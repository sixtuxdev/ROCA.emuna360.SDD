using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/estructura-organizacional")]
public class EstructuraOrganizacionalController : BaseController<EstructuraOrganizacionalDto>
{
    private readonly IEstructuraOrganizacionalService _estructuraService;

    public EstructuraOrganizacionalController(IEstructuraOrganizacionalService service) : base(service) 
    {
        _estructuraService = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _estructuraService.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}

