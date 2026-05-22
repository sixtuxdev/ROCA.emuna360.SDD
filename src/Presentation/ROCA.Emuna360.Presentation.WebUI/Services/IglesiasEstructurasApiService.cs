using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class IglesiasEstructurasApiService
{
    private readonly HttpClient _httpClient;

    public IglesiasEstructurasApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<IReadOnlyList<IglesiaEstructuraDto>> GetByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<IglesiaEstructuraDto>>>(
            $"api/v1/iglesias-estructuras/iglesia/{iglesiaId}/denominacion/{denominacionId}");

        return response?.Data ?? [];
    }

    public async Task<IglesiaEstructuraDto?> GetCurrentByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<IglesiaEstructuraDto>>(
            $"api/v1/iglesias-estructuras/iglesia/{iglesiaId}/denominacion/{denominacionId}/actual");

        return response?.Data;
    }

    public async Task<bool> UpsertByIglesiaAsync(IglesiaEstructuraDto iglesiaEstructura)
    {
        var response = await _httpClient.PutAsJsonAsync(
            $"api/v1/iglesias-estructuras/iglesia/{iglesiaEstructura.IglesiaId}/denominacion/{iglesiaEstructura.DenominacionId}",
            iglesiaEstructura);

        return response.IsSuccessStatusCode && await ReadDataAsync<bool>(response);
    }

    public async Task<bool> DeleteByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        var response = await _httpClient.DeleteAsync(
            $"api/v1/iglesias-estructuras/iglesia/{iglesiaId}/denominacion/{denominacionId}");

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
