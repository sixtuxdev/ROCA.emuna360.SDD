using AutoMapper;
using ROCA.Emuna360.Application.Interfaces.Repositories;
using ROCA.Emuna360.Application.Interfaces.Services;
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

    public virtual async Task<IEnumerable<TDto>> GetAllAsync()
    {
        var entities = await _repository.GetAllAsync();
        return _mapper.Map<IEnumerable<TDto>>(entities);
    }

    public virtual async Task<TDto?> GetByIdAsync(int id)
    {
        var entity = await _repository.GetByIdAsync(id);
        return entity == null ? default : _mapper.Map<TDto>(entity);
    }

    public virtual async Task<int> CreateAsync(TDto dto)
    {
        var entity = _mapper.Map<TEntity>(dto);
        return await _repository.CreateAsync(entity);
    }

    public virtual async Task<bool> UpdateAsync(TDto dto)
    {
        var entity = _mapper.Map<TEntity>(dto);
        return await _repository.UpdateAsync(entity);
    }

    public virtual async Task<bool> DeleteAsync(int id)
    {
        return await _repository.DeleteAsync(id);
    }
}