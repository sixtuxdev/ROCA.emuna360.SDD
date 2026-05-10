using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Structure;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class EstructuraDenominacionRepository : BaseRepository<EstructuraDenominacion>, IEstructuraDenominacionRepository
{
    public EstructuraDenominacionRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<EstructuraDenominacion>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<IEnumerable<EstructuraDenominacion>> GetByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", iglesiaId);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<EstructuraDenominacion>("usp_EstructuraDenominacion_ListarPorIglesia", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<OperationResult<int>> CreateAsync(EstructuraDenominacion entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@TipoEstructuraId", entity.TipoEstructuraId);
        parameters.Add("@PadreId", entity.PadreId);
        parameters.Add("@Nombre", entity.Nombre);
        parameters.Add("@Codigo", entity.Codigo);
        parameters.Add("@Activa", entity.Activa);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_EstructuraDenominacion_Insertar", parameters, "@OutEstructuraId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(EstructuraDenominacion entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@EstructuraId", entity.EstructuraId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@TipoEstructuraId", entity.TipoEstructuraId);
        parameters.Add("@PadreId", entity.PadreId);
        parameters.Add("@Nombre", entity.Nombre);
        parameters.Add("@Codigo", entity.Codigo);
        parameters.Add("@Activa", entity.Activa);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_EstructuraDenominacion_Actualizar", parameters, "@OutEstructuraId");
    }

    public async Task<System.Collections.Generic.IEnumerable<EstructuraDenominacion>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<EstructuraDenominacion>("usp_EstructuraDenominacion_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<EstructuraDenominacion?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<EstructuraDenominacion>("usp_EstructuraDenominacion_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Id", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_EstructuraDenominacion_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

