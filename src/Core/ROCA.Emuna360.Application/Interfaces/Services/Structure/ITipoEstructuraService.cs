using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Services.Structure;

public interface ITipoEstructuraService : IMultiOrganizationalService<TipoEstructuraDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<TipoEstructuraDto>>> GetByDenominacionAsync(int denominacionId);
}