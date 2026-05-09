using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/estructuras-denominacion")]
public class EstructurasDenominacionController : MultiOrganizationalBaseController<EstructuraDenominacionDto>
{
    private readonly IEstructuraDenominacionService _estructuraService;

    public EstructurasDenominacionController(IEstructuraDenominacionService service) : base(service) 
    {
        _estructuraService = service;
    }

    [HttpGet("iglesia/{iglesiaId}/denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId, int denominacionId)
    {
        var result = await _estructuraService.GetByIglesiaAsync(iglesiaId, denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

