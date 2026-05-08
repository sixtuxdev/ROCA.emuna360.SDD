using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Interfaces.Repositories;

public interface IBaseRepository<TDto>
{
    Task<IEnumerable<TDto>> GetAllAsync();
    Task<TDto?> GetByIdAsync(int id);
    Task<int> CreateAsync(TDto dto);
    Task<bool> UpdateAsync(TDto dto);
    Task<bool> DeleteAsync(int id);
}
