using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Services.Parameters;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Parameters;

[Route("api/v1/clases")]
public class ClaseController : MultiOrganizationalBaseController<ClaseDto>
{
    public ClaseController(IClaseService service) : base(service) 
    {
    }
}

