using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Menus;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Menus;

public class MenuRolRepository : BaseRepository<MenuRol>, IMenuRolRepository
{
    public MenuRolRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<MenuRol>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<OperationResult<int>> CreateAsync(MenuRol entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@RolId", entity.RolId);
        parameters.Add("@MenuId", entity.MenuId);
        parameters.Add("@Estado", entity.Estado);
        return await ExecuteCreateAsync("usp_MenuRol_Insertar", parameters, "@OutId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(MenuRol entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Menu_Rol", entity.Menu_Rol);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@RolId", entity.RolId);
        parameters.Add("@MenuId", entity.MenuId);
        parameters.Add("@Estado", entity.Estado);
        return await ExecuteUpdateAsync("usp_MenuRol_Actualizar", parameters, "@OutId");
    }

    public async Task<System.Collections.Generic.IEnumerable<MenuRol>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<MenuRol>("usp_MenuRol_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<MenuRol?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<MenuRol>("usp_MenuRol_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_MenuRol_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

