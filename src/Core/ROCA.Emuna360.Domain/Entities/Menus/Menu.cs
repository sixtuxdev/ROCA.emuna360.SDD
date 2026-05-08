namespace ROCA.Emuna360.Domain.Entities.Menus;

public class Menu
{
    public int? MenuId { get; set; }
    public int? DenominacionId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public int? IdGrupo { get; set; }
    public string Tipo { get; set; } = string.Empty;
    public bool Estado { get; set; }
    public string Url { get; set; } = string.Empty;
    public string Imagen { get; set; } = string.Empty;
    public DateTime Fecha { get; set; }
    public int Orden { get; set; }
    public bool NuevaVentana { get; set; }
}
