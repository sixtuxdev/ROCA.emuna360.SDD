using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Parameters;

public class ClaseDto : BaseAuditDto
{
    public int ClaseId { get; set; }
    public int DenominacionId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public bool Estado { get; set; }
}
