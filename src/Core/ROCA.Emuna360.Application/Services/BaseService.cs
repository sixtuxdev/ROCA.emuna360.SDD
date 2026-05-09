using AutoMapper;
using ROCA.Emuna360.Application.Interfaces.Repositories;
using ROCA.Emuna360.Application.Interfaces.Services;
using ROCA.Emuna360.Domain.Common.Results;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Services;

public abstract class BaseService<TDto, TEntity> : IBaseService<TDto>
{
    protected readonly IBaseRepository<TEntity> _repository;
    protected readonly IMapper _mapper;

    protected BaseService(IBaseRepository<TEntity> repository, IMapper mapper)
    {
        _repository = repository;
        _mapper = mapper;
    }

    public virtual async Task<Result<int>> CreateAsync(TDto dto)
    {
        var entity = _mapper.Map<TEntity>(dto);
        var id = await _repository.CreateAsync(entity);
        return Result<int>.Success(id);
    }

    public virtual async Task<Result<bool>> UpdateAsync(TDto dto)
    {
        var entity = _mapper.Map<TEntity>(dto);
        var success = await _repository.UpdateAsync(entity);
        return success ? Result<bool>.Success(true) : Result<bool>.Failure("No se pudo actualizar el registro.");
    }
}