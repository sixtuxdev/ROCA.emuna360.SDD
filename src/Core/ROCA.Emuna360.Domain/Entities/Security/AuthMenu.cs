namespace ROCA.Emuna360.Domain.Entities.Security;

public class AuthMenu
{
    public int MenuId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public string Url { get; set; } = string.Empty;
    public string Imagen { get; set; } = string.Empty;
    public int? IdGrupo { get; set; }
    public int Orden { get; set; }
}
