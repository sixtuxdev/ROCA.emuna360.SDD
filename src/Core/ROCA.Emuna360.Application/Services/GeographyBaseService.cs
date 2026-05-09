using AutoMapper;
using ROCA.Emuna360.Application.Interfaces.Repositories;
using ROCA.Emuna360.Application.Interfaces.Services;
using ROCA.Emuna360.Domain.Common.Results;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Services;

public abstract class GeographyBaseService<TDto, TEntity> : BaseService<TDto, TEntity>, IGeographyService<TDto>
{
    protected readonly new IGeographyRepository<TEntity> _repository;

    protected GeographyBaseService(IGeographyRepository<TEntity> repository, IMapper mapper) 
        : base(repository, mapper)
    {
        _repository = repository;
    }

    public virtual async Task<Result<IEnumerable<TDto>>> GetAllAsync()
    {
        var entities = await _repository.GetAllAsync();
        return Result<IEnumerable<TDto>>.Success(_mapper.Map<IEnumerable<TDto>>(entities));
    }

    public virtual async Task<Result<TDto>> GetByIdAsync(int id)
    {
        var entity = await _repository.GetByIdAsync(id);
        if (entity == null) return Result<TDto>.Failure("Registro no encontrado.");
        return Result<TDto>.Success(_mapper.Map<TDto>(entity));
    }

    public virtual async Task<Result<bool>> DeleteAsync(int id)
    {
        var success = await _repository.DeleteAsync(id);
        return success ? Result<bool>.Success(true) : Result<bool>.Failure("No se pudo eliminar el registro.");
    }
}
