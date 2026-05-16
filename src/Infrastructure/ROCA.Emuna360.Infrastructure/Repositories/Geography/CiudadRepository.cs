using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Geography;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class CiudadRepository : BaseRepository<Ciudad>, ICiudadRepository
{
    public CiudadRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<OperationResult<int>> CreateAsync(Ciudad entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DepartamentoId", entity.DepartamentoId);
        parameters.Add("@CiudadNombre", entity.CiudadNombre);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_Ciudad_Insertar", parameters, "@OutCiudadId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Ciudad entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CiudadId", entity.CiudadId);
        parameters.Add("@DepartamentoId", entity.DepartamentoId);
        parameters.Add("@CiudadNombre", entity.CiudadNombre);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_Ciudad_Actualizar", parameters, "@OutCiudadId");
    }

    public async Task<System.Collections.Generic.IEnumerable<Ciudad>> GetAllAsync(int DepartamentoId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DepartamentoId", DepartamentoId);
        return await connection.QueryAsync<Ciudad>("usp_Ciudad_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Ciudad?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CiudadId", id);
        return await connection.QueryFirstOrDefaultAsync<Ciudad>("usp_Ciudad_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CiudadId", id);
        var rows = await connection.ExecuteAsync("usp_Ciudad_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }

    public Task<IEnumerable<Ciudad>> GetAllAsync()
    {
        throw new NotImplementedException();
    }
}

