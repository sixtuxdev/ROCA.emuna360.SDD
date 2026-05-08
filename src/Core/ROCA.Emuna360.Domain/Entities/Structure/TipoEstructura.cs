namespace ROCA.Emuna360.Domain.Entities.Structure;

public class TipoEstructura
{
    public int TipoEstructuraId { get; set; }
    public int DenominacionId { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public int Orden { get; set; }
}
