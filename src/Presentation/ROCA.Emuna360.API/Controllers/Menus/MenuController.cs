using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Menus;

[Route("api/v1/menu")]
public class MenuController : BaseController<MenuDto>
{
    private readonly IMenuRepository _menuRepository;

    public MenuController(IMenuRepository repository) : base(repository) 
    {
        _menuRepository = repository;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _menuRepository.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}
