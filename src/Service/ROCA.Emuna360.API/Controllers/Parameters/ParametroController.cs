using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Services.Parameters;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Parameters;

[Route("api/v1/parametros")]
public class ParametroController : BaseController<ParametroDto>
{
    private readonly IParametroService _parametroService;

    public ParametroController(IParametroService service) : base(service) 
    {
        _parametroService = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _parametroService.GetByDenominacionAsync(denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

