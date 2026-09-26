namespace ROCA.Emuna360.Application.DTOs.Registry;

public class RegistroPendienteDto
{
    public int RegistroId { get; set; }
    public string TipoDocumento { get; set; } = string.Empty;
    public string Documento { get; set; } = string.Empty;
    public string Nombres { get; set; } = string.Empty;
    public string Apellidos { get; set; } = string.Empty;
    public string? Telefono { get; set; }
}
