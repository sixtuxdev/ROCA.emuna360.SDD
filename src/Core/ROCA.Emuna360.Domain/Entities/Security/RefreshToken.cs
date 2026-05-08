namespace ROCA.Emuna360.Domain.Entities.Security;

public class RefreshToken
{
    public int RefreshTokenId { get; set; }
    public int DenominacionId { get; set; }
    public int UsuarioId { get; set; }
    public int IglesiaId { get; set; }
    public string? TokenHash { get; set; }
    public DateTime ExpiraEn { get; set; }
    public DateTime? RevocadoEn { get; set; }
    public int? ReemplazadoPor { get; set; }
    public string? UserAgent { get; set; }
    public string? Ip { get; set; }
    public DateTime FechaCreacion { get; set; }
}
