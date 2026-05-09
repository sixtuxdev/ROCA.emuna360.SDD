using ROCA.Emuna360.Application.DTOs.Menus;

namespace ROCA.Emuna360.Application.Interfaces.Services.Menus;

public interface IMenuService : IBaseService<MenuDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<MenuDto>> GetByDenominacionAsync(int denominacionId);
}