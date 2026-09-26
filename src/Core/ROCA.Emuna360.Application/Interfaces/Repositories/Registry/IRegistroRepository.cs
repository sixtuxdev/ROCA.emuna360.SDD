using ROCA.Emuna360.Domain.Entities.Registry;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Registry;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Registry;

public interface IRegistroRepository : IMultiOrganizationalRepository<Registro>
{
    Task<IEnumerable<Registro>> GetByIglesiaAsync(int iglesiaId, int denominacionId);
    Task<IEnumerable<RegistroPendienteDto>> GetPendientesAsync(int denominacionId);
    Task<Domain.Common.Results.OperationResult<bool>> AprobarAsync(int registroId, int denominacionId);
}
