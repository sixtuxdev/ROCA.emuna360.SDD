using ROCA.Emuna360.Domain.Entities.Security;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Security;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Security;

public interface IUsuarioRepository : IMultiOrganizationalRepository<Usuario>
{
    Task<IEnumerable<Usuario>> GetByDenominacionAsync(int denominacionId);
    Task<IEnumerable<UsuarioPastorResponse>> GetPastores(int denominacionId);
}
