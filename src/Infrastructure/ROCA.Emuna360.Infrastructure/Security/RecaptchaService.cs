using Microsoft.Extensions.Options;
using ROCA.Emuna360.Application.Common;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using System.Net.Http.Json;

namespace ROCA.Emuna360.Infrastructure.Security;

public class RecaptchaService : IRecaptchaService
{
    private readonly HttpClient _httpClient;
    private readonly RecaptchaSettings _settings;

    public RecaptchaService(HttpClient httpClient, IOptions<RecaptchaSettings> settings)
    {
        _httpClient = httpClient;
        _settings = settings.Value;
    }

    public async Task<bool> VerifyAsync(string token)
    {
        if (string.IsNullOrEmpty(token)) return false;

        try
        {
            var response = await _httpClient.PostAsync(
                $"https://www.google.com/recaptcha/api/siteverify?secret={_settings.SecretKey}&response={token}", 
                null);

            if (response.IsSuccessStatusCode)
            {
                var result = await response.Content.ReadFromJsonAsync<RecaptchaValidationResponse>();
                return result != null && result.Success && result.Score >= _settings.MinimumScore;
            }
        }
        catch (Exception)
        {
            // En producción registrar el error
            return false;
        }

        return false;
    }
}
