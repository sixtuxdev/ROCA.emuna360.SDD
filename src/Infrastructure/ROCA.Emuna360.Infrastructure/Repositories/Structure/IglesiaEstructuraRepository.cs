using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Structure;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class IglesiaEstructuraRepository : BaseRepository<IglesiaEstructura>, IIglesiaEstructuraRepository
{
    public IglesiaEstructuraRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<IglesiaEstructura>> GetByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", iglesiaId);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<IglesiaEstructura>("usp_IglesiasEstructuras_ListarPorIglesia", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<IglesiaEstructura?> GetCurrentByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", iglesiaId);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<IglesiaEstructura>("usp_IglesiasEstructuras_ObtenerPorIglesia", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<OperationResult<int>> CreateAsync(IglesiaEstructura entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@EstructuraId", entity.EstructuraId);
        parameters.Add("@FechaAsignacion", entity.FechaAsignacion);
        return await ExecuteCreateAsync("usp_IglesiasEstructuras_Insertar", parameters, "@OutIglesiaEstructurasId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(IglesiaEstructura entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaEstructurasId", entity.IglesiaEstructurasId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@EstructuraId", entity.EstructuraId);
        parameters.Add("@FechaAsignacion", entity.FechaAsignacion);
        return await ExecuteUpdateAsync("usp_IglesiasEstructuras_Actualizar", parameters, string.Empty);
    }

    public async Task<OperationResult<bool>> UpsertByIglesiaAsync(IglesiaEstructura entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@EstructuraId", entity.EstructuraId);
        parameters.Add("@FechaAsignacion", entity.FechaAsignacion);
        return await ExecuteUpdateAsync("usp_IglesiasEstructuras_GuardarPorIglesia", parameters, string.Empty);
    }

    public async Task<System.Collections.Generic.IEnumerable<IglesiaEstructura>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<IglesiaEstructura>("usp_IglesiasEstructuras_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<IglesiaEstructura?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaEstructurasId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<IglesiaEstructura>("usp_IglesiasEstructuras_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaEstructurasId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_IglesiasEstructuras_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<bool> DeleteByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", iglesiaId);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_IglesiasEstructuras_EliminarPorIglesia", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

