using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class TipoEstructuraRepository : BaseRepository<TipoEstructuraDto>, ITipoEstructuraRepository
{
    public TipoEstructuraRepository(IConfiguration configuration) 
        : base(configuration, "TiposEstructura", "Id") { }

    public async Task<IEnumerable<TipoEstructuraDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<TipoEstructuraDto>("SELECT * FROM TiposEstructura WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(TipoEstructuraDto dto)
    {
        const string sql = """
            INSERT INTO TiposEstructura (DenominacionId, Nombre, Codigo, Nivel, Activo, FechaCreacion)
            OUTPUT INSERTED.Id
            VALUES (@DenominacionId, @Nombre, @Codigo, @Nivel, @Activo, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(TipoEstructuraDto dto)
    {
        const string sql = """
            UPDATE TiposEstructura SET DenominacionId = @DenominacionId, Nombre = @Nombre, Codigo = @Codigo, Nivel = @Nivel, Activo = @Activo
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
