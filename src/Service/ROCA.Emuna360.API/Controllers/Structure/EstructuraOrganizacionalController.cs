using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/estructura-organizacional")]
public class EstructuraOrganizacionalController : MultiOrganizationalBaseController<EstructuraOrganizacionalDto>
{
    public EstructuraOrganizacionalController(IEstructuraOrganizacionalService service) : base(service) 
    {
    }
}

