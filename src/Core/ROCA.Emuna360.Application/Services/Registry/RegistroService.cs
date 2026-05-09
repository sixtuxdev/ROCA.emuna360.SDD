using ROCA.Emuna360.Domain.Entities.Registry;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Repositories.Registry;
using ROCA.Emuna360.Application.Interfaces.Services.Registry;

namespace ROCA.Emuna360.Application.Services.Registry;

public class RegistroService : MultiOrganizationalBaseService<RegistroDto, Registro>, IRegistroService
{
    private readonly IRegistroRepository _specificRepository;

    public RegistroService(IRegistroRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<RegistroDto>>> GetByIglesiaAsync(int iglesiaId, int denominacionId) 
    { 
        var entities = await _specificRepository.GetByIglesiaAsync(iglesiaId, denominacionId); 
        return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<RegistroDto>>.Success(_mapper.Map<IEnumerable<RegistroDto>>(entities)); 
    }
}

