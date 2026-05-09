using Microsoft.Extensions.DependencyInjection;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;
using ROCA.Emuna360.Application.Services.Organization;
using ROCA.Emuna360.Application.Interfaces.Services.Geography;
using ROCA.Emuna360.Application.Services.Geography;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using ROCA.Emuna360.Application.Services.Security;
using ROCA.Emuna360.Application.Interfaces.Services.Registry;
using ROCA.Emuna360.Application.Services.Registry;
using ROCA.Emuna360.Application.Interfaces.Services.Menus;
using ROCA.Emuna360.Application.Services.Menus;
using ROCA.Emuna360.Application.Interfaces.Services.Parameters;
using ROCA.Emuna360.Application.Services.Parameters;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using ROCA.Emuna360.Application.Services.Structure;

namespace ROCA.Emuna360.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(this IServiceCollection services)
    {
        services.AddAutoMapper(cfg => { cfg.AddProfile<ROCA.Emuna360.Application.Mappers.MappingProfile>(); });

        // Organization
        services.AddScoped<IDenominacionService, DenominacionService>();
        services.AddScoped<IIglesiaService, IglesiaService>();
        services.AddScoped<IConfiguracionIglesiaService, ConfiguracionIglesiaService>();
        services.AddScoped<IConfiguracionIglesiaColorService, ConfiguracionIglesiaColorService>();

        // Geography
        services.AddScoped<IPaisService, PaisService>();
        services.AddScoped<IDepartamentoService, DepartamentoService>();
        services.AddScoped<ICiudadService, CiudadService>();
        services.AddScoped<ICorregimientoService, CorregimientoService>();

        // Security
        services.AddScoped<IUsuarioService, UsuarioService>();
        services.AddScoped<IUsuarioPerfilService, UsuarioPerfilService>();
        services.AddScoped<IUsuarioIglesiaService, UsuarioIglesiaService>();
        services.AddScoped<IRolService, RolService>();
        services.AddScoped<IUsuarioRolService, UsuarioRolService>();
        services.AddScoped<ITokenRefreshService, TokenRefreshService>();
        services.AddScoped<ITokenVerificacionCorreoService, TokenVerificacionCorreoService>();

        // Registry
        services.AddScoped<IRegistroService, RegistroService>();

        // Menus
        services.AddScoped<IMenuService, MenuService>();
        services.AddScoped<IMenuRolService, MenuRolService>();
        services.AddScoped<IMenuUsuarioService, MenuUsuarioService>();

        // Parameters
        services.AddScoped<IClaseService, ClaseService>();
        services.AddScoped<IParametroService, ParametroService>();

        // Structure
        services.AddScoped<IEstructuraOrganizacionalService, EstructuraOrganizacionalService>();
        services.AddScoped<IEstructuraDenominacionService, EstructuraDenominacionService>();
        services.AddScoped<ITipoEstructuraService, TipoEstructuraService>();
        services.AddScoped<IIglesiaEstructuraService, IglesiaEstructuraService>();

        return services;
    }
}
