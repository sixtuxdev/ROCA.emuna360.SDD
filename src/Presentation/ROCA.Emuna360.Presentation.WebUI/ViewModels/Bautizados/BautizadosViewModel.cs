using Microsoft.AspNetCore.Components;
using MudBlazor;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Presentation.WebUI.Services;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Bautizados;

public sealed class BautizadosViewModel
{
    private readonly CompletarDatosApiService _completarService;
    private readonly ISnackbar _snackbar;

    public BautizadosViewModel(
        CompletarDatosApiService completarService,
        ISnackbar snackbar)
    {
        _completarService = completarService;
        _snackbar = snackbar;
    }

    // =========================================================
    // DATOS
    // =========================================================

    public IReadOnlyList<BautizadosDto> Items { get; private set; } = [];

    public int TotalRegistros { get; private set; }

    public int Pagina { get; private set; } = 1;

    public int RegistrosPorPagina { get; private set; } = 10;

    public int TotalPaginas
    {
        get
        {
            if (RegistrosPorPagina <= 0)
                return 0;

            return (int)Math.Ceiling(
                (double)TotalRegistros / RegistrosPorPagina);
        }
    }

    // =========================================================
    // ESTADO
    // =========================================================

    public bool IsLoading { get; private set; }

    public string? Buscar { get; private set; }

    // =========================================================
    // INICIALIZACIÓN
    // =========================================================

    public async Task InitializeAsync()
    {
        Pagina = 1;
        RegistrosPorPagina = 10;
        Buscar = null;

        await CargarAsync();
    }

    // =========================================================
    // CARGAR DATOS
    // =========================================================

    public async Task CargarAsync()
    {
        IsLoading = true;

        try
        {
            var response = await _completarService.ListarAsync(
                Buscar,
                Pagina,
                RegistrosPorPagina);

            if (response is null)
            {
                Items = [];
                TotalRegistros = 0;
                return;
            }

            Items = response.Items ?? [];

            TotalRegistros = response.TotalRegistros;

            // Conservamos los valores que realmente devuelve el API.
            if (response.Pagina > 0)
                Pagina = response.Pagina;

            if (response.RegistrosPorPagina > 0)
                RegistrosPorPagina = response.RegistrosPorPagina;
        }
        catch (Exception ex)
        {
            Items = [];
            TotalRegistros = 0;

            _snackbar.Add(
                $"No fue posible cargar los bautizados: {ex.Message}",
                Severity.Error);
        }
        finally
        {
            IsLoading = false;
        }
    }

    // =========================================================
    // BÚSQUEDA
    // =========================================================

    public async Task BuscarAsync(string? texto)
    {
        Buscar = string.IsNullOrWhiteSpace(texto)
            ? null
            : texto.Trim();

        Pagina = 1;

        await CargarAsync();
    }

    // =========================================================
    // CAMBIAR PÁGINA
    // =========================================================

    public async Task CambiarPaginaAsync(int pagina)
    {
        if (pagina < 1)
            pagina = 1;

        if (TotalPaginas > 0 && pagina > TotalPaginas)
            pagina = TotalPaginas;

        Pagina = pagina;

        await CargarAsync();
    }

    // =========================================================
    // CAMBIAR CANTIDAD POR PÁGINA
    // =========================================================

    public async Task CambiarRegistrosPorPaginaAsync(
        int registrosPorPagina)
    {
        if (registrosPorPagina <= 0)
            registrosPorPagina = 10;

        RegistrosPorPagina = registrosPorPagina;

        Pagina = 1;

        await CargarAsync();
    }

    // =========================================================
    // LIMPIAR BÚSQUEDA
    // =========================================================

    public async Task LimpiarBusquedaAsync()
    {
        Buscar = null;

        Pagina = 1;

        await CargarAsync();
    }
}