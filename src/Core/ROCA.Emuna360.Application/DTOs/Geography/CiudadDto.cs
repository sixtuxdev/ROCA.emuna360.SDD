using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Geography;

public class CiudadDto : BaseAuditDto
{
    public int CiudadId { get; set; }
    public int DepartamentoId { get; set; }
    public string CiudadNombre { get; set; } = string.Empty;
    public string? Descripcion { get; set; }
    public bool Estado { get; set; }
}
