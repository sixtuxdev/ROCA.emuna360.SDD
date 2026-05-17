using AutoMapper;
using Microsoft.Extensions.Options;
using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Application.Common;
using ROCA.Emuna360.Application.DTOs.Auth;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using ROCA.Emuna360.Domain.Entities.Registry;
using ROCA.Emuna360.Domain.Entities.Security;
using System.Security.Cryptography;
using System.Text;

namespace ROCA.Emuna360.Application.Services.Auth;

public class AuthService : IAuthService
{
    private readonly IAuthRepository _authRepository;
    private readonly IPasswordHasherService _passwordHasher;
    private readonly IJwtTokenService _jwtTokenService;
    private readonly IEmailSenderService _emailSender;
    private readonly IMapper _mapper;
    private readonly JwtSettings _jwtSettings;
    private readonly IRecaptchaService _recaptchaService;

    public AuthService(
        IAuthRepository authRepository,
        IPasswordHasherService passwordHasher,
        IJwtTokenService jwtTokenService,
        IEmailSenderService emailSender,
        IMapper mapper,
        IOptions<JwtSettings> jwtSettings,
        IRecaptchaService recaptchaService)
    {
        _authRepository = authRepository;
        _passwordHasher = passwordHasher;
        _jwtTokenService = jwtTokenService;
        _emailSender = emailSender;
        _mapper = mapper;
        _jwtSettings = jwtSettings.Value;
        _recaptchaService = recaptchaService;
    }

    public async Task<Result<LoginResponseDto>> LoginAsync(LoginRequestDto request)
    {
        // Validación reCAPTCHA
        if (!await _recaptchaService.VerifyAsync(request.RecaptchaToken ?? string.Empty))
        {
            return Result<LoginResponseDto>.Failure("La validación de seguridad reCAPTCHA no fue aprobada.");
        }

        AuthUser? user = null;

        // Búsqueda dual: por correo o por documento
        if (request.Login.Contains("@"))
        {
            user = await _authRepository.GetUserByEmailAsync(request.DenominacionId, request.Login);
        }
        else
        {
            user = await _authRepository.GetUserByDocumentAsync(request.DenominacionId, request.Login);
        }

        if (user == null)
            return Result<LoginResponseDto>.Failure("Credenciales incorrectas.");

        if (user.Bloqueado)
            return Result<LoginResponseDto>.Failure("El usuario se encuentra bloqueado.");

        if (!user.EmailVerificado)
            return Result<LoginResponseDto>.Failure("Debe verificar su correo electrónico antes de iniciar sesión.");

        if (!_passwordHasher.VerifyPassword(request.Password, user.PasswordHash ?? string.Empty))
            return Result<LoginResponseDto>.Failure("Credenciales incorrectas.");

        // Cargar detalles adicionales
        //user.Registro = await _authRepository.GetRegistroByIdAsync(request.DenominacionId, user.RegistroId, request.IglesiaId);
        //user.Roles = await _authRepository.GetUserRolesAsync(request.DenominacionId, user.UsuarioId);
        //user.Menus = await _authRepository.GetUserMenusAsync(request.DenominacionId, user.UsuarioId);

        // Generar tokens
        var token = _jwtTokenService.GenerateToken(user);
        var refreshToken = _jwtTokenService.GenerateRefreshToken();

        // Guardar Refresh Token
        var refreshTokenEntity = new RefreshToken
        {
            DenominacionId = user.DenominacionId,
            UsuarioId = user.UsuarioId,
            IglesiaId = user.Registro?.IglesiaId ?? 0,
            EsAdministrador = user.UsuarioIglesia.EsAdministrador,
            TokenHash = HashToken(refreshToken),
            ExpiraEn = DateTime.UtcNow.AddDays(_jwtSettings.RefreshTokenDays),
            FechaCreacion = DateTime.UtcNow
        };

        var refreshTokenResult = await _authRepository.CreateRefreshTokenAsync(refreshTokenEntity);
        if (!refreshTokenResult.Success)
            return Result<LoginResponseDto>.Failure(refreshTokenResult.Message);

        var loginUpdateResult = await _authRepository.UpdateLastLoginAsync(request.DenominacionId, user.UsuarioId);
        if (!loginUpdateResult.Success)
            return Result<LoginResponseDto>.Failure(loginUpdateResult.Message);

        var response = new LoginResponseDto
        {
            AccessToken = token,
            RefreshToken = refreshToken,
            Expiration = DateTime.UtcNow.AddMinutes(_jwtSettings.AccessTokenMinutes),
            User = _mapper.Map<AuthUserDto>(user)
        };

        return Result<LoginResponseDto>.Success(response);
    }

