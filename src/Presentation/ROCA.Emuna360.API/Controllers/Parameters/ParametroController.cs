using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Parameters;

[Route("api/v1/parametros")]
public class ParametroController : BaseController<ParametroDto>
{
    private readonly IParametroRepository _parametroRepository;

    public ParametroController(IParametroRepository repository) : base(repository) 
    {
        _parametroRepository = repository;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _parametroRepository.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}
