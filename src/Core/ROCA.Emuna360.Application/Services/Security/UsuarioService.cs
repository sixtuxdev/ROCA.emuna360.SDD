using ROCA.Emuna360.Domain.Entities.Security;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using ROCA.Emuna360.Application.Interfaces.Services.Security;

namespace ROCA.Emuna360.Application.Services.Security;

public class UsuarioService : MultiOrganizationalBaseService<UsuarioDto, Usuario>, IUsuarioService
{
    private readonly IUsuarioRepository _specificRepository;

    public UsuarioService(IUsuarioRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
}

