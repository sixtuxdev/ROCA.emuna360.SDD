using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Structure;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
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

    public async Task<OperationResult<int>> CreateAsync(TipoEstructura entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Nombre", entity.Nombre);
        parameters.Add("@Orden", entity.Orden);
        return await ExecuteCreateAsync("usp_TipoEstructura_Insertar", parameters, "@OutTipoEstructuraId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(TipoEstructura entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@TipoEstructuraId", entity.TipoEstructuraId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Nombre", entity.Nombre);
        parameters.Add("@Orden", entity.Orden);
        return await ExecuteUpdateAsync("usp_TipoEstructura_Actualizar", parameters, "@OutTipoEstructuraId");
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

