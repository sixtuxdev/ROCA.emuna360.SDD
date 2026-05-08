using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Security;

public class RolDto : BaseAuditDto
{
    public int RolId { get; set; }
    public int? DenominacionId { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public string? Codigo { get; set; }
    public bool Activo { get; set; }
}
