namespace ROCA.Emuna360.Presentation.WebUI.Models.Dashboard;

public sealed class DashboardChurchModel
{
    public string Name { get; set; } = string.Empty;
    public string Pastor { get; set; } = string.Empty;
    public string City { get; set; } = string.Empty;
    public int Members { get; set; }
    public string Status { get; set; } = string.Empty;
}
