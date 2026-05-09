using ROCA.Emuna360.Domain.Entities.Organization;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;

namespace ROCA.Emuna360.Application.Services.Organization;

public class IglesiaService : MultiOrganizationalBaseService<IglesiaDto, Iglesia>, IIglesiaService
{
    private readonly IIglesiaRepository _specificRepository;

    public IglesiaService(IIglesiaRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<IglesiaDto>>> GetByDenominacionAsync(int denominacionId) { var entities = await _specificRepository.GetByDenominacionAsync(denominacionId); return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<IglesiaDto>>.Success(_mapper.Map<IEnumerable<IglesiaDto>>(entities)); }
}

