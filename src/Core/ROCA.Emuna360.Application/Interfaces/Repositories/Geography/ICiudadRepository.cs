using ROCA.Emuna360.Domain.Entities.Geography;
using System.Collections.Generic;
using System.Threading.Tasks;
using ROCA.Emuna360.Application.DTOs.Geography;

namespace ROCA.Emuna360.Application.Interfaces.Repositories.Geography;

public interface ICiudadRepository : IGeographyRepository<Ciudad>
{
    public Task<IEnumerable<Ciudad>> GetAllAsync(int DepartamentoId);
}