    public async Task<Result<RegisterUserResponseDto>> RegisterAsync(RegisterUserRequestDto request)
    {
        // Validar duplicados
        var existingUser = await _authRepository.GetUserByEmailAsync(request.DenominacionId, request.Correo);
        if (existingUser != null)
            return Result<RegisterUserResponseDto>.Failure("El correo ya se encuentra registrado.");

        var existingRegistro = await _authRepository.GetRegistroByDocumentoAsync(request.DenominacionId, request.Documento);
        if (existingRegistro != null)
            return Result<RegisterUserResponseDto>.Failure("El documento ya se encuentra registrado.");

        // Crear Registro
        var registro = new Registro
        {
            DenominacionId = request.DenominacionId,
            IglesiaId = request.IglesiaId,
            Nombres = request.Nombres,
            Apellidos = request.Apellidos,
            ParametroIdTipoDocumento = request.ParametroIdTipoDocumento,
            Documento = request.Documento,
            PaisId = request.PaisId,
            DepartamentoId = request.DepartamentoId,
            CiudadId = request.CiudadId,
            CorregimientoId = request.CorregimientoId,
            Direccion = request.Direccion,
            Correo = request.Correo,
            Telefono = request.Telefono,
            ParametroIdSexo = request.ParametroIdSexo
        };

        var registroResult = await _authRepository.CreateRegistroAsync(registro);
        if (!registroResult.Success)
            return Result<RegisterUserResponseDto>.Failure(registroResult.Message);

        // Crear Usuario
        var usuario = new Usuario
        {
            DenominacionId = request.DenominacionId,
            RegistroId = registroResult.Data,
            Correo = request.Correo,
            PasswordHash = _passwordHasher.HashPassword(request.Password),
            EmailVerificado = false,
            Bloqueado = false,
            FechaCreacion = DateTime.UtcNow,
            SecurityStamp = Guid.NewGuid().ToString(),
            RolId = request.RolId
        };

        var usuarioResult = await _authRepository.CreateUserAsync(usuario);
        if (!usuarioResult.Success)
            return Result<RegisterUserResponseDto>.Failure(usuarioResult.Message);

        // Asignaciones
        var roleResult = await _authRepository.AssignUserRoleAsync(request.DenominacionId, usuarioResult.Data, request.RolId);
        if (!roleResult.Success)
            return Result<RegisterUserResponseDto>.Failure(roleResult.Message);

        var iglesiaResult = await _authRepository.AssignUserIglesiaAsync(request.DenominacionId, usuarioResult.Data, request.IglesiaId, false);
        if (!iglesiaResult.Success)
            return Result<RegisterUserResponseDto>.Failure(iglesiaResult.Message);

        // Token de verificación
        var verificationToken = Guid.NewGuid().ToString();
        var tokenEntity = new TokenVerificacionCorreo
        {
            DenominacionId = request.DenominacionId,
            UsuarioId = usuarioResult.Data,
            IglesiaId = request.IglesiaId,
            TokenHash = HashToken(verificationToken),
            ExpiraEn = DateTime.UtcNow.AddHours(24),
            FechaCreacion = DateTime.UtcNow
        };

        var tokenResult = await _authRepository.CreateEmailVerificationTokenAsync(tokenEntity);
        if (!tokenResult.Success)
            return Result<RegisterUserResponseDto>.Failure(tokenResult.Message);

        // Enviar Correo (Async)
        await _emailSender.SendEmailConfirmationAsync(request.Correo, $"{request.Nombres} {request.Apellidos}", verificationToken);

        return Result<RegisterUserResponseDto>.Success(new RegisterUserResponseDto { UsuarioId = usuarioResult.Data, Correo = request.Correo });
    }

