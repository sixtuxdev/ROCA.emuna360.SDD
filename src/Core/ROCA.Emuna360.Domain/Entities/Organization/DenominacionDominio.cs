namespace ROCA.Emuna360.Domain.Entities.Organization;

public class DenominacionDominio
{
    public int DenominacionId { get; set; }
    public string Dominio { get; set; } = string.Empty;
    public string? Subdominio { get; set; }
    public string NombreDenominacion { get; set; } = string.Empty;
}
