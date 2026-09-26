using System.Net;
using System.Net.Http.Json;
using System.Text.Json;
using ROCA.Emuna360.Application.DTOs.Common;
using ROCA.Emuna360.Application.DTOs.Registry;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class RegistroApiService
{
    private static readonly JsonSerializerOptions JsonOptions = new(JsonSerializerDefaults.Web);
    private readonly HttpClient _httpClient;

    public event EventHandler? RegistroCreado;

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

    public async Task<ApiResponseDto<int>> CreateRegistroAsync(
        RegistroDto registro,
        CancellationToken cancellationToken = default)
    {
        using var response = await _httpClient.PostAsJsonAsync(
            "api/v1/registros",
            registro,
            cancellationToken);
        var apiResponse = await ReadApiResponseAsync<int>(response, cancellationToken);

        if (apiResponse.Success && apiResponse.Data > 0)
            RegistroCreado?.Invoke(this, EventArgs.Empty);

        return apiResponse;
    }

    public async Task<bool> UpdateRegistroAsync(RegistroDto registro)
    {
        var response = await _httpClient.PutAsJsonAsync($"api/v1/registros/{registro.RegistroId}", registro);
        return response.IsSuccessStatusCode && await ReadDataAsync<bool>(response);
    }

    public async Task<ApiResponseDto<List<RegistroPendienteDto>>> GetPendientesAsync(
        CancellationToken cancellationToken = default)
    {
        using var response = await _httpClient.GetAsync(
            "api/v1/registros/pendientes",
            cancellationToken);

        return await ReadApiResponseAsync<List<RegistroPendienteDto>>(response, cancellationToken);
    }

    public async Task<ApiResponseDto<bool>> AprobarRegistroAsync(
        int registroId,
        CancellationToken cancellationToken = default)
    {
        using var request = new HttpRequestMessage(
            HttpMethod.Patch,
            $"api/v1/registros/{registroId}/aprobar");
        using var response = await _httpClient.SendAsync(request, cancellationToken);

        return await ReadApiResponseAsync<bool>(response, cancellationToken);
    }

    private static async Task<T?> ReadDataAsync<T>(HttpResponseMessage response)
    {
        if (!response.IsSuccessStatusCode)
            return default;

        var apiResponse = await response.Content.ReadFromJsonAsync<ApiResponseDto<T>>();
        return apiResponse is { Success: true } ? apiResponse.Data : default;
    }

    private static async Task<ApiResponseDto<T>> ReadApiResponseAsync<T>(
        HttpResponseMessage response,
        CancellationToken cancellationToken)
    {
        var content = await response.Content.ReadAsStringAsync(cancellationToken);
        ApiResponseDto<T>? apiResponse = null;

        if (!string.IsNullOrWhiteSpace(content))
        {
            try
            {
                apiResponse = JsonSerializer.Deserialize<ApiResponseDto<T>>(content, JsonOptions);
            }
            catch (JsonException)
            {
                // El mensaje de respaldo se construye más abajo.
            }
        }

        apiResponse ??= new ApiResponseDto<T>();
        apiResponse.Success = response.IsSuccessStatusCode && apiResponse.Success;
        apiResponse.Message = string.IsNullOrWhiteSpace(apiResponse.Message)
            ? TryReadErrorMessage(content) ?? GetFallbackMessage(response.StatusCode, response.IsSuccessStatusCode)
            : apiResponse.Message;

        return apiResponse;
    }

    private static string? TryReadErrorMessage(string content)
    {
        if (string.IsNullOrWhiteSpace(content))
            return null;

        try
        {
            using var document = JsonDocument.Parse(content);
            foreach (var propertyName in new[] { "message", "error", "title", "detail" })
            {
                if (document.RootElement.TryGetProperty(propertyName, out var property) &&
                    property.ValueKind == JsonValueKind.String)
                {
                    return property.GetString();
                }
            }
        }
        catch (JsonException)
        {
            // El contenido no era JSON; se utilizará un mensaje seguro.
        }

        return null;
    }

    private static string GetFallbackMessage(HttpStatusCode statusCode, bool isSuccessStatusCode)
    {
        if (isSuccessStatusCode)
            return "El servidor devolvió una respuesta que no se pudo procesar.";

        return statusCode switch
        {
            HttpStatusCode.Unauthorized => "La sesión expiró. Inicie sesión nuevamente.",
            HttpStatusCode.Forbidden => "No tiene permisos para aprobar registros.",
            HttpStatusCode.NotFound => "El registro no existe o ya no está disponible.",
            _ => "No fue posible completar la solicitud. Intente nuevamente."
        };
    }
}
