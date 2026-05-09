using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class RolRepository : BaseRepository<Rol>, IRolRepository
{
    public RolRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<Rol>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<int> CreateAsync(Rol entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("usp_Rol_Insertar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> UpdateAsync(Rol entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        var rows = await connection.ExecuteAsync("usp_Rol_Actualizar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Rol>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<Rol>("usp_Rol_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Rol?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RolId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<Rol>("usp_Rol_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RolId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_Rol_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

