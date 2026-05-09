using ROCA.Emuna360.Domain.Entities.Organization;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;

namespace ROCA.Emuna360.Application.Services.Organization;

public class ConfiguracionIglesiaService : BaseService<ConfiguracionIglesiaDto, ConfiguracionIglesia>, IConfiguracionIglesiaService
{
    private readonly IConfiguracionIglesiaRepository _specificRepository;

    public ConfiguracionIglesiaService(IConfiguracionIglesiaRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<ConfiguracionIglesiaDto>> GetByIglesiaAsync(int iglesiaId) { var entities = await _specificRepository.GetByIglesiaAsync(iglesiaId); return _mapper.Map<IEnumerable<ConfiguracionIglesiaDto>>(entities); }
}