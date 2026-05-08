namespace ROCA.Emuna360.Domain.Entities.Structure;

public class EstructuraOrganizacional
{
    public int EstructuraOrganizacionalId { get; set; }
    public int DenominacionId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public int? GrupoEstructuraOrganizacionalId { get; set; }
    public int Orden { get; set; }
    public string? Responsable { get; set; }
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
}
