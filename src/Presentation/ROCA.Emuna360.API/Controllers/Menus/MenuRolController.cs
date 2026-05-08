using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Menus;

[Route("api/v1/menu-rol")]
public class MenuRolController : BaseController<MenuRolDto>
{
    private readonly IMenuRolRepository _menuRolRepository;

    public MenuRolController(IMenuRolRepository repository) : base(repository) 
    {
        _menuRolRepository = repository;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _menuRolRepository.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}
