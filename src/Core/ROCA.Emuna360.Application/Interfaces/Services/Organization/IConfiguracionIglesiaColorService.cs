using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Services.Organization;

public interface IConfiguracionIglesiaColorService : IBaseService<ConfiguracionIglesiaColorDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<ConfiguracionIglesiaColorDto>> GetByDenominacionAsync(int denominacionId);
}