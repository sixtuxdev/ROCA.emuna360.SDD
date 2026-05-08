using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class CiudadRepository : BaseRepository<CiudadDto>, ICiudadRepository
{
    public CiudadRepository(IConfiguration configuration) 
        : base(configuration, "Ciudad", "CiudadId") { }

    public override async Task<int> CreateAsync(CiudadDto dto)
    {
        const string sql = """
            INSERT INTO Ciudad (DepartamentoId, Ciudad, Descripcion, Estado, FechaCreacion)
            OUTPUT INSERTED.CiudadId
            VALUES (@DepartamentoId, @CiudadNombre, @Descripcion, @Estado, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(CiudadDto dto)
    {
        const string sql = """
            UPDATE Ciudad SET DepartamentoId = @DepartamentoId, Ciudad = @CiudadNombre, Descripcion = @Descripcion, Estado = @Estado
            WHERE CiudadId = @CiudadId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
