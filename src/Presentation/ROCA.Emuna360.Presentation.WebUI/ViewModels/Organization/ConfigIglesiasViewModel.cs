using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Components;
using MudBlazor;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Presentation.WebUI.Components.Pages.Iglesias;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Organization;

public class ConfigIglesiasViewModel
{
    private const int AllStatusFilter = -1;
    private const int ActiveStatusFilter = 1;
    private const int InactiveStatusFilter = 0;
    private static readonly Regex EmailRegex = new(@"^[^@\s]+@[^@\s]+\.[^@\s]+$", RegexOptions.Compiled | RegexOptions.CultureInvariant);

    protected readonly IglesiasApiService _iglesiasApiService;
    protected readonly UsuariosApiService _usuariosApiService;
    protected readonly IglesiasEstructurasApiService _iglesiasEstructurasApiService;
    protected readonly EstructuraOrganizacionalApiService _estructuraOrganizacionalApiService;
    protected readonly GeographyApiService _geographyApiService;
    protected readonly TokenStorageService _tokenStorageService;
    protected readonly ISnackbar _snackbar;
    protected readonly IDialogService _dialogService;
    protected readonly NavigationManager _navigation;
    protected readonly IglesiaStateService _iglesiaStateService;
    private readonly Dictionary<int, string> _ciudadesPorId = new();
    private readonly Dictionary<int, string> _corregimientosPorId = new();
    private readonly HashSet<IglesiaFormField> _touchedIglesiaFields = [];
    private string _searchText = string.Empty;
    private int _statusFilter = AllStatusFilter;       

    public ConfigIglesiasViewModel(
        IglesiasApiService iglesiasApiService,
        UsuariosApiService usuariosApiService,
        IglesiasEstructurasApiService iglesiasEstructurasApiService,
        EstructuraOrganizacionalApiService estructuraOrganizacionalApiService,
        GeographyApiService geographyApiService,
        TokenStorageService tokenStorageService,
        ISnackbar snackbar,
        IDialogService dialogService,
        NavigationManager navigation,
        IglesiaStateService iglesiaStateService)
    {
        _iglesiasApiService = iglesiasApiService;
        _usuariosApiService = usuariosApiService;
        _iglesiasEstructurasApiService = iglesiasEstructurasApiService;
        _estructuraOrganizacionalApiService = estructuraOrganizacionalApiService;
        _geographyApiService = geographyApiService;
        _tokenStorageService = tokenStorageService;
        _snackbar = snackbar;
        _dialogService = dialogService;
        _navigation = navigation;
        _iglesiaStateService = iglesiaStateService;
    }

    public int DenominacionId { get; protected set; }
    public bool IsAdminDenominacion { get; private set; }
    public bool IsLoading { get; protected set; }
    public bool IsSaving { get; protected set; }
    public bool LastSaveSucceeded { get; protected set; }
    public bool IsLoadingGeography { get; protected set; }
    public string? ErrorMessage { get; protected set; }
    public IReadOnlyList<IglesiaDto> Iglesias { get; protected set; } = [];
    public IglesiaDto IglesiaForm { get; protected set; } = NewIglesia();
    public IglesiaDto? SelectedIglesia { get; protected set; }
    public bool IsEditing { get; protected set; }
    public IReadOnlyList<PaisDto> Paises { get; protected set; } = [];
    public IReadOnlyList<DepartamentoDto> Departamentos { get; protected set; } = [];
    public IReadOnlyList<CiudadDto> Ciudades { get; protected set; } = [];
    public IReadOnlyList<CorregimientoDto> Corregimientos { get; protected set; } = [];
    public IReadOnlyList<EstructuraOrganizacionalDto> EstructurasDisponibles { get; protected set; } = [];
    public IReadOnlyList<UsuarioPastorResponseDTO> PastoresDisponibles { get; protected set; } = [];
    public IReadOnlyList<StatusFilterOption> StatusFilterOptions { get; } =
    [
        new(AllStatusFilter, "Todos"),
        new(ActiveStatusFilter, "Activas"),
        new(InactiveStatusFilter, "Inactivas")
    ];

    public string SearchText
    {
        get => _searchText;
        set => _searchText = value ?? string.Empty;
    }

    public int StatusFilter
    {
        get => _statusFilter;
        set => _statusFilter = value;
    }

