using ROCA.Emuna360.Domain.Entities.Security;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.Application.Services.Security;

public class UsuarioIglesiaService : MultiOrganizationalBaseService<UsuarioIglesiaDto, UsuarioIglesia>, IUsuarioIglesiaService
{
    private readonly IUsuarioIglesiaRepository _specificRepository;

    public UsuarioIglesiaService(IUsuarioIglesiaRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }

    public async Task<Result<bool>> EsAdminDenominacionAsync(int denominacionId, int usuarioId)
    {
        if (denominacionId <= 0)
            return Result<bool>.Failure("La denominación es requerida.");

        if (usuarioId <= 0)
            return Result<bool>.Failure("El usuario es requerido.");

        var esAdminDenominacion = await _specificRepository.EsAdminDenominacionAsync(denominacionId, usuarioId);
        return Result<bool>.Success(esAdminDenominacion);
    }
}
