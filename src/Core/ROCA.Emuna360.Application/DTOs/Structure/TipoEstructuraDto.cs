namespace ROCA.Emuna360.Application.DTOs.Structure;

public class TipoEstructuraDto
{
    public int TipoEstructuraId { get; set; }
    public int DenominacionId { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public int Orden { get; set; }
}
