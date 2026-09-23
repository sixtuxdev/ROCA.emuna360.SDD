using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Services.Geography;
using ROCA.Emuna360.Application.Interfaces.Services.Parameters;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Parameters;

[Route("api/v1/parametros")]
public class ParametroController : MultiOrganizationalBaseController<ParametroDto>
{
    private readonly IParametroService _parametroService;
    private readonly IRolService _rolService;
    private readonly IPaisService _paisService;

    public ParametroController(
        IParametroService service,
        IRolService rolService,
        IPaisService paisService) : base(service)
    {
        _parametroService = service;
        _rolService = rolService;
        _paisService = paisService;
    }

    [HttpGet("clase/{claseId}/denominacion/{denominacionId}")]
    public async Task<IActionResult> GetParametrosByClase(int claseId, int denominacionId)
    {
        var result = await _parametroService.GetByClaseAsync(denominacionId, claseId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }

    [HttpGet("nombre-clase/{nombreClase}/denominacion/{denominacionId}")]
    public async Task<IActionResult> GetParametrosByNombreClase(string nombreClase, int denominacionId)
    {
        var result = await _parametroService.GetByNombreClaseAsync(denominacionId, nombreClase);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }

    [HttpGet("catalogos-registro/denominacion/{denominacionId:int}")]
    public async Task<IActionResult> GetCatalogosRegistro(int denominacionId)
    {
        if (denominacionId <= 0)
            return this.ToBadRequest("La denominación es obligatoria.");

        var tiposDocumentoTask = _parametroService.GetByNombreClaseAsync(denominacionId, "Tipos de Documentos");
        var sexosTask = _parametroService.GetByNombreClaseAsync(denominacionId, "Sexo");
        var interesesTask = _parametroService.GetByNombreClaseAsync(denominacionId, "Interés");
        var rolesTask = _rolService.GetAllAsync(denominacionId);
        var paisesTask = _paisService.GetAllAsync();

        await Task.WhenAll(
            tiposDocumentoTask,
            sexosTask,
            interesesTask,
            rolesTask,
            paisesTask);

        var tiposDocumentoResult = await tiposDocumentoTask;
        var sexosResult = await sexosTask;
        var interesesResult = await interesesTask;
        var rolesResult = await rolesTask;
        var paisesResult = await paisesTask;

        var errors = new[]
        {
            tiposDocumentoResult.Error,
            sexosResult.Error,
            interesesResult.Error,
            rolesResult.Error,
            paisesResult.Error
        }.Where(error => !string.IsNullOrWhiteSpace(error));

        if (errors.Any())
            return this.ToBadRequest(string.Join(" ", errors));

        var catalogos = new RegistroCatalogosDto
        {
            DenominacionId = denominacionId,
            TiposDocumento = (tiposDocumentoResult.Value ?? []).Where(item => item.Estado).OrderBy(item => item.Descripcion).ToList(),
            Sexos = (sexosResult.Value ?? []).Where(item => item.Estado).OrderBy(item => item.Descripcion).ToList(),
            Intereses = (interesesResult.Value ?? []).Where(item => item.Estado).OrderBy(item => item.Descripcion).ToList(),
            Roles = (rolesResult.Value ?? []).Where(item => item.Activo).OrderBy(item => item.Nombre).ToList(),
            Paises = (paisesResult.Value ?? []).Where(item => item.Estado).OrderBy(item => item.PaisNombre).ToList()
        };

        return this.ToOk(catalogos);
    }
}
