using ROCA.Emuna360.Domain.Entities.Menus;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using ROCA.Emuna360.Application.Interfaces.Services.Menus;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.Application.Services.Menus;

public class MenuRolService : MultiOrganizationalBaseService<MenuRolDto, MenuRol>, IMenuRolService
{
    private readonly IMenuRolRepository _specificRepository;

    public MenuRolService(IMenuRolRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async Task<Result<IEnumerable<MenuRolDto>>> GetByDenominacionAsync(int denominacionId) 
    { 
        var entities = await _specificRepository.GetByDenominacionAsync(denominacionId); 
        return Result<IEnumerable<MenuRolDto>>.Success(_mapper.Map<IEnumerable<MenuRolDto>>(entities));
    }
}
