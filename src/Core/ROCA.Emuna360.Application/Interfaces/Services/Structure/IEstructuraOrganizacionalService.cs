using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Domain.Common.Results;

namespace ROCA.Emuna360.Application.Interfaces.Services.Structure;

public interface IEstructuraOrganizacionalService : IMultiOrganizationalService<EstructuraOrganizacionalDto>
{
    Task<Result<IEnumerable<EstructuraOrganizacionalDto>>> GetByDenominacionAsync(int denominacionId);
}