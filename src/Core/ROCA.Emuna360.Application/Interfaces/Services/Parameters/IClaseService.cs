using ROCA.Emuna360.Application.DTOs.Parameters;

namespace ROCA.Emuna360.Application.Interfaces.Services.Parameters;

public interface IClaseService : IBaseService<ClaseDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<ClaseDto>> GetByDenominacionAsync(int denominacionId);
}