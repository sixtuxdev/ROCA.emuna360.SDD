using ROCA.Emuna360.Domain.Entities.Menus;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Menus;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Menus;

public interface IMenuRepository : IMultiOrganizationalRepository<Menu>
{
}
