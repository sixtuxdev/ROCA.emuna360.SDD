using MudBlazor;

namespace ROCA.Emuna360.Presentation.WebUI.Theme;

public static class CustomMudTheme
{
    public static MudTheme Theme = new MudTheme()
    {
        PaletteLight = new PaletteLight()
        {
            Primary = "#002142",      // Azul Profundo Institucional
            Secondary = "#A7762A",    // Dorado/Bronce Institucional
            Tertiary = "#FEFEFE",     // Blanco
            AppbarBackground = "#002142",
            AppbarText = "#FEFEFE",
            DrawerBackground = "#FEFEFE",
            DrawerText = "#002142",
            Background = "#F5F5F5",
            Surface = "#FFFFFF",
            TextPrimary = "#002142",
            TextSecondary = "#424242",
            Divider = "#E0E0E0"
        },
        PaletteDark = new PaletteDark()
        {
            Primary = "#002142",
            Secondary = "#A7762A",
            Tertiary = "#FEFEFE",
            Background = "#1A1A1A",
            Surface = "#262626",
            TextPrimary = "#FFFFFF",
            TextSecondary = "#BDBDBD"
        },
        LayoutProperties = new LayoutProperties()
        {
            DefaultBorderRadius = "8px"
        },
        Typography = new Typography()
        {
            Default = new DefaultTypography()
            {
                FontFamily = new[] { "Roboto", "Helvetica", "Arial", "sans-serif" },
                FontSize = "0.875rem",
                FontWeight = "400",
                LineHeight = "1.43",
                LetterSpacing = ".01071em"
            },
            H1 = new H1Typography() { FontSize = "3rem", FontWeight = "700" },
            H2 = new H2Typography() { FontSize = "2.25rem", FontWeight = "600" },
            H3 = new H3Typography() { FontSize = "1.75rem", FontWeight = "600" },
            H4 = new H4Typography() { FontSize = "1.5rem", FontWeight = "500" },
            H5 = new H5Typography() { FontSize = "1.25rem", FontWeight = "500" },
            H6 = new H6Typography() { FontSize = "1.125rem", FontWeight = "500" }
        }
    };
}
