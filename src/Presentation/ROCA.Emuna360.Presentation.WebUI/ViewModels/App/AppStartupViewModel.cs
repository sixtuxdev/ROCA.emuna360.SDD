using Microsoft.AspNetCore.Components.Authorization;
using ROCA.Emuna360.Presentation.WebUI.Security;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.App;

public sealed class AppStartupViewModel
{
    private readonly TokenStorageService _tokenStorage;
    private readonly CustomAuthenticationStateProvider _authStateProvider;

    public AppStartupViewModel(
        TokenStorageService tokenStorage,
        CustomAuthenticationStateProvider authStateProvider)
    {
        _tokenStorage = tokenStorage;
        _authStateProvider = authStateProvider;
    }

    public bool IsInitialized { get; private set; }
    public bool IsAuthenticated { get; private set; }

    public async Task InitializeAsync()
    {
        if (IsInitialized)
            return;

        var token = await _tokenStorage.GetTokenAsync();
        var expiration = await _tokenStorage.GetTokenExpirationAsync();

        if (string.IsNullOrWhiteSpace(token) || !expiration.HasValue)
        {
            IsAuthenticated = false;
            IsInitialized = true;
            return;
        }

        if (expiration.Value <= DateTime.UtcNow)
        {
            await _tokenStorage.RemoveTokenAsync();
            _authStateProvider.NotifyUserLogout();
            IsAuthenticated = false;
            IsInitialized = true;
            return;
        }

        await _authStateProvider.NotifyUserAuthenticationAsync(token);
        var authState = await _authStateProvider.GetAuthenticationStateAsync();

        IsAuthenticated = authState.User.Identity?.IsAuthenticated == true;
        IsInitialized = true;
    }
}
