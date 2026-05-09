namespace ROCA.Emuna360.Application.DTOs.Auth;

public class AuthRegistroDto
{
    public int RegistroId { get; set; }
    public string Nombres { get; set; } = string.Empty;
    public string Apellidos { get; set; } = string.Empty;
    public string Documento { get; set; } = string.Empty;
    public string NombreCompleto => $"{Nombres} {Apellidos}";
}
