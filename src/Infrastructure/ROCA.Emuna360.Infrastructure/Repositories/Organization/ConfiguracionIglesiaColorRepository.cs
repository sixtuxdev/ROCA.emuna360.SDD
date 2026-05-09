using ROCA.Emuna360.Domain.Entities.Organization;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class ConfiguracionIglesiaColorRepository : BaseRepository<ConfiguracionIglesiaColor>, IConfiguracionIglesiaColorRepository
{
    public ConfiguracionIglesiaColorRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<ConfiguracionIglesiaColor>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ConfiguracionIglesiaColor>("SELECT * FROM ConfiguracionIglesiaColores WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(ConfiguracionIglesiaColor entity)
    {
        const string sql = """
            INSERT INTO ConfiguracionIglesiaColores (DenominacionId, NombreColor, ValorColor)
            OUTPUT INSERTED.ConfiguracionIglesiaId
            VALUES (@DenominacionId, @NombreColor, @ValorColor)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(ConfiguracionIglesiaColor entity)
    {
        const string sql = """
            UPDATE ConfiguracionIglesiaColores SET DenominacionId = @DenominacionId, NombreColor = @NombreColor, ValorColor = @ValorColor
            WHERE ConfiguracionIglesiaId = @ConfiguracionIglesiaId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<ConfiguracionIglesiaColor>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ConfiguracionIglesiaColor>("usp_ConfiguracionIglesiaColor_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<ConfiguracionIglesiaColor?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        return await connection.QueryFirstOrDefaultAsync<ConfiguracionIglesiaColor>("usp_ConfiguracionIglesiaColor_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        var rows = await connection.ExecuteAsync("usp_ConfiguracionIglesiaColor_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

