yo: Sixto José Romero Martínez
Como: Desarrollador FullStack
Necito: Que el menú quede bien construido y con los colores que se aplican en Theme/CustomMudTheme.cs

Criterios de Aceptación:
* Se necesita que el Menú quede con los colores de CustomMudTheme.cs
* El MudNavMenu debe tener el color Primary
* Los MudNavLink debe tener el color Surface
* Cuando esté seleccionado la opción debe quedar marcado el color Secondary
* se requiere la implementación del Menú de la siguiente forma:
<MudNavMenu Class="mud-width-full">
        <!-- Título y Subtítulo -->
        <MudText Typo="Typo.h6" Class="px-4">Emuna360</MudText>
        <MudText Typo="Typo.body2" Class="px-4 mud-text-secondary">Sistema de Gestión</MudText>
        <MudDivider Class="my-2" />

        <!-- Dashboard fijo -->
        <MudNavLink Href="/dashboard" Icon="@Icons.Material.Filled.Dashboard" IconColor="Color.Secondary" Match="NavLinkMatch.All">
            Dashboard
        </MudNavLink>

        <!-- Menús dinámicos -->
        @if (_isLoading)
        {
            <MudText Typo="Typo.body2" Class="px-4 py-2 mud-text-secondary">
                Cargando menús...
            </MudText>
        }
        else if (_menus != null && _menus.Any())
        {
            @foreach (var grupo in _menus.Where(m => NormalizarTipo(m.Tipo) == "G"))
            {
                var hijos = _menus.Where(m => NormalizarTipo(m.Tipo) == "S" &&
                    int.TryParse(m.IdGrupo?.ToString(), out var idGrupo) &&
                    int.TryParse(grupo.MenuId?.ToString(), out var grupoId) &&
                    idGrupo == grupoId).ToList();

                @if (hijos.Any())
                {
                    <MudNavGroup Title="@grupo.Descripcion" Icon="@GetIcon(grupo.Imagen)" IconColor="Color.Secondary" Expanded="_expandedGroups.TryGetValue(grupo.MenuId ?? 0, out var expanded) && expanded">
                        @foreach (var subMenu in hijos)
                        {
                            <MudNavLink Href="@subMenu.Url" Icon="@GetIcon(subMenu.Imagen)" IconColor="Color.Secondary" Match="NavLinkMatch.Prefix">
                                @subMenu.Descripcion
                            </MudNavLink>
                        }
                    </MudNavGroup>
                }
                else
                {
                    <MudNavLink Href="@grupo.Url" Icon="@GetIcon(grupo.Imagen)" IconColor="Color.Secondary" Match="NavLinkMatch.Prefix">
                        @grupo.Descripcion
                    </MudNavLink>
                }
            }
        }
        else if (!_isLoading)
        {
            <MudText Typo="Typo.body2" Class="px-4 py-2 mud-text-secondary">
                No hay menús disponibles
            </MudText>
        }
    </MudNavMenu>

