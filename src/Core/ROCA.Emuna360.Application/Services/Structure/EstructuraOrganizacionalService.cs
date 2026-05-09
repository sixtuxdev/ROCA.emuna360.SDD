using ROCA.Emuna360.Domain.Entities.Structure;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;

namespace ROCA.Emuna360.Application.Services.Structure;

public class EstructuraOrganizacionalService : BaseService<EstructuraOrganizacionalDto, EstructuraOrganizacional>, IEstructuraOrganizacionalService
{
    private readonly IEstructuraOrganizacionalRepository _specificRepository;

    public EstructuraOrganizacionalService(IEstructuraOrganizacionalRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<EstructuraOrganizacionalDto>>> GetByDenominacionAsync(int denominacionId) { var entities = await _specificRepository.GetByDenominacionAsync(denominacionId); return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<EstructuraOrganizacionalDto>>.Success(_mapper.Map<IEnumerable<EstructuraOrganizacionalDto>>(entities)); }
}
