using System.Text.RegularExpressions;
using Microsoft.AspNetCore.Components;
using MudBlazor;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Registry;

public sealed class AdminRegistroViewModel
{
    private const int DefaultPublicDenominacionId = 1;
    private const string VisitanteRolNombre = "Visitante";
    private static readonly Regex EmailRegex = new(@"^[^@\s]+@[^@\s]+\.[^@\s]+$", RegexOptions.Compiled | RegexOptions.CultureInvariant);

    private readonly RegistroApiService _registroApiService;
    private readonly UsuariosApiService _usuariosApiService;
    private readonly RolApiService _rolApiService;
    private readonly IglesiasApiService _iglesiasApiService;
    private readonly ParametersApiService _parametersApiService;
    private readonly GeographyApiService _geographyApiService;
    private readonly TokenStorageService _tokenStorageService;
    private readonly DenominacionesApiService _denominacionesApiService;
    private readonly ISnackbar _snackbar;
    private readonly NavigationManager _navigation;
    private readonly IConfiguration _configuration;
    private readonly HashSet<RegistroFormField> _touchedFields = [];
    private IglesiaDto? _iglesia;
    private IglesiaDto? _iglesiaSeleccionada;
    private string _searchText = string.Empty;

    public AdminRegistroViewModel(
        RegistroApiService registroApiService,
        UsuariosApiService usuariosApiService,
        RolApiService rolApiService,
        IglesiasApiService iglesiasApiService,
        ParametersApiService parametersApiService,
        GeographyApiService geographyApiService,
        TokenStorageService tokenStorageService,
        DenominacionesApiService denominacionesApiService,
        ISnackbar snackbar,
        NavigationManager navigation,
        IConfiguration configuration)
    {
        _registroApiService = registroApiService;
        _usuariosApiService = usuariosApiService;
        _rolApiService = rolApiService;
        _iglesiasApiService = iglesiasApiService;
        _parametersApiService = parametersApiService;
        _geographyApiService = geographyApiService;
        _tokenStorageService = tokenStorageService;
        _denominacionesApiService = denominacionesApiService;
        _snackbar = snackbar;
        _navigation = navigation;
        _configuration = configuration;
    }

    public int DenominacionId { get; private set; }
    public int IglesiaId { get; private set; }
    public bool EsInterno { get; private set; }
    public bool IsLoading { get; private set; }
    public bool IsSaving { get; private set; }
    public bool IsLoadingGeography { get; private set; }
    public bool LastSaveSucceeded { get; private set; }
    public string? ErrorMessage { get; private set; }
    public string? DenominacionNombre { get; private set; }
    public bool IsLoadingDenominacion { get; private set; }
    public IReadOnlyList<RegistroDto> Registros { get; private set; } = [];
    public RegistroDto RegistroForm { get; private set; } = NewRegistro();
    public RegistroDto? SelectedRegistro { get; private set; }
    public bool IsEditing { get; private set; }
    public IReadOnlyList<ParametroDto> TipoDocumentoOptions { get; private set; } = [];
    public IReadOnlyList<ParametroDto> SexoOptions { get; private set; } = [];
    public IReadOnlyList<ParametroDto> InteresOptions { get; private set; } = [];
    public IReadOnlyList<RolDto> RolOptions { get; private set; } = [];
    public IReadOnlyList<PaisDto> Paises { get; private set; } = [];
    public IReadOnlyList<DepartamentoDto> Departamentos { get; private set; } = [];
    public IReadOnlyList<CiudadDto> Ciudades { get; private set; } = [];
    public IReadOnlyList<CorregimientoDto> Corregimientos { get; private set; } = [];
    public int? RolId { get; set; }
    public string? Contrasena { get; set; }
    public string? ConfirmarContrasena { get; set; }
    public string? CrearUsuarioCon { get; set; }

    public string SearchText
    {
        get => _searchText;
        set => _searchText = value ?? string.Empty;
    }

