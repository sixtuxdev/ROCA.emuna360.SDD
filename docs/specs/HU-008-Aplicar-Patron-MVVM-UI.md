# SPEC-008-MVVM-WebUI-Dashboard-ROCA.Emuna360

## Información General

| Campo | Valor |
|---|---|
| Código | SPEC-008 |
| Nombre | Aplicación Patrón MVVM en WebUI y Dashboard Inicial |
| Proyecto | ROCA.Emuna360 |
| Proyecto afectado | ROCA.Emuna360.Presentation.WebUI |
| Tecnología | .NET 9 + Blazor + MudBlazor |
| Autor | Sixto José Romero Martínez |
| Rol | Desarrollador FullStack |
| Tipo | Arquitectura Frontend / UI |
| Estado | Pendiente |
| Prioridad | Alta |

---

# 1. Objetivo

Aplicar el patrón MVVM únicamente en el proyecto `ROCA.Emuna360.Presentation.WebUI`, migrando la lógica existente del Login, Menú y componentes actuales hacia una estructura ordenada basada en ViewModels, garantizando que todo lo implementado siga funcionando correctamente.

Además, se debe crear un Dashboard inicial para que, después de iniciar sesión correctamente, el usuario sea redirigido directamente al Dashboard.

---

# 2. Historia de Usuario

| Campo | Descripción |
|---|---|
| Yo | Sixto José Romero Martínez |
| Como | Desarrollador FullStack |
| Necesito | Aplicar el patrón MVVM únicamente en el proyecto `ROCA.Emuna360.Presentation.WebUI` |
| Para | Tener una arquitectura frontend más limpia, escalable, mantenible y organizada sin afectar el funcionamiento actual del Login ni del Menú |

---

# 3. Alcance

La implementación debe realizarse únicamente en:

```text
ROCA.Emuna360.Presentation.WebUI
```

No se deben modificar otros proyectos de la solución, salvo que sea estrictamente necesario y previamente justificado.

El alcance incluye:

- Aplicar patrón MVVM en el proyecto WebUI.
- Crear estructura de carpetas para ViewModels.
- Migrar la lógica existente de componentes Razor hacia ViewModels.
- Mantener funcionando el Login.
- Mantener funcionando el Menú.
- Crear Dashboard inicial.
- Redireccionar al Dashboard después del Login exitoso.
- Usar MudBlazor para el diseño visual del Dashboard.
- Mostrar información quemada temporalmente para estadísticas y reportes.
- Mostrar información relacionada con Iglesias asociadas a la Denominación del usuario.
- Mantener buenas prácticas de arquitectura frontend.

---

# 4. Criterios de Aceptación

## 4.1 Aplicación del Patrón MVVM

- Se debe aplicar el patrón MVVM únicamente en el proyecto:

```text
ROCA.Emuna360.Presentation.WebUI
```

- Toda nueva funcionalidad debe quedar construida usando MVVM.
- La lógica de negocio o lógica de presentación no debe quedar directamente dentro de los componentes `.razor`.
- Los componentes Razor deben actuar principalmente como la Vista.
- La lógica de estado, carga de datos, validaciones y acciones debe moverse a ViewModels.
- Se debe migrar lo que ya está construido al patrón MVVM sin romper el funcionamiento actual.

---

## 4.2 Login

- El Login debe seguir funcionando correctamente después de aplicar MVVM.
- La lógica del Login debe quedar en un ViewModel.
- El componente de Login debe consumir el ViewModel.
- Después de un Login exitoso, el usuario debe ser redirigido al Dashboard.

Ruta esperada:

```text
/dashboard
```

---

## 4.3 Menú

- El Menú construido previamente debe seguir funcionando correctamente.
- La lógica de carga del Menú debe quedar organizada bajo MVVM.
- El Menú debe seguir respetando los colores definidos en:

```text
Theme/CustomMudTheme.cs
```

- El Menú debe seguir mostrando los íconos correctamente.
- El Menú debe seguir mostrando el Dashboard como opción fija.
- El Menú no debe perder funcionalidad después de la migración.

---

## 4.4 Dashboard Inicial

Se debe crear un Dashboard elegante usando MudBlazor.

El Dashboard debe:

- Cargar al iniciar sesión correctamente.
- Tener ruta:

```text
/dashboard
```

- Mostrar tarjetas de estadísticas.
- Mostrar reportes gráficos en modo torta.
- Mostrar información de Iglesias asociadas a la Denominación del usuario.
- Usar datos quemados temporalmente.
- Tener diseño visual moderno, limpio y profesional.
- Respetar el Theme visual del sistema.
- Estar construido aplicando patrón MVVM.

