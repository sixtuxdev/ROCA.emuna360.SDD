using ROCA.Emuna360.Domain.Entities.Menus;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Menus;

public class MenuRolRepository : BaseRepository<MenuRol>, IMenuRolRepository
{
    public MenuRolRepository(IConfiguration configuration) : base(configuration) { } // Assuming "Id" as PK

    public async Task<IEnumerable<MenuRol>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<MenuRol>("SELECT * FROM Menu_rol WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(MenuRol entity)
    {
        const string sql = """
            INSERT INTO Menu_rol (MenuId, RolId, DenominacionId, Asignado)
            OUTPUT INSERTED.Id
            VALUES (@MenuId, @RolId, @DenominacionId, @Asignado)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(MenuRol entity)
    {
        const string sql = """
            UPDATE Menu_rol SET MenuId = @MenuId, RolId = @RolId, DenominacionId = @DenominacionId, Asignado = @Asignado
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<MenuRol>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<MenuRol>("usp_MenuRol_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<MenuRol?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        return await connection.QueryFirstOrDefaultAsync<MenuRol>("usp_MenuRol_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        var rows = await connection.ExecuteAsync("usp_MenuRol_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

