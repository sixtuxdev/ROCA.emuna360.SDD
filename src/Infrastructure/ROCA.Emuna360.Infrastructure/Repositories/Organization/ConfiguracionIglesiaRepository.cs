using ROCA.Emuna360.Domain.Entities.Organization;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class ConfiguracionIglesiaRepository : BaseRepository<ConfiguracionIglesia>, IConfiguracionIglesiaRepository
{
    public ConfiguracionIglesiaRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<ConfiguracionIglesia>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ConfiguracionIglesia>("SELECT * FROM ConfiguracionIglesia WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<IEnumerable<ConfiguracionIglesia>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ConfiguracionIglesia>("SELECT * FROM ConfiguracionIglesia WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public async Task<int> CreateAsync(ConfiguracionIglesia entity)
    {
        const string sql = """
            INSERT INTO ConfiguracionIglesia (DenominacionId, IglesiaId, SitioWeb, Logo, HostEmail, HostUsuarioEmail, Host, FromEmail, HostPort, TextFromEmail, KeySecretAPIRecaptcha, KeySecretWebRecaptcha, InfoTextoEncabezado, Activa, FechaCreacion, FechaActualizacion)
            OUTPUT INSERTED.ConfiguracionIglesiaId
            VALUES (@DenominacionId, @IglesiaId, @SitioWeb, @Logo, @HostEmail, @HostUsuarioEmail, @Host, @FromEmail, @HostPort, @TextFromEmail, @KeySecretAPIRecaptcha, @KeySecretWebRecaptcha, @InfoTextoEncabezado, @Activa, @FechaCreacion, @FechaActualizacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(ConfiguracionIglesia entity)
    {
        const string sql = """
            UPDATE ConfiguracionIglesia SET DenominacionId = @DenominacionId, IglesiaId = @IglesiaId, SitioWeb = @SitioWeb, Logo = @Logo, HostEmail = @HostEmail, HostUsuarioEmail = @HostUsuarioEmail, Host = @Host, FromEmail = @FromEmail, HostPort = @HostPort, TextFromEmail = @TextFromEmail, KeySecretAPIRecaptcha = @KeySecretAPIRecaptcha, KeySecretWebRecaptcha = @KeySecretWebRecaptcha, InfoTextoEncabezado = @InfoTextoEncabezado, Activa = @Activa, FechaActualizacion = @FechaActualizacion
            WHERE ConfiguracionIglesiaId = @ConfiguracionIglesiaId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<ConfiguracionIglesia>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ConfiguracionIglesia>("usp_ConfiguracionIglesia_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<ConfiguracionIglesia?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ConfiguracionIglesiaId", id);
        return await connection.QueryFirstOrDefaultAsync<ConfiguracionIglesia>("usp_ConfiguracionIglesia_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ConfiguracionIglesiaId", id);
        var rows = await connection.ExecuteAsync("usp_ConfiguracionIglesia_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

