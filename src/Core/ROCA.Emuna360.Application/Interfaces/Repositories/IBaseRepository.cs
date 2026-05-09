using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Interfaces.Repositories;

public interface IBaseRepository<TEntity>
{
    Task<int> CreateAsync(TEntity entity);
    Task<bool> UpdateAsync(TEntity entity);
}