    public IReadOnlyList<RegistroDto> FilteredRegistros => Registros
        .Where(MatchesSearch)
        .OrderBy(registro => registro.Nombres)
        .ThenBy(registro => registro.Apellidos)
        .ToList();

    public bool HasRegistros => Registros.Any();
    public string SourceLabel => EsInterno ? "Registro interno" : "Registro externo";
    public string FormTitle => IsEditing ? "Editar Registro" : "Nuevo Registro";
    public string FormSubtitle => IsEditing ? "Actualice la información de la persona" : "Complete la información de la persona";
    public string IglesiaNombre => string.IsNullOrWhiteSpace(_iglesia?.Nombre) ? "Sin iglesia" : _iglesia.Nombre;
    public string RegistroIglesiaNombre => IglesiaId > 0
        ? IglesiaNombre
        : string.IsNullOrWhiteSpace(_iglesiaSeleccionada?.Nombre) ? "Sin iglesia seleccionada" : _iglesiaSeleccionada.Nombre;
    public bool IsRegistroPublico => !EsInterno;
    public bool IsRolBloqueado => IsRegistroPublico;
    public IReadOnlyList<RolDto> RolOptionsForForm => IsRolBloqueado && RolId.HasValue
        ? RolOptions.Where(rol => rol.RolId == RolId.Value).ToList()
        : RolOptions;
    public bool CanSaveRegistro => !IsSaving && ValidateForm().Count == 0;

    public enum RegistroFormField
    {
        Iglesia,
        Nombres,
        Apellidos,
        Documento,
        TipoDocumento,
        Sexo,
        Correo,
        Interes,
        Rol,
        Contrasena,
        ConfirmarContrasena,
        CrearUsuarioCon
    }

    public async Task InitializeAsync(bool esInterno, int? denominacionId = null)
    {
        EsInterno = esInterno;
        ErrorMessage = null;

        if (EsInterno)
        {
            DenominacionId = await _tokenStorageService.GetAuthDenominacionIdAsync();
            IglesiaId = await _tokenStorageService.GetAuthIglesiaIdAsync();

            if (DenominacionId <= 0)
            {
                ErrorMessage = "No fue posible obtener la denominación del usuario autenticado.";
                _snackbar.Add(ErrorMessage, Severity.Error);
                return;
            }
        }
        else
        {
            var denominacionExterna = denominacionId.GetValueOrDefault();
            DenominacionId = denominacionExterna > 0
                ? denominacionExterna
                : _configuration.GetValue<int?>("Registro:DefaultDenominacionId") ?? DefaultPublicDenominacionId;
            IglesiaId = 0;
        }

        await LoadDenominacionAsync();
        await LoadCatalogsAsync();
        await LoadIglesiaAsync();
        StartNewRegistro();
        await LoadRegistrosAsync();
    }

    public async Task LoadRegistrosAsync()
    {
        if (DenominacionId <= 0)
            return;

        IsLoading = true;
        ErrorMessage = null;

        try
        {
            if (IglesiaId > 0)
            {
                Registros = await _registroApiService.GetRegistrosByIglesiaAsync(IglesiaId, DenominacionId);
            }
            else
            {
                Registros = await _registroApiService.GetRegistrosAsync(DenominacionId);
            }
        }
        catch
        {
            ErrorMessage = "No fue posible cargar los registros.";
            _snackbar.Add(ErrorMessage, Severity.Error);
        }
        finally
        {
            IsLoading = false;
        }
    }

    public void StartNewRegistro()
    {
        RegistroForm = NewRegistro(DenominacionId, IglesiaId, EsInterno);
        SelectedRegistro = null;
        IsEditing = false;
        _iglesiaSeleccionada = null;
        RolId = EsInterno ? null : GetVisitanteRol()?.RolId;
        Contrasena = null;
        ConfirmarContrasena = null;
        CrearUsuarioCon = null;
        _touchedFields.Clear();
        Departamentos = [];
        Ciudades = [];
        Corregimientos = [];
    }    