    public IReadOnlyList<IglesiaDto> FilteredIglesias => Iglesias
        .Where(MatchesFilters)
        .OrderBy(iglesia => iglesia.Nombre)
        .ToList();

    public bool HasIglesias => Iglesias.Any();
    public bool CanSaveIglesia => !IsSaving && ValidateForm().Count == 0;
    public string FormTitle => IsEditing ? "Editar Iglesia" : "Nueva Iglesia";
    public string SaveButtonText => IsSaving ? "Guardando..." : "Guardar";
    public string PastorResponsableNombre => GetPastorResponsableNombre(IglesiaForm);

    public enum IglesiaFormField
    {
        Nombre,
        Slug,
        PersoneriaJuridica
    }

    public async Task InitializeAsync()
    {
        DenominacionId = await _tokenStorageService.GetAuthDenominacionIdAsync();
        IsAdminDenominacion = await _tokenStorageService.GetIsAdminDenominacionAsync();

        if (DenominacionId <= 0)
        {
            ErrorMessage = "No fue posible obtener la denominación del usuario autenticado.";
            _snackbar.Add(ErrorMessage, Severity.Error);
            return;
        }

        if (!IsAdminDenominacion)
        {
            _navigation.NavigateTo("/iglesias/admin", replace: true);
            return;
        }

        await LoadPaisesAsync();
        await LoadIglesiasAsync();
        await LoadEstructurasDisponiblesAsync();
        await LoadPastoresDisponiblesAsync();
        StartNewIglesia();
    }

    public async Task InitializeSelectorAsync(int denominacionId)
    {
        DenominacionId = denominacionId;
        IsAdminDenominacion = false;
        ErrorMessage = null;
        SearchText = string.Empty;
        StatusFilter = AllStatusFilter;

        if (DenominacionId <= 0)
        {
            ErrorMessage = "No fue posible determinar la denominacion para cargar las iglesias.";
            _snackbar.Add(ErrorMessage, Severity.Warning);
            Iglesias = [];
            return;
        }

        await LoadIglesiasAsync();
    }

    public async Task LoadIglesiasAsync()
    {
        if (DenominacionId <= 0)
            return;

        IsLoading = true;
        ErrorMessage = null;

        try
        {
            Iglesias = await _iglesiasApiService.GetIglesiasAsync(DenominacionId);
            await LoadUbicacionesDelListadoAsync();
            if (PastoresDisponibles.Any())
            {
                foreach (var iglesia in Iglesias)
                {
                    SyncPastorResponsable(iglesia);
                }
            }

            if (SelectedIglesia is not null)
            {
                SelectedIglesia = Iglesias.FirstOrDefault(iglesia => iglesia.IglesiaId == SelectedIglesia.IglesiaId);
            }
        }
        catch
        {
            ErrorMessage = "No fue posible cargar las iglesias.";
            _snackbar.Add(ErrorMessage, Severity.Error);
        }
        finally
        {
            IsLoading = false;
        }
    }

    public void StartNewIglesia()
    {
        SelectedIglesia = null;
        IglesiaForm = NewIglesia(DenominacionId);
        IsEditing = false;
        ResetIglesiaFormInteraction();
        Departamentos = [];
        Ciudades = [];
        Corregimientos = [];
    }

    public async Task StartEditIglesiaAsync(IglesiaDto iglesia)
    {
        var refreshedIglesia = CloneIglesia(iglesia);
        await RefreshEstructuraForIglesiaAsync(refreshedIglesia);

        SelectedIglesia = refreshedIglesia;
        IglesiaForm = CloneIglesia(refreshedIglesia);
        IsEditing = true;
        ResetIglesiaFormInteraction();
        await LoadGeographyForFormAsync();
    }

    public async Task OpenEstructuraSelectorAsync()
    {
        if (!EstructurasDisponibles.Any())
            await LoadEstructurasDisponiblesAsync();

        var parameters = new DialogParameters
        {
            [nameof(EstructuraOrganizacionalSelectorDialog.Estructuras)] = EstructurasDisponibles,
            [nameof(EstructuraOrganizacionalSelectorDialog.SelectedEstructuraId)] = IglesiaForm.EstructuraOrg?.EstructuraOrganizacionalId
        };

        var options = new DialogOptions
        {
            CloseButton = true,
            FullWidth = true,
            MaxWidth = MaxWidth.Medium
        };

        var dialog = await _dialogService.ShowAsync<EstructuraOrganizacionalSelectorDialog>(
            "Seleccionar estructura organizacional",
            parameters,
            options);

        var result = await dialog.Result;
        if (result is null || result.Canceled || result.Data is not EstructuraOrganizacionalDto estructura)
            return;

        SelectEstructura(estructura);
    }

