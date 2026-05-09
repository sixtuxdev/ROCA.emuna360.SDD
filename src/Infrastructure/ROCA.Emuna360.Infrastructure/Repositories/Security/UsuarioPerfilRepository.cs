using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioPerfilRepository : BaseRepository<UsuarioPerfil>, IUsuarioPerfilRepository
{
    public UsuarioPerfilRepository(IConfiguration configuration) : base(configuration) { } // No explicit PK, using Documento as key

    public async Task<IEnumerable<UsuarioPerfil>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioPerfil>("SELECT * FROM UsuariosPerfil WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public async Task<int> CreateAsync(UsuarioPerfil entity)
    {
        const string sql = """
            INSERT INTO UsuariosPerfil (UsuarioId, DenominacionId, TipoDocumento, Documento, Nombres, Apellidos, FechaCumple, Telefono, Genero, Direccion, Avatar, Estado, FechaActualizacion)
            VALUES (@UsuarioId, @DenominacionId, @TipoDocumento, @Documento, @Nombres, @Apellidos, @FechaCumple, @Telefono, @Genero, @Direccion, @Avatar, @Estado, @FechaActualizacion)
        """;
        using var connection = CreateConnection();
        await connection.ExecuteAsync(sql, entity);
        return entity.UsuarioId ?? 0;
    }

    public async Task<bool> UpdateAsync(UsuarioPerfil entity)
    {
        const string sql = """
            UPDATE UsuariosPerfil SET UsuarioId = @UsuarioId, DenominacionId = @DenominacionId, TipoDocumento = @TipoDocumento, Nombres = @Nombres, Apellidos = @Apellidos, FechaCumple = @FechaCumple, Telefono = @Telefono, Genero = @Genero, Direccion = @Direccion, Avatar = @Avatar, Estado = @Estado, FechaActualizacion = @FechaActualizacion
            WHERE Documento = @Documento
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, entity) > 0;
    }

    public async Task<System.Collections.Generic.IEnumerable<UsuarioPerfil>> GetAllAsync()
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioPerfil>("usp_UsuarioPerfil_Listar", commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<UsuarioPerfil?> GetByIdAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Documento", id);
        return await connection.QueryFirstOrDefaultAsync<UsuarioPerfil>("usp_UsuarioPerfil_Obtener", parameters, commandType: System.Data.CommandType.StoredProcedure);
    }

    public async Task<bool> DeleteAsync(int id)
    {
        using var connection = CreateConnection();
        var parameters = new Dapper.DynamicParameters();
        parameters.Add("@Documento", id);
        var rows = await connection.ExecuteAsync("usp_UsuarioPerfil_Eliminar", parameters, commandType: System.Data.CommandType.StoredProcedure);
        return rows > 0;
    }
}

