using ROCA.Emuna360.Domain.Entities.Structure;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class TipoEstructuraRepository : BaseRepository<TipoEstructura>, ITipoEstructuraRepository
{
    public TipoEstructuraRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<TipoEstructura>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<TipoEstructura>("SELECT * FROM TiposEstructura WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(TipoEstructura entity)
    {
        const string sql = """
            INSERT INTO TiposEstructura (DenominacionId, Nombre, Codigo, Nivel, Activo, FechaCreacion)
            OUTPUT INSERTED.Id
            VALUES (@DenominacionId, @Nombre, @Codigo, @Nivel, @Activo, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(TipoEstructura entity)
    {
        const string sql = """
            UPDATE TiposEstructura SET DenominacionId = @DenominacionId, Nombre = @Nombre, Codigo = @Codigo, Nivel = @Nivel, Activo = @Activo
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<TipoEstructura>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<TipoEstructura>("usp_TipoEstructura_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<TipoEstructura?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        return await connection.QueryFirstOrDefaultAsync<TipoEstructura>("usp_TipoEstructura_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        var rows = await connection.ExecuteAsync("usp_TipoEstructura_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

