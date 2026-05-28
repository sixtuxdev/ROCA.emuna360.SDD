using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Parameters;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class ParametersApiService
{
    private readonly HttpClient _httpClient;

    public ParametersApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<IReadOnlyList<ClaseDto>> GetClasesAsync(int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<ClaseDto>>>($"api/v1/clases/denominacion/{denominacionId}");
        return response?.Data ?? [];
    }

    public async Task<int?> CreateClaseAsync(ClaseDto clase)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/clases", clase);
        return await ReadDataAsync<int>(response);
    }

    public async Task<bool> UpdateClaseAsync(ClaseDto clase)
    {
        var response = await _httpClient.PutAsJsonAsync($"api/v1/clases/{clase.ClaseId}", clase);
        return response.IsSuccessStatusCode && await ReadDataAsync<bool>(response);
    }

    public async Task<bool> DeleteClaseAsync(int claseId, int denominacionId)
    {
        var response = await _httpClient.DeleteAsync($"api/v1/clases/{claseId}/denominacion/{denominacionId}");
        return response.IsSuccessStatusCode && await ReadDataAsync<bool>(response);
    }

    public async Task<IReadOnlyList<ParametroDto>> GetParametrosByClaseAsync(int claseId, int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<ParametroDto>>>($"api/v1/parametros/clase/{claseId}/denominacion/{denominacionId}");
        return response?.Data ?? [];
    }

    public async Task<IReadOnlyList<ParametroDto>> GetParametrosByDenominacionAsync(int denominacionId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<ParametroDto>>>($"api/v1/parametros/denominacion/{denominacionId}");
        return response?.Data ?? [];
    }

    public async Task<IReadOnlyList<ParametroDto>> GetParametrosByNombreClase(string nombreClase, int denominacionId)
    {
        var nombreClaseEncoded = Uri.EscapeDataString(nombreClase);
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<ParametroDto>>>($"api/v1/parametros/nombre-clase/{nombreClaseEncoded}/denominacion/{denominacionId}");
        return response?.Data ?? [];
    }

    public async Task<int?> CreateParametroAsync(ParametroDto parametro)
    {
        var response = await _httpClient.PostAsJsonAsync("api/v1/parametros", parametro);
        return await ReadDataAsync<int>(response);
    }

    public async Task<bool> UpdateParametroAsync(ParametroDto parametro)
    {
        var response = await _httpClient.PutAsJsonAsync($"api/v1/parametros/{parametro.ParametroId}", parametro);
        return response.IsSuccessStatusCode && await ReadDataAsync<bool>(response);
    }

    public async Task<bool> DeleteParametroAsync(int parametroId, int denominacionId)
    {
        var response = await _httpClient.DeleteAsync($"api/v1/parametros/{parametroId}/denominacion/{denominacionId}");
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
