using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.Application.Interfaces.Services.Security;

public interface IUsuarioIglesiaService : IMultiOrganizationalService<UsuarioIglesiaDto>
{
    Task<Result<bool>> EsAdminDenominacionAsync(int denominacionId, int usuarioId);
}
