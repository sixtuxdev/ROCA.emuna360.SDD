using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Organization;

public class ConfiguracionIglesiaColorDto
{
    public int ConfiguracionIglesiaId { get; set; }
    public int DenominacionId { get; set; }
    public string NombreColor { get; set; } = string.Empty;
    public string? ValorColor { get; set; }
}
