using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class EstructuraDenominacionRepository : BaseRepository<EstructuraDenominacionDto>, IEstructuraDenominacionRepository
{
    public EstructuraDenominacionRepository(IConfiguration configuration) 
        : base(configuration, "EstructurasDenominacion", "Id") { }

    public async Task<IEnumerable<EstructuraDenominacionDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<EstructuraDenominacionDto>("SELECT * FROM EstructurasDenominacion WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<IEnumerable<EstructuraDenominacionDto>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<EstructuraDenominacionDto>("SELECT * FROM EstructurasDenominacion WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public override async Task<int> CreateAsync(EstructuraDenominacionDto dto)
    {
        const string sql = """
            INSERT INTO EstructurasDenominacion (DenominacionId, IglesiaId, TipoEstructuraId, Nombre, Codigo, PadreId, Activo, FechaCreacion)
            OUTPUT INSERTED.Id
            VALUES (@DenominacionId, @IglesiaId, @TipoEstructuraId, @Nombre, @Codigo, @PadreId, @Activo, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(EstructuraDenominacionDto dto)
    {
        const string sql = """
            UPDATE EstructurasDenominacion SET DenominacionId = @DenominacionId, IglesiaId = @IglesiaId, TipoEstructuraId = @TipoEstructuraId, Nombre = @Nombre, Codigo = @Codigo, PadreId = @PadreId, Activo = @Activo
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