    public async Task StartEditRegistroAsync(RegistroDto registro)
    {
        SelectedRegistro = registro;
        IsEditing = true;
        RegistroForm = CloneRegistro(registro);
        _iglesiaSeleccionada = null;
        RolId = null;
        Contrasena = null;
        ConfirmarContrasena = null;
        CrearUsuarioCon = null;
        _touchedFields.Clear();

        if (IglesiaId <= 0 && RegistroForm.IglesiaId > 0)
        {
            _iglesiaSeleccionada = await _iglesiasApiService.GetIglesiaAsync(RegistroForm.IglesiaId, DenominacionId);
        }

        await LoadGeographyForFormAsync();
    }

    private async Task LoadDenominacionAsync()
    {
        DenominacionNombre = null;

        if (DenominacionId <= 0)
            return;

        IsLoadingDenominacion = true;

        try
        {
            var denominacion = await _denominacionesApiService.GetDenominacionAsync(DenominacionId);
            if (denominacion is null)
            {
                _snackbar.Add("No fue posible obtener la información de la denominación.", Severity.Warning);
                return;
            }

            DenominacionNombre = denominacion.Nombre;
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al consultar la denominación.", Severity.Error);
        }
        finally
        {
            IsLoadingDenominacion = false;
        }
    }

    public async Task SaveRegistroAsync()
    {
        LastSaveSucceeded = false;
        EnsurePublicRolVisitante();
        var validationErrors = ValidateForm();
        if (validationErrors.Count > 0)
        {
            TouchRequiredFields();
            _snackbar.Add($"Complete los campos obligatorios: {string.Join(" ", validationErrors)}", Severity.Warning);
            return;
        }

        IsSaving = true;

        try
        {
            var wasEditing = IsEditing;
            var selectedId = RegistroForm.RegistroId;

            if (!wasEditing)
                RegistroForm.RegistroId = 0;

            RegistroForm.DenominacionId = DenominacionId;
            RegistroForm.IglesiaId = IglesiaId > 0 ? IglesiaId : RegistroForm.IglesiaId;
            RegistroForm.Interno = EsInterno;
            RegistroForm.Nombres = NormalizeRequired(RegistroForm.Nombres);
            RegistroForm.Apellidos = NormalizeRequired(RegistroForm.Apellidos);
            RegistroForm.Documento = NormalizeRequired(RegistroForm.Documento);
            RegistroForm.Correo = NormalizeOptional(RegistroForm.Correo);
            RegistroForm.Direccion = NormalizeOptional(RegistroForm.Direccion);
            RegistroForm.Telefono = NormalizeOptional(RegistroForm.Telefono);
            RegistroForm.FechaActualizacion = DateTime.UtcNow;

            if (wasEditing)
            {
                var updated = await _registroApiService.UpdateRegistroAsync(RegistroForm);
                if (!updated)
                {
                    _snackbar.Add("No fue posible actualizar el registro.", Severity.Error);
                    return;
                }

                _snackbar.Add("Registro actualizado correctamente.", Severity.Success);
                LastSaveSucceeded = true;
                await LoadRegistrosAsync();
                SelectedRegistro = Registros.FirstOrDefault(registro => registro.RegistroId == selectedId);
                if (SelectedRegistro is not null)
                {
                    RegistroForm = CloneRegistro(SelectedRegistro);
                    await LoadGeographyForFormAsync();
                }
                return;
            }

            RegistroForm.FechaCreacion = DateTime.UtcNow;
            var newId = await _registroApiService.CreateRegistroAsync(RegistroForm);
            if (newId is null || newId is 0)
            {
                _snackbar.Add("No fue posible crear el registro.", Severity.Error);
                return;
            }

            var usuarioCreado = await TryCreateUsuarioAsync(newId.Value);
            _snackbar.Add(
                usuarioCreado
                    ? "Registro y usuario creados correctamente."
                    : "Registro creado correctamente, pero ocurrió un error creando el usuario.",
                usuarioCreado ? Severity.Success : Severity.Error);

            LastSaveSucceeded = usuarioCreado;
            StartNewRegistro();
            await LoadRegistrosAsync();
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al guardar el registro.", Severity.Error);
        }
        finally
        {
            IsSaving = false;
        }
    }

