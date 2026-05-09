using ROCA.Emuna360.Domain.Entities.Structure;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;

namespace ROCA.Emuna360.Application.Services.Structure;

public class EstructuraDenominacionService : BaseService<EstructuraDenominacionDto, EstructuraDenominacion>, IEstructuraDenominacionService
{
    private readonly IEstructuraDenominacionRepository _specificRepository;

    public EstructuraDenominacionService(IEstructuraDenominacionRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<EstructuraDenominacionDto>>> GetByDenominacionAsync(int denominacionId) { var entities = await _specificRepository.GetByDenominacionAsync(denominacionId); return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<EstructuraDenominacionDto>>.Success(_mapper.Map<IEnumerable<EstructuraDenominacionDto>>(entities)); }
    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<EstructuraDenominacionDto>>> GetByIglesiaAsync(int iglesiaId) { var entities = await _specificRepository.GetByIglesiaAsync(iglesiaId); return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<EstructuraDenominacionDto>>.Success(_mapper.Map<IEnumerable<EstructuraDenominacionDto>>(entities)); }
}
