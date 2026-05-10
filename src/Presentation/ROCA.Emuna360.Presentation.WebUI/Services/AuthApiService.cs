using ROCA.Emuna360.Application.DTOs.Auth;
using System.Net.Http.Json;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public class AuthApiService
{
    private readonly HttpClient _httpClient;

    public AuthApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
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
}
