using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.API.Controllers.Security;

[Route("api/v1/usuarios-iglesias")]
public class UsuariosIglesiasController : BaseController<UsuarioIglesiaDto>
{
    private readonly IUsuarioIglesiaService _usuarioIglesiaService;

    public UsuariosIglesiasController(IUsuarioIglesiaService service) : base(service)
    {
        _usuarioIglesiaService = service;
    }

    [HttpGet("es-admin-denominacion")]
    public async Task<ActionResult<Result<bool>>> EsAdminDenominacion([FromQuery] int denominacionId, [FromQuery] int usuarioId)
    {
        var result = await _usuarioIglesiaService.EsAdminDenominacionAsync(denominacionId, usuarioId);
        if (result.IsFailure) return BadRequest(result);

        return Ok(result);
    }
}
