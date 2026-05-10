using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Security;

public class UsuarioDto : BaseAuditDto
{
    public int UsuarioId { get; set; }
    public int DenominacionId { get; set; }
    public string Denominacion { get; set; } = string.Empty;
    public string? Correo { get; set; }
    public bool EmailVerificado { get; set; }
    public bool Bloqueado { get; set; }
    public DateTime? UltimoLogin { get; set; }
    public int? RolId { get; set; }
}
