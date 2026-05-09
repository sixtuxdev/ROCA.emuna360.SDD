using ROCA.Emuna360.Domain.Entities.Organization;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;

namespace ROCA.Emuna360.Application.Services.Organization;

public class DenominacionService : BaseService<DenominacionDto, Denominacion>, IDenominacionService
{
    private readonly IDenominacionRepository _specificRepository;

    public DenominacionService(IDenominacionRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
}
