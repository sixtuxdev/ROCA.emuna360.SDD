namespace ROCA.Emuna360.Domain.Entities.Geography;

public class Pais
{
    public int PaisId { get; set; }
    public string PaisNombre { get; set; } = string.Empty; // In DB it is "Pais"
    public string? Descripcion { get; set; }
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
}
