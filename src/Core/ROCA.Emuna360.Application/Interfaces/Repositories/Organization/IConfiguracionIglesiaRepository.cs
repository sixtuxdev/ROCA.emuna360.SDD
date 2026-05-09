using ROCA.Emuna360.Domain.Entities.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Organization;

public interface IConfiguracionIglesiaRepository : IBaseRepository<ConfiguracionIglesia>
{
    Task<IEnumerable<ConfiguracionIglesia>> GetByIglesiaAsync(int iglesiaId);
    Task<IEnumerable<ConfiguracionIglesia>> GetByDenominacionAsync(int denominacionId);
}
