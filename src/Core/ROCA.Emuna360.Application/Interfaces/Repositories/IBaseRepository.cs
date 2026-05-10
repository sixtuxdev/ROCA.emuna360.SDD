using ROCA.Emuna360.Domain.Common.Results;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Interfaces.Repositories;

public interface IBaseRepository<TEntity>
{
    Task<OperationResult<int>> CreateAsync(TEntity entity);
    Task<OperationResult<bool>> UpdateAsync(TEntity entity);
}
