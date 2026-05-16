using System.Net.Http.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Geography;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class GeographyApiService
{
    private readonly HttpClient _httpClient;

    public GeographyApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<IReadOnlyList<PaisDto>> GetPaisesAsync()
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<PaisDto>>>("api/v1/paises");
        return response?.Data ?? [];
    }

    public async Task<IReadOnlyList<DepartamentoDto>> GetDepartamentosAsync(int paisId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<DepartamentoDto>>>("api/v1/departamentos");
        return response?.Data?
            .Where(departamento => departamento.PaisId == paisId)
            .ToList() ?? [];
    }

    public async Task<IReadOnlyList<CiudadDto>> GetCiudadesAsync(int departamentoId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<CiudadDto>>>("api/v1/ciudades");
        return response?.Data?
            .Where(ciudad => ciudad.DepartamentoId == departamentoId)
            .ToList() ?? [];
    }

    public async Task<CiudadDto?> GetCiudadAsync(int ciudadId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<CiudadDto>>($"api/v1/ciudades/{ciudadId}");
        return response?.Data;
    }

    public async Task<IReadOnlyList<CorregimientoDto>> GetCorregimientosAsync(int ciudadId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<List<CorregimientoDto>>>("api/v1/corregimientos");
        var corregimientos = response?.Data ?? [];

        if (corregimientos.Any(corregimiento => corregimiento.CiudadId.HasValue))
        {
            return corregimientos
                .Where(corregimiento => corregimiento.CiudadId == ciudadId)
                .ToList();
        }

        return corregimientos;
    }

    public async Task<CorregimientoDto?> GetCorregimientoAsync(int corregimientoId)
    {
        var response = await _httpClient.GetFromJsonAsync<ApiResponseDto<CorregimientoDto>>($"api/v1/corregimientos/{corregimientoId}");
        return response?.Data;
    }
}
