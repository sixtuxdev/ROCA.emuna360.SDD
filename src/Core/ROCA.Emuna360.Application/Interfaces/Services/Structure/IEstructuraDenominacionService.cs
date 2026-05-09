using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Services.Structure;

public interface IEstructuraDenominacionService : IMultiOrganizationalService<EstructuraDenominacionDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<EstructuraDenominacionDto>>> GetByDenominacionAsync(int denominacionId);
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<EstructuraDenominacionDto>>> GetByIglesiaAsync(int iglesiaId, int denominacionId);
}