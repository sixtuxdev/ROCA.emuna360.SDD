using ROCA.Emuna360.Domain.Entities.Structure;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class IglesiaEstructuraRepository : BaseRepository<IglesiaEstructura>, IIglesiaEstructuraRepository
{
    public IglesiaEstructuraRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<IglesiaEstructura>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<IglesiaEstructura>("SELECT * FROM IglesiasEstructuras WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public async Task<int> CreateAsync(IglesiaEstructura entity)
    {
        const string sql = """
            INSERT INTO IglesiasEstructuras (IglesiaId, EstructuraDenominacionId, Activo, FechaCreacion)
            OUTPUT INSERTED.Id
            VALUES (@IglesiaId, @EstructuraDenominacionId, @Activo, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(IglesiaEstructura entity)
    {
        const string sql = """
            UPDATE IglesiasEstructuras SET IglesiaId = @IglesiaId, EstructuraDenominacionId = @EstructuraDenominacionId, Activo = @Activo
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<IglesiaEstructura>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<IglesiaEstructura>("usp_IglesiaEstructura_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<IglesiaEstructura?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        return await connection.QueryFirstOrDefaultAsync<IglesiaEstructura>("usp_IglesiaEstructura_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        var rows = await connection.ExecuteAsync("usp_IglesiaEstructura_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

