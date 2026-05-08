namespace ROCA.Emuna360.Domain.Entities.Security;

public class UsuarioPerfil
{
    public int? UsuarioId { get; set; }
    public int? DenominacionId { get; set; }
    public string TipoDocumento { get; set; } = string.Empty;
    public string Documento { get; set; } = string.Empty;
    public string Nombres { get; set; } = string.Empty;
    public string Apellidos { get; set; } = string.Empty;
    public DateOnly? FechaCumple { get; set; } // Using DateOnly for DATE column
    public string? Telefono { get; set; }
    public string? Genero { get; set; }
    public string? Direccion { get; set; }
    public string? Avatar { get; set; }
    public byte Estado { get; set; }
    public DateTime? FechaActualizacion { get; set; }
}
