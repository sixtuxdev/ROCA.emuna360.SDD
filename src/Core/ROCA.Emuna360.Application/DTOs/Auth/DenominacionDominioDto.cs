namespace ROCA.Emuna360.Application.DTOs.Auth;

public class DenominacionDominioDto
{
    public int DenominacionId { get; set; }
    public string Dominio { get; set; } = string.Empty;
    public string? Subdominio { get; set; }
    public string NombreDenominacion { get; set; } = string.Empty;
}
