namespace ROCA.Emuna360.Domain.Entities.Structure;

public class EstructuraDenominacion
{
    public int EstructuraId { get; set; }
    public int DenominacionId { get; set; }
    public int IglesiaId { get; set; }
    public int TipoEstructuraId { get; set; }
    public int? PadreId { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public string? Codigo { get; set; }
    public bool Activa { get; set; }
    public DateTime FechaCreacion { get; set; }
}
