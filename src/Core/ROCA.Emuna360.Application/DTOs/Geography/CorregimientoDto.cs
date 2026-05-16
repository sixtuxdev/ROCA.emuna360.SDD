using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Geography;

public class CorregimientoDto : BaseAuditDto
{
    public int CorregimientoId { get; set; }
    public int? CiudadId { get; set; }
    public string CorregimientoNombre { get; set; } = string.Empty;
    public string? Descripcion { get; set; }
    public bool Estado { get; set; }
}
