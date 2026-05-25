using System.Net.Http.Json;
using System.Text.Json;
using ROCA.Emuna360.Application.DTOs.Security;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class UsuariosApiService
{
    private readonly HttpClient _httpClient;

    public UsuariosApiService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<IReadOnlyList<UsuarioPastorResponseDTO>> GetPastoresAsync(int denominacionId)
    {
        var response = await _httpClient.GetAsync($"api/v1/usuarios/get-pastores?denominacionId={denominacionId}");
        if (!response.IsSuccessStatusCode)
            return [];

        var payload = await response.Content.ReadFromJsonAsync<JsonElement>();
        if (!TryGetProperty(payload, "value", out var value) || value.ValueKind != JsonValueKind.Array)
            return [];

        return value.Deserialize<List<UsuarioPastorResponseDTO>>(new JsonSerializerOptions
        {
            PropertyNameCaseInsensitive = true
        }) ?? [];
    }

    private static bool TryGetProperty(JsonElement element, string propertyName, out JsonElement value)
    {
        foreach (var property in element.EnumerateObject())
        {
            if (string.Equals(property.Name, propertyName, StringComparison.OrdinalIgnoreCase))
            {
                value = property.Value;
                return true;
            }
        }

        value = default;
        return false;
    }
}
