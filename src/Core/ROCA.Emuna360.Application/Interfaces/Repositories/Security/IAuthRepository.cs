using ROCA.Emuna360.Domain.Entities.Registry;
using ROCA.Emuna360.Domain.Entities.Security;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Security;

public interface IAuthRepository
{
    Task<AuthUser?> GetUserByEmailAsync(int denominacionId, string correo);
    Task<AuthUser?> GetUserByDocumentAsync(int denominacionId, string documento);
    Task<Registro?> GetRegistroByDocumentoAsync(int denominacionId, string documento);
    Task<Registro?> GetRegistroByIdAsync(int denominacionId, int registroId);
    Task<int> CreateRegistroAsync(Registro entity);
    Task<int> CreateUserAsync(Usuario entity);
    Task<bool> AssignUserRoleAsync(int denominacionId, int usuarioId, int rolId);
    Task<bool> AssignUserIglesiaAsync(int denominacionId, int usuarioId, int iglesiaId, bool esAdministrador);
    Task<bool> UpdateLastLoginAsync(int denominacionId, int usuarioId);
    Task<bool> MarkEmailAsVerifiedAsync(int denominacionId, int usuarioId);
    Task<int> CreateEmailVerificationTokenAsync(TokenVerificacionCorreo entity);
    Task<TokenVerificacionCorreo?> GetEmailVerificationTokenAsync(int denominacionId, string tokenHash);
    Task<bool> MarkEmailVerificationTokenAsUsedAsync(int denominacionId, int tokenId);
    Task<int> CreateRefreshTokenAsync(RefreshToken entity);
    Task<RefreshToken?> GetRefreshTokenAsync(int denominacionId, string tokenHash);
    Task<bool> RevokeRefreshTokenAsync(int denominacionId, int refreshTokenId, int? reemplazadoPor);
    Task<IEnumerable<AuthRole>> GetUserRolesAsync(int denominacionId, int usuarioId);
    Task<IEnumerable<AuthMenu>> GetUserMenusAsync(int denominacionId, int usuarioId);
    Task<AuthUser?> GetUserByIdAsync(int denominacionId, int usuarioId);
}
