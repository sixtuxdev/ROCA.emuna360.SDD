using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Services.Geography;

namespace ROCA.Emuna360.API.Controllers.Geography;

[Route("api/v1/departamentos")]
public class DepartamentosController : GeographyBaseController<DepartamentoDto>
{
    public DepartamentosController(IDepartamentoService service) : base(service) { }

    [HttpGet("all/{id:int}")]
    public new Task<IActionResult> GetAll(int id)
    {
        return base.GetAll(id);
    }
}
