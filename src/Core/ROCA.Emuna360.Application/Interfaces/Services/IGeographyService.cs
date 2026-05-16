using ROCA.Emuna360.Domain.Common.Results;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Interfaces.Services;

public interface IGeographyService<TDto> : IBaseService<TDto>
{
    Task<Result<IEnumerable<TDto>>> GetAllAsync();
    Task<Result<IEnumerable<TDto>>> GetAllAsync(int DepartamentoId);
    Task<Result<TDto>> GetByIdAsync(int id);
    Task<Result<bool>> DeleteAsync(int id);
}
