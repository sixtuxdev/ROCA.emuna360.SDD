using ROCA.Emuna360.Domain.Entities.Structure;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;

namespace ROCA.Emuna360.Application.Services.Structure;

public class IglesiaEstructuraService : BaseService<IglesiaEstructuraDto, IglesiaEstructura>, IIglesiaEstructuraService
{
    private readonly IIglesiaEstructuraRepository _specificRepository;

    public IglesiaEstructuraService(IIglesiaEstructuraRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<IglesiaEstructuraDto>>> GetByIglesiaAsync(int iglesiaId) { var entities = await _specificRepository.GetByIglesiaAsync(iglesiaId); return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<IglesiaEstructuraDto>>.Success(_mapper.Map<IEnumerable<IglesiaEstructuraDto>>(entities)); }
}
