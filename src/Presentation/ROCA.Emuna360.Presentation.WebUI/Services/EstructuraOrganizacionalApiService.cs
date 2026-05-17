using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class EstructuraOrganizacionalApiService
{
    private readonly HttpClient _httpClient;

    public EstructuraOrganizacionalApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<IReadOnlyList<EstructuraOrganizacionalDto>> GetEstructurasAsync(int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<EstructuraOrganizacionalDto>>>(
            $"api/v1/estructura-organizacional/denominacion/{denominacionId}");

        return response?.Data ?? [];
    }

    public async Task<EstructuraOrganizacionalDto?> GetEstructuraAsync(int estructuraOrganizacionalId, int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<EstructuraOrganizacionalDto>>(
            $"api/v1/estructura-organizacional/{estructuraOrganizacionalId}/denominacion/{denominacionId}");

        return response?.Data;
    }

    public async Task<int?> CreateEstructuraAsync(EstructuraOrganizacionalDto estructura)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/estructura-organizacional", estructura);
        return await ReadDataAsync<int>(response);
    }

    public async Task<bool> UpdateEstructuraAsync(EstructuraOrganizacionalDto estructura)
    {
        var response = await _httpClient.PutAsJsonAsync(
            $"api/v1/estructura-organizacional/{estructura.EstructuraOrganizacionalId}",
            estructura);

        return response.IsSuccessStatusCode && await ReadDataAsync<bool>(response);
    }

    public async Task<bool> DeleteEstructuraAsync(int estructuraOrganizacionalId, int denominacionId)
    {
        var response = await _httpClient.DeleteAsync(
            $"api/v1/estructura-organizacional/{estructuraOrganizacionalId}/denominacion/{denominacionId}");

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
