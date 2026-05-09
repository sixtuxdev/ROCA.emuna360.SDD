using ROCA.Emuna360.Application.DTOs.Parameters;

namespace ROCA.Emuna360.Application.Interfaces.Services.Parameters;

public interface IClaseService : IMultiOrganizationalService<ClaseDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<ClaseDto>>> GetByDenominacionAsync(int denominacionId);
}