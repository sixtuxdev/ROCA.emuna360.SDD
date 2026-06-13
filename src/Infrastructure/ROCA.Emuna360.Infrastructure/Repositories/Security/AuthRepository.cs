using ROCA.Emuna360.Domain.Common.Results;
using Dapper;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using ROCA.Emuna360.Domain.Entities.Registry;
using ROCA.Emuna360.Domain.Entities.Organization;
using ROCA.Emuna360.Domain.Entities.Security;
using System.Data;
using System.Threading.Tasks;
using System.Collections.Generic;

namespace ROCA.Emuna360.Infrastructure.Repositories.Security;

public class AuthRepository : BaseRepository<Usuario>, IAuthRepository
{
    public AuthRepository(IConfiguration configuration) : base(configuration) { }

    public async Task<DenominacionDominio?> ObtenerDenominacionPorDominioAsync(string dominio)
    {
        using var connection = CreateConnection();
        var parameters = new DynamicParameters();
        parameters.Add("@Dominio", dominio);

        return await connection.QueryFirstOrDefaultAsync<DenominacionDominio>(
            "usp_Denominaciones_ObtenerPorDominio",
            parameters,
            commandType: CommandType.StoredProcedure);
    }

    //public async Task<AuthUser?> GetUserByEmailAsync(int denominacionId, string correo)
    //{
    //    using var connection = CreateConnection();
    //    var p = new DynamicParameters();
    //    p.Add("@DenominacionId", denominacionId);
    //    p.Add("@Correo", correo);
    //    return await connection.QueryMultipleAsync<AuthUser>("sp_auth_obtener_usuario_por_correo", p, commandType: CommandType.StoredProcedure);
    //}

    public async Task<AuthUser?> GetUserByEmailAsync(int denominacionId, string correo)
    {
        using var connection = CreateConnection();

        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@Correo", correo);

        using var multi = await connection.QueryMultipleAsync(
            "sp_auth_obtener_usuario_por_correo",
            p,
            commandType: CommandType.StoredProcedure);

        // Usuario principal
        var user = await multi.ReadFirstOrDefaultAsync<AuthUser>();

        if (user is null)
            return null;
        
        user.Registro = await multi.ReadFirstOrDefaultAsync<Registro>();

        // Roles
        user.Roles = (await multi.ReadAsync<AuthRole>()).ToList();

        // Menús
        user.Menus = (await multi.ReadAsync<AuthMenu>()).ToList();

        // Iglesias
        user.UsuarioIglesia = await multi.ReadFirstOrDefaultAsync<UsuarioIglesia>(); //(await multi.ReadAsync<UsuarioIglesia>()).FirstOrDefault();

        return user;
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

    public async Task<Registro?> GetRegistroByIdAsync(int denominacionId, int registroId, int? IglesiaId)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@RegistroId", registroId);
        p.Add("@IglesiaId", IglesiaId);
        return await connection.QueryFirstOrDefaultAsync<Registro>("sp_auth_obtener_registro_por_id", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<OperationResult<int>> CreateRegistroAsync(Registro entity)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", entity.DenominacionId);
        p.Add("@IglesiaId", entity.IglesiaId);
        p.Add("@Nombres", entity.Nombres);
        p.Add("@Apellidos", entity.Apellidos);
        p.Add("@ParametroIdTipoDocumento", entity.ParametroIdTipoDocumento);
        p.Add("@Documento", entity.Documento);
        p.Add("@PaisId", entity.PaisId);
        p.Add("@DepartamentoId", entity.DepartamentoId);
        p.Add("@CiudadId", entity.CiudadId);
        p.Add("@CorregimientoId", entity.CorregimientoId);
        p.Add("@Direccion", entity.Direccion);
        p.Add("@Correo", entity.Correo);
        p.Add("@Telefono", entity.Telefono);
        p.Add("@ParametroIdSexo", entity.ParametroIdSexo);
        return await ExecuteCreateAsync("sp_auth_crear_registro", p, "@OutRegistroId");
    }

    public async Task<OperationResult<int>> CreateUserAsync(Usuario entity)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", entity.DenominacionId);
        p.Add("@RegistroId", entity.RegistroId);
        p.Add("@Correo", entity.Correo);
        p.Add("@PasswordHash", entity.PasswordHash);
        p.Add("@EmailVerificado", entity.EmailVerificado);
        p.Add("@Bloqueado", entity.Bloqueado);
        p.Add("@FechaCreacion", entity.FechaCreacion);
        p.Add("@SecurityStamp", entity.SecurityStamp);
        p.Add("@RolId", entity.RolId);
        return await ExecuteCreateAsync("sp_auth_crear_usuario", p, "@OutUsuarioId");
    }