---

# 5. Estructura MVVM Esperada

Se debe crear una estructura similar a la siguiente dentro de `ROCA.Emuna360.Presentation.WebUI`:

```text
ROCA.Emuna360.Presentation.WebUI
│
├── ViewModels
│   ├── Auth
│   │   └── LoginViewModel.cs
│   │
│   ├── Layout
│   │   └── MenuViewModel.cs
│   │
│   └── Dashboard
│       └── DashboardViewModel.cs
│
├── Models
│   └── Dashboard
│       ├── DashboardStatCardModel.cs
│       ├── DashboardChartModel.cs
│       └── DashboardChurchModel.cs
│
├── Pages
│   ├── Auth
│   │   └── Login.razor
│   │
│   └── Dashboard
│       └── Dashboard.razor
│
└── Shared
    └── NavMenu.razor
```

La estructura puede ajustarse si el proyecto ya tiene una convención definida, pero debe mantenerse el principio MVVM.

---

# 6. Reglas Técnicas MVVM

## 6.1 Vista

Los archivos `.razor` deben:

- Renderizar UI.
- Invocar métodos del ViewModel.
- Usar propiedades expuestas por el ViewModel.
- Evitar lógica compleja dentro del Razor.
- No contener lógica de carga de datos directamente.
- No contener validaciones complejas directamente.

---

## 6.2 ViewModel

Los ViewModels deben:

- Contener el estado de la pantalla.
- Contener métodos de inicialización.
- Contener métodos de acción.
- Manejar errores de forma controlada.
- Exponer propiedades públicas para la Vista.
- Usar servicios existentes cuando sea necesario.
- Mantener código claro y testeable.

Ejemplo de responsabilidades:

```csharp
public class LoginViewModel
{
    public LoginRequestDto LoginRequest { get; set; } = new();
    public bool IsLoading { get; set; }
    public string? ErrorMessage { get; set; }

    public Task LoginAsync()
    {
        // Lógica del Login
    }
}
```

---

# 7. Dashboard Requerido

## 7.1 Estadísticas sugeridas

El Dashboard debe mostrar tarjetas con datos quemados temporalmente como:

- Total de Iglesias
- Total de Miembros
- Total de Diezmos del Mes
- Total de Ofrendas del Mes
- Eventos Programados
- Usuarios Activos

Ejemplo:

```text
Total Iglesias: 12
Total Miembros: 1.250
Diezmos del Mes: $ 18.500.000
Ofrendas del Mes: $ 7.300.000
Eventos Programados: 8
Usuarios Activos: 35
```

---

## 7.2 Reportes en modo torta

El Dashboard debe incluir gráficos tipo torta usando MudBlazor o el componente gráfico disponible en el proyecto.

Reportes sugeridos:

- Distribución de miembros por iglesia.
- Distribución de ingresos por concepto:
  - Diezmos
  - Ofrendas
  - Donaciones
  - Actividades
- Participación por iglesia asociada a la denominación.

---

## 7.3 Información de Iglesias

Se debe mostrar una sección con Iglesias asociadas a la Denominación del usuario.

Por ahora, la información puede ser quemada.

Ejemplo:

| Iglesia | Pastor | Ciudad | Miembros | Estado |
|---|---|---|---|---|
| Iglesia Central Emuna | Juan Pérez | Medellín | 320 | Activa |
| Iglesia Roca Viva | Carlos Gómez | Bogotá | 210 | Activa |
| Iglesia Casa de Paz | Andrés López | Cali | 180 | Activa |
| Iglesia Luz y Vida | Pedro Martínez | Barranquilla | 145 | Activa |

---

# 8. Archivos Esperados

## 8.1 Archivos a crear

```text
ViewModels/Auth/LoginViewModel.cs
ViewModels/Layout/MenuViewModel.cs
ViewModels/Dashboard/DashboardViewModel.cs
Models/Dashboard/DashboardStatCardModel.cs
Models/Dashboard/DashboardChartModel.cs
Models/Dashboard/DashboardChurchModel.cs
Pages/Dashboard/Dashboard.razor
```

---

## 8.2 Archivos a revisar/modificar

```text
Pages/Auth/Login.razor
Shared/NavMenu.razor
Layout/MainLayout.razor
Program.cs
Services/AuthApiService.cs
Services/MenuService.cs
Theme/CustomMudTheme.cs
```

---

