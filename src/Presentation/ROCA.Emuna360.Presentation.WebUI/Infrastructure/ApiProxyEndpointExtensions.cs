namespace ROCA.Emuna360.Presentation.WebUI.Infrastructure;

public static class ApiProxyEndpointExtensions
{
    private static readonly HashSet<string> RequestHeadersForwarded = new(StringComparer.OrdinalIgnoreCase)
    {
        "Accept",
        "Accept-Language",
        "Authorization",
        "Content-Type"
    };

    private static readonly HashSet<string> ResponseHeadersNotForwarded = new(StringComparer.OrdinalIgnoreCase)
    {
        "Connection",
        "Content-Length",
        "Transfer-Encoding",
        "Set-Cookie"
    };

    public static IEndpointRouteBuilder MapApiProxy(this IEndpointRouteBuilder endpoints)
    {
        var methods = new[] { "GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS", "HEAD" };

        endpoints.MapMethods("/_api-proxy/{**path}", methods, ForwardAsync)
            .DisableAntiforgery();

        return endpoints;
    }

    private static async Task ForwardAsync(
        HttpContext context,
        IHttpClientFactory httpClientFactory,
        string? path)
    {
        if (string.IsNullOrWhiteSpace(path))
        {
            context.Response.StatusCode = StatusCodes.Status400BadRequest;
            await context.Response.WriteAsJsonAsync(new { error = "La ruta de la API es obligatoria." });
            return;
        }

        var upstreamClient = httpClientFactory.CreateClient("ApiProxyUpstream");
        var targetUri = new Uri(upstreamClient.BaseAddress!, $"{path}{context.Request.QueryString}");

        using var upstreamRequest = new HttpRequestMessage(
            new HttpMethod(context.Request.Method),
            targetUri);

        if (!HttpMethods.IsGet(context.Request.Method) &&
            !HttpMethods.IsHead(context.Request.Method) &&
            context.Request.Body.CanRead)
        {
            using var buffer = new MemoryStream();
            await context.Request.Body.CopyToAsync(buffer, context.RequestAborted);

            if (buffer.Length > 0)
                upstreamRequest.Content = new ByteArrayContent(buffer.ToArray());
        }

        CopyRequestHeaders(context.Request, upstreamRequest);

        try
        {
            using var upstreamResponse = await upstreamClient.SendAsync(
                upstreamRequest,
                HttpCompletionOption.ResponseHeadersRead,
                context.RequestAborted);

            context.Response.StatusCode = (int)upstreamResponse.StatusCode;
            context.Response.Headers["X-DevTools-Upstream-Url"] = targetUri.ToString();
            context.Response.Headers["Cache-Control"] = "no-store";

            CopyResponseHeaders(upstreamResponse, context.Response);

            if (upstreamResponse.Content is not null)
            {
                await upstreamResponse.Content.CopyToAsync(
                    context.Response.Body,
                    context.RequestAborted);
            }
        }
        catch (OperationCanceledException) when (context.RequestAborted.IsCancellationRequested)
        {
            // El navegador canceló la solicitud.
        }
        catch (HttpRequestException ex)
        {
            context.Response.StatusCode = StatusCodes.Status502BadGateway;
            context.Response.Headers["X-DevTools-Upstream-Url"] = targetUri.ToString();
            await context.Response.WriteAsJsonAsync(
                new { error = "No fue posible comunicarse con la API.", detail = ex.Message },
                context.RequestAborted);
        }
    }

    private static void CopyRequestHeaders(HttpRequest source, HttpRequestMessage destination)
    {
        foreach (var header in source.Headers)
        {
            if (!RequestHeadersForwarded.Contains(header.Key))
                continue;

            if (!destination.Headers.TryAddWithoutValidation(header.Key, header.Value.ToArray()) &&
                destination.Content is not null)
            {
                destination.Content.Headers.TryAddWithoutValidation(header.Key, header.Value.ToArray());
            }
        }
    }

    private static void CopyResponseHeaders(HttpResponseMessage source, HttpResponse destination)
    {
        foreach (var header in source.Headers)
        {
            if (!ResponseHeadersNotForwarded.Contains(header.Key))
                destination.Headers[header.Key] = header.Value.ToArray();
        }

        if (source.Content is null)
            return;

        foreach (var header in source.Content.Headers)
        {
            if (!ResponseHeadersNotForwarded.Contains(header.Key))
                destination.Headers[header.Key] = header.Value.ToArray();
        }
    }
}
