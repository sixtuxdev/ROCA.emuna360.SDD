using ROCA.Emuna360.Application;
using ROCA.Emuna360.Infrastructure;
using MudBlazor.Services;
using ROCA.Emuna360.Presentation.WebUI.Components;
using ROCA.Emuna360.Presentation.WebUI.Infrastructure;
using ROCA.Emuna360.Presentation.WebUI.Security;
using ROCA.Emuna360.Presentation.WebUI.Services;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.App;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Auth;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.CompletarDatos; // <-- AGREGADO
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Dashboard;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Layout;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Organization;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Parameters;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Registry;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Structure;

var builder = WebApplication.CreateBuilder(args);

// Add MudBlazor services
builder.Services.AddMudServices();

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

builder.Services.AddApplication();
builder.Services.AddInfrastructure();

// Security and Authentication
builder.Services.AddCascadingAuthenticationState();

builder.Services.AddAuthentication(options =>
{
    options.DefaultScheme = Microsoft.AspNetCore.Authentication.Cookies.CookieAuthenticationDefaults.AuthenticationScheme;
})
.AddCookie(options =>
{
    options.LoginPath = "/login";
    options.LogoutPath = "/logout";
    options.AccessDeniedPath = "/access-denied";
});

builder.Services.AddAuthorization();

builder.Services.AddScoped<TokenStorageService>();
builder.Services.AddScoped<Microsoft.AspNetCore.Components.Authorization.AuthenticationStateProvider, CustomAuthenticationStateProvider>();
builder.Services.AddScoped(sp => (CustomAuthenticationStateProvider)sp.GetRequiredService<Microsoft.AspNetCore.Components.Authorization.AuthenticationStateProvider>());
builder.Services.AddScoped<BrowserApiClientFactory>();

// ViewModels
builder.Services.AddScoped<AppStartupViewModel>();
builder.Services.AddScoped<LoginViewModel>();
builder.Services.AddScoped<MenuViewModel>();
builder.Services.AddScoped<DashboardViewModel>();
builder.Services.AddScoped<IglesiaStateService>();
builder.Services.AddScoped<ConfigClasesViewModel>();
builder.Services.AddScoped<ConfigIglesiasViewModel>();
builder.Services.AddScoped<AdminIglesiaViewModel>();
builder.Services.AddScoped<AdminRegistroViewModel>();
builder.Services.AddScoped<CompletarDatosViewModel>(); // <-- AGREGADO
builder.Services.AddScoped<ConfigEstructuraOrganizacionalViewModel>();

// API Client
var apiBaseUrl = builder.Configuration.GetValue<string>("ApiBaseUrl") ?? "https://localhost:7178";
apiBaseUrl = $"{apiBaseUrl.TrimEnd('/')}/";

// Este cliente se ejecuta en el servidor exclusivamente para reenviar las
// solicitudes que el navegador realiza contra /_api-proxy.
builder.Services.AddHttpClient("ApiProxyUpstream", client =>
{
    client.BaseAddress = new Uri(apiBaseUrl);
});
builder.Services.AddHttpClient("PublicRegistrationApi", client =>
{
    client.BaseAddress = new Uri(apiBaseUrl);
    client.Timeout = TimeSpan.FromSeconds(15);
});

builder.Services.AddScoped(sp => sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient());

builder.Services.AddScoped(sp => new AuthApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreatePublicClient()));
builder.Services.AddScoped(sp => new DenominacionesApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreatePublicClient()));
builder.Services.AddScoped(sp => new RegistroCatalogosApiService(
    sp.GetRequiredService<IHttpClientFactory>().CreateClient("PublicRegistrationApi")));
builder.Services.AddScoped(sp => new IglesiaSelectorApiService(
    sp.GetRequiredService<IHttpClientFactory>().CreateClient("PublicRegistrationApi")));
builder.Services.AddScoped(sp => new ParametersApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient()));
builder.Services.AddScoped(sp => new IglesiasApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient()));
builder.Services.AddScoped(sp => new RegistroApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient()));
builder.Services.AddScoped(sp => new CompletarDatosApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient())); // <-- AGREGADO
builder.Services.AddScoped(sp => new RolApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient()));
builder.Services.AddScoped(sp => new UsuariosApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient()));
builder.Services.AddScoped(sp => new IglesiasEstructurasApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient()));
builder.Services.AddScoped(sp => new GeographyApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient()));
builder.Services.AddScoped(sp => new EstructuraOrganizacionalApiService(sp.GetRequiredService<BrowserApiClientFactory>().CreateAuthenticatedClient()));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();
app.UseAntiforgery();

app.MapStaticAssets();
app.MapApiProxy();

app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();
