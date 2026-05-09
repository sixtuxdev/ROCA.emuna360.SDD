using ROCA.Emuna360.Domain.Entities.Menus;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Repositories.Menus;
using ROCA.Emuna360.Application.Interfaces.Services.Menus;

namespace ROCA.Emuna360.Application.Services.Menus;

public class MenuUsuarioService : BaseService<MenuUsuarioDto, MenuUsuario>, IMenuUsuarioService
{
    private readonly IMenuUsuarioRepository _specificRepository;

    public MenuUsuarioService(IMenuUsuarioRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
    public async System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<MenuUsuarioDto>> GetByDenominacionAsync(int denominacionId) { var entities = await _specificRepository.GetByDenominacionAsync(denominacionId); return _mapper.Map<IEnumerable<MenuUsuarioDto>>(entities); }
}