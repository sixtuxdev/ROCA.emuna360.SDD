using ROCA.Emuna360.Application;
using ROCA.Emuna360.Infrastructure;
using MudBlazor.Services;
using ROCA.Emuna360.Presentation.WebUI.Components;
using ROCA.Emuna360.Presentation.WebUI.Security;
using ROCA.Emuna360.Presentation.WebUI.Services;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Auth;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Dashboard;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Layout;
using ROCA.Emuna360.Presentation.WebUI.ViewModels.Parameters;


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
builder.Services.AddTransient<JwtAuthorizationMessageHandler>();
builder.Services.AddScoped<LoginViewModel>();
builder.Services.AddScoped<MenuViewModel>();
builder.Services.AddScoped<DashboardViewModel>();
builder.Services.AddScoped<ConfigClasesViewModel>();

// API Client
var apiBaseUrl = builder.Configuration.GetValue<string>("ApiBaseUrl") ?? "https://localhost:7178";
builder.Services.AddHttpClient("PublicApi", client =>
{
    client.BaseAddress = new Uri(apiBaseUrl);
});
builder.Services.AddHttpClient("AuthenticatedApi", client =>
{
    client.BaseAddress = new Uri(apiBaseUrl);
}).AddHttpMessageHandler<JwtAuthorizationMessageHandler>();
builder.Services.AddScoped(sp => sp.GetRequiredService<IHttpClientFactory>().CreateClient("AuthenticatedApi"));
builder.Services.AddScoped(sp => new AuthApiService(sp.GetRequiredService<IHttpClientFactory>().CreateClient("PublicApi")));
builder.Services.AddScoped(sp => new ParametersApiService(sp.GetRequiredService<IHttpClientFactory>().CreateClient("AuthenticatedApi")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseAuthentication();
app.UseAuthorization();
app.UseAntiforgery();

app.MapStaticAssets();
app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();
