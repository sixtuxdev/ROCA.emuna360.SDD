using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Organization;
using Dapper;
using Microsoft.Extensions.Configuration;
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
        return await GetAllAsync(denominacionId);
    }

    public async Task<OperationResult<int>> CreateAsync(Iglesia entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Nombre", entity.Nombre);
        parameters.Add("@Slug", entity.Slug);
        parameters.Add("@PersoneriaJuridica", entity.PersoneriaJuridica);
        parameters.Add("@PaisId", entity.PaisId);
        parameters.Add("@DepartamentoId", entity.DepartamentoId);
        parameters.Add("@CiudadId", entity.CiudadId);
        parameters.Add("@CorregimientoId", entity.CorregimientoId);
        parameters.Add("@Direccion", entity.Direccion);
        parameters.Add("@Telefono", entity.Telefono);
        parameters.Add("@Correo", entity.Correo);
        parameters.Add("@Slogan", entity.Slogan);
        parameters.Add("@PastorResponsableRegistroId", entity.PastorResponsableRegistroId);
        parameters.Add("@Activa", entity.Activa);
        
        return await ExecuteCreateAsync("usp_Iglesias_Insertar", parameters, "@OutIglesiaId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Iglesia entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@Nombre", entity.Nombre);
        parameters.Add("@Slug", entity.Slug);
        parameters.Add("@PersoneriaJuridica", entity.PersoneriaJuridica);
        parameters.Add("@PaisId", entity.PaisId);
        parameters.Add("@DepartamentoId", entity.DepartamentoId);
        parameters.Add("@CiudadId", entity.CiudadId);
        parameters.Add("@CorregimientoId", entity.CorregimientoId);
        parameters.Add("@Direccion", entity.Direccion);
        parameters.Add("@Telefono", entity.Telefono);
        parameters.Add("@Correo", entity.Correo);
        parameters.Add("@Slogan", entity.Slogan);
        parameters.Add("@PastorResponsableRegistroId", entity.PastorResponsableRegistroId);
        parameters.Add("@Activa", entity.Activa);
        
        return await ExecuteUpdateAsync("usp_Iglesias_Actualizar", parameters, string.Empty);
    }
    
    public async Task<IEnumerable<Iglesia>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<Iglesia>("usp_Iglesias_Listar", parameters, commandType: CommandType.StoredProcedure);
    }
    
    public async Task<Iglesia?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<Iglesia>("usp_Iglesias_Obtener", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_Iglesias_Eliminar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
}

