using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.DTOs.Security;

namespace ROCA.Emuna360.Application.DTOs.Registry;

public sealed class RegistroCatalogosDto
{
    public int DenominacionId { get; init; }
    public IReadOnlyList<ParametroDto> TiposDocumento { get; init; } = [];
    public IReadOnlyList<ParametroDto> Sexos { get; init; } = [];
    public IReadOnlyList<ParametroDto> Intereses { get; init; } = [];
    public IReadOnlyList<RolDto> Roles { get; init; } = [];
    public IReadOnlyList<PaisDto> Paises { get; init; } = [];
}
