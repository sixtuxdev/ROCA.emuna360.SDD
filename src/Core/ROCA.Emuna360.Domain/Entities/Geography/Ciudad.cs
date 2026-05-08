namespace ROCA.Emuna360.Domain.Entities.Geography;

public class Ciudad
{
    public int CiudadId { get; set; }
    public int DepartamentoId { get; set; }
    public string CiudadNombre { get; set; } = string.Empty; // In DB it is "Ciudad"
    public string? Descripcion { get; set; }
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
}