# 9. Inyección de Dependencias

Los ViewModels deben registrarse en el contenedor de dependencias del proyecto WebUI.

Ejemplo:

```csharp
builder.Services.AddScoped<LoginViewModel>();
builder.Services.AddScoped<MenuViewModel>();
builder.Services.AddScoped<DashboardViewModel>();
```

La ubicación del registro debe respetar la estructura actual del proyecto.

---

# 10. Reglas de Navegación

Después de Login exitoso, el sistema debe redirigir a:

```text
/dashboard
```

El Dashboard debe ser accesible únicamente para usuarios autenticados, si el proyecto ya maneja autorización.

El Menú debe incluir el acceso fijo al Dashboard.

---

# 11. Validaciones Obligatorias

| Validación | Resultado Esperado |
|---|---|
| Login exitoso | Redirige a `/dashboard` |
| Login fallido | Muestra mensaje de error |
| Menú cargando | Muestra estado de carga |
| Menú sin datos | Muestra mensaje controlado |
| Dashboard cargado | Muestra estadísticas, gráficos y tabla |
| ViewModels registrados | No genera error de inyección |
| Componentes Razor | No contienen lógica compleja |
| Colores | Se respetan desde `CustomMudTheme.cs` |
| Menú existente | Sigue funcionando |
| Login existente | Sigue funcionando |

---

# 12. Restricciones

- No modificar proyectos diferentes a `ROCA.Emuna360.Presentation.WebUI`, salvo justificación.
- No romper el Login.
- No romper el Menú.
- No cambiar la estructura de respuesta de las APIs.
- No inventar servicios nuevos si ya existen servicios funcionales.
- No usar Entity Framework.
- No alterar lógica backend.
- No dejar lógica compleja en archivos `.razor`.
- No aplicar datos reales en Dashboard por ahora si no existen endpoints disponibles.
- Usar datos quemados temporalmente para el Dashboard.

---

# 13. Resultado Esperado

Al finalizar la implementación:

- El proyecto `ROCA.Emuna360.Presentation.WebUI` debe quedar organizado bajo patrón MVVM.
- Login debe seguir funcionando.
- Menú debe seguir funcionando.
- Dashboard debe existir y cargar después del Login.
- Dashboard debe verse moderno y elegante.
- Dashboard debe mostrar estadísticas y gráficos tipo torta.
- Dashboard debe mostrar iglesias asociadas a la denominación del usuario.
- Todo el código nuevo debe seguir MVVM.
- El sistema debe compilar sin errores.

---

# 14. Definition of Done

La tarea se considera terminada cuando:

- [ ] Se creó la estructura MVVM en WebUI.
- [ ] Se creó `LoginViewModel`.
- [ ] Se migró la lógica del Login al ViewModel.
- [ ] Se creó `MenuViewModel`.
- [ ] Se migró la lógica del Menú al ViewModel.
- [ ] Se creó `DashboardViewModel`.
- [ ] Se creó la página `/dashboard`.
- [ ] El Login redirige correctamente al Dashboard.
- [ ] El Menú sigue funcionando.
- [ ] El Dashboard muestra estadísticas quemadas.
- [ ] El Dashboard muestra gráficos tipo torta.
- [ ] El Dashboard muestra información de Iglesias.
- [ ] Los ViewModels están registrados en DI.
- [ ] No hay lógica compleja en Razor.
- [ ] El diseño respeta MudBlazor.
- [ ] El diseño respeta `CustomMudTheme.cs`.
- [ ] El proyecto compila correctamente.
- [ ] No existen errores de navegación.
- [ ] No existen errores visuales.
- [ ] No existen errores de inyección de dependencias.

---

# 15. Observaciones

Esta SPEC debe implementarse con cuidado porque afecta la arquitectura frontend del proyecto.

Antes de aplicar cambios, se recomienda que el agente o desarrollador:

1. Lea la estructura actual del proyecto.
2. Identifique dónde está la lógica actual del Login.
3. Identifique dónde está la lógica actual del Menú.
4. Proponga el plan de migración.
5. Aplique MVVM de forma incremental.
6. Valide Login.
7. Valide Menú.
8. Cree Dashboard.
9. Valide navegación final hacia `/dashboard`.

---

# 16. Nota Final

Todo lo que se construya a partir de esta SPEC debe respetar estrictamente el patrón MVVM dentro del proyecto `ROCA.Emuna360.Presentation.WebUI`.

La prioridad principal es aplicar MVVM sin romper lo que ya funciona actualmente: Login y Menú.