    public async Task ChangePaisAsync(int? paisId)
    {
        RegistroForm.PaisId = paisId;
        RegistroForm.DepartamentoId = null;
        RegistroForm.CiudadId = null;
        RegistroForm.CorregimientoId = null;
        Departamentos = [];
        Ciudades = [];
        Corregimientos = [];

        if (paisId.HasValue)
            await LoadDepartamentosAsync(paisId.Value);
    }

    public async Task ChangeDepartamentoAsync(int? departamentoId)
    {
        RegistroForm.DepartamentoId = departamentoId;
        RegistroForm.CiudadId = null;
        RegistroForm.CorregimientoId = null;
        Ciudades = [];
        Corregimientos = [];

        if (departamentoId.HasValue)
            await LoadCiudadesAsync(departamentoId.Value);
    }

    public async Task ChangeCiudadAsync(int? ciudadId)
    {
        RegistroForm.CiudadId = ciudadId;
        RegistroForm.CorregimientoId = null;
        Corregimientos = [];

        if (ciudadId.HasValue)
            await LoadCorregimientosAsync(ciudadId.Value);
    }

    public void ChangeCorregimiento(int? corregimientoId)
    {
        RegistroForm.CorregimientoId = corregimientoId;
    }

    public void SelectIglesia(IglesiaDto iglesia)
    {
        if (iglesia.DenominacionId != DenominacionId)
        {
            _snackbar.Add("La iglesia seleccionada no pertenece a la denominación actual.", Severity.Warning);
            return;
        }

        _iglesiaSeleccionada = iglesia;
        RegistroForm.IglesiaId = iglesia.IglesiaId;
    }

    public void TouchField(RegistroFormField field)
    {
        _touchedFields.Add(field);
    }

    public string? GetFieldError(RegistroFormField field)
    {
        if (!_touchedFields.Contains(field))
            return null;

        return field switch
        {
            RegistroFormField.Iglesia => ValidateIglesia(),
            RegistroFormField.Nombres => ValidateRequired(RegistroForm.Nombres, "Los nombres son obligatorios."),
            RegistroFormField.Apellidos => ValidateRequired(RegistroForm.Apellidos, "Los apellidos son obligatorios."),
            RegistroFormField.Documento => ValidateRequired(RegistroForm.Documento, "El documento es obligatorio."),
            RegistroFormField.TipoDocumento => ValidateTipoDocumento(),
            RegistroFormField.Sexo => ValidateSexo(),
            RegistroFormField.Correo => ValidateCorreo(RegistroForm.Correo),
            RegistroFormField.Interes => ValidateInteres(),
            RegistroFormField.Rol => ValidateRol(),
            RegistroFormField.Contrasena => ValidateContrasena(),
            RegistroFormField.ConfirmarContrasena => ValidateConfirmarContrasena(),
            RegistroFormField.CrearUsuarioCon => ValidateCrearUsuarioCon(),
            _ => null
        };
    }

    public string GetIglesiaNombre(int iglesiaId)
    {
        return _iglesia?.IglesiaId == iglesiaId ? IglesiaNombre : "Sin iglesia";
    }

