using System.Net.Http.Json;
using System.Text.Json;
using ROCA.Emuna360.Application.DTOs.Registry;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class CompletarDatosApiService
{
    private readonly HttpClient _httpClient;

    public CompletarDatosApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<CompletarDatosDto?> GetByRegistroAsync(int registroId)
    {
        var response = await _httpClient.GetAsync($"api/v1/completar-datos/registro/{registroId}");
        if (!response.IsSuccessStatusCode)
            return null;
        return await response.Content.ReadFromJsonAsync<CompletarDatosDto>();
    }

    public async Task<int?> CreateAsync(CompletarDatosDto model)
    {
        // Asegurar FechaCreacion si el servidor la requiere (puede setearla el servidor idealmente)
        if (model.FechaCreacion == null)
            model.FechaCreacion = DateTime.UtcNow;

        var requestJson = JsonSerializer.Serialize(model);
        var response = await _httpClient.PostAsJsonAsync("api/v1/completar-datos", model);
        if (!response.IsSuccessStatusCode)
        {
            var body = await response.Content.ReadAsStringAsync();
            // Incluir payload en la excepción para ayudar al debug
            throw new HttpRequestException($"API error {response.StatusCode}: {body}\nRequest: {requestJson}");
        }
        var created = await response.Content.ReadFromJsonAsync<CompletarDatosDto>();
        return created?.CompletarDatosId;
    }

    public async Task<bool> UpdateAsync(int id, CompletarDatosDto model)
    {
        var response = await _httpClient.PutAsJsonAsync($"api/v1/completar-datos/{id}", model);
        if (!response.IsSuccessStatusCode)
        {
            var body = await response.Content.ReadAsStringAsync();
            throw new HttpRequestException($"API error {response.StatusCode}: {body}");
        }
        return true;
    }
}
