using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Parameters;

public class ParametroDto : BaseAuditDto
{
    public int ParametroId { get; set; }
    public int DenominacionId { get; set; }
    public int ClaseId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public string? Observacion { get; set; }
    public int? PadreParametroId { get; set; }
    public bool Estado { get; set; }
}
