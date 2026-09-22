using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using MudBlazor;
using ROCA.Emuna360.Application.DTOs.Auth;
using ROCA.Emuna360.Presentation.WebUI.Security;
using ROCA.Emuna360.Presentation.WebUI.Services;
using System.Net;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Auth;

public sealed class LoginViewModel
{
    private readonly AuthApiService _authApiService;
    private readonly TokenStorageService _tokenStorage;
    private readonly CustomAuthenticationStateProvider _authStateProvider;
    private readonly NavigationManager _navigation;
    private readonly ISnackbar _snackbar;
    private readonly IJSRuntime _jsRuntime;
    private readonly IConfiguration _configuration;
    private readonly DenominacionesApiService _denominacionesApiService;    

    public LoginViewModel(
        AuthApiService authApiService,
        TokenStorageService tokenStorage,
        CustomAuthenticationStateProvider authStateProvider,
        NavigationManager navigation,
        ISnackbar snackbar,
        IJSRuntime jsRuntime,
        IConfiguration configuration,
        DenominacionesApiService denominacionesApiService)
    {
        _authApiService = authApiService;
        _tokenStorage = tokenStorage;
        _authStateProvider = authStateProvider;
        _navigation = navigation;
        _snackbar = snackbar;
        _jsRuntime = jsRuntime;
        _configuration = configuration;
        _denominacionesApiService = denominacionesApiService;
    }

    public LoginRequestDto LoginRequest { get; } = new();
    public string? DenominacionNombre { get; private set; }
    public string? HostConsultado { get; private set; }
    public string? ApiConsultada { get; private set; }
    public int? EstadoHttpConsulta { get; private set; }
    public string? DiagnosticoConsulta { get; private set; }
    public bool MostrarHostConsultado => _configuration.GetValue<bool>("Login:MostrarHostConsultado");
    public bool IsLoadingDenominacion { get; private set; }
    public bool DenominacionResuelta { get; private set; }
    public bool IsLoading { get; private set; }
    public InputType PasswordInput { get; private set; } = InputType.Password;
    public string PasswordInputIcon { get; private set; } = Icons.Material.Filled.VisibilityOff;
    public bool CanSubmit =>
        !string.IsNullOrWhiteSpace(LoginRequest.Login) &&
        !string.IsNullOrWhiteSpace(LoginRequest.Password) &&
        LoginRequest.Password.Length >= 7 &&
        LoginRequest.Password.Length <= 25 &&
        DenominacionResuelta &&
        LoginRequest.DenominacionId > 0 &&
        !IsLoadingDenominacion;

    public async Task InitializeAsync()
    {
        if (await _tokenStorage.HasActiveSessionAsync())
        {
            _navigation.NavigateTo("/dashboard", replace: true);
            return;
        }

        await ResolverDenominacionAsync();
    }

    private async Task ResolverDenominacionAsync()
    {
        IsLoadingDenominacion = true;
        DenominacionResuelta = false;
        LoginRequest.DenominacionId = 0;
        DenominacionNombre = null;
        HostConsultado = null;
        ApiConsultada = null;
        EstadoHttpConsulta = null;
        DiagnosticoConsulta = null;

        try
        {
            var host = new Uri(_navigation.Uri).Host.Trim().ToLowerInvariant();
            HostConsultado = host;

            if (EsEntornoLocal(host))
            {
                DiagnosticoConsulta = "Consulta por subdominio omitida: se está usando la denominación local predeterminada (ID 1).";
                await EscribirDiagnosticoNavegadorAsync("warn", new
                {
                    Evento = "Resolución de denominación omitida",
                    HostEnviado = host,
                    Motivo = DiagnosticoConsulta
                });

                LoginRequest.DenominacionId = 1;
                DenominacionResuelta = true;
                await LoadDenominacionAsync();
                return;
            }

            ApiConsultada = _authApiService.ObtenerUrlConsultaDenominacion(host);
            await EscribirDiagnosticoNavegadorAsync("info", new
            {
                Evento = "Consultando denominación por subdominio",
                Api = ApiConsultada,
                HostEnviado = host
            });

            var consulta = await _authApiService.ConsultarDenominacionPorDominioAsync(host);
            EstadoHttpConsulta = (int)consulta.EstadoHttp;
            var denominacion = consulta.Denominacion;

            if (denominacion is null || denominacion.DenominacionId <= 0)
            {
                DiagnosticoConsulta = string.IsNullOrWhiteSpace(consulta.DetalleError)
                    ? "La API no devolvió una denominación válida."
                    : consulta.DetalleError;

                await EscribirDiagnosticoNavegadorAsync("warn", new
                {
                    Evento = "Denominación no resuelta",
                    Api = consulta.Url,
                    HostEnviado = host,
                    EstadoHttp = EstadoHttpConsulta,
                    Detalle = DiagnosticoConsulta
                });

                _snackbar.Add("La URL actual no está configurada para ninguna denominación.", Severity.Warning);
                return;
            }

            LoginRequest.DenominacionId = denominacion.DenominacionId;
            DenominacionNombre = denominacion.NombreDenominacion;
            DenominacionResuelta = true;
            DiagnosticoConsulta = $"Denominación resuelta: {denominacion.DenominacionId} - {denominacion.NombreDenominacion}";

            await EscribirDiagnosticoNavegadorAsync("info", new
            {
                Evento = "Denominación resuelta",
                Api = consulta.Url,
                HostEnviado = host,
                EstadoHttp = EstadoHttpConsulta,
                denominacion.DenominacionId,
                denominacion.NombreDenominacion,
                denominacion.Subdominio
            });
        }
        catch (Exception ex)
        {
            DiagnosticoConsulta = ex.Message;
            await EscribirDiagnosticoNavegadorAsync("error", new
            {
                Evento = "Error al resolver la denominación",
                Api = ApiConsultada,
                HostEnviado = HostConsultado,
                Error = ex.Message
            });

            _snackbar.Add("Ocurrió un error al identificar la denominación de la URL.", Severity.Error);
        }
        finally
        {
            IsLoadingDenominacion = false;
        }
    }

