using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class ConfiguracionIglesiaRepository : BaseRepository<ConfiguracionIglesiaDto>, IConfiguracionIglesiaRepository
{
    public ConfiguracionIglesiaRepository(IConfiguration configuration) 
        : base(configuration, "ConfiguracionIglesia", "ConfiguracionIglesiaId") { }

    public async Task<IEnumerable<ConfiguracionIglesiaDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ConfiguracionIglesiaDto>("SELECT * FROM ConfiguracionIglesia WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<IEnumerable<ConfiguracionIglesiaDto>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ConfiguracionIglesiaDto>("SELECT * FROM ConfiguracionIglesia WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public override async Task<int> CreateAsync(ConfiguracionIglesiaDto dto)
    {
        const string sql = """
            INSERT INTO ConfiguracionIglesia (DenominacionId, IglesiaId, SitioWeb, Logo, HostEmail, HostUsuarioEmail, Host, FromEmail, HostPort, TextFromEmail, KeySecretAPIRecaptcha, KeySecretWebRecaptcha, InfoTextoEncabezado, Activa, FechaCreacion, FechaActualizacion)
            OUTPUT INSERTED.ConfiguracionIglesiaId
            VALUES (@DenominacionId, @IglesiaId, @SitioWeb, @Logo, @HostEmail, @HostUsuarioEmail, @Host, @FromEmail, @HostPort, @TextFromEmail, @KeySecretAPIRecaptcha, @KeySecretWebRecaptcha, @InfoTextoEncabezado, @Activa, @FechaCreacion, @FechaActualizacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(ConfiguracionIglesiaDto dto)
    {
        const string sql = """
            UPDATE ConfiguracionIglesia SET DenominacionId = @DenominacionId, IglesiaId = @IglesiaId, SitioWeb = @SitioWeb, Logo = @Logo, HostEmail = @HostEmail, HostUsuarioEmail = @HostUsuarioEmail, Host = @Host, FromEmail = @FromEmail, HostPort = @HostPort, TextFromEmail = @TextFromEmail, KeySecretAPIRecaptcha = @KeySecretAPIRecaptcha, KeySecretWebRecaptcha = @KeySecretWebRecaptcha, InfoTextoEncabezado = @InfoTextoEncabezado, Activa = @Activa, FechaActualizacion = @FechaActualizacion
            WHERE ConfiguracionIglesiaId = @ConfiguracionIglesiaId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
