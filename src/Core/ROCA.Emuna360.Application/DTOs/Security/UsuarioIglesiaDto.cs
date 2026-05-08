using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Security;

public class UsuarioIglesiaDto : BaseAuditDto
{
    public int UsuarioIglesiaId { get; set; }
    public int DenominacionId { get; set; }
    public int UsuarioId { get; set; }
    public int IglesiaId { get; set; }
    public byte Estado { get; set; }
    public bool EsAdministrador { get; set; }
}
