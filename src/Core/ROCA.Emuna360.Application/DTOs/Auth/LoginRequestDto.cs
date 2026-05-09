namespace ROCA.Emuna360.Application.DTOs.Auth;

public class LoginRequestDto
{
    public int DenominacionId { get; set; }
    public string Login { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
    public int? IglesiaId { get; set; }
}
