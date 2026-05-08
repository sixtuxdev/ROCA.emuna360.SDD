using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Organization;

public interface IConfiguracionIglesiaRepository : IBaseRepository<ConfiguracionIglesiaDto>
{
    Task<IEnumerable<ConfiguracionIglesiaDto>> GetByIglesiaAsync(int iglesiaId);
    Task<IEnumerable<ConfiguracionIglesiaDto>> GetByDenominacionAsync(int denominacionId);
}