    private async Task LoadCatalogsAsync()
    {
        if (DenominacionId <= 0)
            return;

        try
        {
            var clases = await _parametersApiService.GetClasesAsync(DenominacionId);
            //var parametros = await _parametersApiService.GetParametrosByClaseAsync(1, DenominacionId);

            TipoDocumentoOptions = await _parametersApiService.GetParametrosByNombreClase("Tipos de Documentos", DenominacionId);//clases.Where(IsTipoDocumentoClase).Select(clase => clase.ClaseId).ToHashSet();
            SexoOptions = await _parametersApiService.GetParametrosByNombreClase("Sexo", DenominacionId);//clases.Where(IsSexoClase).Select(clase => clase.ClaseId).ToHashSet();
            InteresOptions = await _parametersApiService.GetParametrosByNombreClase("Interés", DenominacionId);//clases.Where(IsSexoClase).Select(clase => clase.ClaseId).ToHashSet();
            RolOptions = (await _rolApiService.GetRolesAsync(DenominacionId))
                .Where(rol => rol.Activo)
                .OrderBy(rol => rol.Nombre)
                .ToList();
            EnsurePublicRolVisitante();
            //GetParametrosByNombreClase
            await LoadPaisesAsync();
        }
        catch
        {
            _snackbar.Add("No fue posible cargar los catálogos del registro.", Severity.Error);
        }
    }

    private async Task LoadIglesiaAsync()
    {
        if (DenominacionId <= 0)
            return;

        _iglesia = null;

        if (IglesiaId <= 0)
            return;

        try
        {
            _iglesia = await _iglesiasApiService.GetIglesiaAsync(IglesiaId, DenominacionId);
        }
        catch
        {
            _snackbar.Add("No fue posible cargar la iglesia asociada.", Severity.Error);
        }
    }

    private async Task LoadPaisesAsync()
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

    private List<string> ValidateForm()
    {
        var errors = new List<string>();

        AddIfNotNull(errors, ValidateDenominacion());
        AddIfNotNull(errors, ValidateIglesia());
        if (!IsEditing)
            AddIfNotNull(errors, ValidateCrearUsuarioCon());
        AddIfNotNull(errors, ValidateRequired(RegistroForm.Nombres, "Los nombres son obligatorios."));
        AddIfNotNull(errors, ValidateRequired(RegistroForm.Apellidos, "Los apellidos son obligatorios."));
        AddIfNotNull(errors, ValidateTipoDocumento());
        AddIfNotNull(errors, ValidateRequired(RegistroForm.Documento, "El documento es obligatorio."));
        AddIfNotNull(errors, ValidateSexo());
        AddIfNotNull(errors, ValidateCorreo(RegistroForm.Correo));
        AddIfNotNull(errors, ValidateInteres());
        if (!IsEditing)
        {
            AddIfNotNull(errors, ValidateRol());
            AddIfNotNull(errors, ValidateContrasena());
            AddIfNotNull(errors, ValidateConfirmarContrasena());
        }

        if (RegistroForm.Interno is null)
            errors.Add("No fue posible determinar si el registro es interno o externo.");

        return errors;
    }

    private string? ValidateDenominacion()
    {
        return DenominacionId > 0 ? null : "La denominación es obligatoria.";
    }

    private string? ValidateIglesia()
    {
        var iglesiaId = IglesiaId > 0 ? IglesiaId : RegistroForm.IglesiaId;
        return iglesiaId > 0 ? null : "La iglesia es obligatoria.";
    }

    private string? ValidateTipoDocumento()
    {
        return RegistroForm.ParametroIdTipoDocumento.HasValue && RegistroForm.ParametroIdTipoDocumento.Value > 0
            ? null
            : "El tipo de documento es obligatorio.";
    }

    private string? ValidateSexo()
    {
        return RegistroForm.ParametroIdSexo > 0 ? null : "El sexo es obligatorio.";
    }

    private string? ValidateInteres()
    {
        return RegistroForm.ParametroIdInteres.HasValue && RegistroForm.ParametroIdInteres.Value > 0
            ? null
            : "El interés es obligatorio.";
    }

    private string? ValidateRol()
    {
        if (IsRegistroPublico && GetVisitanteRol() is null)
            return "No fue posible cargar el rol Visitante para el registro público.";

        return RolId.HasValue && RolId.Value > 0 ? null : "El rol es obligatorio.";
    }

