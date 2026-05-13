using ROCA.Emuna360.Application.DTOs.Parameters;

namespace ROCA.Emuna360.Application.Interfaces.Services.Parameters;

public interface IParametroService : IMultiOrganizationalService<ParametroDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<ParametroDto>>> GetByDenominacionAsync(int denominacionId);
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<ParametroDto>>> GetByClaseAsync(int denominacionId, int claseId);
}
