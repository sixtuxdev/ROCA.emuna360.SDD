using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Structure;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class EstructuraOrganizacionalRepository : BaseRepository<EstructuraOrganizacional>, IEstructuraOrganizacionalRepository
{
    public EstructuraOrganizacionalRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<EstructuraOrganizacional>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<OperationResult<int>> CreateAsync(EstructuraOrganizacional entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@GrupoEstructuraOrganizacionalId", entity.GrupoEstructuraOrganizacionalId);
        parameters.Add("@Orden", entity.Orden);
        parameters.Add("@Responsable", entity.Responsable);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_EstructuraOrganizacional_Insertar", parameters, "@OutEstructuraOrganizacionalId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(EstructuraOrganizacional entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@EstructuraOrganizacionalId", entity.EstructuraOrganizacionalId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@GrupoEstructuraOrganizacionalId", entity.GrupoEstructuraOrganizacionalId);
        parameters.Add("@Orden", entity.Orden);
        parameters.Add("@Responsable", entity.Responsable);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_EstructuraOrganizacional_Actualizar", parameters, "@OutEstructuraOrganizacionalId");
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@EstructuraId", id);
        p.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_EstructuraOrganizacional_Eliminar", p, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<IEnumerable<EstructuraOrganizacional>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<EstructuraOrganizacional>("usp_EstructuraOrganizacional_Listar", p, commandType: CommandType.StoredProcedure);
    }
    
    public async Task<EstructuraOrganizacional?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@EstructuraId", id);
        p.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<EstructuraOrganizacional>("usp_EstructuraOrganizacional_Obtener", p, commandType: CommandType.StoredProcedure);
    }
}
