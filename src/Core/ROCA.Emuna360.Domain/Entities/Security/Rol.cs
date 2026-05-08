namespace ROCA.Emuna360.Domain.Entities.Security;

public class Rol
{
    public int RolId { get; set; }
    public int? DenominacionId { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public string? Codigo { get; set; }
    public bool Activo { get; set; }
    public DateTime FechaCreacion { get; set; }
}
