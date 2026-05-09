using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Services.Organization;

public interface IIglesiaService : IBaseService<IglesiaDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<IglesiaDto>>> GetByDenominacionAsync(int denominacionId);
}