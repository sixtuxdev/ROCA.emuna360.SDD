using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class CorregimientoRepository : BaseRepository<CorregimientoDto>, ICorregimientoRepository
{
    public CorregimientoRepository(IConfiguration configuration) 
        : base(configuration, "Corregimiento", "CorregimientoId") { }

    public override async Task<int> CreateAsync(CorregimientoDto dto)
    {
        const string sql = """
            INSERT INTO Corregimiento (Corregimiento, Descripcion, Estado, FechaCreacion)
            OUTPUT INSERTED.CorregimientoId
            VALUES (@CorregimientoNombre, @Descripcion, @Estado, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(CorregimientoDto dto)
    {
        const string sql = """
            UPDATE Corregimiento SET Corregimiento = @CorregimientoNombre, Descripcion = @Descripcion, Estado = @Estado
            WHERE CorregimientoId = @CorregimientoId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
