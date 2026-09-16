namespace ROCA.Emuna360.Domain.Entities.Registry;

// Campos al estilo de los DTOs de registry (heredando BaseAuditDto)
public  class CompletarDatos
{
    public int CompletarDatosId { get; set; }
    public int RegistroId { get; set; }

    // Ubicación
    public int? PaisResidenciaId { get; set; }
    public int? DepartamentoResidenciaId { get; set; }
    public int? CiudadResidenciaId { get; set; }

    // Fechas relevantes
    public DateTime? FechaNacimiento { get; set; }
    public DateTime? FechaBautismo { get; set; }

    // Parámetros (FK a Parametro)
    public int? ParametroIdEstadoCivil { get; set; }
    public int? ParametroIdEstudiosAcademicos { get; set; }
    public int? ParametroIdEstudiosTeologicos { get; set; }
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
