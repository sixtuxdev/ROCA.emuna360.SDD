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
        return await GetAllAsync(denominacionId);
    }

    public async Task<IEnumerable<ConfiguracionIglesia>> GetByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", iglesiaId);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<ConfiguracionIglesia>("usp_ConfiguracionIglesia_ListarPorIglesia", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<int> CreateAsync(ConfiguracionIglesia entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("usp_ConfiguracionIglesia_Insertar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> UpdateAsync(ConfiguracionIglesia entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        var rows = await connection.ExecuteAsync("usp_ConfiguracionIglesia_Actualizar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<IEnumerable<ConfiguracionIglesia>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<ConfiguracionIglesia>("usp_ConfiguracionIglesia_Listar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<ConfiguracionIglesia?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ConfiguracionIglesiaId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<ConfiguracionIglesia>("usp_ConfiguracionIglesia_Obtener", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ConfiguracionIglesiaId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_ConfiguracionIglesia_Eliminar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
}

