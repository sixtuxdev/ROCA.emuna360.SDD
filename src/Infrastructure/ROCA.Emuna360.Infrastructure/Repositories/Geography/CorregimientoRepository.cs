using ROCA.Emuna360.Domain.Entities.Geography;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class CorregimientoRepository : BaseRepository<Corregimiento>, ICorregimientoRepository
{
    public CorregimientoRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<int> CreateAsync(Corregimiento entity)
    {
        const string sql = """
            INSERT INTO Corregimiento (Corregimiento, Descripcion, Estado, FechaCreacion)
            OUTPUT INSERTED.CorregimientoId
            VALUES (@CorregimientoNombre, @Descripcion, @Estado, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(Corregimiento entity)
    {
        const string sql = """
            UPDATE Corregimiento SET Corregimiento = @CorregimientoNombre, Descripcion = @Descripcion, Estado = @Estado
            WHERE CorregimientoId = @CorregimientoId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Corregimiento>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Corregimiento>("usp_Corregimiento_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Corregimiento?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CorregimientoId", id);
        return await connection.QueryFirstOrDefaultAsync<Corregimiento>("usp_Corregimiento_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CorregimientoId", id);
        var rows = await connection.ExecuteAsync("usp_Corregimiento_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

