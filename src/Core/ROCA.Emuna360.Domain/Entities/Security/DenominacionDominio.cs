namespace ROCA.Emuna360.Domain.Entities.Security;

public class DenominacionDominio
{
    public int DenominacionDominioId { get; set; }
    public int DenominacionId { get; set; }
    public string? Dominio { get; set; }
    public string? Subdominio { get; set; }
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
}
