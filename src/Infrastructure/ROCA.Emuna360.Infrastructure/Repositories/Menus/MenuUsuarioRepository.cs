using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Menus;

public class MenuUsuarioRepository : BaseRepository<MenuUsuarioDto>, IMenuUsuarioRepository
{
    public MenuUsuarioRepository(IConfiguration configuration) 
        : base(configuration, "Menu_Usuario", "Id") { }

    public async Task<IEnumerable<MenuUsuarioDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<MenuUsuarioDto>("SELECT * FROM Menu_Usuario WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(MenuUsuarioDto dto)
    {
        const string sql = """
            INSERT INTO Menu_Usuario (MenuId, UsuarioId, DenominacionId, Asignado)
            OUTPUT INSERTED.Id
            VALUES (@MenuId, @UsuarioId, @DenominacionId, @Asignado)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(MenuUsuarioDto dto)
    {
        const string sql = """
            UPDATE Menu_Usuario SET MenuId = @MenuId, UsuarioId = @UsuarioId, DenominacionId = @DenominacionId, Asignado = @Asignado
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
