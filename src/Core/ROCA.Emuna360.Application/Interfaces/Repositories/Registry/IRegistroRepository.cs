using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Registry;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Registry;

public interface IRegistroRepository : IBaseRepository<RegistroDto>
{
    Task<IEnumerable<RegistroDto>> GetByIglesiaAsync(int iglesiaId);
}
