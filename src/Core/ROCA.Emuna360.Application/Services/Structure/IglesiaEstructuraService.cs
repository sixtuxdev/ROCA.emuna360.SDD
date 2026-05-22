using ROCA.Emuna360.Domain.Entities.Structure;
using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Application.Interfaces.Repositories.Structure;
using ROCA.Emuna360.Application.Interfaces.Services.Structure;

namespace ROCA.Emuna360.Application.Services.Structure;

public class IglesiaEstructuraService : MultiOrganizationalBaseService<IglesiaEstructuraDto, IglesiaEstructura>, IIglesiaEstructuraService
{
    private readonly IIglesiaEstructuraRepository _specificRepository;

    public IglesiaEstructuraService(IIglesiaEstructuraRepository repository, IMapper mapper) : base(repository, mapper)
    {
        _specificRepository = repository;
    }

    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<IglesiaEstructuraDto>>> GetByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        var entities = await _specificRepository.GetByIglesiaAsync(iglesiaId, denominacionId);
        return ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<IglesiaEstructuraDto>>.Success(_mapper.Map<IEnumerable<IglesiaEstructuraDto>>(entities));
    }

    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<IglesiaEstructuraDto?>> GetCurrentByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        var entity = await _specificRepository.GetCurrentByIglesiaAsync(iglesiaId, denominacionId);
        return ROCA.Emuna360.Domain.Common.Results.Result<IglesiaEstructuraDto?>.Success(_mapper.Map<IglesiaEstructuraDto?>(entity));
    }

    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<bool>> UpsertByIglesiaAsync(IglesiaEstructuraDto dto)
    {
        var entity = _mapper.Map<IglesiaEstructura>(dto);
        if (entity.FechaAsignacion == default)
            entity.FechaAsignacion = DateTime.UtcNow;

        var result = await _specificRepository.UpsertByIglesiaAsync(entity);
        return result.Success
            ? ROCA.Emuna360.Domain.Common.Results.Result<bool>.Success(result.Data)
            : ROCA.Emuna360.Domain.Common.Results.Result<bool>.Failure(result.Message);
    }

    public async System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<bool>> DeleteByIglesiaAsync(int iglesiaId, int denominacionId)
    {
        var deleted = await _specificRepository.DeleteByIglesiaAsync(iglesiaId, denominacionId);
        return ROCA.Emuna360.Domain.Common.Results.Result<bool>.Success(deleted);
    }
}

