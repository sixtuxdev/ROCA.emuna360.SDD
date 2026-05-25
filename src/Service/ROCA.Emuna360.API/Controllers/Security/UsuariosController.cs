using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using ROCA.Emuna360.Application.Services.Security;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.API.Controllers.Security;

[Route("api/v1/usuarios")]
public class UsuariosController : BaseController<UsuarioDto>
{
    private readonly IUsuarioService _usuarioService;

    public UsuariosController(IUsuarioService service) : base(service) 
    {
        _usuarioService = service;
    }

    [HttpGet("get-pastores")]
    public async Task<ActionResult<Result<IEnumerable<UsuarioPastorResponseDTO>>>> GetPastores([FromQuery] int denominacionId)
    {
        var result = await _usuarioService.GetPastores(denominacionId);
        if (result.IsFailure) return BadRequest(result);

        return Ok(result);
    }

}
