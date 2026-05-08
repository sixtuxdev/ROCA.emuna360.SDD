using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class UsuarioPerfilRepository : BaseRepository<UsuarioPerfilDto>, IUsuarioPerfilRepository
{
    public UsuarioPerfilRepository(IConfiguration configuration) 
        : base(configuration, "UsuariosPerfil", "Documento") { } // No explicit PK, using Documento as key

    public async Task<IEnumerable<UsuarioPerfilDto>> GetByDenominacionAsync(int denominacionId)
    {
        using var connection = CreateConnection();
        return await connection.QueryAsync<UsuarioPerfilDto>("SELECT * FROM UsuariosPerfil WHERE DenominacionId = @DenominacionId", new { DenominacionId = denominacionId });
    }

    public override async Task<int> CreateAsync(UsuarioPerfilDto dto)
    {
        const string sql = """
            INSERT INTO UsuariosPerfil (UsuarioId, DenominacionId, TipoDocumento, Documento, Nombres, Apellidos, FechaCumple, Telefono, Genero, Direccion, Avatar, Estado, FechaActualizacion)
            VALUES (@UsuarioId, @DenominacionId, @TipoDocumento, @Documento, @Nombres, @Apellidos, @FechaCumple, @Telefono, @Genero, @Direccion, @Avatar, @Estado, @FechaActualizacion)
        """;
        using var connection = CreateConnection();
        await connection.ExecuteAsync(sql, dto);
        return dto.UsuarioId ?? 0;
    }

    public override async Task<bool> UpdateAsync(UsuarioPerfilDto dto)
    {
        const string sql = """
            UPDATE UsuariosPerfil SET UsuarioId = @UsuarioId, DenominacionId = @DenominacionId, TipoDocumento = @TipoDocumento, Nombres = @Nombres, Apellidos = @Apellidos, FechaCumple = @FechaCumple, Telefono = @Telefono, Genero = @Genero, Direccion = @Direccion, Avatar = @Avatar, Estado = @Estado, FechaActualizacion = @FechaActualizacion
            WHERE Documento = @Documento
        """;
        using var connection = CreateConnection();
        return await connection.ExecuteAsync(sql, dto) > 0;
    }
}