    public async Task OpenPastorResponsableSelectorAsync()
    {
        if (!PastoresDisponibles.Any())
            await LoadPastoresDisponiblesAsync();

        var parameters = new DialogParameters
        {
            [nameof(PastorResponsableSelectorDialog.Pastores)] = PastoresDisponibles,
            [nameof(PastorResponsableSelectorDialog.SelectedUsuarioId)] = IglesiaForm.PastorResponsableRegistroId
        };

        var options = new DialogOptions
        {
            CloseButton = true,
            FullWidth = true,
            MaxWidth = MaxWidth.Large
        };

        var dialog = await _dialogService.ShowAsync<PastorResponsableSelectorDialog>(
            "Seleccionar pastor responsable",
            parameters,
            options);

        var result = await dialog.Result;
        if (result is null || result.Canceled || result.Data is not UsuarioPastorResponseDTO pastor)
            return;

        SelectPastorResponsable(pastor);
    }

    public void SelectEstructura(EstructuraOrganizacionalDto estructura)
    {
        IglesiaForm.EstructuraOrg = CloneEstructura(estructura);
    }

    public void SelectPastorResponsable(UsuarioPastorResponseDTO pastor)
    {
        IglesiaForm.PastorResponsableRegistroId = pastor.UsuarioId;
        IglesiaForm.PastorResponsable = ClonePastor(pastor);
    }

    public async Task ClearEstructura()
    {
        var confirmed = await _dialogService.ShowMessageBox(
            "Eliminar Estructura Organizacional",
            $"¿Desea eliminar la Estructura Organizacional Seleccionada?",
            yesText: "Eliminar",
            cancelText: "Cancelar");

        if (confirmed != true)
            return;

        var denominacionId = IglesiaForm.DenominacionId > 0 ? IglesiaForm.DenominacionId : DenominacionId;
        var resp = await _iglesiasEstructurasApiService.DeleteByIglesiaAsync(IglesiaForm.IglesiaId, denominacionId);
        if (resp)
        {
            IglesiaForm.EstructuraOrg = null;
            await AfterClearEstructuraAsync();
        }
    }

    protected virtual async Task AfterClearEstructuraAsync()
    {
        var selectedId = IglesiaForm.IglesiaId;

        await LoadIglesiasAsync();

        if (selectedId > 0)
        {
            var refreshedIglesia = Iglesias.FirstOrDefault(iglesia => iglesia.IglesiaId == selectedId);
            if (refreshedIglesia is not null)
            {
                SelectedIglesia = refreshedIglesia;
                IglesiaForm = CloneIglesia(refreshedIglesia);
                IsEditing = true;
                await LoadGeographyForFormAsync();
            }
        }

        await _iglesiaStateService.NotifyEstructuraChangedAsync(this);
    }

