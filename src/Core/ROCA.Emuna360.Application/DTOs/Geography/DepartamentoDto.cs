using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Geography;

public class DepartamentoDto : BaseAuditDto
{
    public int DepartamentoId { get; set; }
    public int PaisId { get; set; }
    public string DepartamentoNombre { get; set; } = string.Empty;
    public string? Descripcion { get; set; }
    public bool Estado { get; set; }
}
