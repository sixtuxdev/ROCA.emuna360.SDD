using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Repositories.Registry;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Registry;

[Route("api/v1/registros")]
public class RegistroController : BaseController<RegistroDto>
{
    private readonly IRegistroRepository _registroRepository;

    public RegistroController(IRegistroRepository repository) : base(repository) 
    {
        _registroRepository = repository;
    }

    [HttpGet("iglesia/{iglesiaId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId)
    {
        var result = await _registroRepository.GetByIglesiaAsync(iglesiaId);
        return this.ToOk(result);
    }
}
