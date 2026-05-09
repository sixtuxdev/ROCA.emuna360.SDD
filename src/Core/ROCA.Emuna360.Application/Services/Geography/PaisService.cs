using ROCA.Emuna360.Domain.Entities.Geography;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using ROCA.Emuna360.Application.Interfaces.Services.Geography;

namespace ROCA.Emuna360.Application.Services.Geography;

public class PaisService : BaseService<PaisDto, Pais>, IPaisService
{
    private readonly IPaisRepository _specificRepository;

    public PaisService(IPaisRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
}
