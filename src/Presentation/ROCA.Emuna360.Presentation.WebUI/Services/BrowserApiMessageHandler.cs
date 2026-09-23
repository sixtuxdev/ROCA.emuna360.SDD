using Microsoft.JSInterop;
using System.Net;
using System.Text;
using System.Text.Json;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

/// <summary>
/// Ejecuta las solicitudes HTTP mediante fetch en el navegador para que sean
/// visibles en DevTools. La URL de fetch apunta al proxy del mismo WebUI.
/// </summary>
public sealed class BrowserApiMessageHandler : HttpMessageHandler
{
    private const string ProxyPrefix = "/_api-proxy";
    private const int BrowserRequestTimeoutMilliseconds = 30_000;
    private readonly IJSRuntime _jsRuntime;

    public BrowserApiMessageHandler(IJSRuntime jsRuntime)
    {
        _jsRuntime = jsRuntime;
    }

    protected override async Task<HttpResponseMessage> SendAsync(
        HttpRequestMessage request,
        CancellationToken cancellationToken)
    {
        if (request.RequestUri is null || !request.RequestUri.IsAbsoluteUri)
            throw new InvalidOperationException("La solicitud a la API debe tener una URL absoluta.");

        var headers = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

        foreach (var header in request.Headers)
            headers[header.Key] = string.Join(", ", header.Value);

        string? body = null;
        if (request.Content is not null)
        {
            try
            {
                body = await request.Content.ReadAsStringAsync(cancellationToken);
            }
            catch (OperationCanceledException)
            {
                return CreateErrorResponse(request, HttpStatusCode.RequestTimeout, "La solicitud fue cancelada antes de leer su contenido.");
            }

            foreach (var header in request.Content.Headers)
                headers[header.Key] = string.Join(", ", header.Value);
        }

        // Este encabezado se ve en DevTools y el proxy lo elimina antes de reenviar.
        headers["X-DevTools-Upstream-Url"] = request.RequestUri.ToString();

        var browserRequest = new BrowserFetchRequest
        {
            RequestId = Guid.NewGuid().ToString("N"),
            Url = $"{ProxyPrefix}{request.RequestUri.PathAndQuery}",
            Method = request.Method.Method,
            Headers = headers,
            Body = body,
            TimeoutMilliseconds = BrowserRequestTimeoutMilliseconds
        };

        if (cancellationToken.IsCancellationRequested)
            return CreateErrorResponse(request, HttpStatusCode.RequestTimeout, "La solicitud fue cancelada antes de ser enviada.");

        try
        {
            // La cancelación se transmite al AbortController del navegador. No se
            // cancela directamente InvokeAsync porque Blazor la materializa como
            // TaskCanceledException y deja el fetch ejecutándose en segundo plano.
            var browserInvocation = _jsRuntime.InvokeAsync<BrowserFetchResponse>(
                "browserApiHttp.send",
                browserRequest);
            using var cancellationRegistration = cancellationToken.Register(
                () => _ = TryAbortBrowserRequestAsync(browserRequest.RequestId));

            var browserResponse = await browserInvocation;
            return CreateResponse(request, browserResponse);
        }
        catch (JSDisconnectedException)
        {
            return CreateErrorResponse(request, HttpStatusCode.ServiceUnavailable, "La conexión con el navegador fue cerrada.");
        }
        catch (JSException)
        {
            return CreateErrorResponse(request, HttpStatusCode.BadGateway, "No fue posible ejecutar la solicitud desde el navegador.");
        }
        catch (OperationCanceledException)
        {
            return CreateErrorResponse(request, HttpStatusCode.RequestTimeout, "La solicitud a la API fue cancelada.");
        }
    }

    private static HttpResponseMessage CreateResponse(
        HttpRequestMessage request,
        BrowserFetchResponse browserResponse)
    {
        var response = new HttpResponseMessage((HttpStatusCode)browserResponse.Status)
        {
            ReasonPhrase = browserResponse.StatusText,
            RequestMessage = request,
            Content = new StringContent(browserResponse.Body ?? string.Empty, Encoding.UTF8)
        };

        response.Content.Headers.Clear();

        foreach (var header in browserResponse.Headers)
        {
            if (!response.Headers.TryAddWithoutValidation(header.Key, header.Value))
                response.Content.Headers.TryAddWithoutValidation(header.Key, header.Value);
        }

        return response;
    }

    private static HttpResponseMessage CreateErrorResponse(
        HttpRequestMessage request,
        HttpStatusCode statusCode,
        string message)
    {
        return new HttpResponseMessage(statusCode)
        {
            RequestMessage = request,
            ReasonPhrase = statusCode switch
            {
                HttpStatusCode.RequestTimeout => "Request Timeout",
                HttpStatusCode.BadGateway => "Bad Gateway",
                _ => "Service Unavailable"
            },
            Content = new StringContent(
                JsonSerializer.Serialize(new { error = message }),
                Encoding.UTF8,
                "application/json")
        };
    }

    private async Task TryAbortBrowserRequestAsync(string requestId)
    {
        try
        {
            await _jsRuntime.InvokeVoidAsync("browserApiHttp.abort", requestId);
        }
        catch (JSDisconnectedException)
        {
            // El circuito se cerró; no queda ninguna solicitud que cancelar.
        }
        catch (JSException)
        {
            // La solicitud ya terminó o el navegador dejó de estar disponible.
        }
        catch (OperationCanceledException)
        {
            // El circuito se está cerrando.
        }
    }

    public sealed class BrowserFetchRequest
    {
        public string RequestId { get; init; } = string.Empty;
        public string Url { get; init; } = string.Empty;
        public string Method { get; init; } = string.Empty;
        public Dictionary<string, string> Headers { get; init; } = [];
        public string? Body { get; init; }
        public int TimeoutMilliseconds { get; init; }
    }

    public sealed class BrowserFetchResponse
    {
        public int Status { get; init; }
        public string? StatusText { get; init; }
        public Dictionary<string, string> Headers { get; init; } = [];
        public string? Body { get; init; }
    }
}
