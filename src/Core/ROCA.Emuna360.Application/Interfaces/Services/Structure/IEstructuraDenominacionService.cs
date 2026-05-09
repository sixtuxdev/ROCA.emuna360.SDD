using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Services.Structure;

public interface IEstructuraDenominacionService : IBaseService<EstructuraDenominacionDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<EstructuraDenominacionDto>> GetByDenominacionAsync(int denominacionId);
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<EstructuraDenominacionDto>> GetByIglesiaAsync(int iglesiaId);
}