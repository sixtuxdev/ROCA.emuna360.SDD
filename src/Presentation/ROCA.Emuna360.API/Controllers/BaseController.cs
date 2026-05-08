using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.API.Common;
using ROCA.Emuna360.Application.Interfaces.Repositories;
using System.Threading.Tasks;

namespace ROCA.Emuna360.API.Controllers;

[ApiController]
[Route("api/v1/[controller]")]
public abstract class BaseController<TDto> : ControllerBase
{
    protected readonly IBaseRepository<TDto> _repository;

    protected BaseController(IBaseRepository<TDto> repository)
    {
        _repository = repository;
    }

    [HttpGet]
    public virtual async Task<IActionResult> GetAll()
    {
        var result = await _repository.GetAllAsync();
        return this.ToOk(result);
    }

    [HttpGet("{id}")]
    public virtual async Task<IActionResult> GetById(int id)
    {
        var result = await _repository.GetByIdAsync(id);
        if (result == null) return this.ToNotFound();
        return this.ToOk(result);
    }

    [HttpPost]
    public virtual async Task<IActionResult> Create([FromBody] TDto dto)
    {
        var id = await _repository.CreateAsync(dto);
        return this.ToOk(id, "Created successfully");
    }

    [HttpPut("{id}")]
    public virtual async Task<IActionResult> Update(int id, [FromBody] TDto dto)
    {
        var result = await _repository.UpdateAsync(dto);
        if (!result) return this.ToNotFound();
        return this.ToOk(result, "Updated successfully");
    }

    [HttpDelete("{id}")]
    public virtual async Task<IActionResult> Delete(int id)
    {
        var result = await _repository.DeleteAsync(id);
        if (!result) return this.ToNotFound();
        return this.ToOk(result, "Deleted successfully");
    }
}
