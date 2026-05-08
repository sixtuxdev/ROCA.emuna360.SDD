using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioRolRepository : BaseRepository<UsuarioRolDto>, IUsuarioRolRepository
{
    public UsuarioRolRepository(IConfiguration configuration) 
        : base(configuration, "UsuarioRoles", "Id") { }

    public async Task<IEnumerable<UsuarioRolDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioRolDto>("SELECT * FROM UsuarioRoles WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(UsuarioRolDto dto)
    {
        const string sql = """
            INSERT INTO UsuarioRoles (UsuarioId, RolId, DenominacionId, IglesiaId, FechaAsignacion)
            OUTPUT INSERTED.Id
            VALUES (@UsuarioId, @RolId, @DenominacionId, @IglesiaId, @FechaAsignacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(UsuarioRolDto dto)
    {
        const string sql = """
            UPDATE UsuarioRoles SET UsuarioId = @UsuarioId, RolId = @RolId, DenominacionId = @DenominacionId, IglesiaId = @IglesiaId
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
