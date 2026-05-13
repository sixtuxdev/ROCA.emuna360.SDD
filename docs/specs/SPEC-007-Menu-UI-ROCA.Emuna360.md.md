# SPEC-007-Menu-UI

## Información General

| Campo | Valor |
|---|---|
| Código | SPEC-007 |
| Nombre | Menu UI Funcional |
| Proyecto | ROCA.Emuna360 |
| Arquitectura | .NET 9 + Blazor + MudBlazor |
| Base de Datos | SQL Server |
| Autor | Sixto José Romero Martínez |
| Rol | Desarrollador FullStack |
| Tipo | Frontend / UI |
| Estado | Pendiente |
| Prioridad | Alta |

---

# 1. Objetivo

Implementar correctamente el menú dinámico del sistema ROCA.Emuna360 utilizando MudBlazor, asegurando que:

- Respete completamente los colores configurados en `Theme/CustomMudTheme.cs`
- Tenga soporte para menús dinámicos agrupados
- Permita navegación funcional
- Muestre correctamente los íconos configurados desde base de datos
- Mantenga comportamiento visual consistente
- Permita identificar visualmente la opción seleccionada
- Cumpla con las buenas prácticas de UI/UX

---

# 2. Historia de Usuario

| Campo | Descripción |
|---|---|
| Yo | Sixto José Romero Martínez |
| Como | Desarrollador FullStack |
| Necesito | Que el menú quede bien construido y con los colores que se aplican en `Theme/CustomMudTheme.cs` |
| Para | Tener una navegación moderna, consistente y alineada con el tema visual de ROCA.Emuna360 |

---

# 3. Alcance

La implementación incluye:

- Construcción visual del menú lateral
- Implementación de grupos dinámicos
- Implementación de submenús
- Soporte visual de selección
- Integración con MudBlazor
- Manejo dinámico de íconos
- Normalización de tipos de menú
- Estados de carga
- Estados vacíos
- Compatibilidad con navegación Blazor

---

# 4. Criterios de Aceptación

## 4.1 Colores del Tema

### Reglas Obligatorias

- El menú debe utilizar los colores definidos en:

```csharp
Theme/CustomMudTheme.cs
```

- El `MudNavMenu` debe usar el color:

```csharp
Color.Primary
```

- Los `MudNavLink` deben usar el color:

```csharp
Color.Surface
```

- La opción seleccionada debe marcarse utilizando:

```csharp
Color.Secondary
```

---

## 4.2 Estructura Obligatoria del Menú

El menú debe implementarse utilizando la siguiente estructura:

```razor
<MudNavMenu Class="mud-width-full">

    <!-- Título y Subtítulo -->
    <MudText Typo="Typo.h6" Class="px-4">
        Emuna360
    </MudText>

    <MudText Typo="Typo.body2" Class="px-4 mud-text-secondary">
        Sistema de Gestión
    </MudText>

    <MudDivider Class="my-2" />

    <!-- Dashboard fijo -->
    <MudNavLink Href="/dashboard"
                Icon="@Icons.Material.Filled.Dashboard"
                IconColor="Color.Secondary"
                Match="NavLinkMatch.All">
        Dashboard
    </MudNavLink>

    <!-- Menús dinámicos -->
    @if (_isLoading)
    {
        <MudText Typo="Typo.body2"
                 Class="px-4 py-2 mud-text-secondary">
            Cargando menús...
        </MudText>
    }
    else if (_menus != null && _menus.Any())
    {
        @foreach (var grupo in _menus.Where(m => NormalizarTipo(m.Tipo) == "G"))
        {
            var hijos = _menus.Where(m =>
                NormalizarTipo(m.Tipo) == "S" &&
                int.TryParse(m.IdGrupo?.ToString(), out var idGrupo) &&
                int.TryParse(grupo.MenuId?.ToString(), out var grupoId) &&
                idGrupo == grupoId).ToList();

            @if (hijos.Any())
            {
                <MudNavGroup Title="@grupo.Descripcion"
                             Icon="@GetIcon(grupo.Imagen)"
                             IconColor="Color.Secondary"
                             Expanded="_expandedGroups.TryGetValue(grupo.MenuId ?? 0, out var expanded) && expanded">

                    @foreach (var subMenu in hijos)
                    {
                        <MudNavLink Href="@subMenu.Url"
                                    Icon="@GetIcon(subMenu.Imagen)"
                                    IconColor="Color.Secondary"
                                    Match="NavLinkMatch.Prefix">

                            @subMenu.Descripcion

                        </MudNavLink>
                    }

                </MudNavGroup>
            }
            else
            {
                <MudNavLink Href="@grupo.Url"
                            Icon="@GetIcon(grupo.Imagen)"
                            IconColor="Color.Secondary"
                            Match="NavLinkMatch.Prefix">

                    @grupo.Descripcion

                </MudNavLink>
            }
        }
    }
    else if (!_isLoading)
    {
        <MudText Typo="Typo.body2"
                 Class="px-4 py-2 mud-text-secondary">

            No hay menús disponibles

        </MudText>
    }

</MudNavMenu>
```

