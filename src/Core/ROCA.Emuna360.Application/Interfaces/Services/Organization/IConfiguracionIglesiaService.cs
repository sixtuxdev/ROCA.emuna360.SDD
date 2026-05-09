using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Services.Organization;

public interface IConfiguracionIglesiaService : IBaseService<ConfiguracionIglesiaDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<ConfiguracionIglesiaDto>> GetByIglesiaAsync(int iglesiaId);
}