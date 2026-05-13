using ROCA.Emuna360.Domain.Entities.Parameters;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Parameters;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;

public interface IParametroRepository : IMultiOrganizationalRepository<Parametro>
{
    Task<IEnumerable<Parametro>> GetByDenominacionAsync(int denominacionId);
    Task<IEnumerable<Parametro>> GetByClaseAsync(int denominacionId, int claseId);
}
