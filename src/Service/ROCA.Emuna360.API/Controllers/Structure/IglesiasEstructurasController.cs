using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/iglesias-estructuras")]
public class IglesiasEstructurasController : BaseController<IglesiaEstructuraDto>
{
    private readonly IIglesiaEstructuraService _iglesiaEstructuraRepository;

    public IglesiasEstructurasController(IIglesiaEstructuraService service) : base(service) 
    {
        _iglesiaEstructuraRepository = service;
    }

    [HttpGet("iglesia/{iglesiaId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId)
    {
        var result = await _iglesiaEstructuraRepository.GetByIglesiaAsync(iglesiaId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

