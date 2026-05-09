using ROCA.Emuna360.Domain.Entities.Parameters;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Parameters;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;

public interface IClaseRepository : IBaseRepository<Clase>
{
    Task<IEnumerable<Clase>> GetByDenominacionAsync(int denominacionId);
}
