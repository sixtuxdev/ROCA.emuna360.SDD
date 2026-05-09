namespace ROCA.Emuna360.Application.DTOs.Auth;

public class ConfirmEmailRequestDto
{
    public int DenominacionId { get; set; }
    public string Token { get; set; } = string.Empty;
}
