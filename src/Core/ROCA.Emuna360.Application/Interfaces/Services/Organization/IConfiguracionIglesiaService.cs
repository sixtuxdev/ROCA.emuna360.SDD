using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Services.Organization;

public interface IConfiguracionIglesiaService : IMultiOrganizationalService<ConfiguracionIglesiaDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<ConfiguracionIglesiaDto>>> GetByIglesiaAsync(int iglesiaId, int denominacionId);
}