using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class DenominacionesApiService
{
    private readonly HttpClient _httpClient;

    public DenominacionesApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<DenominacionDto?> GetDenominacionAsync(int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<DenominacionDto>>(
            $"api/v1/denominaciones/{denominacionId}/denominacion/{denominacionId}");

        return response is { Success: true } ? response.Data : null;
    }
}
