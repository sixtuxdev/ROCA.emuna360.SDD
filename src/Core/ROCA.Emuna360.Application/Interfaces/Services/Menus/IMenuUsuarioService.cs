using ROCA.Emuna360.Application.DTOs.Menus;

namespace ROCA.Emuna360.Application.Interfaces.Services.Menus;

public interface IMenuUsuarioService : IBaseService<MenuUsuarioDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<MenuUsuarioDto>> GetByDenominacionAsync(int denominacionId);
}