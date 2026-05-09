using ROCA.Emuna360.Domain.Entities.Structure;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Structure;

public interface IEstructuraOrganizacionalRepository : IBaseRepository<EstructuraOrganizacional>
{
    Task<IEnumerable<EstructuraOrganizacional>> GetByDenominacionAsync(int denominacionId);
}
