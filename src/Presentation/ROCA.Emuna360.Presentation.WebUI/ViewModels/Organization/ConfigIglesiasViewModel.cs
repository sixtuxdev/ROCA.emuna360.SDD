using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Components;
using MudBlazor;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Organization;

public class ConfigIglesiasViewModel
{
    private const int AllStatusFilter = -1;
    private const int ActiveStatusFilter = 1;
    private const int InactiveStatusFilter = 0;
    private static readonly Regex EmailRegex = new(@"^[^@\s]+@[^@\s]+\.[^@\s]+$", RegexOptions.Compiled | RegexOptions.CultureInvariant);

    protected readonly IglesiasApiService _iglesiasApiService;
    protected readonly GeographyApiService _geographyApiService;
    protected readonly TokenStorageService _tokenStorageService;
    protected readonly ISnackbar _snackbar;
    protected readonly IDialogService _dialogService;
    protected readonly NavigationManager _navigation;
    private readonly Dictionary<int, string> _ciudadesPorId = new();
    private readonly Dictionary<int, string> _corregimientosPorId = new();
    private readonly HashSet<IglesiaFormField> _touchedIglesiaFields = [];
    private string _searchText = string.Empty;
    private int _statusFilter = AllStatusFilter;

    public ConfigIglesiasViewModel(
        IglesiasApiService iglesiasApiService,
        GeographyApiService geographyApiService,
        TokenStorageService tokenStorageService,
        ISnackbar snackbar,
        IDialogService dialogService,
        NavigationManager navigation)
    {
        _iglesiasApiService = iglesiasApiService;
        _geographyApiService = geographyApiService;
        _tokenStorageService = tokenStorageService;
        _snackbar = snackbar;
        _dialogService = dialogService;
        _navigation = navigation;
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
        StartNewIglesia();
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
        SelectedIglesia = iglesia;
        IglesiaForm = CloneIglesia(iglesia);
        IsEditing = true;
        ResetIglesiaFormInteraction();
        await LoadGeographyForFormAsync();
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

    protected List<string> ValidateForm()
    {
        var errors = new List<string>();

        AddIfNotNull(errors, ValidateNombre(IglesiaForm.Nombre));
        AddIfNotNull(errors, ValidateSlug(IglesiaForm.Slug));
        AddIfNotNull(errors, ValidatePersoneriaJuridica(IglesiaForm.PersoneriaJuridica));
        AddIfNotNull(errors, ValidateCorreo(IglesiaForm.Correo));

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
            Activa = iglesia.Activa,
            FechaCreacion = iglesia.FechaCreacion,
            FechaActualizacion = iglesia.FechaActualizacion
        };
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

    public sealed record StatusFilterOption(int Value, string Text);
}
