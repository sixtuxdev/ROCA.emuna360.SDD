using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Parameters;
using Dapper;
using Microsoft.Extensions.Configuration;
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
        return await GetAllAsync(denominacionId);
    }

    public async Task<OperationResult<int>> CreateAsync(Clase entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);        
        return await ExecuteCreateAsync("usp_Clase_Insertar", parameters, "@OutClaseId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Clase entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@ClaseId", entity.ClaseId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);        
        return await ExecuteUpdateAsync("usp_Clase_Actualizar", parameters, string.Empty);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@ClaseId", id);
        p.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_Clase_Eliminar", p, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<IEnumerable<Clase>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<Clase>("usp_Clase_Listar", p, commandType: CommandType.StoredProcedure);
    }
    
    public async Task<Clase?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@ClaseId", id);
        p.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<Clase>("usp_Clase_Obtener", p, commandType: CommandType.StoredProcedure);
    }
}
