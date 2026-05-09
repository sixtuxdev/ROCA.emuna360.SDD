using ROCA.Emuna360.Domain.Entities.Organization;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class DenominacionRepository : BaseRepository<Denominacion>, IDenominacionRepository
{
    public DenominacionRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<int> CreateAsync(Denominacion entity)
    {
        const string sql = """
            INSERT INTO Denominaciones (Nombre, Slug, Activa, IglesiaPrincipalId, FechaCreacion)
            OUTPUT INSERTED.DenominacionId
            VALUES (@Nombre, @Slug, @Activa, @IglesiaPrincipalId, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(Denominacion entity)
    {
        const string sql = """
            UPDATE Denominaciones 
            SET Nombre = @Nombre, Slug = @Slug, Activa = @Activa, IglesiaPrincipalId = @IglesiaPrincipalId
            WHERE DenominacionId = @DenominacionId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Denominacion>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Denominacion>("usp_Denominacion_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Denominacion?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", id);
        return await connection.QueryFirstOrDefaultAsync<Denominacion>("usp_Denominacion_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", id);
        var rows = await connection.ExecuteAsync("usp_Denominacion_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

