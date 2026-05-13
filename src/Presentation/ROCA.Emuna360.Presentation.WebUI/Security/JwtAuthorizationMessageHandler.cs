using Microsoft.AspNetCore.Components.Authorization;
using ROCA.Emuna360.Application.DTOs.Auth;
using ROCA.Emuna360.Presentation.WebUI.Services;
using System.Net;
using System.Net.Http.Json;
using System.Net.Http.Headers;

namespace ROCA.Emuna360.Presentation.WebUI.Security;

public sealed class JwtAuthorizationMessageHandler : DelegatingHandler
{
    private static readonly string[] PublicAuthPaths =
    {
        "/api/v1/auth/login",
        "/api/v1/auth/register",
        "/api/v1/auth/confirm-email"
    };

    private readonly TokenStorageService _tokenStorage;
    private readonly IHttpClientFactory _httpClientFactory;
    private readonly AuthenticationStateProvider _authenticationStateProvider;

    public JwtAuthorizationMessageHandler(
        TokenStorageService tokenStorage,
        IHttpClientFactory httpClientFactory,
        AuthenticationStateProvider authenticationStateProvider)
    {
        _tokenStorage = tokenStorage;
        _httpClientFactory = httpClientFactory;
        _authenticationStateProvider = authenticationStateProvider;
    }

    protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
    {
        var isPublicAuthRequest = IsPublicAuthRequest(request);
        var retryRequest = isPublicAuthRequest ? null : await CloneRequestAsync(request, cancellationToken);

        if (!isPublicAuthRequest)
        {
            await EnsureValidAccessTokenAsync(cancellationToken);
            await AttachAccessTokenAsync(request);
        }

        var response = await base.SendAsync(request, cancellationToken);

        if (response.StatusCode != HttpStatusCode.Unauthorized || isPublicAuthRequest || retryRequest is null)
            return response;

        response.Dispose();

        if (!await TryRefreshTokenAsync(cancellationToken))
        {
            await ClearSessionAsync();
            return new HttpResponseMessage(HttpStatusCode.Unauthorized)
            {
                RequestMessage = request
            };
        }

        await AttachAccessTokenAsync(retryRequest);
        return await base.SendAsync(retryRequest, cancellationToken);
    }

    private async Task EnsureValidAccessTokenAsync(CancellationToken cancellationToken)
    {
        var expiration = await _tokenStorage.GetTokenExpirationAsync();

        if (!expiration.HasValue)
            return;

        if (expiration.Value <= DateTime.UtcNow.AddMinutes(1))
        {
            await TryRefreshTokenAsync(cancellationToken);
        }
    }

    private async Task AttachAccessTokenAsync(HttpRequestMessage request)
    {
        var token = await _tokenStorage.GetTokenAsync();

        if (!string.IsNullOrWhiteSpace(token))
        {
            request.Headers.Authorization = new AuthenticationHeaderValue("Bearer", token);
        }
    }

    private async Task<bool> TryRefreshTokenAsync(CancellationToken cancellationToken)
    {
        var refreshToken = await _tokenStorage.GetRefreshTokenAsync();
        var userInfo = await _tokenStorage.GetUserInfoAsync();

        if (string.IsNullOrWhiteSpace(refreshToken) || userInfo is null)
            return false;

        var publicClient = _httpClientFactory.CreateClient("PublicApi");
        var response = await publicClient.PostAsJsonAsync(
            "api/v1/auth/refresh-token",
            new RefreshTokenRequestDto
            {
                DenominacionId = userInfo.DenominacionId,
                RefreshToken = refreshToken
            },
            cancellationToken);

        if (!response.IsSuccessStatusCode)
            return false;

        var tokenResponse = await response.Content.ReadFromJsonAsync<RefreshTokenResponseDto>(cancellationToken: cancellationToken);

        if (tokenResponse is null || string.IsNullOrWhiteSpace(tokenResponse.AccessToken))
            return false;

        await _tokenStorage.UpdateTokensAsync(tokenResponse);

        if (_authenticationStateProvider is CustomAuthenticationStateProvider customProvider)
        {
            customProvider.NotifyUserAuthentication(tokenResponse.AccessToken);
        }

        return true;
    }

    private async Task ClearSessionAsync()
    {
        await _tokenStorage.RemoveTokenAsync();

        if (_authenticationStateProvider is CustomAuthenticationStateProvider customProvider)
        {
            customProvider.NotifyUserLogout();
        }
    }

    private static bool IsPublicAuthRequest(HttpRequestMessage request)
    {
        var path = request.RequestUri?.AbsolutePath.ToLowerInvariant();
        return path is not null && PublicAuthPaths.Contains(path);
    }

    private static async Task<HttpRequestMessage> CloneRequestAsync(HttpRequestMessage request, CancellationToken cancellationToken)
    {
        var clone = new HttpRequestMessage(request.Method, request.RequestUri)
        {
            Version = request.Version,
            VersionPolicy = request.VersionPolicy
        };

        foreach (var header in request.Headers)
        {
            clone.Headers.TryAddWithoutValidation(header.Key, header.Value);
        }

        if (request.Content is not null)
        {
            var contentBytes = await request.Content.ReadAsByteArrayAsync(cancellationToken);
            clone.Content = new ByteArrayContent(contentBytes);

            foreach (var header in request.Content.Headers)
            {
                clone.Content.Headers.TryAddWithoutValidation(header.Key, header.Value);
            }
        }

        return clone;
    }
}
