using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Parameters;

[Route("api/v1/clases")]
public class ClaseController : BaseController<ClaseDto>
{
    private readonly IClaseRepository _claseRepository;

    public ClaseController(IClaseRepository repository) : base(repository) 
    {
        _claseRepository = repository;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _claseRepository.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}
