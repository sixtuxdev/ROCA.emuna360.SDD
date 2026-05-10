using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Organization;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class ConfiguracionIglesiaColorRepository : BaseRepository<ConfiguracionIglesiaColor>, IConfiguracionIglesiaColorRepository
{
    public ConfiguracionIglesiaColorRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<ConfiguracionIglesiaColor>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<OperationResult<int>> CreateAsync(ConfiguracionIglesiaColor entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ConfiguracionIglesiaId", entity.ConfiguracionIglesiaId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@NombreColor", entity.NombreColor);
        parameters.Add("@ValorColor", entity.ValorColor);
        return await ExecuteCreateAsync("usp_ConfiguracionIglesiaColor_Insertar", parameters, "@OutId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(ConfiguracionIglesiaColor entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ConfiguracionIglesiaId", entity.ConfiguracionIglesiaId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@NombreColor", entity.NombreColor);
        parameters.Add("@ValorColor", entity.ValorColor);
        return await ExecuteUpdateAsync("usp_ConfiguracionIglesiaColor_Actualizar", parameters, "@OutId");
    }

    public async Task<IEnumerable<ConfiguracionIglesiaColor>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<ConfiguracionIglesiaColor>("usp_ConfiguracionIglesiaColor_Listar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<ConfiguracionIglesiaColor?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<ConfiguracionIglesiaColor>("usp_ConfiguracionIglesiaColor_Obtener", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_ConfiguracionIglesiaColor_Eliminar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
}

