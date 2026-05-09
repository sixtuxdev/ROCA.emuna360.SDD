using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Organization;

[Route("api/v1/configuracion-iglesia")]
public class ConfiguracionIglesiaController : BaseController<ConfiguracionIglesiaDto>
{
    private readonly IConfiguracionIglesiaService _configuracionIglesiaRepository;

    public ConfiguracionIglesiaController(IConfiguracionIglesiaService service) : base(service) 
    { 
        _configuracionIglesiaRepository = service;
    }

    [HttpGet("iglesia/{iglesiaId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId)
    {
        var result = await _configuracionIglesiaRepository.GetByIglesiaAsync(iglesiaId);
        return this.ToOk(result);
    }
}

