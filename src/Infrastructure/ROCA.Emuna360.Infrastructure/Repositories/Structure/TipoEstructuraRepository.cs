using ROCA.Emuna360.Domain.Entities.Structure;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class TipoEstructuraRepository : BaseRepository<TipoEstructura>, ITipoEstructuraRepository
{
    public TipoEstructuraRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<TipoEstructura>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<int> CreateAsync(TipoEstructura entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("usp_TipoEstructura_Insertar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> UpdateAsync(TipoEstructura entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        var rows = await connection.ExecuteAsync("usp_TipoEstructura_Actualizar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<TipoEstructura>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<TipoEstructura>("usp_TipoEstructura_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<TipoEstructura?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<TipoEstructura>("usp_TipoEstructura_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_TipoEstructura_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

