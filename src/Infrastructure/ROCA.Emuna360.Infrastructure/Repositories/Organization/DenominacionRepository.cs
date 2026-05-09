using ROCA.Emuna360.Domain.Entities.Organization;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class DenominacionRepository : BaseRepository<Denominacion>, IDenominacionRepository
{
    public DenominacionRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<int> CreateAsync(Denominacion entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("usp_Denominacion_Insertar", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> UpdateAsync(Denominacion entity)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters(entity);
        var rows = await connection.ExecuteAsync("usp_Denominacion_Actualizar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<Denominacion>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<Denominacion>("usp_Denominacion_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<Denominacion?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", id); // For Denominacion, id IS denominacionId?
        // Actually, if we are filtering by denominacionId, and the entity is Denominacion, then id must be denominacionId.
        return await connection.QueryFirstOrDefaultAsync<Denominacion>("usp_Denominacion_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", id);
        var rows = await connection.ExecuteAsync("usp_Denominacion_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

