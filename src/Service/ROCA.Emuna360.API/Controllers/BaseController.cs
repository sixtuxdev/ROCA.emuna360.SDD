using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.API.Common;
using ROCA.Emuna360.Application.Interfaces.Services;
using System.Threading.Tasks;

namespace ROCA.Emuna360.API.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public abstract class BaseController<TDto> : ControllerBase
{
    protected readonly IBaseService<TDto> _service;

    protected BaseController(IBaseService<TDto> service)
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

    [HttpGet("{id}")]
    public virtual async Task<IActionResult> GetById(int id)
    {
        var result = await _service.GetByIdAsync(id);
        if (result.IsFailure) return this.ToNotFound();
        return this.ToOk(result.Value);
    }

    [HttpPost]
    public virtual async Task<IActionResult> Create([FromBody] TDto dto)
    {
        var result = await _service.CreateAsync(dto);
        if (result.IsFailure) return BadRequest(new { error = result.Error });
        return this.ToOk(result.Value, "Created successfully");
    }

    [HttpPut("{id}")]
    public virtual async Task<IActionResult> Update(int id, [FromBody] TDto dto)
    {
        var result = await _service.UpdateAsync(dto);
        if (result.IsFailure) return this.ToNotFound();
        return this.ToOk(result.Value, "Updated successfully");
    }

    [HttpDelete("{id}")]
    public virtual async Task<IActionResult> Delete(int id)
    {
        var result = await _service.DeleteAsync(id);
        if (result.IsFailure) return this.ToNotFound();
        return this.ToOk(result.Value, "Deleted successfully");
    }
}