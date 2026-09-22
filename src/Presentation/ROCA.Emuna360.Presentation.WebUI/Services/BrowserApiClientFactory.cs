using Microsoft.Extensions.DependencyInjection;
using Microsoft.JSInterop;
using ROCA.Emuna360.Presentation.WebUI.Security;

namespace ROCA.Emuna360.Presentation.WebUI.Services;

public sealed class BrowserApiClientFactory : IDisposable
{
    private readonly IServiceProvider _serviceProvider;
    private readonly IJSRuntime _jsRuntime;
    private readonly Uri _apiBaseAddress;
    private HttpClient? _publicClient;
    private HttpClient? _authenticatedClient;

    public BrowserApiClientFactory(
        IServiceProvider serviceProvider,
        IJSRuntime jsRuntime,
        IConfiguration configuration)
    {
        _serviceProvider = serviceProvider;
        _jsRuntime = jsRuntime;

        var apiBaseUrl = configuration.GetValue<string>("ApiBaseUrl") ?? "https://localhost:7178";
        _apiBaseAddress = new Uri($"{apiBaseUrl.TrimEnd('/')}/", UriKind.Absolute);
    }

    public HttpClient CreatePublicClient()
    {
        return _publicClient ??= CreateClient(new BrowserApiMessageHandler(_jsRuntime));
    }

    public HttpClient CreateAuthenticatedClient()
    {
        if (_authenticatedClient is not null)
            return _authenticatedClient;

        var authorizationHandler = ActivatorUtilities.CreateInstance<JwtAuthorizationMessageHandler>(_serviceProvider);
        authorizationHandler.InnerHandler = new BrowserApiMessageHandler(_jsRuntime);
        _authenticatedClient = CreateClient(authorizationHandler);
        return _authenticatedClient;
    }

    private HttpClient CreateClient(HttpMessageHandler handler)
    {
        return new HttpClient(handler)
        {
            BaseAddress = _apiBaseAddress
        };
    }

    public void Dispose()
    {
        _authenticatedClient?.Dispose();
        _publicClient?.Dispose();
    }
}
