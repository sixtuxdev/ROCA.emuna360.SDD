using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Organization;

[Route("api/v1/iglesias")]
public class IglesiasController : MultiOrganizationalBaseController<IglesiaDto>
{
    private readonly IIglesiaService _iglesiaService;

    public IglesiasController(IIglesiaService service) : base(service) 
    {
        _iglesiaService = service;
    }

    [AllowAnonymous]
    [HttpGet("selector/denominacion/{denominacionId:int}")]
    public async Task<IActionResult> GetForSelector(int denominacionId)
    {
        var result = await _iglesiaService.GetForSelectorAsync(denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }

    [HttpGet("GetAllPorUsuarioIdDenId/{usuarioId}/{denominacionId}")]
    public async Task<IActionResult> GetAllPorUsuarioIdDenId(int usuarioId, int denominacionId)
    {
        var result = await _iglesiaService.GetAllPorUsuarioIdDenIdAsync(usuarioId, denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

