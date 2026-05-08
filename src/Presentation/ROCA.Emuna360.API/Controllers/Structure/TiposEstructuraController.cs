using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/tipos-estructura")]
public class TiposEstructuraController : BaseController<TipoEstructuraDto>
{
    private readonly ITipoEstructuraRepository _tipoEstructuraRepository;

    public TiposEstructuraController(ITipoEstructuraRepository repository) : base(repository) 
    {
        _tipoEstructuraRepository = repository;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _tipoEstructuraRepository.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}
