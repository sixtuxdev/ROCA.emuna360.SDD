using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using MudBlazor;
using ROCA.Emuna360.Application.DTOs.Auth;
using ROCA.Emuna360.Presentation.WebUI.Security;
using ROCA.Emuna360.Presentation.WebUI.Services;

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
    private readonly IHostEnvironment _hostEnvironment;
    private readonly DenominacionesApiService _denominacionesApiService;    

    public LoginViewModel(
        AuthApiService authApiService,
        TokenStorageService tokenStorage,
        CustomAuthenticationStateProvider authStateProvider,
        NavigationManager navigation,
        ISnackbar snackbar,
        IJSRuntime jsRuntime,
        IConfiguration configuration,
        IHostEnvironment hostEnvironment,
        DenominacionesApiService denominacionesApiService)
    {
        _authApiService = authApiService;
        _tokenStorage = tokenStorage;
        _authStateProvider = authStateProvider;
        _navigation = navigation;
        _snackbar = snackbar;
        _jsRuntime = jsRuntime;
        _configuration = configuration;
        _hostEnvironment = hostEnvironment;
        _denominacionesApiService = denominacionesApiService;
    }

    public LoginRequestDto LoginRequest { get; } = new();
    public string? DenominacionNombre { get; private set; }
    public string? HostConsultado { get; private set; }
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

        try
        {
            var host = new Uri(_navigation.Uri).Host.Trim().ToLowerInvariant();
            HostConsultado = host;

            if (EsEntornoLocal(host))
            {
                LoginRequest.DenominacionId = 1;
                DenominacionResuelta = true;
                await LoadDenominacionAsync();
                return;
            }
            
            var denominacion = await _authApiService.ObtenerDenominacionPorDominioAsync(host);
            if (denominacion is null || denominacion.DenominacionId <= 0)
            {
                _snackbar.Add("La URL actual no está configurada para ninguna denominación.", Severity.Warning);
                return;
            }

            LoginRequest.DenominacionId = denominacion.DenominacionId;
            DenominacionNombre = denominacion.NombreDenominacion;
            DenominacionResuelta = true;
        }
        catch
        {
            _snackbar.Add("Ocurrió un error al identificar la denominación de la URL.", Severity.Error);
        }
        finally
        {
            IsLoadingDenominacion = false;
        }
    }

    private bool EsEntornoLocal(string host)
    {
#if DEBUG
        return true;
#else
        return _hostEnvironment.IsDevelopment() ||
            host.Equals("localhost", StringComparison.OrdinalIgnoreCase) ||
            host.Equals("127.0.0.1", StringComparison.OrdinalIgnoreCase) ||
            host.Equals("::1", StringComparison.OrdinalIgnoreCase);
#endif
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
