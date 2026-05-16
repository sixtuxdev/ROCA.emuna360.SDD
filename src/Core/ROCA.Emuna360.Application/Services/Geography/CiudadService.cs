using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.Interfaces.Repositories.Geography;
using ROCA.Emuna360.Application.Interfaces.Services.Geography;
using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Geography;

namespace ROCA.Emuna360.Application.Services.Geography;

public class CiudadService : GeographyBaseService<CiudadDto, Ciudad>, ICiudadService
{
    private readonly ICiudadRepository _specificRepository;

    public CiudadService(ICiudadRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }

    public override async Task<Result<IEnumerable<CiudadDto>>> GetAllAsync(int id)
    {
        var entities = await _specificRepository.GetAllAsync(id);
        return Result<IEnumerable<CiudadDto>>.Success(_mapper.Map<IEnumerable<CiudadDto>>(entities));
    }
}
