using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/estructura-organizacional")]
public class EstructuraOrganizacionalController : BaseController<EstructuraOrganizacionalDto>
{
    private readonly IEstructuraOrganizacionalRepository _estructuraRepository;

    public EstructuraOrganizacionalController(IEstructuraOrganizacionalRepository repository) : base(repository) 
    {
        _estructuraRepository = repository;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _estructuraRepository.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}
