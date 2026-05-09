using ROCA.Emuna360.Domain.Entities.Geography;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class CiudadRepository : BaseRepository<Ciudad>, ICiudadRepository
{
    public CiudadRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<int> CreateAsync(Ciudad entity)
    {
        const string sql = """
            INSERT INTO Ciudad (DepartamentoId, Ciudad, Descripcion, Estado, FechaCreacion)
            OUTPUT INSERTED.CiudadId
            VALUES (@DepartamentoId, @CiudadNombre, @Descripcion, @Estado, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(Ciudad entity)
    {
        const string sql = """
            UPDATE Ciudad SET DepartamentoId = @DepartamentoId, Ciudad = @CiudadNombre, Descripcion = @Descripcion, Estado = @Estado
            WHERE CiudadId = @CiudadId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Ciudad>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Ciudad>("usp_Ciudad_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Ciudad?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CiudadId", id);
        return await connection.QueryFirstOrDefaultAsync<Ciudad>("usp_Ciudad_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@CiudadId", id);
        var rows = await connection.ExecuteAsync("usp_Ciudad_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

