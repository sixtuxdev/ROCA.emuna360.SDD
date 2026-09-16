using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.Interfaces.Services.CompletarDatos;
using ROCA.Emuna360.Application.DTOs.Registry;
using System.Threading.Tasks;

namespace ROCA.Emuna360.API.Controllers.CompletarDatos;

[Route("api/v1/completar-datos")]
[ApiController]
public class CompletarDatosController : ControllerBase
{
    private readonly ICompletarDatosService _service;

    public CompletarDatosController(ICompletarDatosService service)
    {
        _service = service;
    }

    [HttpGet("registro/{registroId}")]
    public async Task<IActionResult> GetByRegistro(int registroId)
    {
        var item = await _service.GetByRegistroAsync(registroId);
        if (item is null) return NotFound();
        return Ok(item);
    }

    [HttpPost]
    public async Task<IActionResult> Create([FromBody] CompletarDatosDto model)
    {
        try
        {
            var id = await _service.CreateAsync(model);
            if (!id.HasValue) return BadRequest("No se pudo crear el registro.");
            model.CompletarDatosId = id.Value;
            return CreatedAtAction(nameof(GetByRegistro), new { registroId = model.RegistroId }, model);
        }
        catch (System.Exception ex)
        {
            // Dev: devolver mensaje para depuración
            return Problem(detail: ex.Message, statusCode: 500);
        }
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, [FromBody] CompletarDatosDto model)
    {
        try
        {
            var ok = await _service.UpdateAsync(id, model);
            if (!ok) return NotFound();
            return NoContent();
        }
        catch (System.Exception ex)
        {
            return Problem(detail: ex.Message, statusCode: 500);
        }
    }
}
