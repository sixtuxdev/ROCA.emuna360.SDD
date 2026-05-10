using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Registry;
using ROCA.Emuna360.Domain.Entities.Security;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Security;

public interface IAuthRepository
{
    Task<AuthUser?> GetUserByEmailAsync(int denominacionId, string correo);
    Task<AuthUser?> GetUserByDocumentAsync(int denominacionId, string documento);
    Task<Registro?> GetRegistroByDocumentoAsync(int denominacionId, string documento);
    Task<Registro?> GetRegistroByIdAsync(int denominacionId, int registroId);
    Task<OperationResult<int>> CreateRegistroAsync(Registro entity);
    Task<OperationResult<int>> CreateUserAsync(Usuario entity);
    Task<OperationResult<bool>> AssignUserRoleAsync(int denominacionId, int usuarioId, int rolId);
    Task<OperationResult<bool>> AssignUserIglesiaAsync(int denominacionId, int usuarioId, int iglesiaId, bool esAdministrador);
    Task<OperationResult<bool>> UpdateLastLoginAsync(int denominacionId, int usuarioId);
    Task<OperationResult<bool>> MarkEmailAsVerifiedAsync(int denominacionId, int usuarioId);
    Task<OperationResult<int>> CreateEmailVerificationTokenAsync(TokenVerificacionCorreo entity);
    Task<TokenVerificacionCorreo?> GetEmailVerificationTokenAsync(int denominacionId, string tokenHash);
    Task<OperationResult<bool>> MarkEmailVerificationTokenAsUsedAsync(int denominacionId, int tokenId);
    Task<OperationResult<int>> CreateRefreshTokenAsync(RefreshToken entity);
    Task<RefreshToken?> GetRefreshTokenAsync(int denominacionId, string tokenHash);
    Task<OperationResult<bool>> RevokeRefreshTokenAsync(int denominacionId, int refreshTokenId, int? reemplazadoPor);
    Task<IEnumerable<AuthRole>> GetUserRolesAsync(int denominacionId, int usuarioId);
    Task<IEnumerable<AuthMenu>> GetUserMenusAsync(int denominacionId, int usuarioId);
    Task<AuthUser?> GetUserByIdAsync(int denominacionId, int usuarioId);
}
