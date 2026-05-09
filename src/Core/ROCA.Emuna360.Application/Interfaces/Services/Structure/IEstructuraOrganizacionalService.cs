using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Services.Structure;

public interface IEstructuraOrganizacionalService : IBaseService<EstructuraOrganizacionalDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<EstructuraOrganizacionalDto>> GetByDenominacionAsync(int denominacionId);
}