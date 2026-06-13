namespace ROCA.Emuna360.Application.DTOs.Security;

public class DenominacionDominioDTO
{
    public int DenominacionDominioId { get; set; }
    public int DenominacionId { get; set; }
    public string? Dominio { get; set; }
    public string? Subdominio { get; set; }
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
}