    public virtual async Task SaveIglesiaAsync()
    {
        var validationErrors = ValidateForm();
        if (validationErrors.Count > 0)
        {
            _snackbar.Add(validationErrors[0], Severity.Warning);
            return;
        }

        IsSaving = true;
        LastSaveSucceeded = false;

        try
        {
            var wasEditing = IsEditing;
            var selectedId = IglesiaForm.IglesiaId;

            IglesiaForm.DenominacionId = DenominacionId;
            IglesiaForm.Nombre = IglesiaForm.Nombre.Trim();
            IglesiaForm.Slug = IglesiaForm.Slug.Trim();
            IglesiaForm.Correo = NormalizeOptional(IglesiaForm.Correo);
            IglesiaForm.PersoneriaJuridica = NormalizeOptional(IglesiaForm.PersoneriaJuridica);
            IglesiaForm.Direccion = NormalizeOptional(IglesiaForm.Direccion);
            IglesiaForm.Telefono = NormalizeOptional(IglesiaForm.Telefono);
            IglesiaForm.Slogan = NormalizeOptional(IglesiaForm.Slogan);
            IglesiaForm.FechaActualizacion = DateTime.UtcNow;
            EnsurePastorResponsableForSave();

            if (wasEditing)
            {
                var updated = await _iglesiasApiService.UpdateIglesiaAsync(IglesiaForm);
                if (!updated)
                {
                    _snackbar.Add("No fue posible actualizar la iglesia.", Severity.Error);
                    return;
                }
                else
                {
                    StartNewIglesia();
                }
            }
            else
            {
                IglesiaForm.IglesiaId = 0;
                IglesiaForm.FechaCreacion = DateTime.UtcNow;
                var newId = await _iglesiasApiService.CreateIglesiaAsync(IglesiaForm);
                if (newId is null)
                {
                    _snackbar.Add("No fue posible crear la iglesia.", Severity.Error);
                    return;
                }
                StartNewIglesia();
            }

            _snackbar.Add(wasEditing ? "Iglesia actualizada correctamente." : "Iglesia creada correctamente.", Severity.Success);
            await AfterSaveAsync(wasEditing, selectedId);
            LastSaveSucceeded = true;
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al guardar la iglesia.", Severity.Error);
        }
        finally
        {
            IsSaving = false;
        }
    }

    protected virtual async Task AfterSaveAsync(bool wasEditing, int selectedId)
    {
        await LoadIglesiasAsync();

        if (selectedId > 0)
        {
            SelectedIglesia = Iglesias.FirstOrDefault(iglesia => iglesia.IglesiaId == selectedId);
        }

        if (!wasEditing)
        {
            StartNewIglesia();
        }
    }

    public async Task ToggleEstadoAsync(IglesiaDto iglesia)
    {
        var accion = iglesia.Activa ? "inactivar" : "activar";
        var confirmed = await _dialogService.ShowMessageBox(
            $"{Capitalize(accion)} iglesia",
            $"¿Desea {accion} la iglesia {iglesia.Nombre}?",
            yesText: Capitalize(accion),
            cancelText: "Cancelar");

        if (confirmed != true)
            return;

        try
        {
            var iglesiaEstado = CloneIglesia(iglesia);
            iglesiaEstado.Activa = !iglesia.Activa;
            iglesiaEstado.FechaActualizacion = DateTime.UtcNow;

            var updated = await _iglesiasApiService.UpdateIglesiaAsync(iglesiaEstado);
            if (!updated)
            {
                _snackbar.Add("No fue posible cambiar el estado de la iglesia.", Severity.Error);
                return;
            }

            _snackbar.Add("Estado de la iglesia actualizado correctamente.", Severity.Success);
            await LoadIglesiasAsync();
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al cambiar el estado de la iglesia.", Severity.Error);
        }
    }

    public async Task ChangePaisAsync(int? paisId)
    {
        IglesiaForm.PaisId = paisId;
        IglesiaForm.DepartamentoId = null;
        IglesiaForm.CiudadId = null;
        IglesiaForm.CorregimientoId = null;
        Departamentos = [];
        Ciudades = [];
        Corregimientos = [];

        if (paisId.HasValue)
            await LoadDepartamentosAsync(paisId.Value);
    }

    public async Task ChangeDepartamentoAsync(int? departamentoId)
    {
        IglesiaForm.DepartamentoId = departamentoId;
        IglesiaForm.CiudadId = null;
        IglesiaForm.CorregimientoId = null;
        Ciudades = [];
        Corregimientos = [];

        if (departamentoId.HasValue)
            await LoadCiudadesAsync(departamentoId.Value);
    }

    public async Task ChangeCiudadAsync(int? ciudadId)
    {
        IglesiaForm.CiudadId = ciudadId;
        IglesiaForm.CorregimientoId = null;
        Corregimientos = [];

        if (ciudadId.HasValue)
            await LoadCorregimientosAsync(ciudadId.Value);
    }

    public void ChangeCorregimiento(int? corregimientoId)
    {
        IglesiaForm.CorregimientoId = corregimientoId;
    }

