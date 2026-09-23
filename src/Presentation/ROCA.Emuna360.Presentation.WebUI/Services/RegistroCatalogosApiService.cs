using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Registry;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class RegistroCatalogosApiService
{
    private readonly HttpClient _httpClient;

    public RegistroCatalogosApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<RegistroCatalogosDto?> GetAsync(
        int denominacionId,
        CancellationToken cancellationToken = default)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<RegistroCatalogosDto>>(
            $"api/v1/parametros/catalogos-registro/denominacion/{denominacionId}",
            cancellationToken);
        return response is { Success: true } ? response.Data : null;
    }
}