* Para que los íconos se vean correctamente implementar la función requerida que se usa en el MudNavMenu
/// <summary>
    /// Obtiene el icono de MudBlazor basado en el nombre del icono.
    /// </summary>
    private string GetIcon(string? iconName)
    {
        if (string.IsNullOrWhiteSpace(iconName))
            return Icons.Material.Filled.Circle;

        var normalizedName = iconName.Trim().ToUpperInvariant();

        return normalizedName switch
        {
            "SETTINGS" => Icons.Material.Filled.Settings,
            "DASHBOARD" => Icons.Material.Filled.Dashboard,
            "HOME" => Icons.Material.Filled.Home,
            "PEOPLE" => Icons.Material.Filled.People,
            "PERSON" => Icons.Material.Filled.Person,
            "ADMINPANELSETTINGS" => Icons.Material.Filled.AdminPanelSettings,
            "SECURITY" => Icons.Material.Filled.Security,
            "LOCK" => Icons.Material.Filled.Lock,
            "BUILD" => Icons.Material.Filled.Build,
            "CHURCH" or "CHURCHJESUS" => Icons.Material.Filled.Home,
            "ACCOUNTTREE" => Icons.Material.Filled.AccountTree,
            "SETTINGSUGGEST" => Icons.Material.Filled.SettingsSuggest,
            "ASSESSMENT" => Icons.Material.Filled.Assessment,
            "INFO" => Icons.Material.Filled.Info,
            "CODE" => Icons.Material.Filled.Code,
            "WIDGETS" => Icons.Material.Filled.Widgets,
            "ADDCIRCLE" => Icons.Material.Filled.AddCircle,
            "CLOUD" => Icons.Material.Filled.Cloud,
            "FOLDER" => Icons.Material.Filled.Folder,
            "DESCRIPTION" => Icons.Material.Filled.Description,
            "LIST" => Icons.Material.Filled.List,
            "MENU" => Icons.Material.Filled.Menu,
            "NOTIFICATIONS" => Icons.Material.Filled.Notifications,
            "SEARCH" => Icons.Material.Filled.Search,
            "STAR" => Icons.Material.Filled.Star,
            "ADDHOMEWORK" => Icons.Material.Filled.AddHomeWork,
            "FAVORITE" => Icons.Material.Filled.Favorite,
            "BOOKMARK" => Icons.Material.Filled.Bookmark,
            "EDIT" => Icons.Material.Filled.Edit,
            "DELETE" => Icons.Material.Filled.Delete,
            "SAVE" => Icons.Material.Filled.Save,
            "CANCEL" => Icons.Material.Filled.Cancel,
            "CHECK" => Icons.Material.Filled.Check,
            "CLOSE" => Icons.Material.Filled.Close,
            "ADD" => Icons.Material.Filled.Add,
            "REMOVE" => Icons.Material.Filled.Remove,
            "ARROWBACK" => Icons.Material.Filled.ArrowBack,
            "ARROWFORWARD" => Icons.Material.Filled.ArrowForward,
            "REFRESH" => Icons.Material.Filled.Refresh,
            "DOWNLOAD" => Icons.Material.Filled.Download,
            "UPLOAD" => Icons.Material.Filled.Upload,
            "PRINT" => Icons.Material.Filled.Print,
            "SHARE" => Icons.Material.Filled.Share,
            "EMAIL" => Icons.Material.Filled.Email,
            "PHONE" => Icons.Material.Filled.Phone,
            "LOCATIONON" => Icons.Material.Filled.LocationOn,
            "CALENDARTODAY" => Icons.Material.Filled.CalendarToday,
            "SCHEDULE" => Icons.Material.Filled.Schedule,
            "ACCESS.TIME" => Icons.Material.Filled.AccessTime,
            "EVENT" => Icons.Material.Filled.Event,
            "IMAGE" => Icons.Material.Filled.Image,
            "VIDEOCAM" => Icons.Material.Filled.Videocam,
            "AUDIOTRACK" => Icons.Material.Filled.Audiotrack,
            "ATTACHMENT" => Icons.Material.Filled.Attachment,
            "INSERTDRIVEFILE" => Icons.Material.Filled.InsertDriveFile,
            "PICTUREASPDF" => Icons.Material.Filled.PictureAsPdf,
            "TABLECHART" => Icons.Material.Filled.TableChart,
            "BARCHART" => Icons.Material.Filled.BarChart,
            "PIECHART" => Icons.Material.Filled.PieChart,
            "SHOWCHART" => Icons.Material.Filled.ShowChart,
            "TRENDINGUP" => Icons.Material.Filled.TrendingUp,
            "TRENDINGDOWN" => Icons.Material.Filled.TrendingDown,
            "WARNING" => Icons.Material.Filled.Warning,
            "ERROR" => Icons.Material.Filled.Error,
            "REPORTPROBLEM" => Icons.Material.Filled.ReportProblem,
            "HELP" => Icons.Material.Filled.Help,
            "HELP OUTLINE" or "HELPOUTLINE" => Icons.Material.Filled.HelpOutline,
            "QUESTIONMARK" => Icons.Material.Filled.QuestionMark,
            "LIGHTBULB" => Icons.Material.Filled.Lightbulb,
            "TIPSANDUPDATES" => Icons.Material.Filled.TipsAndUpdates,
            "LOGOUT" => Icons.Material.Filled.Logout,
            "LOGIN" => Icons.Material.Filled.Login,
            "APPREGISTRATION" => Icons.Material.Filled.AppRegistration,
            "APPS" => Icons.Material.Filled.Apps,
            "MANAGEACCOUNTS" => Icons.Material.Filled.ManageAccounts,
            "VERIFIEDUSER" => Icons.Material.Filled.VerifiedUser,
            "HOWTOREG" => Icons.Material.Filled.HowToReg,
            "PERSONADD" => Icons.Material.Filled.PersonAdd,
            "GROUPADD" => Icons.Material.Filled.GroupAdd,
            "GROUP" => Icons.Material.Filled.Group,
            "GROUPS" => Icons.Material.Filled.Groups,
            "TEAMS" => Icons.Material.Filled.Groups,
            "CORPORATEFARE" => Icons.Material.Filled.CorporateFare,
            "BUSINESS" => Icons.Material.Filled.Business,
            "DOMAIN" => Icons.Material.Filled.Domain,
            "STORE" => Icons.Material.Filled.Store,
            "SHOPPINGCART" => Icons.Material.Filled.ShoppingCart,
            "POINTOFSALE" => Icons.Material.Filled.PointOfSale,
            "PAYMENTS" => Icons.Material.Filled.Payments,
            "CREDITCARD" => Icons.Material.Filled.CreditCard,
            "ACCOUNTBALANCEWALLET" => Icons.Material.Filled.AccountBalanceWallet,
            "ACCOUNTBALANCE" => Icons.Material.Filled.AccountBalance,
            "SAVINGS" => Icons.Material.Filled.Savings,
            "MONETIZATIONON" => Icons.Material.Filled.MonetizationOn,
            "PAID" => Icons.Material.Filled.Paid,
            "RECEIPT" => Icons.Material.Filled.Receipt,
            "REDEEM" => Icons.Material.Filled.Redeem,
            "LOCALOFFER" => Icons.Material.Filled.LocalOffer,
            "SELL" => Icons.Material.Filled.Sell,
            "LAN" => Icons.Material.Filled.Lan,
            "PERCENT" => Icons.Material.Filled.Percent,
            "DECK" => Icons.Material.Filled.Deck,
            _ => Icons.Material.Filled.Circle
        };
    }

* Función Requerida para el funcionamiento del Menú

    private string NormalizarTipo(string? tipo)
    {
        if (string.IsNullOrWhiteSpace(tipo))
            return string.Empty;

        var normalized = tipo.Trim().ToUpperInvariant();

        return normalized switch
        {
            "G" => "G",
            "S" => "S",
            "O" => "S",
            _ => string.Empty
        };
    }

* El menú debe estar bien creado y como se indica.