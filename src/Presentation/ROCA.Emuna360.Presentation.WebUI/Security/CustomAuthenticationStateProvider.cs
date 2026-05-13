using Microsoft.AspNetCore.Components.Authorization;
using ROCA.Emuna360.Presentation.WebUI.Services;
using System.Security.Claims;
using System.Text.Json;

namespace ROCA.Emuna360.Presentation.WebUI.Security;

public class CustomAuthenticationStateProvider : AuthenticationStateProvider
{
    private readonly TokenStorageService _tokenStorage;
    private readonly ClaimsPrincipal _anonymous = new ClaimsPrincipal(new ClaimsIdentity());

    public CustomAuthenticationStateProvider(TokenStorageService tokenStorage)
    {
        _tokenStorage = tokenStorage;
    }

    public override async Task<AuthenticationState> GetAuthenticationStateAsync()
    {
        try
        {
            var token = await _tokenStorage.GetTokenAsync();
            var expiration = await _tokenStorage.GetTokenExpirationAsync();

            if (string.IsNullOrWhiteSpace(token) || !expiration.HasValue)
                return new AuthenticationState(_anonymous);

            if (expiration.Value <= DateTime.UtcNow)
            {
                await _tokenStorage.RemoveTokenAsync();
                return new AuthenticationState(_anonymous);
            }

            var claims = await BuildClaimsAsync(token);
            var identity = new ClaimsIdentity(claims, "jwt");
            var user = new ClaimsPrincipal(identity);

            return new AuthenticationState(user);
        }
        catch
        {
            return new AuthenticationState(_anonymous);
        }
    }

    public void NotifyUserAuthentication(string token)
    {
        var claims = ParseClaimsFromJwt(token);
        var identity = new ClaimsIdentity(claims, "jwt");
        var user = new ClaimsPrincipal(identity);
        var authState = Task.FromResult(new AuthenticationState(user));
        NotifyAuthenticationStateChanged(authState);
    }

    public async Task NotifyUserAuthenticationAsync(string token)
    {
        var claims = await BuildClaimsAsync(token);
        var identity = new ClaimsIdentity(claims, "jwt");
        var user = new ClaimsPrincipal(identity);
        var authState = Task.FromResult(new AuthenticationState(user));
        NotifyAuthenticationStateChanged(authState);
    }

    public void NotifyUserLogout()
    {
        var authState = Task.FromResult(new AuthenticationState(_anonymous));
        NotifyAuthenticationStateChanged(authState);
    }

    private IEnumerable<Claim> ParseClaimsFromJwt(string jwt)
    {
        var claims = new List<Claim>();
        var tokenParts = jwt.Split('.');

        if (tokenParts.Length < 2)
            return claims;

        var payload = tokenParts[1];

        var jsonBytes = ParseBase64WithoutPadding(payload);

        var keyValuePairs = JsonSerializer.Deserialize<Dictionary<string, object>>(jsonBytes);

        if (keyValuePairs != null)
        {
            foreach (var kvp in keyValuePairs)
            {
                if (kvp.Value is JsonElement element && element.ValueKind == JsonValueKind.Array)
                {
                    foreach (var item in element.EnumerateArray())
                    {
                        claims.Add(new Claim(kvp.Key, item.ToString()));
                    }
                }
                else
                {
                    claims.Add(new Claim(kvp.Key, kvp.Value.ToString() ?? ""));
                }
            }
        }

        return claims;
    }

    private async Task<IEnumerable<Claim>> BuildClaimsAsync(string jwt)
    {
        var claims = ParseClaimsFromJwt(jwt).ToList();
        var userInfo = await _tokenStorage.GetUserInfoAsync();
        var registerInfo = await _tokenStorage.GetRegisterInfoAsync();
        var roles = await _tokenStorage.GetRolesAsync();

        if (userInfo is not null)
        {
            AddOrReplace(claims, "UsuarioId", userInfo.UsuarioId.ToString());
            AddOrReplace(claims, "DenominacionId", userInfo.DenominacionId.ToString());
            AddOrReplace(claims, ClaimTypes.Email, userInfo.Correo);
            AddOrReplace(claims, "Correo", userInfo.Correo);
            AddOrReplace(claims, "RolId", userInfo.RolId.ToString());
        }

        if (registerInfo is not null)
        {
            AddOrReplace(claims, "RegistroId", registerInfo.RegistroId.ToString());
            AddOrReplace(claims, "Documento", registerInfo.Documento);
            AddOrReplace(claims, "NombreCompleto", registerInfo.NombreCompleto);
            AddOrReplace(claims, ClaimTypes.Name, registerInfo.NombreCompleto);
        }

        foreach (var role in roles)
        {
            if (!string.IsNullOrWhiteSpace(role.Nombre) && !claims.Any(c => c.Type == ClaimTypes.Role && c.Value == role.Nombre))
            {
                claims.Add(new Claim(ClaimTypes.Role, role.Nombre));
            }

            if (!string.IsNullOrWhiteSpace(role.Codigo) && !claims.Any(c => c.Type == "Roles" && c.Value == role.Codigo))
            {
                claims.Add(new Claim("Roles", role.Codigo));
            }
        }

        return claims;
    }

    private static void AddOrReplace(List<Claim> claims, string type, string value)
    {
        claims.RemoveAll(c => c.Type == type);
        claims.Add(new Claim(type, value));
    }

    private byte[] ParseBase64WithoutPadding(string base64)
    {
        switch (base64.Length % 4)
        {
            case 2: base64 += "=="; break;
            case 3: base64 += "="; break;
        }
        return Convert.FromBase64String(base64);
    }
}
