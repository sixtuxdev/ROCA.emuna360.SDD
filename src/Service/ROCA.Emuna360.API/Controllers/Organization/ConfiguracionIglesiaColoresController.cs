using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Organization;

[Route("api/v1/configuracion-iglesia-colores")]
public class ConfiguracionIglesiaColoresController : BaseController<ConfiguracionIglesiaColorDto>
{
    private readonly IConfiguracionIglesiaColorService _colorService;

    public ConfiguracionIglesiaColoresController(IConfiguracionIglesiaColorService service) : base(service) 
    { 
        _colorService = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _colorService.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}

