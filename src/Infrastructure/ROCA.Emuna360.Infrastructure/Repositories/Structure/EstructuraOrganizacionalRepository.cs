using ROCA.Emuna360.Domain.Entities.Structure;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
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

    public async Task<int> CreateAsync(EstructuraOrganizacional entity)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("usp_EstructuraOrganizacional_Insertar", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> UpdateAsync(EstructuraOrganizacional entity)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(entity);
        var rows = await connection.ExecuteAsync("usp_EstructuraOrganizacional_Actualizar", p, commandType: CommandType.StoredProcedure);
        return rows > 0;
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