    private async Task EscribirDiagnosticoNavegadorAsync(string nivel, object datos)
    {
        if (!MostrarHostConsultado)
            return;

        try
        {
            await _jsRuntime.InvokeVoidAsync($"console.{nivel}", "[Login][Denominación]", datos);
        }
        catch
        {
            // El diagnóstico nunca debe interrumpir el flujo de autenticación.
        }
    }

    private static bool EsEntornoLocal(string host)
    {
        if (string.IsNullOrWhiteSpace(host))
            return false;

        var hostNormalizado = host.Trim().Trim('[', ']').TrimEnd('.');

        if (hostNormalizado.Equals("localhost", StringComparison.OrdinalIgnoreCase) ||
            hostNormalizado.EndsWith(".localhost", StringComparison.OrdinalIgnoreCase))
        {
            return true;
        }

        return IPAddress.TryParse(hostNormalizado, out var direccionIp) &&
            IPAddress.IsLoopback(direccionIp);
    }

    private async Task LoadDenominacionAsync()
    {
        IsLoadingDenominacion = true;
        DenominacionNombre = null;

        try
        {
            var denominacion = await _denominacionesApiService.GetDenominacionAsync(LoginRequest.DenominacionId);
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

    public void TogglePasswordVisibility()
    {
        if (PasswordInput == InputType.Password)
        {
            PasswordInput = InputType.Text;
            PasswordInputIcon = Icons.Material.Filled.Visibility;
            return;
        }

        PasswordInput = InputType.Password;
        PasswordInputIcon = Icons.Material.Filled.VisibilityOff;
    }

    public string? ValidatePassword(string password)
    {
        if (string.IsNullOrEmpty(password))
            return null;

        if (password.Length < 7)
            return "La contraseña debe tener al menos 7 caracteres.";

        if (password.Length > 25)
            return "La contraseña no debe exceder los 25 caracteres.";

        return null;
    }

    public async Task LoginAsync()
    {
        if (!DenominacionResuelta || LoginRequest.DenominacionId <= 0)
        {
            _snackbar.Add("No se pudo identificar una denominación válida para iniciar sesión.", Severity.Warning);
            return;
        }

        IsLoading = true;

        try
        {
            var siteKey = _configuration["Recaptcha:SiteKey"];
            var token = await _jsRuntime.InvokeAsync<string>("recaptchaInterop.execute", siteKey);

            if (string.IsNullOrEmpty(token))
            {
                _snackbar.Add("Error de validación de seguridad (reCAPTCHA).", Severity.Error);
                return;
            }

            LoginRequest.RecaptchaToken = token;

            var response = await _authApiService.LoginAsync(LoginRequest);

            if (response is not null && !string.IsNullOrEmpty(response.AccessToken))
            {
                if (response.User is null || response.User.DenominacionId <= 0 || response.User.UsuarioId <= 0)
                {
                    _snackbar.Add("No fue posible obtener la información organizacional del usuario.", Severity.Error);
                    return;
                }

                var isAdminDenominacion = await _authApiService.EsAdminDenominacionAsync(response.User.DenominacionId, response.User.UsuarioId);

                if (!isAdminDenominacion.HasValue)
                {
                    _snackbar.Add("No fue posible validar los permisos de administrador de la denominación.", Severity.Error);
                    return;
                }

                var infoDenominacion = await _denominacionesApiService.GetDenominacionAsync(response.User.DenominacionId);

                await _tokenStorage.SetLoginSessionAsync(response);
                await _tokenStorage.SetIsAdminDenominacionAsync(isAdminDenominacion.Value);
                await _tokenStorage.SetInfoDenominacionAsync(infoDenominacion);
                
                await _authStateProvider.NotifyUserAuthenticationAsync(response.AccessToken);
                _snackbar.Add("Bienvenido a ROCA.Emuna360", Severity.Success);
                _navigation.NavigateTo("/dashboard", replace: true);
                return;
            }

            _snackbar.Add("Credenciales inválidas, error de seguridad o cuenta no verificada.", Severity.Error);
        }
        catch
        {
            _snackbar.Add("Ocurrió un error inesperado al intentar iniciar sesión.", Severity.Error);
        }
        finally
        {
            IsLoading = false;
        }
    }
}
