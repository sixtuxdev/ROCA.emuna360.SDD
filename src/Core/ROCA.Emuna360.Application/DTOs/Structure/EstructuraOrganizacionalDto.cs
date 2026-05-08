using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Structure;

public class EstructuraOrganizacionalDto : BaseAuditDto
{
    public int EstructuraOrganizacionalId { get; set; }
    public int DenominacionId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public int? GrupoEstructuraOrganizacionalId { get; set; }
    public int Orden { get; set; }
    public string? Responsable { get; set; }
    public bool Estado { get; set; }
}
