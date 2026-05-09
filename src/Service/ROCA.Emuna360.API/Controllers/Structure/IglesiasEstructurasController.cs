using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/iglesias-estructuras")]
public class IglesiasEstructurasController : MultiOrganizationalBaseController<IglesiaEstructuraDto>
{
    private readonly IIglesiaEstructuraService _iglesiaEstructuraService;

    public IglesiasEstructurasController(IIglesiaEstructuraService service) : base(service) 
    {
        _iglesiaEstructuraService = service;
    }

    [HttpGet("iglesia/{iglesiaId}/denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId, int denominacionId)
    {
        var result = await _iglesiaEstructuraService.GetByIglesiaAsync(iglesiaId, denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

