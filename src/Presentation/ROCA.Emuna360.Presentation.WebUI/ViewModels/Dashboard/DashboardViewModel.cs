using MudBlazor;
using ROCA.Emuna360.Presentation.WebUI.Models.Dashboard;

namespace ROCA.Emuna360.Presentation.WebUI.ViewModels.Dashboard;

public sealed class DashboardViewModel
{
    public bool IsLoading { get; private set; } = true;
    public IReadOnlyList<DashboardStatCardModel> Stats { get; private set; } = [];
    public IReadOnlyList<DashboardChartModel> Charts { get; private set; } = [];
    public IReadOnlyList<DashboardChurchModel> Churches { get; private set; } = [];

    public Task InitializeAsync()
    {
        Stats =
        [
            new() { Title = "Total Iglesias", Value = "12", Detail = "4 ciudades principales", Icon = Icons.Material.Filled.Church },
            new() { Title = "Total Miembros", Value = "1.250", Detail = "Crecimiento mensual 8%", Icon = Icons.Material.Filled.Groups },
            new() { Title = "Diezmos del Mes", Value = "$ 18.500.000", Detail = "Meta cumplida 92%", Icon = Icons.Material.Filled.Savings },
            new() { Title = "Ofrendas del Mes", Value = "$ 7.300.000", Detail = "Aportes registrados", Icon = Icons.Material.Filled.Payments },
            new() { Title = "Eventos Programados", Value = "8", Detail = "Próximos 30 días", Icon = Icons.Material.Filled.Event },
            new() { Title = "Usuarios Activos", Value = "35", Detail = "Accesos recientes", Icon = Icons.Material.Filled.VerifiedUser }
        ];

        Charts =
        [
            new()
            {
                Title = "Miembros por Iglesia",
                Labels = ["Central Emuna", "Roca Viva", "Casa de Paz", "Luz y Vida"],
                Values = [320, 210, 180, 145]
            },
            new()
            {
                Title = "Ingresos por Concepto",
                Labels = ["Diezmos", "Ofrendas", "Donaciones", "Actividades"],
                Values = [18500000, 7300000, 2500000, 1800000]
            },
            new()
            {
                Title = "Participación por Iglesia",
                Labels = ["Central Emuna", "Roca Viva", "Casa de Paz", "Luz y Vida"],
                Values = [38, 25, 21, 16]
            }
        ];

        Churches =
        [
            new() { Name = "Iglesia Central Emuna", Pastor = "Juan Pérez", City = "Medellín", Members = 320, Status = "Activa" },
            new() { Name = "Iglesia Roca Viva", Pastor = "Carlos Gómez", City = "Bogotá", Members = 210, Status = "Activa" },
            new() { Name = "Iglesia Casa de Paz", Pastor = "Andrés López", City = "Cali", Members = 180, Status = "Activa" },
            new() { Name = "Iglesia Luz y Vida", Pastor = "Pedro Martínez", City = "Barranquilla", Members = 145, Status = "Activa" }
        ];

        IsLoading = false;
        return Task.CompletedTask;
    }
}
