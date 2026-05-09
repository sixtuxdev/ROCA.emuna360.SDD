using ROCA.Emuna360.Domain.Entities.Structure;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class EstructuraDenominacionRepository : BaseRepository<EstructuraDenominacion>, IEstructuraDenominacionRepository
{
    public EstructuraDenominacionRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<EstructuraDenominacion>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<EstructuraDenominacion>("SELECT * FROM EstructurasDenominacion WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<IEnumerable<EstructuraDenominacion>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<EstructuraDenominacion>("SELECT * FROM EstructurasDenominacion WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public async Task<int> CreateAsync(EstructuraDenominacion entity)
    {
        const string sql = """
            INSERT INTO EstructurasDenominacion (DenominacionId, IglesiaId, TipoEstructuraId, Nombre, Codigo, PadreId, Activo, FechaCreacion)
            OUTPUT INSERTED.Id
            VALUES (@DenominacionId, @IglesiaId, @TipoEstructuraId, @Nombre, @Codigo, @PadreId, @Activo, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(EstructuraDenominacion entity)
    {
        const string sql = """
            UPDATE EstructurasDenominacion SET DenominacionId = @DenominacionId, IglesiaId = @IglesiaId, TipoEstructuraId = @TipoEstructuraId, Nombre = @Nombre, Codigo = @Codigo, PadreId = @PadreId, Activo = @Activo
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<EstructuraDenominacion>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<EstructuraDenominacion>("usp_EstructuraDenominacion_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<EstructuraDenominacion?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        return await connection.QueryFirstOrDefaultAsync<EstructuraDenominacion>("usp_EstructuraDenominacion_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        var rows = await connection.ExecuteAsync("usp_EstructuraDenominacion_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

