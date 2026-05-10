using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioIglesiaRepository : BaseRepository<UsuarioIglesia>, IUsuarioIglesiaRepository
{
    public UsuarioIglesiaRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<UsuarioIglesia>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<IEnumerable<UsuarioIglesia>> GetByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", iglesiaId);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<UsuarioIglesia>("usp_UsuarioIglesia_ListarPorIglesia", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<OperationResult<int>> CreateAsync(UsuarioIglesia entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@EsAdministrador", entity.EsAdministrador);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_UsuarioIglesia_Insertar", parameters, "@OutUsuarioIglesiaId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(UsuarioIglesia entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioIglesiaId", entity.UsuarioIglesiaId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@EsAdministrador", entity.EsAdministrador);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_UsuarioIglesia_Actualizar", parameters, "@OutUsuarioIglesiaId");
    }

    public async Task<System.Collections.Generic.IEnumerable<UsuarioIglesia>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<UsuarioIglesia>("usp_UsuarioIglesia_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<UsuarioIglesia?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioIglesiaId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<UsuarioIglesia>("usp_UsuarioIglesia_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioIglesiaId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_UsuarioIglesia_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

