using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioRolRepository : BaseRepository<UsuarioRol>, IUsuarioRolRepository
{
    public UsuarioRolRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<UsuarioRol>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioRol>("SELECT * FROM UsuarioRoles WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(UsuarioRol entity)
    {
        const string sql = """
            INSERT INTO UsuarioRoles (UsuarioId, RolId, DenominacionId, IglesiaId, FechaAsignacion)
            OUTPUT INSERTED.Id
            VALUES (@UsuarioId, @RolId, @DenominacionId, @IglesiaId, @FechaAsignacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(UsuarioRol entity)
    {
        const string sql = """
            UPDATE UsuarioRoles SET UsuarioId = @UsuarioId, RolId = @RolId, DenominacionId = @DenominacionId, IglesiaId = @IglesiaId
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<UsuarioRol>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioRol>("usp_UsuarioRol_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<UsuarioRol?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        return await connection.QueryFirstOrDefaultAsync<UsuarioRol>("usp_UsuarioRol_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        var rows = await connection.ExecuteAsync("usp_UsuarioRol_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

