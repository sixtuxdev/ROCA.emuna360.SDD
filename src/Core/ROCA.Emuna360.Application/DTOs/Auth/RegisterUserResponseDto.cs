namespace ROCA.Emuna360.Application.DTOs.Auth;

public class RegisterUserResponseDto
{
    public int UsuarioId { get; set; }
    public string Correo { get; set; } = string.Empty;
    public string Message { get; set; } = "Usuario registrado exitosamente. Por favor verifique su correo.";
}
