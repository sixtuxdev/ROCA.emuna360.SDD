using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.API.Common;
using ROCA.Emuna360.Application.Interfaces.Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.API.Controllers;

public abstract class MultiOrganizationalBaseController<TDto> : BaseController<TDto>
{
    protected readonly new IMultiOrganizationalService<TDto> _service;

    protected MultiOrganizationalBaseController(IMultiOrganizationalService<TDto> service) : base(service)
    {
        _service = service;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public virtual async Task<IActionResult> GetAll(int denominacionId)
    {
        var result = await _service.GetAllAsync(denominacionId);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }

    [HttpGet("{id}/denominacion/{denominacionId}")]
    public virtual async Task<IActionResult> GetById(int id, int denominacionId)
    {
        var result = await _service.GetByIdAsync(id, denominacionId);
        if (result.IsFailure) return this.ToNotFound();
        return this.ToOk(result.Value);
    }

    [HttpDelete("{id}/denominacion/{denominacionId}")]
    public virtual async Task<IActionResult> Delete(int id, int denominacionId)
    {
        var result = await _service.DeleteAsync(id, denominacionId);
        if (result.IsFailure) return this.ToNotFound();
        return this.ToOk(result.Value, "Deleted successfully");
    }
}
