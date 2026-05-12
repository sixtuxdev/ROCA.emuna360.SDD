namespace ROCA.Emuna360.Domain.Entities.Security;

public class UsuarioIglesia
{
    public int UsuarioIglesiaId { get; set; }
    public int DenominacionId { get; set; }
    public int UsuarioId { get; set; }
    public int IglesiaId { get; set; }
    public bool Estado { get; set; }
    public bool EsAdministrador { get; set; }
    public DateTime FechaCreacion { get; set; }
}