    public async Task<Result<bool>> ConfirmEmailAsync(ConfirmEmailRequestDto request)
    {
        var tokenHash = HashToken(request.Token);
        var token = await _authRepository.GetEmailVerificationTokenAsync(request.DenominacionId, tokenHash);

        if (token == null || token.UsadoEn != null || token.ExpiraEn < DateTime.UtcNow)
            return Result<bool>.Failure("Token inválido o expirado.");

        var tokenUsedResult = await _authRepository.MarkEmailVerificationTokenAsUsedAsync(request.DenominacionId, token.TokenId);
        if (!tokenUsedResult.Success)
            return Result<bool>.Failure(tokenUsedResult.Message);

        var emailVerifiedResult = await _authRepository.MarkEmailAsVerifiedAsync(request.DenominacionId, token.UsuarioId ?? 0);
        if (!emailVerifiedResult.Success)
            return Result<bool>.Failure(emailVerifiedResult.Message);

        return Result<bool>.Success(true);
    }

    public async Task<Result<RefreshTokenResponseDto>> RefreshTokenAsync(RefreshTokenRequestDto request)
    {
        var tokenHash = HashToken(request.RefreshToken);
        var token = await _authRepository.GetRefreshTokenAsync(request.DenominacionId, tokenHash);

        if (token == null || token.RevocadoEn != null || token.ExpiraEn < DateTime.UtcNow)
            return Result<RefreshTokenResponseDto>.Failure("Refresh token inválido o expirado.");

        var user = await _authRepository.GetUserByIdAsync(request.DenominacionId, token.UsuarioId);
        if (user == null)
            return Result<RefreshTokenResponseDto>.Failure("Usuario no encontrado.");

        // Cargar detalles para el nuevo JWT
        user.Registro = await _authRepository.GetRegistroByIdAsync(request.DenominacionId, user.RegistroId, user.UsuarioIglesia.IglesiaId);
        user.Roles = await _authRepository.GetUserRolesAsync(request.DenominacionId, user.UsuarioId);
        user.Menus = await _authRepository.GetUserMenusAsync(request.DenominacionId, user.UsuarioId);

        // Generar nuevo par de tokens
        var newAccessToken = _jwtTokenService.GenerateToken(user);
        var newRefreshToken = _jwtTokenService.GenerateRefreshToken();

        // Rotar tokens: Revocar el anterior y crear el nuevo
        var revokeResult = await _authRepository.RevokeRefreshTokenAsync(request.DenominacionId, token.RefreshTokenId, null);
        if (!revokeResult.Success)
            return Result<RefreshTokenResponseDto>.Failure(revokeResult.Message);

        var newRefreshTokenEntity = new RefreshToken
        {
            DenominacionId = user.DenominacionId,
            UsuarioId = user.UsuarioId,
            IglesiaId = user.Registro?.IglesiaId ?? 0,
            TokenHash = HashToken(newRefreshToken),
            ExpiraEn = DateTime.UtcNow.AddDays(_jwtSettings.RefreshTokenDays),
            FechaCreacion = DateTime.UtcNow
        };

        var refreshTokenResult = await _authRepository.CreateRefreshTokenAsync(newRefreshTokenEntity);
        if (!refreshTokenResult.Success)
            return Result<RefreshTokenResponseDto>.Failure(refreshTokenResult.Message);

        var response = new RefreshTokenResponseDto
        {
            AccessToken = newAccessToken,
            RefreshToken = newRefreshToken,
            Expiration = DateTime.UtcNow.AddMinutes(_jwtSettings.AccessTokenMinutes)
        };

        return Result<RefreshTokenResponseDto>.Success(response);
    }

    public async Task<Result<bool>> LogoutAsync(LogoutRequestDto request)
    {
        var tokenHash = HashToken(request.RefreshToken);
        var token = await _authRepository.GetRefreshTokenAsync(request.DenominacionId, tokenHash);

        if (token != null)
        {
            var logoutResult = await _authRepository.RevokeRefreshTokenAsync(request.DenominacionId, token.RefreshTokenId, null);
            if (!logoutResult.Success)
                return Result<bool>.Failure(logoutResult.Message);
        }

        return Result<bool>.Success(true);
    }

    private string HashToken(string token)
    {
        using var sha256 = SHA256.Create();
        var bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(token));
        return Convert.ToBase64String(bytes);
    }
}
