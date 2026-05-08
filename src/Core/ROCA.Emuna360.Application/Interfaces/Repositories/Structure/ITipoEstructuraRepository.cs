using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Structure;

public interface ITipoEstructuraRepository : IBaseRepository<TipoEstructuraDto>
{
    Task<IEnumerable<TipoEstructuraDto>> GetByDenominacionAsync(int denominacionId);
}
