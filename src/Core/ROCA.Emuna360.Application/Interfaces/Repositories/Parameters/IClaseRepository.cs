using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Parameters;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;

public interface IClaseRepository : IBaseRepository<ClaseDto>
{
    Task<IEnumerable<ClaseDto>> GetByDenominacionAsync(int denominacionId);
}
