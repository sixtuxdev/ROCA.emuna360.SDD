namespace ROCA.Emuna360.Application.DTOs.Registry;

public sealed class BautizadosPaginadoDto
{
    public List<BautizadosDto> Items { get; set; } = [];

    public int TotalRegistros { get; set; }

    public int Pagina { get; set; }

    public int RegistrosPorPagina { get; set; }

    public int TotalPaginas =>
        RegistrosPorPagina <= 0
            ? 0
            : (int)Math.Ceiling(
                (double)TotalRegistros / RegistrosPorPagina);
}