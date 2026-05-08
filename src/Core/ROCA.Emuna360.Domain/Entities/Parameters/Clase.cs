namespace ROCA.Emuna360.Domain.Entities.Parameters;

public class Clase
{
    public int ClaseId { get; set; }
    public int DenominacionId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public bool Estado { get; set; }
    public DateTime FechaCreacion { get; set; }
}
