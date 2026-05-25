using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.Application.Interfaces.Services.Security;

public interface IUsuarioService : IMultiOrganizationalService<UsuarioDto>
{
    Task<Result<IEnumerable<UsuarioPastorResponseDTO>>> GetPastores(int denominacionId);
}
