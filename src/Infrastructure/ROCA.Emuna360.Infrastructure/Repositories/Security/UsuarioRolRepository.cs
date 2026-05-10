using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioRolRepository : BaseRepository<UsuarioRol>, IUsuarioRolRepository
{
    public UsuarioRolRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<UsuarioRol>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<OperationResult<int>> CreateAsync(UsuarioRol entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@RolId", entity.RolId);
        parameters.Add("@FechaAsignacion", entity.FechaAsignacion);
        return await ExecuteCreateAsync("usp_UsuarioRol_Insertar", parameters, "@OutUsuarioRolId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(UsuarioRol entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioRolId", entity.UsuarioRolId);
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@RolId", entity.RolId);
        parameters.Add("@FechaAsignacion", entity.FechaAsignacion);
        return await ExecuteUpdateAsync("usp_UsuarioRol_Actualizar", parameters, "@OutUsuarioRolId");
    }

    public async Task<System.Collections.Generic.IEnumerable<UsuarioRol>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<UsuarioRol>("usp_UsuarioRol_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<UsuarioRol?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<UsuarioRol>("usp_UsuarioRol_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_UsuarioRol_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

