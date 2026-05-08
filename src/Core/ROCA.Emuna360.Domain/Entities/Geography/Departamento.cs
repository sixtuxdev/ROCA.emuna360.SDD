namespace ROCA.Emuna360.Domain.Entities.Geography;

public class Departamento
{
    public int DepartamentoId { get; set; }
    public int PaisId { get; set; }
    public string DepartamentoNombre { get; set; } = string.Empty; // In DB it is "Departamento"
    public string? Descripcion { get; set; }
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
}
