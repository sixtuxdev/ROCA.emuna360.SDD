namespace ROCA.Emuna360.Application.DTOs.Auth;

public class AuthUserDto
{
    public int UsuarioId { get; set; }
    public int DenominacionId { get; set; }
    public string Correo { get; set; } = string.Empty;
    public bool EmailVerificado { get; set; }
    public int RolId { get; set; }
    public AuthRegistroDto? Registro { get; set; }
    public List<AuthRoleDto> Roles { get; set; } = new();
    public List<AuthMenuDto> Menus { get; set; } = new();
}
