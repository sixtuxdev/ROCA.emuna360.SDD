namespace ROCA.Emuna360.Application.DTOs.Auth;

public class RefreshTokenRequestDto
{
    public int DenominacionId { get; set; }
    public string RefreshToken { get; set; } = string.Empty;
}
