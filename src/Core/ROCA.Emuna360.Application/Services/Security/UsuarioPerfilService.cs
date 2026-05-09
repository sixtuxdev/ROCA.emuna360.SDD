using ROCA.Emuna360.Domain.Entities.Security;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using ROCA.Emuna360.Application.Interfaces.Services.Security;

namespace ROCA.Emuna360.Application.Services.Security;

public class UsuarioPerfilService : MultiOrganizationalBaseService<UsuarioPerfilDto, UsuarioPerfil>, IUsuarioPerfilService
{
    private readonly IUsuarioPerfilRepository _specificRepository;

    public UsuarioPerfilService(IUsuarioPerfilRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }
}