    private string? ValidateCrearUsuarioCon()
    {
        return string.IsNullOrWhiteSpace(CrearUsuarioCon)
            ? "Debe seleccionar si el usuario se crea con documento o correo."
            : null;
    }

    private string? ValidateContrasena()
    {
        if (string.IsNullOrWhiteSpace(Contrasena))
            return "La contraseña es obligatoria.";

        if (Contrasena.Length < 7)
            return "La contraseña debe tener al menos 7 caracteres.";

        if (Contrasena.Length > 25)
            return "La contraseña no debe exceder los 25 caracteres.";

        return null;
    }

    private string? ValidateConfirmarContrasena()
    {
        if (string.IsNullOrWhiteSpace(ConfirmarContrasena))
            return "Debe repetir la contraseña.";

        return string.Equals(Contrasena, ConfirmarContrasena, StringComparison.Ordinal)
            ? null
            : "Las contraseñas no coinciden.";
    }

    private static string? ValidateRequired(string? value, string message)
    {
        return string.IsNullOrWhiteSpace(value) ? message : null;
    }

    private string? ValidateCorreo(string? value)
    {
        if (string.Equals(CrearUsuarioCon, "Correo", StringComparison.OrdinalIgnoreCase)
            && string.IsNullOrWhiteSpace(value))
        {
            return "El correo es obligatorio cuando el usuario se crea con correo.";
        }

        if (string.IsNullOrWhiteSpace(value))
            return null;

        return EmailRegex.IsMatch(value.Trim()) ? null : "Ingrese un correo válido.";
    }

    private bool MatchesSearch(RegistroDto registro)
    {
        return string.IsNullOrWhiteSpace(SearchText)
            || MatchesText(registro.Nombres, SearchText)
            || MatchesText(registro.Apellidos, SearchText)
            || MatchesText(registro.Documento, SearchText)
            || MatchesText(registro.Correo, SearchText);
    }

    private static bool MatchesText(string? value, string searchText)
    {
        return !string.IsNullOrWhiteSpace(value)
            && value.Contains(searchText.Trim(), StringComparison.OrdinalIgnoreCase);
    }

    private static bool IsTipoDocumentoClase(ClaseDto clase)
    {
        var text = NormalizeClassName(clase.Descripcion);
        return text.Contains("DOCUMENTO", StringComparison.Ordinal) && !text.Contains("ESTADO", StringComparison.Ordinal);
    }

    private static bool IsSexoClase(ClaseDto clase)
    {
        var text = NormalizeClassName(clase.Descripcion);
        return text.Contains("SEXO", StringComparison.Ordinal) || text.Contains("GENERO", StringComparison.Ordinal);
    }

    private static string NormalizeClassName(string value)
    {
        return value.Trim().ToUpperInvariant()
            .Replace("É", "E")
            .Replace("Á", "A")
            .Replace("Í", "I")
            .Replace("Ó", "O")
            .Replace("Ú", "U");
    }

    private static RegistroDto NewRegistro(int denominacionId = 0, int iglesiaId = 0, bool interno = false)
    {
        return new RegistroDto
        {
            DenominacionId = denominacionId,
            IglesiaId = iglesiaId,
            Interno = interno
        };
    }

    private static RegistroDto CloneRegistro(RegistroDto registro)
    {
        return new RegistroDto
        {
            RegistroId = registro.RegistroId,
            DenominacionId = registro.DenominacionId,
            IglesiaId = registro.IglesiaId,
            Nombres = registro.Nombres,
            Apellidos = registro.Apellidos,
            ParametroIdTipoDocumento = registro.ParametroIdTipoDocumento,
            Documento = registro.Documento,
            PaisId = registro.PaisId,
            DepartamentoId = registro.DepartamentoId,
            CiudadId = registro.CiudadId,
            CorregimientoId = registro.CorregimientoId,
            Direccion = registro.Direccion,
            Correo = registro.Correo,
            Telefono = registro.Telefono,
            ParametroIdSexo = registro.ParametroIdSexo,
            Interno = registro.Interno,
            ParametroIdInteres = registro.ParametroIdInteres,
            FechaCreacion = registro.FechaCreacion,
            FechaActualizacion = registro.FechaActualizacion
        };
    }

