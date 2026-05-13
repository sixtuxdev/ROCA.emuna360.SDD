using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Services.Parameters;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Parameters;

[Route("api/v1/parametros")]
public class ParametroController : MultiOrganizationalBaseController<ParametroDto>
{
    private readonly IParametroService _parametroService;

    public ParametroController(IParametroService service) : base(service) 
    {
        _parametroService = service;
    }

    [HttpGet("clase/{claseId}/denominacion/{denominacionId}")]
    public async Task<IActionResult> GetParametrosByClase(int claseId, int denominacionId)
    {
        var result = await _parametroService.GetByClaseAsync(denominacionId, claseId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}
