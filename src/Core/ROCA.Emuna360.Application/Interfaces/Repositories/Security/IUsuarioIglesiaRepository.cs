using ROCA.Emuna360.Domain.Entities.Security;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Security;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Security;

public interface IUsuarioIglesiaRepository : IMultiOrganizationalRepository<UsuarioIglesia>
{
    Task<IEnumerable<UsuarioIglesia>> GetByIglesiaAsync(int iglesiaId, int denominacionId);
    Task<IEnumerable<UsuarioIglesia>> GetByDenominacionAsync(int denominacionId);
    Task<bool> EsAdminDenominacionAsync(int denominacionId, int usuarioId);
}