    public string GetUbicacion(IglesiaDto iglesia)
    {
        if (iglesia.CorregimientoId.HasValue)
        {
            if (_corregimientosPorId.TryGetValue(iglesia.CorregimientoId.Value, out var corregimientoNombre))
                return corregimientoNombre;

            var corregimiento = Corregimientos.FirstOrDefault(item => item.CorregimientoId == iglesia.CorregimientoId);
            if (corregimiento is not null)
                return corregimiento.CorregimientoNombre;
        }

        if (iglesia.CiudadId.HasValue)
        {
            if (_ciudadesPorId.TryGetValue(iglesia.CiudadId.Value, out var ciudadNombre))
                return ciudadNombre;

            var ciudad = Ciudades.FirstOrDefault(item => item.CiudadId == iglesia.CiudadId);
            if (ciudad is not null)
                return ciudad.CiudadNombre;
        }

        return "Sin ubicación";
    }

    public string? ValidateNombre(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
            return "El nombre de la iglesia es obligatorio.";

        return IsDuplicateName(value) ? "Ya existe una iglesia registrada con este nombre." : null;
    }

    public string? ValidateSlug(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? "El slug es obligatorio." : null;
    }

    public string? ValidatePersoneriaJuridica(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? "La personería jurídica es obligatoria." : null;
    }

    public string? ValidateCorreo(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
            return null;

        return EmailRegex.IsMatch(value.Trim()) ? null : "Ingrese un correo válido.";
    }

    public void TouchIglesiaFormField(IglesiaFormField field)
    {
        _touchedIglesiaFields.Add(field);
    }

    public string? GetIglesiaFormFieldError(IglesiaFormField field)
    {
        if (!_touchedIglesiaFields.Contains(field))
            return null;

        return field switch
        {
            IglesiaFormField.Nombre => ValidateNombre(IglesiaForm.Nombre),
            IglesiaFormField.Slug => ValidateSlug(IglesiaForm.Slug),
            IglesiaFormField.PersoneriaJuridica => ValidatePersoneriaJuridica(IglesiaForm.PersoneriaJuridica),
            _ => null
        };
    }

    protected async Task LoadPaisesAsync()
    {
        if (Paises.Any())
            return;

        IsLoadingGeography = true;

        try
        {
            Paises = (await _geographyApiService.GetPaisesAsync())
                .Where(pais => pais.Estado)
                .OrderBy(pais => pais.PaisNombre)
                .ToList();
        }
        catch
        {
            _snackbar.Add("No fue posible cargar los países.", Severity.Error);
        }
        finally
        {
            IsLoadingGeography = false;
        }
    }

    protected async Task LoadGeographyForFormAsync()
    {
        var paisId = IglesiaForm.PaisId;
        var departamentoId = IglesiaForm.DepartamentoId;
        var ciudadId = IglesiaForm.CiudadId;
        var corregimientoId = IglesiaForm.CorregimientoId;

        IglesiaForm.PaisId = null;
        IglesiaForm.DepartamentoId = null;
        IglesiaForm.CiudadId = null;
        IglesiaForm.CorregimientoId = null;
        Departamentos = [];
        Ciudades = [];
        Corregimientos = [];

        await LoadPaisesAsync();

        IglesiaForm.PaisId = paisId;

        if (paisId.HasValue)
            await LoadDepartamentosAsync(paisId.Value);

        IglesiaForm.DepartamentoId = departamentoId;

        if (departamentoId.HasValue)
            await LoadCiudadesAsync(departamentoId.Value);

        IglesiaForm.CiudadId = ciudadId;

        if (ciudadId.HasValue)
            await LoadCorregimientosAsync(ciudadId.Value);

        IglesiaForm.CorregimientoId = corregimientoId;
    }

    protected async Task RefreshEstructuraForIglesiaAsync(IglesiaDto iglesia)
    {
        var denominacionId = iglesia.DenominacionId > 0 ? iglesia.DenominacionId : DenominacionId;
        if (iglesia.IglesiaId <= 0 || denominacionId <= 0)
        {
            iglesia.EstructuraOrg = null;
            return;
        }

        var relation = await _iglesiasEstructurasApiService.GetCurrentByIglesiaAsync(iglesia.IglesiaId, denominacionId);
        if (relation is null || relation.EstructuraId <= 0)
        {
            iglesia.EstructuraOrg = null;
            return;
        }

        var estructura = await _estructuraOrganizacionalApiService.GetEstructuraAsync(relation.EstructuraId, denominacionId);
        iglesia.EstructuraOrg = estructura is null ? null : CloneEstructura(estructura);
    }

