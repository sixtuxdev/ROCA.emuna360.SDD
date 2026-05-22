namespace ROCA.Emuna360.Domain.Entities.Structure;

public class IglesiaEstructura
{
    public int IglesiaEstructurasId { get; set; }
    public int IglesiaId { get; set; }
    public int DenominacionId { get; set; }
    public int EstructuraId { get; set; }
    public DateTime FechaAsignacion { get; set; }
}
