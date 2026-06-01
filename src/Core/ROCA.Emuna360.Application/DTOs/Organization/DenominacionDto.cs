using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Organization;

public class DenominacionDto : BaseAuditDto
{
    public int DenominacionId { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public string Slug { get; set; } = string.Empty;
    public bool Activa { get; set; }
    public int IglesiaPrincipalId { get; set; }

    public IglesiaDto? IglesiaInfo { get; set; }
}
