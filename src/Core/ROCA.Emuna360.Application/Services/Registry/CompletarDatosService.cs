using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.Interfaces.Repositories.Registry;
using ROCA.Emuna360.Application.Interfaces.Services.Registry;
using System.Threading.Tasks;

namespace ROCA.Emuna360.Application.Services.Registry;

public class CompletarDatosService : ICompletarDatosService
{
    private readonly ICompletarDatosRepository _repository;

    public CompletarDatosService(ICompletarDatosRepository repository)
    {
        _repository = repository;
    }

    public async Task<CompletarDatosDto?> GetByRegistroAsync(int registroId)
    {
        return await _repository.GetByRegistroAsync(registroId);
    }

    public async Task<int?> CreateAsync(CompletarDatosDto dto)
    {
        var id = await _repository.CreateAsync(dto);
        return id;
    }

    public async Task<bool> UpdateAsync(int id, CompletarDatosDto dto)
    {
        return await _repository.UpdateAsync(id, dto);
    }
}
