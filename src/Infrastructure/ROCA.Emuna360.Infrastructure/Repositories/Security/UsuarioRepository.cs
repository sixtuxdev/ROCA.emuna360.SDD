using ROCA.Emuna360.Domain.Entities.Security;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioRepository : BaseRepository<Usuario>, IUsuarioRepository
{
    public UsuarioRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<Usuario>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Usuario>("SELECT * FROM Usuarios WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(Usuario entity)
    {
        using var connection = CreateConnection();
        // Uses stored procedure based on SPEC-003
        var p = new DynamicParameters(entity);
        p.Add("@UsuarioId", dbType: DbType.Int32, direction: ParameterDirection.Output);
        
        await connection.ExecuteAsync("sp_Usuarios_Insertar", p, commandType: CommandType.StoredProcedure);
        return p.Get<int>("@UsuarioId");
    }

    public async Task<bool> UpdateAsync(Usuario entity)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("sp_Usuarios_Actualizar", entity, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Usuario>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Usuario>("usp_Usuario_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Usuario?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioId", id);
        return await connection.QueryFirstOrDefaultAsync<Usuario>("usp_Usuario_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioId", id);
        var rows = await connection.ExecuteAsync("usp_Usuario_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}
