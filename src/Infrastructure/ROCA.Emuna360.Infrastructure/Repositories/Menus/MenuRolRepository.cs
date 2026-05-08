using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Menus;

public class MenuRolRepository : BaseRepository<MenuRolDto>, IMenuRolRepository
{
    public MenuRolRepository(IConfiguration configuration) 
        : base(configuration, "Menu_rol", "Id") { } // Assuming "Id" as PK

    public async Task<IEnumerable<MenuRolDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<MenuRolDto>("SELECT * FROM Menu_rol WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(MenuRolDto dto)
    {
        const string sql = """
            INSERT INTO Menu_rol (MenuId, RolId, DenominacionId, Asignado)
            OUTPUT INSERTED.Id
            VALUES (@MenuId, @RolId, @DenominacionId, @Asignado)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, dto);
    }

    public override async Task<bool> UpdateAsync(MenuRolDto dto)
    {
        const string sql = """
            UPDATE Menu_rol SET MenuId = @MenuId, RolId = @RolId, DenominacionId = @DenominacionId, Asignado = @Asignado
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
