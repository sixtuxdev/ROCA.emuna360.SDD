using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/tipos-estructura")]
public class TiposEstructuraController : MultiOrganizationalBaseController<TipoEstructuraDto>
{
    public TiposEstructuraController(ITipoEstructuraService service) : base(service) 
    {
    }
}

