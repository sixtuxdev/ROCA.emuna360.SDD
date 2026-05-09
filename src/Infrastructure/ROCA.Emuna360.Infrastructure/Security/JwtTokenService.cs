using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using ROCA.Emuna360.Application.Common;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using ROCA.Emuna360.Domain.Entities.Security;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace ROCA.Emuna360.Infrastructure.Security;

public class JwtTokenService : IJwtTokenService
{
    private readonly JwtSettings _jwtSettings;

    public JwtTokenService(IOptions<JwtSettings> jwtSettings)
    {
        _jwtSettings = jwtSettings.Value;
    }

    public string GenerateToken(AuthUser user)
    {
        var claims = new List<Claim>
        {
            new(JwtRegisteredClaimNames.Sub, user.UsuarioId.ToString()),
            new(JwtRegisteredClaimNames.Email, user.Correo ?? string.Empty),
            new(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
            new("UsuarioId", user.UsuarioId.ToString()),
            new("RegistroId", user.RegistroId.ToString()),
            new("DenominacionId", user.DenominacionId.ToString()),
            new("RolId", user.RolId?.ToString() ?? string.Empty),
            new("SecurityStamp", user.SecurityStamp ?? string.Empty)
        };

        if (user.Registro != null)
        {
            claims.Add(new("NombreCompleto", $"{user.Registro.Nombres} {user.Registro.Apellidos}"));
            claims.Add(new("Documento", user.Registro.Documento ?? string.Empty));
        }

        foreach (var role in user.Roles)
        {
            claims.Add(new(ClaimTypes.Role, role.Nombre));
            claims.Add(new("Roles", role.Codigo));
        }

        var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwtSettings.SecretKey));
        var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

        var token = new JwtSecurityToken(
            issuer: _jwtSettings.Issuer,
            audience: _jwtSettings.Audience,
            claims: claims,
            expires: DateTime.UtcNow.AddMinutes(_jwtSettings.AccessTokenMinutes),
            signingCredentials: creds
        );

        return new JwtSecurityTokenHandler().WriteToken(token);
    }

    public string GenerateRefreshToken()
    {
        var randomNumber = new byte[64];
        using var rng = RandomNumberGenerator.Create();
        rng.GetBytes(randomNumber);
        return Convert.ToBase64String(randomNumber);
    }
}
