namespace ROCA.Emuna360.Domain.Entities.Security;

public class Usuario
{
    public int UsuarioId { get; set; }
    public int DenominacionId { get; set; }
    public string? Correo { get; set; }
    public string? PasswordHash { get; set; }
    public bool EmailVerificado { get; set; }
    public bool Bloqueado { get; set; }
    public DateTime FechaCreacion { get; set; }
    public DateTime? UltimoLogin { get; set; }
    public string? SecurityStamp { get; set; }
    public int? RolId { get; set; }
}
