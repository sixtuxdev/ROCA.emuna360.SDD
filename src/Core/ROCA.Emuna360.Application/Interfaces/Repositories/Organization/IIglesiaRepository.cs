using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Organization;

public interface IIglesiaRepository : IBaseRepository<IglesiaDto>
{
    Task<IEnumerable<IglesiaDto>> GetByDenominacionAsync(int denominacionId);
}
