using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Organization;

public interface IConfiguracionIglesiaColorRepository : IBaseRepository<ConfiguracionIglesiaColorDto>
{
    Task<IEnumerable<ConfiguracionIglesiaColorDto>> GetByDenominacionAsync(int denominacionId);
}
