using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Geography;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Geography;

public class PaisRepository : BaseRepository<Pais>, IPaisRepository
{
    public PaisRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<OperationResult<int>> CreateAsync(Pais entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@PaisNombre", entity.PaisNombre);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("usp_Pais_Insertar", parameters, "@OutPaisId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Pais entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@PaisId", entity.PaisId);
        parameters.Add("@PaisNombre", entity.PaisNombre);
        parameters.Add("@Descripcion", entity.Descripcion);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteUpdateAsync("usp_Pais_Actualizar", parameters, "@OutPaisId");
    }

    public async Task<System.Collections.Generic.IEnumerable<Pais>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Pais>("usp_Pais_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Pais?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@PaisId", id);
        return await connection.QueryFirstOrDefaultAsync<Pais>("usp_Pais_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@PaisId", id);
        var rows = await connection.ExecuteAsync("usp_Pais_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

