using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Security;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Security;

public interface IUsuarioIglesiaRepository : IBaseRepository<UsuarioIglesiaDto>
{
    Task<IEnumerable<UsuarioIglesiaDto>> GetByIglesiaAsync(int iglesiaId);
    Task<IEnumerable<UsuarioIglesiaDto>> GetByDenominacionAsync(int denominacionId);
}
