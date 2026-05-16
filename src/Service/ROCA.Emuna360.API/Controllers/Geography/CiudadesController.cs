using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.API.Common;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Services.Geography;

namespace ROCA.Emuna360.API.Controllers.Geography;

[Route("api/v1/ciudades")]
public class CiudadesController : GeographyBaseController<CiudadDto>
{
    public CiudadesController(ICiudadService service) : base(service) { }

    [HttpGet]
    public virtual async Task<IActionResult> GetAll(int DepartamentoId)
    {
        var result = await _service.GetAllAsync(DepartamentoId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}
