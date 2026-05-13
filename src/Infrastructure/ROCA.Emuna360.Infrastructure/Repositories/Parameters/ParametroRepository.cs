using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Parameters;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Parameters;

public class ParametroRepository : BaseRepository<Parametro>, IParametroRepository
{
    public ParametroRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<Parametro>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<Parametro?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ParametroId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<Parametro>("usp_Parametro_Obtener", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<IEnumerable<Parametro>> GetByClaseAsync(int denominacionId, int claseId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        parameters.Add("@ClaseId", claseId);
        return await connection.QueryAsync<Parametro>("usp_Parametro_Listar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<OperationResult<int>> CreateAsync(Parametro entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@ClaseId", entity.ClaseId);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Observacion", entity.Observacion);
        parameters.Add("@PadreParametroId", entity.PadreParametroId);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_Parametro_Insertar", parameters, "@OutParametroId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Parametro entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ParametroId", entity.ParametroId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@ClaseId", entity.ClaseId);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Observacion", entity.Observacion);
        parameters.Add("@PadreParametroId", entity.PadreParametroId);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_Parametro_Actualizar", parameters, "@OutParametroId");
    }

    public async Task<System.Collections.Generic.IEnumerable<Parametro>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<Parametro>("usp_Parametro_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ParametroId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_Parametro_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

