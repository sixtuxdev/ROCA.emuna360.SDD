using System;

namespace ROCA.Emuna360.Application.DTOs.Security;

public class TokenVerificacionCorreoDto
{
    public int TokenId { get; set; }
    public int? DenominacionId { get; set; }
    public int? UsuarioId { get; set; }
    public int? IglesiaId { get; set; }
    public string? TokenHash { get; set; }
    public DateTime ExpiraEn { get; set; }
    public DateTime? UsadoEn { get; set; }
}
