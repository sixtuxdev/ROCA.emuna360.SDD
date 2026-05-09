using ROCA.Emuna360.Application.DTOs.Parameters;

namespace ROCA.Emuna360.Application.Interfaces.Services.Parameters;

public interface IParametroService : IBaseService<ParametroDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<ParametroDto>> GetByDenominacionAsync(int denominacionId);
}