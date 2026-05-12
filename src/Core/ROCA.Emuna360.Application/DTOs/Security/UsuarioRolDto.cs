namespace ROCA.Emuna360.Application.DTOs.Security;

public class UsuarioRolDto
{
    public int UsuarioRolId { get; set; }
    public int? UsuarioId { get; set; }
    public int? IglesiaId { get; set; }
    public int? DenominacionId { get; set; }
    public int? RolId { get; set; }
    public DateTime FechaCreacion { get; set; }
}
