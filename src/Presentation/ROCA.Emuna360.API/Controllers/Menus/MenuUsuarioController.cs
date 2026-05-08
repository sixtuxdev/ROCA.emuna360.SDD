using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Menus;

[Route("api/v1/menu-usuario")]
public class MenuUsuarioController : BaseController<MenuUsuarioDto>
{
    private readonly IMenuUsuarioRepository _menuUsuarioRepository;

    public MenuUsuarioController(IMenuUsuarioRepository repository) : base(repository) 
    {
        _menuUsuarioRepository = repository;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _menuUsuarioRepository.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}
