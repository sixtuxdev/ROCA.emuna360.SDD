using Microsoft.AspNetCore.Components.Server.ProtectedBrowserStorage;
using Microsoft.JSInterop;
using ROCA.Emuna360.Application.DTOs.Auth;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.DTOs.Security;
using System.Text.Json;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public class TokenStorageService
{
    private readonly ProtectedLocalStorage _localStorage;
    private readonly ProtectedSessionStorage _sessionStorage;
    private readonly IJSRuntime _jsRuntime;
    private const string AccessTokenKey = "AccessToken";
    private const string RefreshTokenKey = "RefreshToken";
    private const string TokenExpirationKey = "TokenExpiration";
    private const string InfoUserKey = "InfoUser";
    private const string InfoUserIdKey = "InfoUserId";
    private const string InfoRegisterKey = "InfoRegister";
    private const string RolesKey = "Roles";
    private const string MenusKey = "Menus";
    private const string AuthDenominacionIdKey = "authDenominacionId";
    private const string AuthIglesiaIdKey = "authIglesiaId";
    private const string IsAdminDenominacionKey = "IsAdminDenominacion";
    private const string InfoDenominacionKey = "InfoDenominacionKey";

    public TokenStorageService(ProtectedLocalStorage localStorage, ProtectedSessionStorage sessionStorage, IJSRuntime jsRuntime)
    {
        _localStorage = localStorage;
        _sessionStorage = sessionStorage;
        _jsRuntime = jsRuntime;
    }

    public async Task SetTokenAsync(string token, bool rememberMe)
    {
        await _localStorage.SetAsync(AccessTokenKey, token);
    }

    public async Task SetLoginSessionAsync(LoginResponseDto response)
    {
        await _localStorage.SetAsync(AccessTokenKey, response.AccessToken);
        await _localStorage.SetAsync(RefreshTokenKey, response.RefreshToken);
        await _localStorage.SetAsync(TokenExpirationKey, response.Expiration);

        if (response.User is null)
            return;

        if (response.User.DenominacionId > 0)
        {
            await SetAuthDenominacionIdAsync(response.User.DenominacionId);
        }

        if (response.User.IglesiaId > 0)
        {
            await SetAuthIglesiaIdAsync(response.User.IglesiaId);
        }

        await _localStorage.SetAsync(InfoUserIdKey, response.User.UsuarioId.ToString());

        await _localStorage.SetAsync(InfoUserKey, new StoredUserInfo(
            response.User.UsuarioId,
            response.User.DenominacionId,
            response.User.Correo,
            response.User.EmailVerificado,
            response.User.RolId,
            response.User.IglesiaId));

        if (response.User.Registro is not null)
        {
            await _localStorage.SetAsync(InfoRegisterKey, response.User.Registro);
        }

        await _localStorage.SetAsync(RolesKey, response.User.Roles);
        await _localStorage.SetAsync(MenusKey, response.User.Menus);
    }

    public async Task SetAuthDenominacionIdAsync(int denominacionId)
    {
        await _jsRuntime.InvokeVoidAsync("localStorage.setItem", AuthDenominacionIdKey, denominacionId.ToString());
    }

    public async Task SetAuthIglesiaIdAsync(int iglesiaId)
    {
        await _jsRuntime.InvokeVoidAsync("localStorage.setItem", AuthIglesiaIdKey, iglesiaId.ToString());
    }

    public async Task SetIsAdminDenominacionAsync(bool isAdminDenominacion)
    {
        await _jsRuntime.InvokeVoidAsync("localStorage.setItem", IsAdminDenominacionKey, isAdminDenominacion.ToString().ToLowerInvariant());
    }

    public async Task SetInfoDenominacionAsync(DenominacionDto? info)
    {
        var jsonInfoDen = JsonSerializer.Serialize(info);
        await _jsRuntime.InvokeVoidAsync("localStorage.setItem", InfoDenominacionKey, jsonInfoDen);
    }

    public async Task<DenominacionDto?> GetInfoDenominacionAsync()
    {
        try
        {
            var value = await _jsRuntime.InvokeAsync<string?>("localStorage.getItem", InfoDenominacionKey);
            return string.IsNullOrWhiteSpace(value)
                ? null
                : JsonSerializer.Deserialize<DenominacionDto>(value);
        }
        catch
        {
            return null;
        }
    }

    public async Task<int> GetAuthDenominacionIdAsync()
    {
        try
        {
            var value = await _jsRuntime.InvokeAsync<string?>("localStorage.getItem", AuthDenominacionIdKey);
            return int.TryParse(value, out var denominacionId) ? denominacionId : 0;
        }
        catch
        {
            return 0;
        }
    }

    public async Task<int> GetAuthIglesiaIdAsync()
    {
        try
        {
            var value = await _jsRuntime.InvokeAsync<string?>("localStorage.getItem", AuthIglesiaIdKey);
            if (int.TryParse(value, out var iglesiaId))
                return iglesiaId;

            var userInfo = await GetUserInfoAsync();
            return userInfo?.IglesiaId ?? 0;
        }
        catch
        {
            return 0;
        }
    }

    public async Task<bool> GetIsAdminDenominacionAsync()
    {
        try
        {
            var value = await _jsRuntime.InvokeAsync<string?>("localStorage.getItem", IsAdminDenominacionKey);
            return bool.TryParse(value, out var isAdminDenominacion) && isAdminDenominacion;
        }
        catch
        {
            return false;
        }
    }

    public async Task UpdateTokensAsync(RefreshTokenResponseDto response)
    {
        await _localStorage.SetAsync(AccessTokenKey, response.AccessToken);
        await _localStorage.SetAsync(RefreshTokenKey, response.RefreshToken);
        await _localStorage.SetAsync(TokenExpirationKey, response.Expiration);
    }

    public async Task<string?> GetTokenAsync()
    {
        try
        {
            var result = await _localStorage.GetAsync<string>(AccessTokenKey);
            if (result.Success) return result.Value;

            result = await _sessionStorage.GetAsync<string>(AccessTokenKey);
            if (result.Success) return result.Value;
        }
        catch
        {
            // Handle error (e.g., during prerendering)
        }
        return null;
    }

    public async Task<string?> GetRefreshTokenAsync()
    {
        try
        {
            var result = await _localStorage.GetAsync<string>(RefreshTokenKey);
            if (result.Success) return result.Value;
        }
        catch
        {
            // Storage is unavailable during prerendering.
        }

        return null;
    }

    public async Task<DateTime?> GetTokenExpirationAsync()
    {
        try
        {
            var result = await _localStorage.GetAsync<DateTime>(TokenExpirationKey);
            if (result.Success) return result.Value;
        }
        catch
        {
            // Storage is unavailable during prerendering.
        }

        return null;
    }

    public async Task<StoredUserInfo?> GetUserInfoAsync()
    {
        try
        {
            var result = await _localStorage.GetAsync<StoredUserInfo>(InfoUserKey);
            if (result.Success) return result.Value;
        }
        catch
        {
            // Storage is unavailable during prerendering.
        }

        return null;
    }
    public async Task<int?> GetUserIdInfoAsync()
    {
        try
        {
            var result = await _localStorage.GetAsync<int?>(InfoUserIdKey);
            if (result.Success) return int.Parse(result!.Value!.ToString());
        }
        catch
        {
            // Storage is unavailable during prerendering.
        }

        return null;
    }

    public async Task<AuthRegistroDto?> GetRegisterInfoAsync()
    {
        try
        {
            var result = await _localStorage.GetAsync<AuthRegistroDto>(InfoRegisterKey);
            if (result.Success) return result.Value;
        }
        catch
        {
            // Storage is unavailable during prerendering.
        }

        return null;
    }

    public async Task<List<AuthRoleDto>> GetRolesAsync()
    {
        try
        {
            var result = await _localStorage.GetAsync<List<AuthRoleDto>>(RolesKey);
            if (result.Success && result.Value is not null) return result.Value;
        }
        catch
        {
            // Storage is unavailable during prerendering.
        }

        return new List<AuthRoleDto>();
    }

    public async Task<List<AuthMenuDto>> GetMenusAsync()
    {
        try
        {
            var result = await _localStorage.GetAsync<List<AuthMenuDto>>(MenusKey);
            if (result.Success && result.Value is not null) return result.Value;
        }
        catch
        {
            // Storage is unavailable during prerendering.
        }

        return new List<AuthMenuDto>();
    }

    public async Task<bool> HasActiveSessionAsync()
    {
        var token = await GetTokenAsync();
        var expiration = await GetTokenExpirationAsync();

        return !string.IsNullOrWhiteSpace(token) &&
            expiration.HasValue &&
            expiration.Value > DateTime.UtcNow;
    }

    public async Task RemoveTokenAsync()
    {
        await _localStorage.DeleteAsync(AccessTokenKey);
        await _localStorage.DeleteAsync(RefreshTokenKey);
        await _localStorage.DeleteAsync(TokenExpirationKey);
        await _localStorage.DeleteAsync(InfoUserKey);
        await _localStorage.DeleteAsync(InfoRegisterKey);
        await _localStorage.DeleteAsync(RolesKey);
        await _localStorage.DeleteAsync(MenusKey);
        await _sessionStorage.DeleteAsync(AccessTokenKey);
        await _jsRuntime.InvokeVoidAsync("localStorage.removeItem", AuthDenominacionIdKey);
        await _jsRuntime.InvokeVoidAsync("localStorage.removeItem", AuthIglesiaIdKey);
        await _jsRuntime.InvokeVoidAsync("localStorage.removeItem", IsAdminDenominacionKey);
        await _jsRuntime.InvokeVoidAsync("localStorage.removeItem", InfoDenominacionKey);
    }
}

public sealed record StoredUserInfo(
    int UsuarioId,
    int DenominacionId,
    string Correo,
    bool EmailVerificado,
    int RolId,
    int IglesiaId = 0);