    protected List<string> ValidateForm()
    {
        var errors = new List<string>();

        AddIfNotNull(errors, ValidateNombre(IglesiaForm.Nombre));
        AddIfNotNull(errors, ValidateSlug(IglesiaForm.Slug));
        AddIfNotNull(errors, ValidatePersoneriaJuridica(IglesiaForm.PersoneriaJuridica));
        AddIfNotNull(errors, ValidateCorreo(IglesiaForm.Correo));
        AddIfNotNull(errors, ValidatePastorResponsable());

        if (DenominacionId <= 0)
            errors.Add("La denominación es obligatoria.");

        if (!IglesiaForm.PaisId.HasValue)
            errors.Add("El país es obligatorio.");

        if (!IglesiaForm.DepartamentoId.HasValue)
            errors.Add("El departamento es obligatorio.");

        if (!IglesiaForm.CiudadId.HasValue)
            errors.Add("La ciudad es obligatoria.");

        return errors;
    }

    protected static IglesiaDto NewIglesia(int denominacionId = 0)
    {
        return new IglesiaDto
        {
            DenominacionId = denominacionId,
            Activa = true
        };
    }

    protected static IglesiaDto CloneIglesia(IglesiaDto iglesia)
    {
        return new IglesiaDto
        {
            IglesiaId = iglesia.IglesiaId,
            DenominacionId = iglesia.DenominacionId,
            Nombre = iglesia.Nombre,
            Slug = iglesia.Slug,
            PersoneriaJuridica = iglesia.PersoneriaJuridica,
            PaisId = iglesia.PaisId,
            DepartamentoId = iglesia.DepartamentoId,
            CiudadId = iglesia.CiudadId,
            CorregimientoId = iglesia.CorregimientoId,
            Direccion = iglesia.Direccion,
            Telefono = iglesia.Telefono,
            Correo = iglesia.Correo,
            Slogan = iglesia.Slogan,
            PastorResponsableRegistroId = iglesia.PastorResponsableRegistroId,
            Activa = iglesia.Activa,
            EstructuraOrg = iglesia.EstructuraOrg is null ? null : CloneEstructura(iglesia.EstructuraOrg),
            PastorResponsable = iglesia.PastorResponsable is null ? null : ClonePastor(iglesia.PastorResponsable),
            FechaCreacion = iglesia.FechaCreacion,
            FechaActualizacion = iglesia.FechaActualizacion
        };
    }

    protected async Task LoadEstructurasDisponiblesAsync()
    {
        if (DenominacionId <= 0)
            return;

        try
        {
            var estructuras = await _estructuraOrganizacionalApiService.GetEstructurasAsync(DenominacionId);

            if (IsAdminDenominacion)
            {
                EstructurasDisponibles = estructuras;
                return;
            }

            var iglesiaId = await _tokenStorageService.GetAuthIglesiaIdAsync();
            if (iglesiaId <= 0)
            {
                EstructurasDisponibles = [];
                return;
            }

            var relation = await _iglesiasEstructurasApiService.GetCurrentByIglesiaAsync(iglesiaId, DenominacionId);
            if (relation is null || relation.EstructuraId <= 0)
            {
                EstructurasDisponibles = [];
                return;
            }

            var allowedIds = GetDescendantIds(estructuras, relation.EstructuraId);
            EstructurasDisponibles = estructuras
                .Where(estructura => allowedIds.Contains(estructura.EstructuraOrganizacionalId))
                .ToList();
        }
        catch
        {
            EstructurasDisponibles = [];
            _snackbar.Add("No fue posible cargar las estructuras organizacionales disponibles.", Severity.Error);
        }
    }

    public string GetPastorResponsableNombre(IglesiaDto iglesia)
    {
        var pastor = iglesia.PastorResponsable;
        if (pastor is null && iglesia.PastorResponsableRegistroId.HasValue)
        {
            pastor = PastoresDisponibles.FirstOrDefault(item => item.UsuarioId == iglesia.PastorResponsableRegistroId.Value);
        }

        var nombre = string.Join(' ', new[] { pastor?.Nombres, pastor?.Apellidos }
            .Where(value => !string.IsNullOrWhiteSpace(value)));

        return string.IsNullOrWhiteSpace(nombre) ? "Sin pastor responsable" : nombre;
    }

