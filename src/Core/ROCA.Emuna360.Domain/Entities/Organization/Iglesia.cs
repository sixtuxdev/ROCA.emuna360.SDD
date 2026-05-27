namespace ROCA.Emuna360.Domain.Entities.Organization;

using ROCA.Emuna360.Domain.Entities.Structure;

public class Iglesia
{
    public int IglesiaId { get; set; }
    public int DenominacionId { get; set; }
    public string Nombre { get; set; } = string.Empty;
    public string Slug { get; set; } = string.Empty;
    public string? PersoneriaJuridica { get; set; }
    public int? PaisId { get; set; }
    public int? DepartamentoId { get; set; }
    public int? CiudadId { get; set; }
    public int? CorregimientoId { get; set; }
    public string? CiudadCorregimiento { get; set; }
    public string? Direccion { get; set; }
    public string? Telefono { get; set; }
    public string? Correo { get; set; }
    public string? Slogan { get; set; }
    public int? PastorResponsableRegistroId { get; set; }
    public bool Activa { get; set; }
    public DateTime FechaCreacion { get; set; }
    public EstructuraOrganizacional? EstructuraOrg { get; set; }
}
