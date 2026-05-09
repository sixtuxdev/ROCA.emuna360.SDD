using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Services.Geography;

namespace ROCA.Emuna360.API.Controllers.Geography;

[Route("api/v1/paises")]
public class PaisesController : GeographyBaseController<PaisDto>
{
    public PaisesController(IPaisService service) : base(service) { }
}
