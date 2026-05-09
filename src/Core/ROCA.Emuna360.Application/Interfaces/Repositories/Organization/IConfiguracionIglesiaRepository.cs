using ROCA.Emuna360.Domain.Entities.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Organization;

public interface IConfiguracionIglesiaRepository : IMultiOrganizationalRepository<ConfiguracionIglesia>
{
    Task<IEnumerable<ConfiguracionIglesia>> GetByIglesiaAsync(int iglesiaId, int denominacionId);
    Task<IEnumerable<ConfiguracionIglesia>> GetByDenominacionAsync(int denominacionId);
}
