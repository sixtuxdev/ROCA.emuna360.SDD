namespace ROCA.Emuna360.Domain.Entities.Parameters;

public class Parametro
{
    public int ParametroId { get; set; }
    public int DenominacionId { get; set; }
    public int ClaseId { get; set; }
    public string Descripcion { get; set; } = string.Empty;
    public string? Observacion { get; set; }
    public int? PadreParametroId { get; set; }
    public bool Estado { get; set; }
    public DateTime? FechaCreacion { get; set; }
}
