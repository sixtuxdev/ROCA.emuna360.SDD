using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;

namespace ROCA.Emuna360.API.Controllers.Geography;

[Route("api/v1/ciudades")]
public class CiudadesController : BaseController<CiudadDto>
{
    public CiudadesController(ICiudadRepository repository) : base(repository) { }
}
