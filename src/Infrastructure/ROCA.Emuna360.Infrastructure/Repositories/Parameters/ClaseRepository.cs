using ROCA.Emuna360.Domain.Entities.Parameters;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Parameters;

public class ClaseRepository : BaseRepository<Clase>, IClaseRepository
{
    public ClaseRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<Clase>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Clase>("SELECT * FROM Clase WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(Clase entity)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(entity);
        p.Add("@ClaseId", dbType: DbType.Int32, direction: ParameterDirection.Output);
        
        await connection.ExecuteAsync("usp_Clase_Insertar", p, commandType: CommandType.StoredProcedure);
        return p.Get<int>("@ClaseId");
    }

    public async Task<bool> UpdateAsync(Clase entity)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_Clase_Actualizar", entity, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_Clase_Eliminar", new { ClaseId = id }, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<IEnumerable<Clase>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Clase>("usp_Clase_Listar", commandType: CommandType.StoredProcedure);
    }
    
    public async Task<Clase?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        return await connection.QueryFirstOrDefaultAsync<Clase>("usp_Clase_Obtener", new { ClaseId = id }, commandType: CommandType.StoredProcedure);
    }
}
