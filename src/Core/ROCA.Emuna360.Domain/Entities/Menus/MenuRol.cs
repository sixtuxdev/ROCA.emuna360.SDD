namespace ROCA.Emuna360.Domain.Entities.Menus;

public class MenuRol
{
    public int Menu_Rol { get; set; } // PK
    public int? DenominacionId { get; set; }
    public int? RolId { get; set; }
    public int? MenuId { get; set; }
    public bool Estado { get; set; }
}
