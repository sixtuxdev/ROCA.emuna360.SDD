using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Structure;

public interface IIglesiaEstructuraRepository : IBaseRepository<IglesiaEstructuraDto>
{
    Task<IEnumerable<IglesiaEstructuraDto>> GetByIglesiaAsync(int iglesiaId);
}
