using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class IglesiasApiService
{
    private readonly HttpClient _httpClient;

    public IglesiasApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<IReadOnlyList<IglesiaDto>> GetIglesiasAsync(int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<IglesiaDto>>>($"api/v1/iglesias/denominacion/{denominacionId}");
        return response?.Data ?? [];
    }

    public async Task<IReadOnlyList<IglesiaDto>> GetAllPorUsuarioIdDenIdAsync(int usuarioId, int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<IglesiaDto>>>($"api/v1/iglesias/GetAllPorUsuarioIdDenId/{usuarioId}/{denominacionId}");
        return response?.Data ?? [];
    }

    public async Task<IglesiaDto?> GetIglesiaAsync(int iglesiaId, int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<IglesiaDto>>($"api/v1/iglesias/{iglesiaId}/denominacion/{denominacionId}");
        return response?.Data;
    }

    public async Task<int?> CreateIglesiaAsync(IglesiaDto iglesia)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/iglesias", iglesia);
        return await ReadDataAsync<int>(response);
    }

    public async Task<bool> UpdateIglesiaAsync(IglesiaDto iglesia)
    {
        var response = await _httpClient.PutAsJsonAsync($"api/v1/iglesias/{iglesia.IglesiaId}", iglesia);
        return response.IsSuccessStatusCode && await ReadDataAsync<bool>(response);
    }

    public async Task<bool> DeleteIglesiaAsync(int iglesiaId, int denominacionId)
    {
        var response = await _httpClient.DeleteAsync($"api/v1/iglesias/{iglesiaId}/denominacion/{denominacionId}");
        return response.IsSuccessStatusCode && await ReadDataAsync<bool>(response);
    }

    private static async Task<T?> ReadDataAsync<T>(HttpResponseMessage response)
    {
        if (!response.IsSuccessStatusCode)
            return default;

        var apiResponse = await response.Content.ReadFromJsonAsync<ApiResponseDto<T>>();
        return apiResponse is { Success: true } ? apiResponse.Data : default;
    }
}
