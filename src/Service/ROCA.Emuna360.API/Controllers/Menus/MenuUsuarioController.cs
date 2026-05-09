using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Services.Menus;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Menus;

[Route("api/v1/menu-usuario")]
public class MenuUsuarioController : BaseController<MenuUsuarioDto>
{
    private readonly IMenuUsuarioService _menuUsuarioRepository;

    public MenuUsuarioController(IMenuUsuarioService service) : base(service) 
    {
        _menuUsuarioRepository = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _menuUsuarioRepository.GetByDenominacionAsync(denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

