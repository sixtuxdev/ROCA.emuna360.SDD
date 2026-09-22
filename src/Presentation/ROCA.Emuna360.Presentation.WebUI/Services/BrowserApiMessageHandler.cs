using Microsoft.JSInterop;
using System.Net;
using System.Text;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

/// <summary>
/// Ejecuta las solicitudes HTTP mediante fetch en el navegador para que sean
/// visibles en DevTools. La URL de fetch apunta al proxy del mismo WebUI.
/// </summary>
public sealed class BrowserApiMessageHandler : HttpMessageHandler
{
    private const string ProxyPrefix = "/_api-proxy";
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
            body = await request.Content.ReadAsStringAsync(cancellationToken);

            foreach (var header in request.Content.Headers)
                headers[header.Key] = string.Join(", ", header.Value);
        }

        // Este encabezado se ve en DevTools y el proxy lo elimina antes de reenviar.
        headers["X-DevTools-Upstream-Url"] = request.RequestUri.ToString();

        var browserRequest = new BrowserFetchRequest
        {
            Url = $"{ProxyPrefix}{request.RequestUri.PathAndQuery}",
            Method = request.Method.Method,
            Headers = headers,
            Body = body
        };

        var browserResponse = await _jsRuntime.InvokeAsync<BrowserFetchResponse>(
            "browserApiHttp.send",
            cancellationToken,
            browserRequest);

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

    public sealed class BrowserFetchRequest
    {
        public string Url { get; init; } = string.Empty;
        public string Method { get; init; } = string.Empty;
        public Dictionary<string, string> Headers { get; init; } = [];
        public string? Body { get; init; }
    }

    public sealed class BrowserFetchResponse
    {
        public int Status { get; init; }
        public string? StatusText { get; init; }
        public Dictionary<string, string> Headers { get; init; } = [];
        public string? Body { get; init; }
    }
}
