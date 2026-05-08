using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class PaisRepository : BaseRepository<PaisDto>, IPaisRepository
{
    public PaisRepository(IConfiguration configuration) 
        : base(configuration, "Pais", "PaisId") { }

    public override async Task<int> CreateAsync(PaisDto dto)
    {
        const string sql = """
            INSERT INTO Pais (Pais, Descripcion, Estado, FechaCreacion)
            OUTPUT INSERTED.PaisId
            VALUES (@PaisNombre, @Descripcion, @Estado, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(PaisDto dto)
    {
        const string sql = """
            UPDATE Pais SET Pais = @PaisNombre, Descripcion = @Descripcion, Estado = @Estado
            WHERE PaisId = @PaisId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
