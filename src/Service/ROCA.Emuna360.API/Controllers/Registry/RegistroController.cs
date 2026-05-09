using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Services.Registry;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Registry;

[Route("api/v1/registros")]
public class RegistroController : BaseController<RegistroDto>
{
    private readonly IRegistroService _registroService;

    public RegistroController(IRegistroService service) : base(service) 
    {
        _registroService = service;
    }

    [HttpGet("iglesia/{iglesiaId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId)
    {
        var result = await _registroService.GetByIglesiaAsync(iglesiaId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }
}

