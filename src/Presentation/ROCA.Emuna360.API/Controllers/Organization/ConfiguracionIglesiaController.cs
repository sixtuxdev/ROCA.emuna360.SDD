using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Organization;

[Route("api/v1/configuracion-iglesia")]
public class ConfiguracionIglesiaController : BaseController<ConfiguracionIglesiaDto>
{
    private readonly IConfiguracionIglesiaRepository _configuracionIglesiaRepository;

    public ConfiguracionIglesiaController(IConfiguracionIglesiaRepository repository) : base(repository) 
    { 
        _configuracionIglesiaRepository = repository;
    }

    [HttpGet("iglesia/{iglesiaId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId)
    {
        var result = await _configuracionIglesiaRepository.GetByIglesiaAsync(iglesiaId);
        return this.ToOk(result);
    }
}