---

# 5. Requerimiento Funcional de Íconos

## 5.1 Función Obligatoria `GetIcon`

Se debe implementar obligatoriamente la función:

```csharp
private string GetIcon(string? iconName)
```

La función debe:

- Convertir correctamente nombres de íconos a íconos de MudBlazor
- Soportar múltiples alias
- Retornar un ícono por defecto cuando el ícono no exista
- Evitar errores por valores null o vacíos

---

## 5.2 Implementación Obligatoria

```csharp
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
```

---

# 6. Requerimiento Funcional de Normalización

## 6.1 Función Obligatoria `NormalizarTipo`

La función debe permitir:

- Validar correctamente tipos de menú
- Convertir tipos inválidos
- Soportar menús tipo:
  - Grupo
  - Submenú
  - Opciones

---

## 6.2 Implementación Obligatoria

```csharp
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
```

---

# 7. Reglas Técnicas

## 7.1 Frameworks

| Tecnología | Versión |
|---|---|
| .NET | 9 |
| Blazor | WebAssembly |
| MudBlazor | 8+ |

---

## 7.2 Reglas de Implementación

- No se deben hardcodear colores fuera del Theme
- No se deben usar íconos fuera de MudBlazor
- El menú debe ser completamente dinámico
- Los grupos deben expandirse correctamente
- Debe evitarse duplicidad de renderizados
- Debe mantenerse compatibilidad responsive
- Debe soportar múltiples niveles básicos

---

# 8. Validaciones

## 8.1 Validaciones Obligatorias

| Validación | Resultado Esperado |
|---|---|
| Menú sin datos | Mostrar “No hay menús disponibles” |
| Menú cargando | Mostrar “Cargando menús…” |
| Ícono null | Mostrar ícono por defecto |
| Tipo inválido | Ignorar opción |
| Grupo sin hijos | Mostrar como link normal |
| Ruta activa | Debe quedar resaltada |

---

# 9. Resultado Esperado

El sistema debe permitir:

- Navegación fluida
- Renderizado dinámico del menú
- Visual moderno alineado al Theme
- Correcta identificación visual de la opción activa
- Correcta agrupación de menús
- Escalabilidad para nuevos módulos

---

# 10. Definition of Done (DoD)

La tarea se considerará terminada cuando:

- [ ] El menú renderice correctamente
- [ ] Los colores provengan del Theme
- [ ] Los grupos funcionen correctamente
- [ ] Los submenús funcionen correctamente
- [ ] Los íconos rendericen correctamente
- [ ] La opción activa quede resaltada
- [ ] No existan errores visuales
- [ ] No existan errores de navegación
- [ ] El componente sea responsive
- [ ] El menú cargue dinámicamente
- [ ] Se mantenga compatibilidad con MudBlazor
- [ ] El código compile correctamente
- [ ] No existan warnings ni errores de compilación

---

# 11. Consideraciones Técnicas

- Se debe respetar la arquitectura actual de ROCA.Emuna360
- No modificar componentes fuera del alcance
- Mantener separación de responsabilidades
- Mantener reutilización del componente
- Aplicar buenas prácticas Blazor/MudBlazor
- Evitar lógica compleja en Razor
- Mantener código limpio y mantenible

---

# 12. Archivos Involucrados

| Archivo | Tipo |
|---|---|
| `Shared/NavMenu.razor` | UI |
| `Theme/CustomMudTheme.cs` | Theme |
| `Services/MenuService.cs` | Servicio |
| `DTOs/MenuDto.cs` | DTO |
| `Layout/MainLayout.razor` | Layout |

---

# 13. Dependencias

- MudBlazor
- NavigationManager
- Theme personalizado
- Servicio de menús
- Sistema de autenticación
- Menús dinámicos desde API

---

# 14. Observaciones

- El menú debe quedar exactamente como se especifica
- La implementación visual debe ser profesional
- El diseño debe ser consistente con ROCA.Emuna360
- No deben inventarse estructuras diferentes
- Debe mantenerse compatibilidad con futuras expansiones