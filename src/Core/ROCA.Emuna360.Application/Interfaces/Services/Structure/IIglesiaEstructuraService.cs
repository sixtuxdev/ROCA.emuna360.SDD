using ROCA.Emuna360.Application.DTOs.Structure;

namespace ROCA.Emuna360.Application.Interfaces.Services.Structure;

public interface IIglesiaEstructuraService : IMultiOrganizationalService<IglesiaEstructuraDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<IglesiaEstructuraDto>>> GetByIglesiaAsync(int iglesiaId, int denominacionId);
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<IglesiaEstructuraDto?>> GetCurrentByIglesiaAsync(int iglesiaId, int denominacionId);
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<bool>> UpsertByIglesiaAsync(IglesiaEstructuraDto dto);
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<bool>> DeleteByIglesiaAsync(int iglesiaId, int denominacionId);
}
