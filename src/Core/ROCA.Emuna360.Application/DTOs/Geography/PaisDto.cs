using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Geography;

public class PaisDto : BaseAuditDto
{
    public int PaisId { get; set; }
    public string PaisNombre { get; set; } = string.Empty;
    public string? Descripcion { get; set; }
    public bool Estado { get; set; }
}
