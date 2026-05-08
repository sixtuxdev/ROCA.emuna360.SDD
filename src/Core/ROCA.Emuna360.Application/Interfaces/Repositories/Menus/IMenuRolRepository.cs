using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Menus;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Menus;

public interface IMenuRolRepository : IBaseRepository<MenuRolDto>
{
    Task<IEnumerable<MenuRolDto>> GetByDenominacionAsync(int denominacionId);
}
