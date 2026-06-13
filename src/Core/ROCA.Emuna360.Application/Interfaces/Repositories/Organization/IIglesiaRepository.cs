using ROCA.Emuna360.Domain.Entities.Organization;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Organization;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Organization;

public interface IIglesiaRepository : IMultiOrganizationalRepository<Iglesia>
{
    Task<IEnumerable<Iglesia>> GetByDenominacionAsync(int denominacionId);
    Task<IEnumerable<Iglesia>> GetAllPorUsuarioIdDenIdAsync(int usuarioId, int denominacionId);
}
