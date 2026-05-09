namespace ROCA.Emuna360.Application.DTOs.Auth;

public class RegisterUserRequestDto
{
    public int DenominacionId { get; set; }
    public int IglesiaId { get; set; }
    public string Nombres { get; set; } = string.Empty;
    public string Apellidos { get; set; } = string.Empty;
    public int? ParametroIdTipoDocumento { get; set; }
    public string Documento { get; set; } = string.Empty;
    public int? PaisId { get; set; }
    public int? DepartamentoId { get; set; }
    public int? CiudadId { get; set; }
    public int? CorregimientoId { get; set; }
    public string Direccion { get; set; } = string.Empty;
    public string Correo { get; set; } = string.Empty;
    public string? Telefono { get; set; }
    public int ParametroIdSexo { get; set; }
    public string Password { get; set; } = string.Empty;
    public int RolId { get; set; }
}
