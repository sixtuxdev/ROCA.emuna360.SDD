using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Services.Structure;

public interface IIglesiaEstructuraService : IBaseService<IglesiaEstructuraDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<IglesiaEstructuraDto>> GetByIglesiaAsync(int iglesiaId);
}