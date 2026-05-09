using ROCA.Emuna360.Domain.Entities.Geography;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using ROCA.Emuna360.Application.Interfaces.Services.Geography;

namespace ROCA.Emuna360.Application.Services.Geography;

public class CorregimientoService : BaseService<CorregimientoDto, Corregimiento>, ICorregimientoService
{
    private readonly ICorregimientoRepository _specificRepository;

    public CorregimientoService(ICorregimientoRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
}