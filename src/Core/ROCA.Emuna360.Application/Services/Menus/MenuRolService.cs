using ROCA.Emuna360.Domain.Entities.Menus;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using ROCA.Emuna360.Application.Interfaces.Services.Menus;

namespace ROCA.Emuna360.Application.Services.Menus;

public class MenuRolService : MultiOrganizationalBaseService<MenuRolDto, MenuRol>, IMenuRolService
{
    private readonly IMenuRolRepository _specificRepository;

    public MenuRolService(IMenuRolRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<MenuRolDto>>> GetByDenominacionAsync(int denominacionId) { var entities = await _specificRepository.GetByDenominacionAsync(denominacionId); return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<MenuRolDto>>.Success(_mapper.Map<IEnumerable<MenuRolDto>>(entities)); }
}

