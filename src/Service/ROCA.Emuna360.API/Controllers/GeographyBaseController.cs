using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.API.Common;
using ROCA.Emuna360.Application.Interfaces.Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.API.Controllers;

public abstract class GeographyBaseController<TDto> : BaseController<TDto>
{
    protected readonly new IGeographyService<TDto> _service;

    protected GeographyBaseController(IGeographyService<TDto> service) : base(service)
    {
        _service = service;
    }

    [HttpGet]
    public virtual async Task<IActionResult> GetAll()
    {
        var result = await _service.GetAllAsync();
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }

    protected virtual async Task<IActionResult> GetAll(int id)
    {
        var result = await _service.GetAllAsync(id);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value);
    }

    [HttpGet("{id}")]
    public virtual async Task<IActionResult> GetById(int id)
    {
        var result = await _service.GetByIdAsync(id);
        if (result.IsFailure) return this.ToNotFound();
        return this.ToOk(result.Value);
    }

    [HttpDelete("{id}")]
    public virtual async Task<IActionResult> Delete(int id)
    {
        var result = await _service.DeleteAsync(id);
        if (result.IsFailure) return this.ToNotFound();
        return this.ToOk(result.Value, "Deleted successfully");
    }
}
