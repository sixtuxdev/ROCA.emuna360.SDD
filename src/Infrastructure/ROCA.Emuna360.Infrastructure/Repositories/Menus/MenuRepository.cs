using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Menus;

public class MenuRepository : BaseRepository<MenuDto>, IMenuRepository
{
    public MenuRepository(IConfiguration configuration) 
        : base(configuration, "Menu", "MenuId") { } // The analysis said no PK explicitly visible but assuming MenuId based on common patterns. I'll use "MenuId" for now.

    public async Task<IEnumerable<MenuDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<MenuDto>("SELECT * FROM Menu WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(MenuDto dto)
    {
        const string sql = """
            INSERT INTO Menu (DenominacionId, Titulo, Icono, Ruta, Posicion, Activo, IdPadre)
            OUTPUT INSERTED.MenuId
            VALUES (@DenominacionId, @Titulo, @Icono, @Ruta, @Posicion, @Activo, @IdPadre)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(MenuDto dto)
    {
        const string sql = """
            UPDATE Menu SET DenominacionId = @DenominacionId, Titulo = @Titulo, Icono = @Icono, Ruta = @Ruta, Posicion = @Posicion, Activo = @Activo, IdPadre = @IdPadre
            WHERE MenuId = @MenuId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
