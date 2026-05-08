using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Registry;

public class RegistroDto : BaseAuditDto
{
    public int RegistroId { get; set; }
    public int? DenominacionId { get; set; }
    public int IglesiaId { get; set; }
    public string? Nombres { get; set; }
    public string? Apellidos { get; set; }
    public int? ParametroIdTipoDocumento { get; set; }
    public string? Documento { get; set; }
    public int? PaisId { get; set; }
    public int? DepartamentoId { get; set; }
    public int? CiudadId { get; set; }
    public int? CorregimientoId { get; set; }
    public string? Direccion { get; set; }
    public string? Correo { get; set; }
    public string? Telefono { get; set; }
    public int ParametroIdSexo { get; set; }
}
