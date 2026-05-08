using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class IglesiaEstructuraRepository : BaseRepository<IglesiaEstructuraDto>, IIglesiaEstructuraRepository
{
    public IglesiaEstructuraRepository(IConfiguration configuration) 
        : base(configuration, "IglesiasEstructuras", "Id") { }

    public async Task<IEnumerable<IglesiaEstructuraDto>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<IglesiaEstructuraDto>("SELECT * FROM IglesiasEstructuras WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public override async Task<int> CreateAsync(IglesiaEstructuraDto dto)
    {
        const string sql = """
            INSERT INTO IglesiasEstructuras (IglesiaId, EstructuraDenominacionId, Activo, FechaCreacion)
            OUTPUT INSERTED.Id
            VALUES (@IglesiaId, @EstructuraDenominacionId, @Activo, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(IglesiaEstructuraDto dto)
    {
        const string sql = """
            UPDATE IglesiasEstructuras SET IglesiaId = @IglesiaId, EstructuraDenominacionId = @EstructuraDenominacionId, Activo = @Activo
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
