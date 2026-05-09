using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Organization;

[Route("api/v1/iglesias")]
public class IglesiasController : BaseController<IglesiaDto>
{
    private readonly IIglesiaService _iglesiaService;

    public IglesiasController(IIglesiaService service) : base(service) 
    { 
        _iglesiaService = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _iglesiaService.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}

