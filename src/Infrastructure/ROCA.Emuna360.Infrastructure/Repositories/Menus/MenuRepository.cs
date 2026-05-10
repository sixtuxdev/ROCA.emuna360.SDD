using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Menus;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Menus;

public class MenuRepository : BaseRepository<Menu>, IMenuRepository
{
    public MenuRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<OperationResult<int>> CreateAsync(Menu entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@IdGrupo", entity.IdGrupo);
        parameters.Add("@Tipo", entity.Tipo);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@Url", entity.Url);
        parameters.Add("@Imagen", entity.Imagen);
        parameters.Add("@Fecha", entity.Fecha);
        parameters.Add("@Orden", entity.Orden);
        parameters.Add("@NuevaVentana", entity.NuevaVentana);
        return await ExecuteCreateAsync("usp_Menu_Insertar", parameters, "@OutMenuId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Menu entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@MenuId", entity.MenuId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@IdGrupo", entity.IdGrupo);
        parameters.Add("@Tipo", entity.Tipo);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@Url", entity.Url);
        parameters.Add("@Imagen", entity.Imagen);
        parameters.Add("@Fecha", entity.Fecha);
        parameters.Add("@Orden", entity.Orden);
        parameters.Add("@NuevaVentana", entity.NuevaVentana);
        return await ExecuteUpdateAsync("usp_Menu_Actualizar", parameters, "@OutMenuId");
    }

    public async Task<System.Collections.Generic.IEnumerable<Menu>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<Menu>("usp_Menu_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Menu?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@MenuId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<Menu>("usp_Menu_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@MenuId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_Menu_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

