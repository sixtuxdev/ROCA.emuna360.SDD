using Microsoft.Extensions.DependencyInjection;
using ROCA.Emuna360.Application.Interfaces.Persistence;
using ROCA.Emuna360.Infrastructure.Persistence;

using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using ROCA.Emuna360.Infrastructure.Repositories.Organization;

using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using ROCA.Emuna360.Infrastructure.Repositories.Geography;

using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using ROCA.Emuna360.Infrastructure.Repositories.Security;

using ROCA.Emuna360.Application.Interfaces.Repositories.Registry;
using ROCA.Emuna360.Infrastructure.Repositories.Registry;

using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using ROCA.Emuna360.Infrastructure.Repositories.Menus;

using ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;
using ROCA.Emuna360.Infrastructure.Repositories.Parameters;

using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using ROCA.Emuna360.Infrastructure.Repositories.Structure;

namespace ROCA.Emuna360.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services)
    {
        services.AddScoped<ISqlConnectionFactory, SqlConnectionFactory>();

        // Organization
        services.AddScoped<IDenominacionRepository, DenominacionRepository>();
        services.AddScoped<IIglesiaRepository, IglesiaRepository>();
        services.AddScoped<IConfiguracionIglesiaRepository, ConfiguracionIglesiaRepository>();
        services.AddScoped<IConfiguracionIglesiaColorRepository, ConfiguracionIglesiaColorRepository>();

        // Geography
        services.AddScoped<IPaisRepository, PaisRepository>();
        services.AddScoped<IDepartamentoRepository, DepartamentoRepository>();
        services.AddScoped<ICiudadRepository, CiudadRepository>();
        services.AddScoped<ICorregimientoRepository, CorregimientoRepository>();

        // Security
        services.AddScoped<IUsuarioRepository, UsuarioRepository>();
        services.AddScoped<IUsuarioPerfilRepository, UsuarioPerfilRepository>();
        services.AddScoped<IUsuarioIglesiaRepository, UsuarioIglesiaRepository>();
        services.AddScoped<IRolRepository, RolRepository>();
        services.AddScoped<IUsuarioRolRepository, UsuarioRolRepository>();
        services.AddScoped<ITokenRefreshRepository, TokenRefreshRepository>();
        services.AddScoped<ITokenVerificacionCorreoRepository, TokenVerificacionCorreoRepository>();

        // Registry
        services.AddScoped<IRegistroRepository, RegistroRepository>();

        // Menus
        services.AddScoped<IMenuRepository, MenuRepository>();
        services.AddScoped<IMenuRolRepository, MenuRolRepository>();
        services.AddScoped<IMenuUsuarioRepository, MenuUsuarioRepository>();

        // Parameters
        services.AddScoped<IClaseRepository, ClaseRepository>();
        services.AddScoped<IParametroRepository, ParametroRepository>();

        // Structure
        services.AddScoped<IEstructuraOrganizacionalRepository, EstructuraOrganizacionalRepository>();
        services.AddScoped<IEstructuraDenominacionRepository, EstructuraDenominacionRepository>();
        services.AddScoped<ITipoEstructuraRepository, TipoEstructuraRepository>();
        services.AddScoped<IIglesiaEstructuraRepository, IglesiaEstructuraRepository>();

        return services;
    }
}
