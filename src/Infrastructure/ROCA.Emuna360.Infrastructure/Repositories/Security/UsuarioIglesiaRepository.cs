using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioIglesiaRepository : BaseRepository<UsuarioIglesia>, IUsuarioIglesiaRepository
{
    public UsuarioIglesiaRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<UsuarioIglesia>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioIglesia>("SELECT * FROM UsuariosIglesias WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<IEnumerable<UsuarioIglesia>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioIglesia>("SELECT * FROM UsuariosIglesias WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public async Task<int> CreateAsync(UsuarioIglesia entity)
    {
        const string sql = """
            INSERT INTO UsuariosIglesias (DenominacionId, UsuarioId, IglesiaId, Estado, EsAdministrador, FechaCreacion)
            OUTPUT INSERTED.UsuarioIglesiaId
            VALUES (@DenominacionId, @UsuarioId, @IglesiaId, @Estado, @EsAdministrador, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(UsuarioIglesia entity)
    {
        const string sql = """
            UPDATE UsuariosIglesias SET DenominacionId = @DenominacionId, UsuarioId = @UsuarioId, IglesiaId = @IglesiaId, Estado = @Estado, EsAdministrador = @EsAdministrador
            WHERE UsuarioIglesiaId = @UsuarioIglesiaId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<UsuarioIglesia>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioIglesia>("usp_UsuarioIglesia_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<UsuarioIglesia?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioIglesiaId", id);
        return await connection.QueryFirstOrDefaultAsync<UsuarioIglesia>("usp_UsuarioIglesia_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioIglesiaId", id);
        var rows = await connection.ExecuteAsync("usp_UsuarioIglesia_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

