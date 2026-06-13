using ROCA.Emuna360.Domain.Entities.Organization;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Organization;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Organization;
using ROCA.Emuna360.Domain.Common.Results;
using ROCA.Emuna360.Domain.Entities.Structure;

namespace ROCA.Emuna360.Application.Services.Organization;

public class IglesiaService : MultiOrganizationalBaseService<IglesiaDto, Iglesia>, IIglesiaService
{
    private readonly IIglesiaRepository _specificRepository;
    private readonly IIglesiaEstructuraRepository _iglesiaEstructuraRepository;
    private readonly IEstructuraOrganizacionalRepository _estructuraOrganizacionalRepository;

    public IglesiaService(
        IIglesiaRepository repository,
        IIglesiaEstructuraRepository iglesiaEstructuraRepository,
        IEstructuraOrganizacionalRepository estructuraOrganizacionalRepository,
        IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
        _iglesiaEstructuraRepository = iglesiaEstructuraRepository;
        _estructuraOrganizacionalRepository = estructuraOrganizacionalRepository;
    }

    public override async Task<Result<IEnumerable<IglesiaDto>>> GetAllAsync(int denominacionId)
    {
        var entities = await _specificRepository.GetAllAsync(denominacionId);
        var dtos = _mapper.Map<IEnumerable<IglesiaDto>>(entities).ToList();
        await PopulateEstructurasAsync(dtos, denominacionId);
        return Result<IEnumerable<IglesiaDto>>.Success(dtos);
    }

    public override async Task<Result<IglesiaDto>> GetByIdAsync(int id, int denominacionId)
    {
        var entity = await _specificRepository.GetByIdAsync(id, denominacionId);
        if (entity == null)
            return Result<IglesiaDto>.Failure("Registro no encontrado.");

        var dto = _mapper.Map<IglesiaDto>(entity);
        await PopulateEstructuraAsync(dto, denominacionId);
        return Result<IglesiaDto>.Success(dto);
    }

    public async Task<Result<System.Collections.Generic.IEnumerable<IglesiaDto>>> GetByDenominacionAsync(int denominacionId)
    {
        var entities = await _specificRepository.GetByDenominacionAsync(denominacionId);
        var dtos = _mapper.Map<IEnumerable<IglesiaDto>>(entities).ToList();
        await PopulateEstructurasAsync(dtos, denominacionId);
        return Result<System.Collections.Generic.IEnumerable<IglesiaDto>>.Success(dtos);
    }

    public async Task<Result<System.Collections.Generic.IEnumerable<IglesiaDto>>> GetAllPorUsuarioIdDenIdAsync(int usuarioId, int denominacionId)
    {
        var entities = await _specificRepository.GetAllPorUsuarioIdDenIdAsync(usuarioId, denominacionId);
        var dtos = _mapper.Map<IEnumerable<IglesiaDto>>(entities).ToList();
        return Result<System.Collections.Generic.IEnumerable<IglesiaDto>>.Success(dtos);
    }

    public override async Task<Result<int>> CreateAsync(IglesiaDto dto)
    {
        var validation = ValidatePastorResponsable(dto);
        if (validation.IsFailure)
            return Result<int>.Failure(validation.Error);

        var entity = _mapper.Map<Iglesia>(dto);
        var result = await _specificRepository.CreateAsync(entity);

        if (!result.Success)
            return Result<int>.Failure(result.Message);

        dto.IglesiaId = result.Data;
        var relationResult = await SaveEstructuraRelationAsync(dto);
        if (relationResult.IsFailure)
            return Result<int>.Failure(relationResult.Error);

        return Result<int>.Success(result.Data);
    }

    public override async Task<Result<bool>> UpdateAsync(IglesiaDto dto)
    {
        var validation = ValidatePastorResponsable(dto);
        if (validation.IsFailure)
            return Result<bool>.Failure(validation.Error);

        var entity = _mapper.Map<Iglesia>(dto);
        var result = await _specificRepository.UpdateAsync(entity);

        if (!result.Success)
            return Result<bool>.Failure(result.Message);

        var relationResult = await SaveEstructuraRelationAsync(dto);
        if (relationResult.IsFailure)
            return Result<bool>.Failure(relationResult.Error);

        return Result<bool>.Success(result.Data);
    }

    private async Task PopulateEstructurasAsync(IReadOnlyList<IglesiaDto> iglesias, int denominacionId)
    {
        foreach (var iglesia in iglesias)
        {
            await PopulateEstructuraAsync(iglesia, denominacionId);
        }
    }

    private async Task PopulateEstructuraAsync(IglesiaDto iglesia, int denominacionId)
    {
        var relation = await _iglesiaEstructuraRepository.GetCurrentByIglesiaAsync(iglesia.IglesiaId, denominacionId);
        if (relation is null)
        {
            iglesia.EstructuraOrg = null;
            return;
        }

        var estructura = await _estructuraOrganizacionalRepository.GetByIdAsync(relation.EstructuraId, denominacionId);
        iglesia.EstructuraOrg = _mapper.Map<ROCA.Emuna360.Application.DTOs.Structure.EstructuraOrganizacionalDto?>(estructura);
    }

    private async Task<Result<bool>> SaveEstructuraRelationAsync(IglesiaDto iglesia)
    {
        if (iglesia.IglesiaId <= 0 || iglesia.DenominacionId <= 0)
            return Result<bool>.Success(true);

        var estructuraId = iglesia.EstructuraOrg?.EstructuraOrganizacionalId ?? 0;
        if (estructuraId <= 0)
        {
            await _iglesiaEstructuraRepository.DeleteByIglesiaAsync(iglesia.IglesiaId, iglesia.DenominacionId);
            return Result<bool>.Success(true);
        }

        var relation = new IglesiaEstructura
        {
            IglesiaId = iglesia.IglesiaId,
            DenominacionId = iglesia.DenominacionId,
            EstructuraId = estructuraId,
            FechaAsignacion = DateTime.UtcNow
        };

        var result = await _iglesiaEstructuraRepository.UpsertByIglesiaAsync(relation);
        return result.Success
            ? Result<bool>.Success(true)
            : Result<bool>.Failure(result.Message);
    }

    private static Result<bool> ValidatePastorResponsable(IglesiaDto iglesia)
    {
        return iglesia.PastorResponsableRegistroId.HasValue && iglesia.PastorResponsableRegistroId.Value > 0
            ? Result<bool>.Success(true)
            : Result<bool>.Failure("El pastor responsable es obligatorio.");
    }
}

