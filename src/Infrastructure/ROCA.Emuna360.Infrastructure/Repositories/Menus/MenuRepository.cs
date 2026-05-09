using ROCA.Emuna360.Domain.Entities.Menus;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Menus;

public class MenuRepository : BaseRepository<Menu>, IMenuRepository
{
    public MenuRepository(IConfiguration configuration) : base(configuration) { } // The analysis said no PK explicitly visible but assuming MenuId based on common patterns. I'll use "MenuId" for now.

    public async Task<IEnumerable<Menu>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Menu>("SELECT * FROM Menu WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(Menu entity)
    {
        const string sql = """
            INSERT INTO Menu (DenominacionId, Titulo, Icono, Ruta, Posicion, Activo, IdPadre)
            OUTPUT INSERTED.MenuId
            VALUES (@DenominacionId, @Titulo, @Icono, @Ruta, @Posicion, @Activo, @IdPadre)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(Menu entity)
    {
        const string sql = """
            UPDATE Menu SET DenominacionId = @DenominacionId, Titulo = @Titulo, Icono = @Icono, Ruta = @Ruta, Posicion = @Posicion, Activo = @Activo, IdPadre = @IdPadre
            WHERE MenuId = @MenuId
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Menu>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Menu>("usp_Menu_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Menu?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@MenuId", id);
        return await connection.QueryFirstOrDefaultAsync<Menu>("usp_Menu_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@MenuId", id);
        var rows = await connection.ExecuteAsync("usp_Menu_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

