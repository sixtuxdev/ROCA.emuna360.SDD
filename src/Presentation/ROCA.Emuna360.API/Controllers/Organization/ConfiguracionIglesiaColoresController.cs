using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Organization;

[Route("api/v1/configuracion-iglesia-colores")]
public class ConfiguracionIglesiaColoresController : BaseController<ConfiguracionIglesiaColorDto>
{
    private readonly IConfiguracionIglesiaColorRepository _colorRepository;

    public ConfiguracionIglesiaColoresController(IConfiguracionIglesiaColorRepository repository) : base(repository) 
    { 
        _colorRepository = repository;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _colorRepository.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}
