namespace ROCA.Emuna360.Domain.Entities.Geography;

public class Corregimiento
{
    public int CorregimientoId { get; set; }
    public int? CiudadId { get; set; }
    public string CorregimientoNombre { get; set; } = string.Empty; // In DB it is "Corregimiento"
    public string? Descripcion { get; set; }
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
}
