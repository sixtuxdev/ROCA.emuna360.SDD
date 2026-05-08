using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioIglesiaRepository : BaseRepository<UsuarioIglesiaDto>, IUsuarioIglesiaRepository
{
    public UsuarioIglesiaRepository(IConfiguration configuration) 
        : base(configuration, "UsuariosIglesias", "UsuarioIglesiaId") { }

    public async Task<IEnumerable<UsuarioIglesiaDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioIglesiaDto>("SELECT * FROM UsuariosIglesias WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<IEnumerable<UsuarioIglesiaDto>> GetByIglesiaAsync(int iglesiaId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioIglesiaDto>("SELECT * FROM UsuariosIglesias WHERE IglesiaId = @IglesiaId", new { IglesiaId = iglesiaId });
    }

    public override async Task<int> CreateAsync(UsuarioIglesiaDto dto)
    {
        const string sql = """
            INSERT INTO UsuariosIglesias (DenominacionId, UsuarioId, IglesiaId, Estado, EsAdministrador, FechaCreacion)
            OUTPUT INSERTED.UsuarioIglesiaId
            VALUES (@DenominacionId, @UsuarioId, @IglesiaId, @Estado, @EsAdministrador, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(UsuarioIglesiaDto dto)
    {
        const string sql = """
            UPDATE UsuariosIglesias SET DenominacionId = @DenominacionId, UsuarioId = @UsuarioId, IglesiaId = @IglesiaId, Estado = @Estado, EsAdministrador = @EsAdministrador
            WHERE UsuarioIglesiaId = @UsuarioIglesiaId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
