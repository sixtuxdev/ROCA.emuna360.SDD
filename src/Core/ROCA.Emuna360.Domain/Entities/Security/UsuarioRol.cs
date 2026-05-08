namespace ROCA.Emuna360.Domain.Entities.Security;

public class UsuarioRol
{
    public int UsuarioRolId { get; set; }
    public int? UsuarioId { get; set; }
    public int? DenominacionId { get; set; }
    public int? RolId { get; set; }
    public DateTime FechaAsignacion { get; set; }
}
