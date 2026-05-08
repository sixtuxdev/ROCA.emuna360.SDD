using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class DepartamentoRepository : BaseRepository<DepartamentoDto>, IDepartamentoRepository
{
    public DepartamentoRepository(IConfiguration configuration) 
        : base(configuration, "Departamento", "DepartamentoId") { }

    public override async Task<int> CreateAsync(DepartamentoDto dto)
    {
        const string sql = """
            INSERT INTO Departamento (PaisId, Departamento, Descripcion, Estado, FechaCreacion)
            OUTPUT INSERTED.DepartamentoId
            VALUES (@PaisId, @DepartamentoNombre, @Descripcion, @Estado, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(DepartamentoDto dto)
    {
        const string sql = """
            UPDATE Departamento SET PaisId = @PaisId, Departamento = @DepartamentoNombre, Descripcion = @Descripcion, Estado = @Estado
            WHERE DepartamentoId = @DepartamentoId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