    protected async Task LoadPastoresDisponiblesAsync()
    {
        if (DenominacionId <= 0)
            return;

        try
        {
            PastoresDisponibles = (await _usuariosApiService.GetPastoresAsync(DenominacionId))
                .OrderBy(pastor => pastor.Nombres)
                .ThenBy(pastor => pastor.Apellidos)
                .ToList();

            SyncPastorResponsable(IglesiaForm);
            foreach (var iglesia in Iglesias)
            {
                SyncPastorResponsable(iglesia);
            }
        }
        catch
        {
            PastoresDisponibles = [];
            _snackbar.Add("No fue posible cargar los pastores disponibles.", Severity.Error);
        }
    }

    private async Task LoadDepartamentosAsync(int paisId)
    {
        IsLoadingGeography = true;

        try
        {
            Departamentos = (await _geographyApiService.GetDepartamentosAsync(paisId))
                .Where(departamento => departamento.Estado)
                .OrderBy(departamento => departamento.DepartamentoNombre)
                .ToList();
        }
        catch
        {
            _snackbar.Add("No fue posible cargar los departamentos.", Severity.Error);
        }
        finally
        {
            IsLoadingGeography = false;
        }
    }

    private async Task LoadCiudadesAsync(int departamentoId)
    {
        IsLoadingGeography = true;

        try
        {
            Ciudades = (await _geographyApiService.GetCiudadesAsync(departamentoId))
                .Where(ciudad => ciudad.Estado)
                .OrderBy(ciudad => ciudad.CiudadNombre)
                .ToList();
        }
        catch
        {
            _snackbar.Add("No fue posible cargar las ciudades.", Severity.Error);
        }
        finally
        {
            IsLoadingGeography = false;
        }
    }

    private async Task LoadCorregimientosAsync(int ciudadId)
    {
        IsLoadingGeography = true;

        try
        {
            Corregimientos = (await _geographyApiService.GetCorregimientosAsync(ciudadId))
                .Where(corregimiento => corregimiento.Estado)
                .OrderBy(corregimiento => corregimiento.CorregimientoNombre)
                .ToList();
        }
        catch
        {
            _snackbar.Add("No fue posible cargar los corregimientos.", Severity.Error);
        }
        finally
        {
            IsLoadingGeography = false;
        }
    }

    private async Task LoadUbicacionesDelListadoAsync()
    {
        var ciudadIds = Iglesias
            .Where(iglesia => iglesia.CiudadId.HasValue && !_ciudadesPorId.ContainsKey(iglesia.CiudadId.Value))
            .Select(iglesia => iglesia.CiudadId!.Value)
            .Distinct()
            .ToList();

        var corregimientoIds = Iglesias
            .Where(iglesia => iglesia.CorregimientoId.HasValue && !_corregimientosPorId.ContainsKey(iglesia.CorregimientoId.Value))
            .Select(iglesia => iglesia.CorregimientoId!.Value)
            .Distinct()
            .ToList();

        foreach (var ciudadId in ciudadIds)
        {
            var ciudad = await _geographyApiService.GetCiudadAsync(ciudadId);
            if (ciudad is not null)
                _ciudadesPorId[ciudad.CiudadId] = ciudad.CiudadNombre;
        }

        foreach (var corregimientoId in corregimientoIds)
        {
            var corregimiento = await _geographyApiService.GetCorregimientoAsync(corregimientoId);
            if (corregimiento is not null)
                _corregimientosPorId[corregimiento.CorregimientoId] = corregimiento.CorregimientoNombre;
        }
    }

    private bool MatchesFilters(IglesiaDto iglesia)
    {
        return MatchesStatus(iglesia.Activa, StatusFilter)
            && (MatchesText(iglesia.Nombre, SearchText)
                || MatchesText(iglesia.Slug, SearchText)
                || MatchesText(iglesia.Correo, SearchText));
    }

    private bool IsDuplicateName(string nombre)
    {
        var normalized = NormalizeName(nombre);

        return Iglesias.Any(iglesia =>
            iglesia.IglesiaId != IglesiaForm.IglesiaId &&
            NormalizeName(iglesia.Nombre) == normalized);
    }

