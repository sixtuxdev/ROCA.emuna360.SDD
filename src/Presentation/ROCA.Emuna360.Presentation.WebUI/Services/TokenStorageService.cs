using Microsoft.AspNetCore.Components.Server.ProtectedBrowserStorage;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public class TokenStorageService
{
    private readonly ProtectedLocalStorage _localStorage;
    private readonly ProtectedSessionStorage _sessionStorage;
    private const string TokenKey = "authToken";
    private const string RefreshTokenKey = "refreshToken";

    public TokenStorageService(ProtectedLocalStorage localStorage, ProtectedSessionStorage sessionStorage)
    {
        _localStorage = localStorage;
        _sessionStorage = sessionStorage;
    }

    public async Task SetTokenAsync(string token, bool rememberMe)
    {
        if (rememberMe)
        {
            await _localStorage.SetAsync(TokenKey, token);
        }
        else
        {
            await _sessionStorage.SetAsync(TokenKey, token);
        }
    }

    public async Task<string?> GetTokenAsync()
    {
        try
        {
            var result = await _localStorage.GetAsync<string>(TokenKey);
            if (result.Success) return result.Value;

            result = await _sessionStorage.GetAsync<string>(TokenKey);
            if (result.Success) return result.Value;
        }
        catch
        {
            // Handle error (e.g., during prerendering)
        }
        return null;
    }

    public async Task RemoveTokenAsync()
    {
        await _localStorage.DeleteAsync(TokenKey);
        await _sessionStorage.DeleteAsync(TokenKey);
    }
}
