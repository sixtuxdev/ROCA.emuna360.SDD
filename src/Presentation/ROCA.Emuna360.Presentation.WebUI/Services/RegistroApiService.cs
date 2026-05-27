using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Registry;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class RegistroApiService
{
    private readonly HttpClient _httpClient;

    public RegistroApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<IReadOnlyList<RegistroDto>> GetRegistrosAsync(int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<RegistroDto>>>($"api/v1/registros/denominacion/{denominacionId}");
        return response?.Data ?? [];
    }

    public async Task<IReadOnlyList<RegistroDto>> GetRegistrosByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<RegistroDto>>>($"api/v1/registros/iglesia/{iglesiaId}/denominacion/{denominacionId}");
        return response?.Data ?? [];
    }

    public async Task<int?> CreateRegistroAsync(RegistroDto registro)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/registros", registro);
        return await ReadDataAsync<int>(response);
    }

    private static async Task<T?> ReadDataAsync<T>(HttpResponseMessage response)
    {
        if (!response.IsSuccessStatusCode)
            return default;

        var apiResponse = await response.Content.ReadFromJsonAsync<ApiResponseDto<T>>();
        return apiResponse is { Success: true } ? apiResponse.Data : default;
    }
}
