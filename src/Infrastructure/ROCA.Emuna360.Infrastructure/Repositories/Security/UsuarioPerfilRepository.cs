using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioPerfilRepository : BaseRepository<UsuarioPerfil>, IUsuarioPerfilRepository
{
    public UsuarioPerfilRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<IEnumerable<UsuarioPerfil>> GetByDenominacionAsync(int denominacionId)
    {
        return await GetAllAsync(denominacionId);
    }

    public async Task<OperationResult<int>> CreateAsync(UsuarioPerfil entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@TipoDocumento", entity.TipoDocumento);
        parameters.Add("@Documento", entity.Documento);
        parameters.Add("@Nombres", entity.Nombres);
        parameters.Add("@Apellidos", entity.Apellidos);
        parameters.Add("@FechaCumple", entity.FechaCumple);
        parameters.Add("@Telefono", entity.Telefono);
        parameters.Add("@Genero", entity.Genero);
        parameters.Add("@Direccion", entity.Direccion);
        parameters.Add("@Avatar", entity.Avatar);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaActualizacion", entity.FechaActualizacion);
        return await ExecuteCreateAsync("usp_UsuarioPerfil_Insertar", parameters, "@OutDocumento");
    }

    public async Task<OperationResult<bool>> UpdateAsync(UsuarioPerfil entity)
    {
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@UsuarioId", entity.UsuarioId);
        parameters.Add("@DenominacionId", entity.DenominacionId);
        parameters.Add("@TipoDocumento", entity.TipoDocumento);
        parameters.Add("@Documento", entity.Documento);
        parameters.Add("@Nombres", entity.Nombres);
        parameters.Add("@Apellidos", entity.Apellidos);
        parameters.Add("@FechaCumple", entity.FechaCumple);
        parameters.Add("@Telefono", entity.Telefono);
        parameters.Add("@Genero", entity.Genero);
        parameters.Add("@Direccion", entity.Direccion);
        parameters.Add("@Avatar", entity.Avatar);
        parameters.Add("@Estado", entity.Estado);
        parameters.Add("@FechaActualizacion", entity.FechaActualizacion);
        return await ExecuteUpdateAsync("usp_UsuarioPerfil_Actualizar", parameters, "@OutDocumento");
    }

    public async Task<System.Collections.Generic.IEnumerable<UsuarioPerfil>> GetAllAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryAsync<UsuarioPerfil>("usp_UsuarioPerfil_Listar", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<UsuarioPerfil?> GetByIdAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Documento", id);
        parameters.Add("@DenominacionId", denominacionId);
        return await connection.QueryFirstOrDefaultAsync<UsuarioPerfil>("usp_UsuarioPerfil_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id, int denominacionId)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Documento", id);
        parameters.Add("@DenominacionId", denominacionId);
        var rows = await connection.ExecuteAsync("usp_UsuarioPerfil_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

