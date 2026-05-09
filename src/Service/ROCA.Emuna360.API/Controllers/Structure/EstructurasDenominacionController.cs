using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/estructuras-denominacion")]
public class EstructurasDenominacionController : BaseController<EstructuraDenominacionDto>
{
    private readonly IEstructuraDenominacionService _estructuraService;

    public EstructurasDenominacionController(IEstructuraDenominacionService service) : base(service) 
    {
        _estructuraService = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _estructuraService.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }

    [HttpGet("iglesia/{iglesiaId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId)
    {
        var result = await _estructuraService.GetByIglesiaAsync(iglesiaId);
        return this.ToOk(result);
    }
}

