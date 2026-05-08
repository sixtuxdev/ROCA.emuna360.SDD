using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Organization;

public class ConfiguracionIglesiaDto : BaseAuditDto
{
    public int ConfiguracionIglesiaId { get; set; }
    public int DenominacionId { get; set; }
    public int IglesiaId { get; set; }
    public string? SitioWeb { get; set; }
    public string? Logo { get; set; }
    public string? HostEmail { get; set; }
    public string? HostUsuarioEmail { get; set; }
    public string? Host { get; set; }
    public string? FromEmail { get; set; }
    public int? HostPort { get; set; }
    public string? TextFromEmail { get; set; }
    public string? KeySecretAPIRecaptcha { get; set; }
    public string? KeySecretWebRecaptcha { get; set; }
    public string? InfoTextoEncabezado { get; set; }
    public bool Activa { get; set; }
}
