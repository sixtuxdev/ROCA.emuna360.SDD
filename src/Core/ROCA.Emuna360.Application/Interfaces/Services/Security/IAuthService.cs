using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Application.DTOs.Auth;

namespace ROCA.Emuna360.Application.Interfaces.Services.Security;

public interface IAuthService
{
    Task<Result<LoginResponseDto>> LoginAsync(LoginRequestDto request);
    Task<Result<RegisterUserResponseDto>> RegisterAsync(RegisterUserRequestDto request);
    Task<Result<bool>> ConfirmEmailAsync(ConfirmEmailRequestDto request);
    Task<Result<RefreshTokenResponseDto>> RefreshTokenAsync(RefreshTokenRequestDto request);
    Task<Result<bool>> LogoutAsync(LogoutRequestDto request);
}
