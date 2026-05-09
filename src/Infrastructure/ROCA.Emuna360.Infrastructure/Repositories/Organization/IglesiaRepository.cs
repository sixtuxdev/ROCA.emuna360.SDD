using ROCA.Emuna360.Domain.Entities.Organization;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Organization;

public class IglesiaRepository : BaseRepository<Iglesia>, IIglesiaRepository
{
    public IglesiaRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<Iglesia>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Iglesia>("SELECT * FROM Iglesias WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(Iglesia entity)
    {
        const string sql = """
            INSERT INTO Iglesias (DenominacionId, Nombre, Slug, PersoneriaJuridica, PaisId, DepartamentoId, CiudadId, CorregimientoId, Direccion, Telefono, Correo, Slogan, Activa, FechaCreacion)
            OUTPUT INSERTED.IglesiaId
            VALUES (@DenominacionId, @Nombre, @Slug, @PersoneriaJuridica, @PaisId, @DepartamentoId, @CiudadId, @CorregimientoId, @Direccion, @Telefono, @Correo, @Slogan, @Activa, @FechaCreacion)
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteScalarAsync<int>(sql, entity);
    }

    public async Task<bool> UpdateAsync(Iglesia entity)
    {
        using var connection = CreateConnection();
        var rows = await connection.ExecuteAsync("usp_Iglesias_Actualizar", entity, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
    
    public async Task<IEnumerable<Iglesia>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<Iglesia>("usp_Iglesias_Listar", commandType: CommandType.StoredProcedure);
    }
    
    public async Task<Iglesia?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", id);
        return await connection.QueryFirstOrDefaultAsync<Iglesia>("usp_Iglesias_Obtener", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", id);
        var rows = await connection.ExecuteAsync("usp_Iglesias_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

