using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;

namespace ROCA.Emuna360.API.Controllers.Organization;

[Route("api/v1/denominaciones")]
public class DenominacionesController : BaseController<DenominacionDto>
{
    public DenominacionesController(IDenominacionRepository repository) : base(repository) { }
}