    private async Task LoadGeographyForFormAsync()
    {
        var paisId = RegistroForm.PaisId;
        var departamentoId = RegistroForm.DepartamentoId;
        var ciudadId = RegistroForm.CiudadId;
        var corregimientoId = RegistroForm.CorregimientoId;

        RegistroForm.PaisId = null;
        RegistroForm.DepartamentoId = null;
        RegistroForm.CiudadId = null;
        RegistroForm.CorregimientoId = null;
        Departamentos = [];
        Ciudades = [];
        Corregimientos = [];

        await LoadPaisesAsync();

        RegistroForm.PaisId = paisId;
        if (paisId.HasValue)
            await LoadDepartamentosAsync(paisId.Value);

        RegistroForm.DepartamentoId = departamentoId;
        if (departamentoId.HasValue)
            await LoadCiudadesAsync(departamentoId.Value);

        RegistroForm.CiudadId = ciudadId;
        if (ciudadId.HasValue)
            await LoadCorregimientosAsync(ciudadId.Value);

        RegistroForm.CorregimientoId = corregimientoId;
    }

    private UsuarioDto BuildUsuario(int registroId)
    {
        return new UsuarioDto
        {
            UsuarioId = 0,
            DenominacionId = DenominacionId,
            RegistroId = registroId,
            Correo = string.Equals(CrearUsuarioCon, "Correo", StringComparison.OrdinalIgnoreCase) ? RegistroForm.Correo : RegistroForm.Documento,
            PasswordHash = Contrasena,
            EmailVerificado = false,
            Bloqueado = false,
            RolId = RolId,
            FechaCreacion = DateTime.UtcNow,
            FechaActualizacion = DateTime.UtcNow
        };
    }

    private async Task<bool> TryCreateUsuarioAsync(int registroId)
    {
        try
        {
            var usuarioId = await _usuariosApiService.CreateUsuarioAsync(BuildUsuario(registroId));
            return usuarioId is not null;

        }
        catch
        {
            return false;
        }
    }

    private static string NormalizeRequired(string? value)
    {
        return string.Join(' ', (value ?? string.Empty).Trim().Split(' ', StringSplitOptions.RemoveEmptyEntries));
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

    private void TouchRequiredFields()
    {
        _touchedFields.Add(RegistroFormField.Iglesia);
        _touchedFields.Add(RegistroFormField.CrearUsuarioCon);
        _touchedFields.Add(RegistroFormField.Rol);
        _touchedFields.Add(RegistroFormField.Contrasena);
        _touchedFields.Add(RegistroFormField.ConfirmarContrasena);
        _touchedFields.Add(RegistroFormField.Nombres);
        _touchedFields.Add(RegistroFormField.Apellidos);
        _touchedFields.Add(RegistroFormField.TipoDocumento);
        _touchedFields.Add(RegistroFormField.Documento);
        _touchedFields.Add(RegistroFormField.Sexo);
        _touchedFields.Add(RegistroFormField.Correo);
        _touchedFields.Add(RegistroFormField.Interes);
    }

    private RolDto? GetVisitanteRol()
    {
        return RolOptions.FirstOrDefault(IsVisitanteRol);
    }

    private void EnsurePublicRolVisitante()
    {
        if (!IsRegistroPublico)
            return;

        var visitanteRol = GetVisitanteRol();
        if (visitanteRol is not null)
        {
            RolId = visitanteRol.RolId;
        }
    }

    private static bool IsVisitanteRol(RolDto rol)
    {
        return IsVisitanteText(rol.Nombre) || IsVisitanteText(rol.Codigo);
    }

    private static bool IsVisitanteText(string? value)
    {
        return string.Equals(value?.Trim(), VisitanteRolNombre, StringComparison.OrdinalIgnoreCase);
    }
}
