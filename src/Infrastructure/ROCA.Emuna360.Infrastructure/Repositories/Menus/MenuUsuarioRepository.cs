using ROCA.Emuna360.Domain.Entities.Menus;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Menus;

public class MenuUsuarioRepository : BaseRepository<MenuUsuario>, IMenuUsuarioRepository
{
    public MenuUsuarioRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<MenuUsuario>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<MenuUsuario>("SELECT * FROM Menu_Usuario WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(MenuUsuario entity)
    {
        const string sql = """
            INSERT INTO Menu_Usuario (MenuId, UsuarioId, DenominacionId, Asignado)
            OUTPUT INSERTED.Id
            VALUES (@MenuId, @UsuarioId, @DenominacionId, @Asignado)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(MenuUsuario entity)
    {
        const string sql = """
            UPDATE Menu_Usuario SET MenuId = @MenuId, UsuarioId = @UsuarioId, DenominacionId = @DenominacionId, Asignado = @Asignado
            WHERE Id = @Id
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<MenuUsuario>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<MenuUsuario>("usp_MenuUsuario_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<MenuUsuario?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        return await connection.QueryFirstOrDefaultAsync<MenuUsuario>("usp_MenuUsuario_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        var rows = await connection.ExecuteAsync("usp_MenuUsuario_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

