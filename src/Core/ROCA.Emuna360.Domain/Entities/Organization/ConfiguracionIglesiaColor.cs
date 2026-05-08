namespace ROCA.Emuna360.Domain.Entities.Organization;

public class ConfiguracionIglesiaColor
{
    public int ConfiguracionIglesiaId { get; set; }
    public int DenominacionId { get; set; }
    public string NombreColor { get; set; } = string.Empty;
    public string? ValorColor { get; set; }
}
