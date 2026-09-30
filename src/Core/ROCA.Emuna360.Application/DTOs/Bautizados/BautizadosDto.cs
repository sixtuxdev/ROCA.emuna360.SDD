using ROCA.Emuna360.Application.Common;

namespace ROCA.Emuna360.Application.DTOs.Registry;

public sealed class BautizadosDto : BaseAuditDto
{
    public int CompletarDatosId { get; set; }
    public int RegistroId { get; set; }

    // Datos del registro
    public string? Documento { get; set; }
    public string? Nombres { get; set; }
    public string? Apellidos { get; set; }
    public string? NombreCompleto { get; set; }

    // Número único de bautizo
    public string? NumeroUnicoBautizo { get; set; }

    // Ubicación
    public int? PaisResidenciaId { get; set; }
    public int? DepartamentoResidenciaId { get; set; }
    public int? CiudadResidenciaId { get; set; }

    // Fechas
    public DateTime? FechaNacimiento { get; set; }
    public DateTime? FechaBautismo { get; set; }

    // Parámetros
    public int? ParametroIdEstadoCivil { get; set; }

    public List<int> ParametrosEstudiosAcademicos { get; set; } = [];
    public List<int> ParametrosEstudiosTeologicos { get; set; } = [];

    public int? ParametroIdSituacionLaboral { get; set; }
    public int? ParametroIdTipoMiembro { get; set; }
    public int? ParametroIdTipoPoblacion { get; set; }

    // Contacto
    public string? PersonaContacto { get; set; }
    public string? TelefonoContacto { get; set; }

    // Iglesia / organización
    public int? IglesiaId { get; set; }
    public int? DenominacionId { get; set; }

    // Datos de bautismo
    public string? IglesiaBautismo { get; set; }
    public string? PastorBautismo { get; set; }
}