using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Structure;

[Route("api/v1/iglesias-estructuras")]
public class IglesiasEstructurasController : BaseController<IglesiaEstructuraDto>
{
    private readonly IIglesiaEstructuraRepository _iglesiaEstructuraRepository;

    public IglesiasEstructurasController(IIglesiaEstructuraRepository repository) : base(repository) 
    {
        _iglesiaEstructuraRepository = repository;
    }

    [HttpGet("iglesia/{iglesiaId}")]
    public async Task<IActionResult> GetByIglesia(int iglesiaId)
    {
        var result = await _iglesiaEstructuraRepository.GetByIglesiaAsync(iglesiaId);
        return this.ToOk(result);
    }
}
