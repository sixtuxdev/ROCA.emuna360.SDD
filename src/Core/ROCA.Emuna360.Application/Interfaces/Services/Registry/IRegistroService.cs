using ROCA.Emuna360.Application.DTOs.Registry;

namespace ROCA.Emuna360.Application.Interfaces.Services.Registry;

public interface IRegistroService : IMultiOrganizationalService<RegistroDto>
{
    System.Threading.Tasks.Task<ROCA.Emuna360.Domain.Common.Results.Result<System.Collections.Generic.IEnumerable<RegistroDto>>> GetByIglesiaAsync(int iglesiaId, int denominacionId);
}