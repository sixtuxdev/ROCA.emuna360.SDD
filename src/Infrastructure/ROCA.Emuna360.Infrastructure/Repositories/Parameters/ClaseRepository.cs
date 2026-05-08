using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Parameters;

public class ClaseRepository : BaseRepository<ClaseDto>, IClaseRepository
{
    public ClaseRepository(IConfiguration configuration) 
        : base(configuration, "Clase", "ClaseId") { }

    public async Task<IEnumerable<ClaseDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ClaseDto>("SELECT * FROM Clase WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(ClaseDto dto)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(dto);
        p.Add("@ClaseId", dbType: DbType.Int32, direction: ParameterDirection.Output);
        
        await connection.ExecuteAsync("usp_Clase_Insertar", p, commandType: CommandType.StoredProcedure);
        return p.Get<int>("@ClaseId");
    }

    public override async Task<bool> UpdateAsync(ClaseDto dto)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_Clase_Actualizar", dto, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public override async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_Clase_Eliminar", new { ClaseId = id }, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public override async Task<IEnumerable<ClaseDto>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<ClaseDto>("usp_Clase_Listar", commandType: CommandType.StoredProcedure);
    }
    
    public override async Task<ClaseDto?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        return await connection.QueryFirstOrDefaultAsync<ClaseDto>("usp_Clase_Obtener", new { ClaseId = id }, commandType: CommandType.StoredProcedure);
    }
}
