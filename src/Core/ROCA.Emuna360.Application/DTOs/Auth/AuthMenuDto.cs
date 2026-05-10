namespace ROCA.Emuna360.Application.DTOs.Auth;

public class AuthMenuDto
{
    public int MenuId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public int? IdGrupo { get; set; }
    public string Tipo { get; set; } = string.Empty;
    public string Url { get; set; } = string.Empty;
    public string Imagen { get; set; } = string.Empty;
    public int Orden { get; set; }

}
