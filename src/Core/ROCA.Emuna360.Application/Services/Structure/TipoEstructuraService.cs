using ROCA.Emuna360.Domain.Entities.Structure;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;

namespace ROCA.Emuna360.Application.Services.Structure;

public class TipoEstructuraService : MultiOrganizationalBaseService<TipoEstructuraDto, TipoEstructura>, ITipoEstructuraService
{
    private readonly ITipoEstructuraRepository _specificRepository;

    public TipoEstructuraService(ITipoEstructuraRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<TipoEstructuraDto>>> GetByDenominacionAsync(int denominacionId) { var entities = await _specificRepository.GetByDenominacionAsync(denominacionId); return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<TipoEstructuraDto>>.Success(_mapper.Map<IEnumerable<TipoEstructuraDto>>(entities)); }
}

