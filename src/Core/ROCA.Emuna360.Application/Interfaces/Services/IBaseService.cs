using ROCA.Emuna360.Domain.Common.Results;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Interfaces.Services;

public interface IBaseService<TDto>
{
    Task<Result<IEnumerable<TDto>>> GetAllAsync();
    Task<Result<TDto>> GetByIdAsync(int id);
    Task<Result<int>> CreateAsync(TDto dto);
    Task<Result<bool>> UpdateAsync(TDto dto);
    Task<Result<bool>> DeleteAsync(int id);
}
