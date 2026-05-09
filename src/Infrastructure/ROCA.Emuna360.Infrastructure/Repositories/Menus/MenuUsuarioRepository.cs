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
        return await GetAllAsync(denominacionId);
    }

    public async Task<int> CreateAsync(MenuUsuario entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("usp_MenuUsuario_Insertar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> UpdateAsync(MenuUsuario entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        var rows = await connection.ExecuteAsync("usp_MenuUsuario_Actualizar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<MenuUsuario>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<MenuUsuario>("usp_MenuUsuario_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<MenuUsuario?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<MenuUsuario>("usp_MenuUsuario_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_MenuUsuario_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

