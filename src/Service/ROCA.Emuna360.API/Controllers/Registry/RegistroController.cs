using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.Common;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Services.Registry;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Registry;

[Authorize]
[Route("api/v1/registros")]
public class RegistroController : MultiOrganizationalBaseController<RegistroDto>
{
    private readonly IRegistroService _registroService;
    private readonly IAuthService _authService;

    public RegistroController(IRegistroService service, IAuthService authService) : base(service)
    {
        _registroService = service;
        _authService = authService;
    }

    [AllowAnonymous]
    public override Task<IActionResult> Create([FromBody] RegistroDto dto)
        => base.Create(dto);

    public override async Task<IActionResult> GetAll(int denominacionId)
    {
        var accessError = ValidateDenominacionAccess(denominacionId, out var authenticatedDenominacionId);
        if (accessError is not null)
            return accessError;

        return await base.GetAll(authenticatedDenominacionId);
    }

    public override async Task<IActionResult> GetById(int id, int denominacionId)
    {
        var accessError = ValidateDenominacionAccess(denominacionId, out var authenticatedDenominacionId);
        if (accessError is not null)
            return accessError;

        return await base.GetById(id, authenticatedDenominacionId);
    }

    public override async Task<IActionResult> Delete(int id, int denominacionId)
    {
        var accessError = ValidateDenominacionAccess(denominacionId, out var authenticatedDenominacionId);
        if (accessError is not null)
            return accessError;

        return await base.Delete(id, authenticatedDenominacionId);
    }

    public override async Task<IActionResult> Update(int id, [FromBody] RegistroDto dto)
    {
        if (id <= 0)
            return this.ToBadRequest("El registro es obligatorio.");

        if (dto is null)
            return this.ToBadRequest("Los datos del registro son obligatorios.");

        if (dto.RegistroId != 0 && dto.RegistroId != id)
            return this.ToBadRequest("El identificador de la ruta no coincide con el registro enviado.");

        var accessError = ValidateDenominacionAccess(
            dto.DenominacionId.GetValueOrDefault(),
            out var authenticatedDenominacionId);

        if (accessError is not null)
            return accessError;

        dto.RegistroId = id;
        dto.DenominacionId = authenticatedDenominacionId;

        return await base.Update(id, dto);
    }

    [HttpGet("iglesia/{iglesiaId}/denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId, int denominacionId)
    {
        var accessError = ValidateDenominacionAccess(denominacionId, out var authenticatedDenominacionId);
        if (accessError is not null)
            return accessError;

        var result = await _registroService.GetByIglesiaAsync(iglesiaId, authenticatedDenominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }

    [Authorize]
    [HttpGet("pendientes")]
    public async Task<IActionResult> GetPendientes()
    {
        if (!TryGetAuthenticatedUserContext(out var usuarioId, out var denominacionId))
            return this.ToUnauthorized("No fue posible determinar el usuario autenticado.");

        var authorization = await _authService.HasAnyRoleAsync(
            usuarioId,
            denominacionId,
            RegistroApprovalAccess.AllowedRoleIds);

        if (authorization.IsFailure)
            return this.ToBadRequest(authorization.Error);

        if (authorization.Value != true)
            return this.ToForbidden("No tiene permisos para consultar registros pendientes de aprobación.");

        var result = await _registroService.GetPendientesAsync(denominacionId);
        if (result.IsFailure)
            return this.ToBadRequest(result.Error);

        return this.ToOk(result.Value);
    }

    [Authorize]
    [HttpPatch("{registroId:int}/aprobar")]
    public async Task<IActionResult> Aprobar(int registroId)
    {
        if (!TryGetAuthenticatedUserContext(out var usuarioId, out var denominacionId))
            return this.ToUnauthorized("No fue posible determinar el usuario autenticado.");

        var authorization = await _authService.HasAnyRoleAsync(
            usuarioId,
            denominacionId,
            RegistroApprovalAccess.AllowedRoleIds);

        if (authorization.IsFailure)
            return this.ToBadRequest(authorization.Error);

        if (authorization.Value != true)
            return this.ToForbidden("No tiene permisos para aprobar registros.");

        var result = await _registroService.AprobarAsync(registroId, denominacionId);
        if (result.IsFailure)
            return this.ToBadRequest(result.Error);

        return this.ToOk(result.Value, "Registro aprobado correctamente.");
    }

    private bool TryGetAuthenticatedUserContext(out int usuarioId, out int denominacionId)
    {
        usuarioId = 0;
        denominacionId = 0;

        return User.Identity?.IsAuthenticated == true
            && int.TryParse(User.FindFirst("UsuarioId")?.Value, out usuarioId)
            && usuarioId > 0
            && int.TryParse(User.FindFirst("DenominacionId")?.Value, out denominacionId)
            && denominacionId > 0;
    }

    private IActionResult? ValidateDenominacionAccess(
        int requestedDenominacionId,
        out int authenticatedDenominacionId)
    {
        authenticatedDenominacionId = 0;

        if (!TryGetAuthenticatedUserContext(out _, out authenticatedDenominacionId))
            return this.ToUnauthorized("No fue posible determinar el usuario autenticado.");

        if (requestedDenominacionId != authenticatedDenominacionId)
            return this.ToForbidden("No tiene permisos para acceder a otra denominación.");

        return null;
    }
}

