using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/iglesias-estructuras")]
public class IglesiasEstructurasController : MultiOrganizationalBaseController<IglesiaEstructuraDto>
{
    private readonly IIglesiaEstructuraService _iglesiaEstructuraService;

    public IglesiasEstructurasController(IIglesiaEstructuraService service) : base(service) 
    {
        _iglesiaEstructuraService = service;
    }

    [HttpGet("iglesia/{iglesiaId}/denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId, int denominacionId)
    {
        var result = await _iglesiaEstructuraService.GetByIglesiaAsync(iglesiaId, denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }

    [HttpGet("iglesia/{iglesiaId}/denominacion/{denominacionId}/actual")]
    public async Task<IActionResult> GetCurrentByIglesia(int iglesiaId, int denominacionId)
    {
        var result = await _iglesiaEstructuraService.GetCurrentByIglesiaAsync(iglesiaId, denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }

    [HttpPut("iglesia/{iglesiaId}/denominacion/{denominacionId}")]
    public async Task<IActionResult> UpsertByIglesia(int iglesiaId, int denominacionId, [FromBody] IglesiaEstructuraDto dto)
    {
        dto.IglesiaId = iglesiaId;
        dto.DenominacionId = denominacionId;

        var result = await _iglesiaEstructuraService.UpsertByIglesiaAsync(dto);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value, "Updated successfully");
    }

    [HttpDelete("iglesia/{iglesiaId}/denominacion/{denominacionId}")]
    public async Task<IActionResult> DeleteByIglesia(int iglesiaId, int denominacionId)
    {
        var result = await _iglesiaEstructuraService.DeleteByIglesiaAsync(iglesiaId, denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value, "Deleted successfully");
    }
}

