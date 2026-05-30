using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Security;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class RolApiService
{
    private readonly HttpClient _httpClient;

    public RolApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<IReadOnlyList<RolDto>> GetRolesAsync(int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<RolDto>>>($"api/v1/roles/denominacion/{denominacionId}");
        return response?.Data ?? [];
    }
}
