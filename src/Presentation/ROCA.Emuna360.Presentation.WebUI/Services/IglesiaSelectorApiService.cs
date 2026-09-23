using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class IglesiaSelectorApiService
{
    private readonly HttpClient _httpClient;

    public IglesiaSelectorApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<IReadOnlyList<IglesiaDto>> GetAsync(
        int denominacionId,
        CancellationToken cancellationToken = default)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<IglesiaDto>>>(
            $"api/v1/iglesias/selector/denominacion/{denominacionId}",
            cancellationToken);

        return response is { Success: true } ? response.Data ?? [] : [];
    }
}
