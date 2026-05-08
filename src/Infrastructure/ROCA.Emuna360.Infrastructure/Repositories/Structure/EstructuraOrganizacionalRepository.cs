using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Structure;

public class EstructuraOrganizacionalRepository : BaseRepository<EstructuraOrganizacionalDto>, IEstructuraOrganizacionalRepository
{
    public EstructuraOrganizacionalRepository(IConfiguration configuration) 
        : base(configuration, "EstructuraOrganizacional", "EstructuraId") { }

    public async Task<IEnumerable<EstructuraOrganizacionalDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<EstructuraOrganizacionalDto>("SELECT * FROM EstructuraOrganizacional WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(EstructuraOrganizacionalDto dto)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(dto);
        p.Add("@EstructuraId", dbType: DbType.Int32, direction: ParameterDirection.Output);
        
        await connection.ExecuteAsync("usp_EstructuraOrganizacional_Insertar", p, commandType: CommandType.StoredProcedure);
        return p.Get<int>("@EstructuraId");
    }

    public override async Task<bool> UpdateAsync(EstructuraOrganizacionalDto dto)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_EstructuraOrganizacional_Actualizar", dto, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public override async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_EstructuraOrganizacional_Eliminar", new { EstructuraId = id }, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public override async Task<IEnumerable<EstructuraOrganizacionalDto>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<EstructuraOrganizacionalDto>("usp_EstructuraOrganizacional_Listar", commandType: CommandType.StoredProcedure);
    }
    
    public override async Task<EstructuraOrganizacionalDto?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        return await connection.QueryFirstOrDefaultAsync<EstructuraOrganizacionalDto>("usp_EstructuraOrganizacional_Obtener", new { EstructuraId = id }, commandType: CommandType.StoredProcedure);
    }
}
