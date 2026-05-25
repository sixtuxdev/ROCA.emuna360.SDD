using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Security;
using Dapper;
using Microsoft.Extensions.Configuration;
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
        return await GetAllAsync(denominacionId);
    }

    public async Task<OperationResult<int>> CreateAsync(Usuario entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@RegistroId", entity.RegistroId);
        parameters.Add("@Correo", entity.Correo);
        parameters.Add("@PasswordHash", entity.PasswordHash);
        parameters.Add("@EmailVerificado", entity.EmailVerificado);
        parameters.Add("@Bloqueado", entity.Bloqueado);
        parameters.Add("@SecurityStamp", entity.SecurityStamp);        
        parameters.Add("@RolId", entity.RolId);
        return await ExecuteCreateAsync("usp_Usuario_Insertar", parameters, "@OutUsuarioId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Usuario entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@RegistroId", entity.RegistroId);
        parameters.Add("@Correo", entity.Correo);
        parameters.Add("@PasswordHash", entity.PasswordHash);
        parameters.Add("@EmailVerificado", entity.EmailVerificado);
        parameters.Add("@Bloqueado", entity.Bloqueado);
        parameters.Add("@SecurityStamp", entity.SecurityStamp);
        parameters.Add("@RolId", entity.RolId);
        return await ExecuteUpdateAsync("usp_Usuario_Actualizar", parameters, "@OutUsuarioId");
    }

    public async Task<System.Collections.Generic.IEnumerable<Usuario>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<Usuario>("usp_Usuario_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Usuario?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<Usuario>("usp_Usuario_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_Usuario_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<IEnumerable<UsuarioPastorResponse>> GetPastores(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<UsuarioPastorResponse>("UspGetPastores", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }
}
