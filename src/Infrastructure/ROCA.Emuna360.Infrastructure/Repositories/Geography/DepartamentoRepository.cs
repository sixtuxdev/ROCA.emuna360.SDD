using ROCA.Emuna360.Domain.Entities.Geography;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class DepartamentoRepository : BaseRepository<Departamento>, IDepartamentoRepository
{
    public DepartamentoRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<int> CreateAsync(Departamento entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("usp_Departamento_Insertar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> UpdateAsync(Departamento entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        var rows = await connection.ExecuteAsync("usp_Departamento_Actualizar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Departamento>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Departamento>("usp_Departamento_Listar", commandType: System.Data.CommandType.StoredProcedure);
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

