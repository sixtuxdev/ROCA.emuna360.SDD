using ROCA.Emuna360.Application;
using ROCA.Emuna360.Infrastructure;
using MudBlazor.Services;
using ROCA.Emuna360.Presentation.WebUI.Components;


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
builder.Services.AddScoped<ROCA.Emuna360.Presentation.WebUI.Services.TokenStorageService>();
builder.Services.AddScoped<Microsoft.AspNetCore.Components.Authorization.AuthenticationStateProvider, ROCA.Emuna360.Presentation.WebUI.Security.CustomAuthenticationStateProvider>();
builder.Services.AddScoped(sp => (ROCA.Emuna360.Presentation.WebUI.Security.CustomAuthenticationStateProvider)sp.GetRequiredService<Microsoft.AspNetCore.Components.Authorization.AuthenticationStateProvider>());

// API Client
var apiBaseUrl = builder.Configuration.GetValue<string>("ApiBaseUrl") ?? "https://localhost:7178";
builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(apiBaseUrl) });
builder.Services.AddScoped<ROCA.Emuna360.Presentation.WebUI.Services.AuthApiService>();

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
