using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Services.Organization;

public interface IConfiguracionIglesiaColorService : IMultiOrganizationalService<ConfiguracionIglesiaColorDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<ConfiguracionIglesiaColorDto>>> GetByDenominacionAsync(int denominacionId);
}