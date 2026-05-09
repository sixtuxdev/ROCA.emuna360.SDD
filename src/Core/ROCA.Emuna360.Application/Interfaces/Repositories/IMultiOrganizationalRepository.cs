using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Interfaces.Repositories;

public interface IMultiOrganizationalRepository<TEntity> : IBaseRepository<TEntity>
{
    Task<IEnumerable<TEntity>> GetAllAsync(int denominacionId);
    Task<TEntity?> GetByIdAsync(int id, int denominacionId);
    Task<bool> DeleteAsync(int id, int denominacionId);
}
