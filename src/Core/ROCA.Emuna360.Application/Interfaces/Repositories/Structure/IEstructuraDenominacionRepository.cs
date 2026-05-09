using ROCA.Emuna360.Domain.Entities.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Structure;

public interface IEstructuraDenominacionRepository : IBaseRepository<EstructuraDenominacion>
{
    Task<IEnumerable<EstructuraDenominacion>> GetByDenominacionAsync(int denominacionId);
    Task<IEnumerable<EstructuraDenominacion>> GetByIglesiaAsync(int iglesiaId);
}
