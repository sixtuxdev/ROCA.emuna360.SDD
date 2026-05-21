using ROCA.Emuna360.Domain.Entities.Security;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;
using ROCA.Emuna360.Application.Interfaces.Services.Security;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.Application.Services.Security;

public class UsuarioService : MultiOrganizationalBaseService<UsuarioDto, Usuario>, IUsuarioService
{
    private readonly IUsuarioRepository _specificRepository;
    private readonly IPasswordHasherService _passwordHasher;

    public UsuarioService(
        IUsuarioRepository repository,
        IMapper mapper,
        IPasswordHasherService passwordHasher) : base(repository, mapper)
    {
        _specificRepository = repository;
        _passwordHasher = passwordHasher;
    }

    public override async Task<Result<int>> CreateAsync(UsuarioDto dto)
    {
        if (string.IsNullOrWhiteSpace(dto.PasswordHash))
            return Result<int>.Failure("La contrasena es requerida.");

        dto.PasswordHash = EnsurePasswordHash(dto.PasswordHash);

        return await base.CreateAsync(dto);
    }

    public override async Task<Result<bool>> UpdateAsync(UsuarioDto dto)
    {
        if (!string.IsNullOrWhiteSpace(dto.PasswordHash))
            dto.PasswordHash = EnsurePasswordHash(dto.PasswordHash);

        return await base.UpdateAsync(dto);
    }

    private string EnsurePasswordHash(string password)
    {
        return IsBCryptHash(password)
            ? password
            : _passwordHasher.HashPassword(password);
    }

    private static bool IsBCryptHash(string password)
    {
        return password.StartsWith("$2a$") ||
               password.StartsWith("$2b$") ||
               password.StartsWith("$2x$") ||
               password.StartsWith("$2y$");
    }
}

