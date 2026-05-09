using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Organization;

[Route("api/v1/configuracion-iglesia")]
public class ConfiguracionIglesiaController : MultiOrganizationalBaseController<ConfiguracionIglesiaDto>
{
    private readonly IConfiguracionIglesiaService _configuracionIglesiaService;

    public ConfiguracionIglesiaController(IConfiguracionIglesiaService service) : base(service) 
    { 
        _configuracionIglesiaService = service;
    }

    [HttpGet("iglesia/{iglesiaId}/denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId, int denominacionId)
    {
        var result = await _configuracionIglesiaService.GetByIglesiaAsync(iglesiaId, denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

