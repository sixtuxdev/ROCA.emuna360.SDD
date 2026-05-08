using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Organization;

[Route("api/v1/iglesias")]
public class IglesiasController : BaseController<IglesiaDto>
{
    private readonly IIglesiaRepository _iglesiaRepository;

    public IglesiasController(IIglesiaRepository repository) : base(repository) 
    { 
        _iglesiaRepository = repository;
    }

    [HttpGet("denominacion/{denominacionId}")]
    public async Task<IActionResult> GetByDenominacion(int denominacionId)
    {
        var result = await _iglesiaRepository.GetByDenominacionAsync(denominacionId);
        return this.ToOk(result);
    }
}
