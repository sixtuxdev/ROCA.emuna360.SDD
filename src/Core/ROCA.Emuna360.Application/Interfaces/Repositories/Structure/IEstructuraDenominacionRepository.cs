using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Structure;

public interface IEstructuraDenominacionRepository : IBaseRepository<EstructuraDenominacionDto>
{
    Task<IEnumerable<EstructuraDenominacionDto>> GetByDenominacionAsync(int denominacionId);
    Task<IEnumerable<EstructuraDenominacionDto>> GetByIglesiaAsync(int iglesiaId);
}
