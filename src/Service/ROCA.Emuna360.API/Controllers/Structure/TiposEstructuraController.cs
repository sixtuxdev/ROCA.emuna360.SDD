using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/tipos-estructura")]
public class TiposEstructuraController : BaseController<TipoEstructuraDto>
{
    private readonly ITipoEstructuraService _tipoEstructuraService;

    public TiposEstructuraController(ITipoEstructuraService service) : base(service) 
    {
        _tipoEstructuraService = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _tipoEstructuraService.GetByDenominacionAsync(denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