    public async Task<OperationResult<bool>> AssignUserRoleAsync(int denominacionId, int usuarioId, int rolId)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        p.Add("@RolId", rolId);
        return await ExecuteUpdateAsync("sp_auth_asignar_usuario_rol", p, "@OutId");
    }

    public async Task<OperationResult<bool>> AssignUserIglesiaAsync(int denominacionId, int usuarioId, int iglesiaId, bool esAdministrador)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        p.Add("@IglesiaId", iglesiaId);
        p.Add("@EsAdministrador", esAdministrador);
        return await ExecuteUpdateAsync("sp_auth_asignar_usuario_iglesia", p, "@OutId");
    }

    public async Task<OperationResult<bool>> UpdateLastLoginAsync(int denominacionId, int usuarioId)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        return await ExecuteUpdateAsync("sp_auth_actualizar_ultimo_login", p, "@OutUsuarioId");
    }

    public async Task<OperationResult<bool>> MarkEmailAsVerifiedAsync(int denominacionId, int usuarioId)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@UsuarioId", usuarioId);
        return await ExecuteUpdateAsync("sp_auth_marcar_email_verificado", p, "@OutId");
    }

    public async Task<OperationResult<int>> CreateEmailVerificationTokenAsync(TokenVerificacionCorreo entity)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", entity.DenominacionId);
        p.Add("@UsuarioId", entity.UsuarioId);
        p.Add("@IglesiaId", entity.IglesiaId);
        p.Add("@TokenHash", entity.TokenHash);
        p.Add("@ExpiraEn", entity.ExpiraEn);
        p.Add("@FechaCreacion", entity.FechaCreacion);
        return await ExecuteCreateAsync("sp_auth_crear_token_verificacion_correo", p, "@OutTokenId");
    }

    public async Task<TokenVerificacionCorreo?> GetEmailVerificationTokenAsync(int denominacionId, string tokenHash)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@TokenHash", tokenHash);
        return await connection.QueryFirstOrDefaultAsync<TokenVerificacionCorreo>("sp_auth_obtener_token_verificacion_correo", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<OperationResult<bool>> MarkEmailVerificationTokenAsUsedAsync(int denominacionId, int tokenId)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@TokenId", tokenId);
        return await ExecuteUpdateAsync("sp_auth_marcar_token_verificacion_usado", p, "@OutId");
    }

    public async Task<OperationResult<int>> CreateRefreshTokenAsync(RefreshToken entity)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", entity.DenominacionId);
        p.Add("@UsuarioId", entity.UsuarioId);
        p.Add("@IglesiaId", entity.IglesiaId);
        p.Add("@TokenHash", entity.TokenHash);
        //p.Add("@ExpiraEn", entity.ExpiraEn);
        p.Add("@UserAgent", entity.UserAgent);
        p.Add("@Ip", entity.Ip);
        return await ExecuteCreateAsync("sp_auth_crear_refresh_token", p, "@OutRefreshTokenId");
    }

    public async Task<RefreshToken?> GetRefreshTokenAsync(int denominacionId, string tokenHash)
    {
        using var connection = CreateConnection();
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@TokenHash", tokenHash);
        return await connection.QueryFirstOrDefaultAsync<RefreshToken>("sp_auth_obtener_refresh_token", p, commandType: CommandType.StoredProcedure);
    }

    public async Task<OperationResult<bool>> RevokeRefreshTokenAsync(int denominacionId, int refreshTokenId, int? reemplazadoPor)
    {
        var p = new DynamicParameters();
        p.Add("@DenominacionId", denominacionId);
        p.Add("@RefreshTokenId", refreshTokenId);
        p.Add("@ReemplazadoPor", reemplazadoPor);
        return await ExecuteUpdateAsync("sp_auth_revocar_refresh_token", p, "@OutRefreshTokenId");
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
