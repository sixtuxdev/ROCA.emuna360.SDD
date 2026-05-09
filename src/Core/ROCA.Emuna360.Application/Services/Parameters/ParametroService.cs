using ROCA.Emuna360.Domain.Entities.Parameters;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.Interfaces.Repositories.Parameters;
using ROCA.Emuna360.Application.Interfaces.Services.Parameters;

namespace ROCA.Emuna360.Application.Services.Parameters;

public class ParametroService : MultiOrganizationalBaseService<ParametroDto, Parametro>, IParametroService
{
    private readonly IParametroRepository _specificRepository;

    public ParametroService(IParametroRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<ParametroDto>>> GetByDenominacionAsync(int denominacionId) { var entities = await _specificRepository.GetByDenominacionAsync(denominacionId); return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<ParametroDto>>.Success(_mapper.Map<IEnumerable<ParametroDto>>(entities)); }
}

