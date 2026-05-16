using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Geography;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class DepartamentoRepository : BaseRepository<Departamento>, IDepartamentoRepository
{
    public DepartamentoRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<OperationResult<int>> CreateAsync(Departamento entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@PaisId", entity.PaisId);
        parameters.Add("@DepartamentoNombre", entity.DepartamentoNombre);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_Departamento_Insertar", parameters, "@OutDepartamentoId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Departamento entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DepartamentoId", entity.DepartamentoId);
        parameters.Add("@PaisId", entity.PaisId);
        parameters.Add("@DepartamentoNombre", entity.DepartamentoNombre);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_Departamento_Actualizar", parameters, "@OutDepartamentoId");
    }

    public async Task<System.Collections.Generic.IEnumerable<Departamento>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Departamento>("usp_Departamento_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<System.Collections.Generic.IEnumerable<Departamento>> GetAllAsync(int paisId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@PaisId", paisId);
        return await connection.QueryAsync<Departamento>("usp_Departamento_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Departamento?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DepartamentoId", id);
        return await connection.QueryFirstOrDefaultAsync<Departamento>("usp_Departamento_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DepartamentoId", id);
        var rows = await connection.ExecuteAsync("usp_Departamento_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

