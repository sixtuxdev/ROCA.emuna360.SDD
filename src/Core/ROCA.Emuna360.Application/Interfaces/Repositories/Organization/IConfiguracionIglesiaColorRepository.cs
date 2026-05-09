using ROCA.Emuna360.Domain.Entities.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Organization;

public interface IConfiguracionIglesiaColorRepository : IBaseRepository<ConfiguracionIglesiaColor>
{
    Task<IEnumerable<ConfiguracionIglesiaColor>> GetByDenominacionAsync(int denominacionId);
}
