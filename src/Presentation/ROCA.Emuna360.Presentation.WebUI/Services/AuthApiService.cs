using ROCA.Emuna360.Application.DTOs.Auth;
using System.Net.Http.Json;
using System.Text.Json;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public class AuthApiService
{
    private readonly HttpClient _httpClient;

    public AuthApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<DenominacionDominioDto?> ObtenerDenominacionPorDominioAsync(string dominio)
    {
        var url = $"api/v1/auth/obtener-denominacion-por-dominio?dominio={Uri.EscapeDataString(dominio)}";
        var response = await _httpClient.GetAsync(url);

        if (response.IsSuccessStatusCode)
        {
            return await response.Content.ReadFromJsonAsync<DenominacionDominioDto>();
        }

        return null;
    }

    public async Task<LoginResponseDto?> LoginAsync(LoginRequestDto request)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/auth/login", request);
        
        if (response.IsSuccessStatusCode)
        {
            return await response.Content.ReadFromJsonAsync<LoginResponseDto>();
        }

        return null;
    }

    public async Task<RegisterUserResponseDto?> RegisterAsync(RegisterUserRequestDto request)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/auth/register", request);

        if (response.IsSuccessStatusCode)
        {
            return await response.Content.ReadFromJsonAsync<RegisterUserResponseDto>();
        }

        return null;
    }

    public async Task<bool> ConfirmEmailAsync(ConfirmEmailRequestDto request)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/auth/confirm-email", request);
        return response.IsSuccessStatusCode;
    }

    public async Task<RefreshTokenResponseDto?> RefreshTokenAsync(RefreshTokenRequestDto request)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/auth/refresh-token", request);

        if (response.IsSuccessStatusCode)
        {
            return await response.Content.ReadFromJsonAsync<RefreshTokenResponseDto>();
        }

        return null;
    }

    public async Task<bool> LogoutAsync(LogoutRequestDto request)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/auth/logout", request);
        return response.IsSuccessStatusCode;
    }

    public async Task<bool?> EsAdminDenominacionAsync(int denominacionId, int usuarioId)
    {
        var response = await _httpClient.GetAsync($"api/v1/usuarios-iglesias/es-admin-denominacion?denominacionId={denominacionId}&usuarioId={usuarioId}");

        if (!response.IsSuccessStatusCode)
            return null;

        using var content = await response.Content.ReadAsStreamAsync();
        using var json = await JsonDocument.ParseAsync(content);

        if (json.RootElement.ValueKind == JsonValueKind.True)
            return true;

        if (json.RootElement.ValueKind == JsonValueKind.False)
            return false;

        if (json.RootElement.TryGetProperty("value", out var camelValue) && TryReadBoolean(camelValue, out var camelResult))
            return camelResult;

        if (json.RootElement.TryGetProperty("Value", out var pascalValue) && TryReadBoolean(pascalValue, out var pascalResult))
            return pascalResult;

        return null;
    }

    private static bool TryReadBoolean(JsonElement element, out bool value)
    {
        value = false;

        if (element.ValueKind == JsonValueKind.True)
        {
            value = true;
            return true;
        }

        return element.ValueKind == JsonValueKind.False;
    }
}
