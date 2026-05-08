using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class DenominacionRepository : BaseRepository<DenominacionDto>, IDenominacionRepository
{
    public DenominacionRepository(IConfiguration configuration) 
        : base(configuration, "Denominaciones", "DenominacionId") { }

    public override async Task<int> CreateAsync(DenominacionDto dto)
    {
        const string sql = """
            INSERT INTO Denominaciones (Nombre, Slug, Activa, IglesiaPrincipalId, FechaCreacion)
            OUTPUT INSERTED.DenominacionId
            VALUES (@Nombre, @Slug, @Activa, @IglesiaPrincipalId, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(DenominacionDto dto)
    {
        const string sql = """
            UPDATE Denominaciones 
            SET Nombre = @Nombre, Slug = @Slug, Activa = @Activa, IglesiaPrincipalId = @IglesiaPrincipalId
            WHERE DenominacionId = @DenominacionId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
