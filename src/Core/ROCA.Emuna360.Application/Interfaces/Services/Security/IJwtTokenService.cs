using ROCA.Emuna360.Domain.Entities.Security;

namespace ROCA.Emuna360.Application.Interfaces.Services.Security;

public interface IJwtTokenService
{
    string GenerateToken(AuthUser user);
    string GenerateRefreshToken();
}
