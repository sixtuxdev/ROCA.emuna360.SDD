using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Geography;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class CorregimientoRepository : BaseRepository<Corregimiento>, ICorregimientoRepository
{
    public CorregimientoRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<OperationResult<int>> CreateAsync(Corregimiento entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CorregimientoNombre", entity.CorregimientoNombre);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_Corregimiento_Insertar", parameters, "@OutCorregimientoId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Corregimiento entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CorregimientoId", entity.CorregimientoId);
        parameters.Add("@CorregimientoNombre", entity.CorregimientoNombre);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_Corregimiento_Actualizar", parameters, "@OutCorregimientoId");
    }

    public async Task<System.Collections.Generic.IEnumerable<Corregimiento>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Corregimiento>("usp_Corregimiento_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<System.Collections.Generic.IEnumerable<Corregimiento>> GetAllAsync(int ciudadId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CiudadId", ciudadId);
        return await connection.QueryAsync<Corregimiento>("usp_Corregimiento_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Corregimiento?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CorregimientoId", id);
        return await connection.QueryFirstOrDefaultAsync<Corregimiento>("usp_Corregimiento_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CorregimientoId", id);
        var rows = await connection.ExecuteAsync("usp_Corregimiento_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

