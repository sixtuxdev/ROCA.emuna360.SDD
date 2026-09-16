using ROCA.Emuna360.Application.DTOs.Registry;
namespace ROCA.Emuna360.Application.Interfaces.Services.CompletarDatos;

public interface ICompletarDatosService
{
    Task<CompletarDatosDto?> GetByRegistroAsync(int registroId);
    Task<int?> CreateAsync(CompletarDatosDto dto);
    Task<bool> UpdateAsync(int id, CompletarDatosDto dto);
}
