using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Services.Structure;

public interface ITipoEstructuraService : IBaseService<TipoEstructuraDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<TipoEstructuraDto>> GetByDenominacionAsync(int denominacionId);
}