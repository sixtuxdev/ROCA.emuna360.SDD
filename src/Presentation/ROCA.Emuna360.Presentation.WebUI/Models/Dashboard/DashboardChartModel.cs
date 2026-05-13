namespace ROCA.Emuna360.Presentation.WebUI.Models.Dashboard;

public sealed class DashboardChartModel
{
    public string Title { get; set; } = string.Empty;
    public string[] Labels { get; set; } = [];
    public double[] Values { get; set; } = [];
}
