using ROCA.Emuna360.Domain.Entities.Registry;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Registry;
using ROCA.Emuna360.Application.Interfaces.Services.Registry;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.Application.Services.Registry;

public class RegistroService : MultiOrganizationalBaseService<RegistroDto, Registro>, IRegistroService
{
    private readonly IRegistroRepository _specificRepository;
    private readonly IIglesiaRepository _iglesiaRepository;

    public RegistroService(
        IRegistroRepository repository,
        IIglesiaRepository iglesiaRepository,
        IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
        _iglesiaRepository = iglesiaRepository;
    }

    public override async Task<Result<int>> CreateAsync(RegistroDto dto)
    {
        var validation = await ValidateIglesiaAsync(dto);
        if (validation.IsFailure)
            return Result<int>.Failure(validation.Error);

        return await base.CreateAsync(dto);
    }

    public override async Task<Result<bool>> UpdateAsync(RegistroDto dto)
    {
        var validation = await ValidateIglesiaAsync(dto);
        if (validation.IsFailure)
            return Result<bool>.Failure(validation.Error);

        return await base.UpdateAsync(dto);
    }

    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<RegistroDto>>> GetByIglesiaAsync(int iglesiaId, int denominacionId) 
    { 
        var entities = await _specificRepository.GetByIglesiaAsync(iglesiaId, denominacionId); 
        return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<RegistroDto>>.Success(_mapper.Map<IEnumerable<RegistroDto>>(entities)); 
    }

    private async Task<Result<bool>> ValidateIglesiaAsync(RegistroDto dto)
    {
        var denominacionId = dto.DenominacionId.GetValueOrDefault();
        if (denominacionId <= 0)
            return Result<bool>.Failure("La denominación es obligatoria.");

        if (dto.IglesiaId <= 0)
            return Result<bool>.Failure("La iglesia es obligatoria.");

        var iglesia = await _iglesiaRepository.GetByIdAsync(dto.IglesiaId, denominacionId);
        if (iglesia is null || iglesia.DenominacionId != denominacionId)
            return Result<bool>.Failure("La iglesia no pertenece a la denominación indicada.");

        return Result<bool>.Success(true);
    }
}

