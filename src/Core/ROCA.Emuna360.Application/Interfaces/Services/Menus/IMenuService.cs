using ROCA.Emuna360.Application.DTOs.Menus;

namespace ROCA.Emuna360.Application.Interfaces.Services.Menus;

public interface IMenuService : IBaseService<MenuDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<MenuDto>>> GetByDenominacionAsync(int denominacionId);
}