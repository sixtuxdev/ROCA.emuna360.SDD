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
        using var connection = CreateConnection();
        return await connection.QueryAsync<EstructuraOrganizacional>("SELECT * FROM EstructuraOrganizacional WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(EstructuraOrganizacional entity)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(entity);
        p.Add("@EstructuraId", dbType: DbType.Int32, direction: ParameterDirection.Output);
        
        await connection.ExecuteAsync("usp_EstructuraOrganizacional_Insertar", p, commandType: CommandType.StoredProcedure);
        return p.Get<int>("@EstructuraId");
    }

    public async Task<bool> UpdateAsync(EstructuraOrganizacional entity)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_EstructuraOrganizacional_Actualizar", entity, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_EstructuraOrganizacional_Eliminar", new { EstructuraId = id }, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<IEnumerable<EstructuraOrganizacional>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<EstructuraOrganizacional>("usp_EstructuraOrganizacional_Listar", commandType: CommandType.StoredProcedure);
    }
    
    public async Task<EstructuraOrganizacional?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        return await connection.QueryFirstOrDefaultAsync<EstructuraOrganizacional>("usp_EstructuraOrganizacional_Obtener", new { EstructuraId = id }, commandType: CommandType.StoredProcedure);
    }
}
