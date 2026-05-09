using ROCA.Emuna360.Domain.Entities.Structure;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class IglesiaEstructuraRepository : BaseRepository<IglesiaEstructura>, IIglesiaEstructuraRepository
{
    public IglesiaEstructuraRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<IglesiaEstructura>> GetByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", iglesiaId);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<IglesiaEstructura>("usp_IglesiaEstructura_ListarPorIglesia", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<int> CreateAsync(IglesiaEstructura entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("usp_IglesiaEstructura_Insertar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> UpdateAsync(IglesiaEstructura entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        var rows = await connection.ExecuteAsync("usp_IglesiaEstructura_Actualizar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<IglesiaEstructura>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<IglesiaEstructura>("usp_IglesiaEstructura_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<IglesiaEstructura?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<IglesiaEstructura>("usp_IglesiaEstructura_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_IglesiaEstructura_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

