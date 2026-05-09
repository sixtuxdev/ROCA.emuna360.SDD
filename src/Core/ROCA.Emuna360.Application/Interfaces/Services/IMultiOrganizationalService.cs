using ROCA.Emuna360.Domain.Common.Results;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Interfaces.Services;

public interface IMultiOrganizationalService<TDto> : IBaseService<TDto>
{
    Task<Result<IEnumerable<TDto>>> GetAllAsync(int denominacionId);
    Task<Result<TDto>> GetByIdAsync(int id, int denominacionId);
    Task<Result<bool>> DeleteAsync(int id, int denominacionId);
}
