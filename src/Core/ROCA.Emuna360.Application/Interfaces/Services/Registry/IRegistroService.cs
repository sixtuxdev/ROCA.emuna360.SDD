using ROCA.Emuna360.Application.DTOs.Registry;

namespace ROCA.Emuna360.Application.Interfaces.Services.Registry;

public interface IRegistroService : IBaseService<RegistroDto>
{
    System.Threading.Tasks.Task<System.Collections.Generic.IEnumerable<RegistroDto>> GetByIglesiaAsync(int iglesiaId);
}