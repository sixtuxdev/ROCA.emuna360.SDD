using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Registry;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Registry;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Registry;

public class RegistroRepository : BaseRepository<Registro>, IRegistroRepository
{
    public RegistroRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<Registro>> GetByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@IglesiaId", iglesiaId);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<Registro>("usp_Registro_ListarPorIglesia", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<OperationResult<int>> CreateAsync(Registro entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@Nombres", entity.Nombres);
        parameters.Add("@Apellidos", entity.Apellidos);
        parameters.Add("@ParametroIdTipoDocumento", entity.ParametroIdTipoDocumento);
        parameters.Add("@Documento", entity.Documento);
        parameters.Add("@PaisId", entity.PaisId);
        parameters.Add("@DepartamentoId", entity.DepartamentoId);
        parameters.Add("@CiudadId", entity.CiudadId);
        parameters.Add("@CorregimientoId", entity.CorregimientoId);
        parameters.Add("@Direccion", entity.Direccion);
        parameters.Add("@Correo", entity.Correo);
        parameters.Add("@Telefono", entity.Telefono);
        parameters.Add("@ParametroIdSexo", entity.ParametroIdSexo);
        parameters.Add("@Interno", entity.Interno);

        return await ExecuteCreateAsync("usp_Registro_Insertar", parameters, "@OutRegistroId");
    }

    public async Task<OperationResult<bool>> UpdateAsync(Registro entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RegistroId", entity.RegistroId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@IglesiaId", entity.IglesiaId);
        parameters.Add("@Nombres", entity.Nombres);
        parameters.Add("@Apellidos", entity.Apellidos);
        parameters.Add("@ParametroIdTipoDocumento", entity.ParametroIdTipoDocumento);
        parameters.Add("@Documento", entity.Documento);
        parameters.Add("@PaisId", entity.PaisId);
        parameters.Add("@DepartamentoId", entity.DepartamentoId);
        parameters.Add("@CiudadId", entity.CiudadId);
        parameters.Add("@CorregimientoId", entity.CorregimientoId);
        parameters.Add("@Direccion", entity.Direccion);
        parameters.Add("@Correo", entity.Correo);
        parameters.Add("@Telefono", entity.Telefono);
        parameters.Add("@ParametroIdSexo", entity.ParametroIdSexo);
        return await ExecuteUpdateAsync("usp_Registro_Actualizar", parameters, "@OutRegistroId");
    }
    
    public async Task<IEnumerable<Registro>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<Registro>("usp_Registro_Listar", parameters, commandType: CommandType.StoredProcedure);
    }
    
    public async Task<Registro?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RegistroId", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<Registro>("usp_Registro_Obtener", parameters, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@RegistroId", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_Registro_Eliminar", parameters, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }
}

