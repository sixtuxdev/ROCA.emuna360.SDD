using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Security;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Security;

public interface IUsuarioPerfilRepository : IBaseRepository<UsuarioPerfilDto>
{
    Task<IEnumerable<UsuarioPerfilDto>> GetByDenominacionAsync(int denominacionId);
}
