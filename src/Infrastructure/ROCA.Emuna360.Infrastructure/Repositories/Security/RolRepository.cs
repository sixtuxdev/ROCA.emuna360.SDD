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
        using var connection = CreateConnection();
        return await connection.QueryAsync<Rol>("SELECT * FROM Roles WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(Rol entity)
    {
        const string sql = """
            INSERT INTO Roles (DenominacionId, Nombre, Codigo, Activo, FechaCreacion)
            OUTPUT INSERTED.RolId
            VALUES (@DenominacionId, @Nombre, @Codigo, @Activo, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(Rol entity)
    {
        const string sql = """
            UPDATE Roles SET DenominacionId = @DenominacionId, Nombre = @Nombre, Codigo = @Codigo, Activo = @Activo
            WHERE RolId = @RolId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Rol>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Rol>("usp_Rol_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Rol?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RolId", id);
        return await connection.QueryFirstOrDefaultAsync<Rol>("usp_Rol_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RolId", id);
        var rows = await connection.ExecuteAsync("usp_Rol_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

