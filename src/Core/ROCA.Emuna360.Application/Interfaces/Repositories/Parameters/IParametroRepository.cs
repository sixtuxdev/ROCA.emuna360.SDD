using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Parameters;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;

public interface IParametroRepository : IBaseRepository<ParametroDto>
{
    Task<IEnumerable<ParametroDto>> GetByDenominacionAsync(int denominacionId);
}
