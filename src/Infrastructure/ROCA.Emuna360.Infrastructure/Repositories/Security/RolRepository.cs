using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class RolRepository : BaseRepository<RolDto>, IRolRepository
{
    public RolRepository(IConfiguration configuration) 
        : base(configuration, "Roles", "RolId") { }

    public async Task<IEnumerable<RolDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<RolDto>("SELECT * FROM Roles WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(RolDto dto)
    {
        const string sql = """
            INSERT INTO Roles (DenominacionId, Nombre, Codigo, Activo, FechaCreacion)
            OUTPUT INSERTED.RolId
            VALUES (@DenominacionId, @Nombre, @Codigo, @Activo, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(RolDto dto)
    {
        const string sql = """
            UPDATE Roles SET DenominacionId = @DenominacionId, Nombre = @Nombre, Codigo = @Codigo, Activo = @Activo
            WHERE RolId = @RolId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
