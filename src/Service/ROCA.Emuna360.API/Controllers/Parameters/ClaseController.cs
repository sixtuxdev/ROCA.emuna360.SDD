using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Services.Parameters;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Parameters;

[Route("api/v1/clases")]
public class ClaseController : BaseController<ClaseDto>
{
    private readonly IClaseService _claseService;

    public ClaseController(IClaseService service) : base(service) 
    {
        _claseService = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _claseService.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}

