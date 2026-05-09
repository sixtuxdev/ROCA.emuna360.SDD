using ROCA.Emuna360.Domain.Entities.Menus;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using ROCA.Emuna360.Application.Interfaces.Services.Menus;

namespace ROCA.Emuna360.Application.Services.Menus;

public class MenuService : MultiOrganizationalBaseService<MenuDto, Menu>, IMenuService
{
    private readonly IMenuRepository _specificRepository;

    public MenuService(IMenuRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
}