    private static bool MatchesText(string? value, string searchText)
    {
        return string.IsNullOrWhiteSpace(searchText)
            || (!string.IsNullOrWhiteSpace(value)
                && value.Contains(searchText.Trim(), StringComparison.OrdinalIgnoreCase));
    }

    private static bool MatchesStatus(bool activa, int statusFilter)
    {
        return statusFilter == AllStatusFilter
            || (statusFilter == ActiveStatusFilter && activa)
            || (statusFilter == InactiveStatusFilter && !activa);
    }

    private static string NormalizeName(string value)
    {
        return string.Join(' ', value.Trim().Split(' ', StringSplitOptions.RemoveEmptyEntries)).ToUpperInvariant();
    }

    private static string? NormalizeOptional(string? value)
    {
        return string.IsNullOrWhiteSpace(value) ? null : value.Trim();
    }

    private static void AddIfNotNull(List<string> errors, string? error)
    {
        if (!string.IsNullOrWhiteSpace(error))
            errors.Add(error);
    }

    private string? ValidatePastorResponsable()
    {
        return IglesiaForm.PastorResponsableRegistroId.HasValue && IglesiaForm.PastorResponsableRegistroId.Value > 0
            ? null
            : "El pastor responsable es obligatorio.";
    }

    private void EnsurePastorResponsableForSave()
    {
        if (IglesiaForm.PastorResponsableRegistroId.HasValue && IglesiaForm.PastorResponsableRegistroId.Value > 0)
            return;

        IglesiaForm.PastorResponsableRegistroId = IglesiaForm.PastorResponsable?.UsuarioId;
    }

    private void SyncPastorResponsable(IglesiaDto iglesia)
    {
        if (!iglesia.PastorResponsableRegistroId.HasValue)
        {
            iglesia.PastorResponsable = null;
            return;
        }

        var pastor = PastoresDisponibles.FirstOrDefault(item => item.UsuarioId == iglesia.PastorResponsableRegistroId.Value);
        iglesia.PastorResponsable = pastor is null ? null : ClonePastor(pastor);
    }

    private void ResetIglesiaFormInteraction()
    {
        _touchedIglesiaFields.Clear();
    }

    private static string Capitalize(string value)
    {
        return string.IsNullOrWhiteSpace(value)
            ? value
            : char.ToUpperInvariant(value[0]) + value[1..];
    }

    private static EstructuraOrganizacionalDto CloneEstructura(EstructuraOrganizacionalDto estructura)
    {
        return new EstructuraOrganizacionalDto
        {
            EstructuraOrganizacionalId = estructura.EstructuraOrganizacionalId,
            DenominacionId = estructura.DenominacionId,
            Descripcion = estructura.Descripcion,
            GrupoEstructuraOrganizacionalId = estructura.GrupoEstructuraOrganizacionalId,
            Orden = estructura.Orden,
            Responsable = estructura.Responsable,
            Estado = estructura.Estado,
            FechaCreacion = estructura.FechaCreacion,
            FechaActualizacion = estructura.FechaActualizacion
        };
    }

    private static UsuarioPastorResponseDTO ClonePastor(UsuarioPastorResponseDTO pastor)
    {
        return new UsuarioPastorResponseDTO
        {
            UsuarioId = pastor.UsuarioId,
            Nombres = pastor.Nombres,
            Apellidos = pastor.Apellidos,
            Direccion = pastor.Direccion,
            Telefono = pastor.Telefono,
            Correo = pastor.Correo
        };
    }

    private static HashSet<int> GetDescendantIds(IReadOnlyList<EstructuraOrganizacionalDto> estructuras, int rootId)
    {
        var allowedIds = new HashSet<int> { rootId };
        var added = true;

        while (added)
        {
            added = false;
            foreach (var estructura in estructuras)
            {
                if (estructura.GrupoEstructuraOrganizacionalId.HasValue
                    && allowedIds.Contains(estructura.GrupoEstructuraOrganizacionalId.Value)
                    && allowedIds.Add(estructura.EstructuraOrganizacionalId))
                {
                    added = true;
                }
            }
        }

        return allowedIds;
    }

    public sealed record StatusFilterOption(int Value, string Text);
}
