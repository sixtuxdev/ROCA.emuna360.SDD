namespace ROCA.Emuna360.Domain.Entities.Organization;

public class Denominacion
{
    public int DenominacionId { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public string Slug { get; set; } = string.Empty;
    public bool Activa { get; set; }
    public int IglesiaPrincipalId { get; set; }
    public DateTime? FechaCreacion { get; set; }

    public Iglesia? IglesiaInfo { get; set; }

}
