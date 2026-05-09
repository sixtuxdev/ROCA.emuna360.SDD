using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Services.Menus;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Menus;

[Route("api/v1/menu")]
public class MenuController : BaseController<MenuDto>
{
    private readonly IMenuService _menuService;

    public MenuController(IMenuService service) : base(service) 
    {
        _menuService = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _menuService.GetByDenominacionAsync(denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

