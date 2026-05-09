using ROCA.Emuna360.Domain.Entities.Geography;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class PaisRepository : BaseRepository<Pais>, IPaisRepository
{
    public PaisRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<int> CreateAsync(Pais entity)
    {
        const string sql = """
            INSERT INTO Pais (Pais, Descripcion, Estado, FechaCreacion)
            OUTPUT INSERTED.PaisId
            VALUES (@PaisNombre, @Descripcion, @Estado, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(Pais entity)
    {
        const string sql = """
            UPDATE Pais SET Pais = @PaisNombre, Descripcion = @Descripcion, Estado = @Estado
            WHERE PaisId = @PaisId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Pais>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Pais>("usp_Pais_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Pais?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@PaisId", id);
        return await connection.QueryFirstOrDefaultAsync<Pais>("usp_Pais_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@PaisId", id);
        var rows = await connection.ExecuteAsync("usp_Pais_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

