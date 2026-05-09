using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using ROCA.Emuna360.Domain.Entities.Registry;
using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class AuthRepository : BaseRepository<Usuario>, IAuthRepository
{
    public AuthRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<AuthUser?> GetUserByEmailAsync(int denominacionId, string correo)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@Correo", correo);
        return await connection.QueryFirstOrDefaultAsync<AuthUser>("sp_auth_obtener_usuario_por_correo", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<AuthUser?> GetUserByDocumentAsync(int denominacionId, string documento)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@Documento", documento);
        return await connection.QueryFirstOrDefaultAsync<AuthUser>("sp_auth_obtener_usuario_por_documento", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<Registro?> GetRegistroByDocumentoAsync(int denominacionId, string documento)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@Documento", documento);
        return await connection.QueryFirstOrDefaultAsync<Registro>("sp_auth_obtener_registro_por_documento", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<Registro?> GetRegistroByIdAsync(int denominacionId, int registroId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@RegistroId", registroId);
        return await connection.QueryFirstOrDefaultAsync<Registro>("sp_auth_obtener_registro_por_id", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<int> CreateRegistroAsync(Registro entity)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("sp_auth_crear_registro", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<int> CreateUserAsync(Usuario entity)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("sp_auth_crear_usuario", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> AssignUserRoleAsync(int denominacionId, int usuarioId, int rolId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        p.Add("@RolId", rolId);
        var rows = await connection.ExecuteAsync("sp_auth_asignar_usuario_rol", p, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<bool> AssignUserIglesiaAsync(int denominacionId, int usuarioId, int iglesiaId, bool esAdministrador)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        p.Add("@IglesiaId", iglesiaId);
        p.Add("@EsAdministrador", esAdministrador);
        var rows = await connection.ExecuteAsync("sp_auth_asignar_usuario_iglesia", p, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<bool> UpdateLastLoginAsync(int denominacionId, int usuarioId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        var rows = await connection.ExecuteAsync("sp_auth_actualizar_ultimo_login", p, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<bool> MarkEmailAsVerifiedAsync(int denominacionId, int usuarioId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        var rows = await connection.ExecuteAsync("sp_auth_marcar_email_verificado", p, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<int> CreateEmailVerificationTokenAsync(TokenVerificacionCorreo entity)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("sp_auth_crear_token_verificacion_correo", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<TokenVerificacionCorreo?> GetEmailVerificationTokenAsync(int denominacionId, string tokenHash)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@TokenHash", tokenHash);
        return await connection.QueryFirstOrDefaultAsync<TokenVerificacionCorreo>("sp_auth_obtener_token_verificacion_correo", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> MarkEmailVerificationTokenAsUsedAsync(int denominacionId, int tokenId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@TokenId", tokenId);
        var rows = await connection.ExecuteAsync("sp_auth_marcar_token_verificacion_usado", p, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<int> CreateRefreshTokenAsync(RefreshToken entity)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters(entity);
        return await connection.ExecuteScalarAsync<int>("sp_auth_crear_refresh_token", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<RefreshToken?> GetRefreshTokenAsync(int denominacionId, string tokenHash)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@TokenHash", tokenHash);
        return await connection.QueryFirstOrDefaultAsync<RefreshToken>("sp_auth_obtener_refresh_token", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<bool> RevokeRefreshTokenAsync(int denominacionId, int refreshTokenId, int? reemplazadoPor)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@RefreshTokenId", refreshTokenId);
        p.Add("@ReemplazadoPor", reemplazadoPor);
        var rows = await connection.ExecuteAsync("sp_auth_revocar_refresh_token", p, commandType: CommandType.StoredProcedure);
        return rows > 0;
    }

    public async Task<IEnumerable<AuthRole>> GetUserRolesAsync(int denominacionId, int usuarioId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        return await connection.QueryAsync<AuthRole>("sp_auth_obtener_roles_usuario", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<IEnumerable<AuthMenu>> GetUserMenusAsync(int denominacionId, int usuarioId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        return await connection.QueryAsync<AuthMenu>("sp_auth_obtener_menu_usuario", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<AuthUser?> GetUserByIdAsync(int denominacionId, int usuarioId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        return await connection.QueryFirstOrDefaultAsync<AuthUser>("sp_auth_obtener_usuario_por_id", p, commandType: CommandType.StoredProcedure);
    }
}
