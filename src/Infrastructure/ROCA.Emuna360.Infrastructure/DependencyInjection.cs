using Microsoft.Extensions.DependencyInjection;
using ROCA.Emuna360.Application.Interfaces.Persistence;
using ROCA.Emuna360.Infrastructure.Persistence;

namespace ROCA.Emuna360.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services)
    {
        services.AddScoped<ISqlConnectionFactory, SqlConnectionFactory>();

        return services;
    }
}
