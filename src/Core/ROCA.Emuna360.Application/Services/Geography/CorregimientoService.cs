using ROCA.Emuna360.Domain.Entities.Geography;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using ROCA.Emuna360.Application.Interfaces.Services.Geography;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.Application.Services.Geography;

public class CorregimientoService : GeographyBaseService<CorregimientoDto, Corregimiento>, ICorregimientoService
{
    private readonly ICorregimientoRepository _specificRepository;

    public CorregimientoService(ICorregimientoRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }

    public override async Task<Result<IEnumerable<CorregimientoDto>>> GetAllAsync(int id)
    {
        var entities = await _specificRepository.GetAllAsync(id);
        return Result<IEnumerable<CorregimientoDto>>.Success(_mapper.Map<IEnumerable<CorregimientoDto>>(entities));
    }
}
