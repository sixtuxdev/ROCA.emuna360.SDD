using ROCA.Emuna360.Application.DTOs.Menus;

namespace ROCA.Emuna360.Application.Interfaces.Services.Menus;

public interface IMenuRolService : IMultiOrganizationalService<MenuRolDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<MenuRolDto>>> GetByDenominacionAsync(int denominacionId);
}