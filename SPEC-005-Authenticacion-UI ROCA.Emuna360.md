# SPEC-005-Authenticacion-UI ROCA.Emuna360

---

# Objetivo

Crear la pantalla de Login en el proyecto:

```txt
ROCA.Emuna360.Presentation.WebUI
```

Aplicando diseño profesional, elegante, seguro y consistente con los colores institucionales definidos.

La pantalla debe permitir:

- Iniciar sesión por correo o documento.
- Ingresar contraseña.
- Validar campos requeridos.
- Validar longitud de contraseña.
- Manejar opción "Recordarme".
- Permitir navegación a registro.
- Permitir navegación a recuperación de contraseña.
- Manejar reCAPTCHA.
- Proteger el acceso al Home o Dashboard si el usuario no está autenticado.
- Aplicar MudBlazor correctamente.
- Crear y usar tema global CustomMudTheme.

---

# Colores institucionales

```txt
Primary   : #002142
Secondary : #A7762A
Tertiary  : #FEFEFE
```

---

# Reglas obligatorias

1. Usar únicamente componentes MudBlazor para la pantalla.
2. No usar componentes HTML básicos si existe equivalente en MudBlazor.
3. No romper la arquitectura existente.
4. No modificar la API salvo que sea estrictamente necesario para consumir el login ya existente.
5. No implementar lógica backend en WebUI.
6. No consumir SQL desde WebUI.
7. No usar Entity Framework.
8. No crear DbContext.
9. No quemar credenciales en código.
10. No guardar tokens inseguramente.
11. No permitir acceso al Home o Dashboard sin autenticación.
12. No dejar rutas protegidas accesibles sin login.
13. La pantalla Login debe tener layout propio.
14. Debe usarse MudBlazor correctamente.
15. Debe crearse un tema global reutilizable.
16. El diseño debe ser responsive.
17. Debe compilar sin errores.
18. Debe respetarse Arquitectura Limpia.
19. Debe respetarse Arquitectura Cebolla.
20. Debe seguir la estructura actual de ROCA.Emuna360.

---

# Ubicación requerida del Layout

Debe crearse:

```txt
src/Presentation/ROCA.Emuna360.Presentation.WebUI/Layout/AuthLayout.razor
```

Nombre obligatorio:

```txt
AuthLayout.razor
```

---

# Pantalla requerida

Crear o ajustar la pantalla Login en:

```txt
src/Presentation/ROCA.Emuna360.Presentation.WebUI/Pages/Auth/Login.razor
```

Ruta esperada:

```txt
/login
```

---

# Campos requeridos

## Usuario

Debe permitir:

- Correo electrónico.
- Documento.

Debe ser requerido.

Placeholder sugerido:

```txt
Correo electrónico o documento
```

---

## Contraseña

Debe ser requerida.

Validaciones:

- Mayor a 7 caracteres.
- Menor o igual a 15 caracteres.

Debe permitir:

- Mostrar contraseña.
- Ocultar contraseña.

Usar iconos MudBlazor.

---

## Recordarme

Debe permitir mantener sesión iniciada.

---

## reCAPTCHA

Debe quedar preparado para evitar bots.

Si aún no existe configuración real:

- Dejar preparada estructura.
- Configuración en appsettings.
- No quemar claves.

---

# Validaciones requeridas

Debe validar:

- Usuario requerido.
- Contraseña requerida.
- Contraseña mínimo 8 caracteres.
- Contraseña máximo 15 caracteres.

Debe mostrar:

- Mensajes claros.
- Validaciones visuales.
- Errores controlados.

No mostrar:

- Stacktrace.
- Excepciones técnicas.
- Errores internos.

---

# Acciones requeridas

La pantalla debe incluir:

- Botón Iniciar sesión.
- Link Registrarme.
- Link Recuperar contraseña.
- Checkbox Recordarme.
- Validación reCAPTCHA antes del login.
- Estado de carga.
- Deshabilitar botón mientras procesa.

---

# Diseño visual requerido

La pantalla debe verse:

- Profesional.
- Elegante.
- Moderna.
- Institucional.

Debe usar:

```txt
Primary   : #002142
Secondary : #A7762A
Tertiary  : #FEFEFE
```

Debe incluir:

- Fondo profesional.
- Card centrada.
- Logo o placeholder de logo.
- Título ROCA.Emuna360.
- Subtítulo institucional.
- Inputs elegantes.
- Botón principal institucional.
- Diseño responsive.
- Responsive móvil.
- Responsive tablet.
- Responsive escritorio.

---

# Tema global requerido

Crear o ajustar:

```txt
src/Presentation/ROCA.Emuna360.Presentation.WebUI/Theme/CustomMudTheme.cs
```

Debe definir:

- PaletteLight
- Primary
- Secondary
- Tertiary
- AppbarBackground
- DrawerBackground
- Background
- Surface
- TextPrimary
- TextSecondary
- BorderRadius
- Shadows
- Typography si aplica

Valores:

```txt
Primary   = #002142
Secondary = #A7762A
Tertiary  = #FEFEFE
```

Debe integrarse globalmente mediante:

```txt
MudThemeProvider
```

Validar dónde se encuentra actualmente:

- MainLayout
- App.razor
- Routes.razor

y ajustar correctamente.

---

# AuthLayout requerido

Crear:

```txt
src/Presentation/ROCA.Emuna360.Presentation.WebUI/Layout/AuthLayout.razor
```

Debe incluir:

- Fondo institucional.
- Renderizado de @Body.
- Diseño centrado.
- MudThemeProvider si aplica.
- MudDialogProvider si aplica.
- MudSnackbarProvider si aplica.

No debe incluir:

- Drawer.
- Sidebar.
- Navbar privada.
- Dashboard.
- Menú lateral.
- Menú autenticado.

---

# Protección de rutas

Si el usuario no está autenticado:

- No debe entrar al Home.
- No debe entrar al Dashboard.
- Debe redirigir a /login.

Debe analizar:

```txt
App.razor
Routes.razor
MainLayout.razor
NavMenu.razor
Program.cs
```

Debe validar:

- AuthorizeRouteView.
- AuthenticationStateProvider.
- Rutas públicas.
- Rutas privadas.

Rutas públicas:

```txt
/login
/register
/forgot-password
/confirm-email
```

---

# AuthenticationStateProvider

Validar si existe.

Si no existe:

Crear uno personalizado:

```txt
CustomAuthenticationStateProvider
```

Debe manejar:

- JWT.
- Estado autenticación.
- Logout.
- Refresh UI.
- Claims.
- Recordarme.

---

# Servicios WebUI requeridos

Crear o validar:

```txt
AuthApiService
TokenStorageService
CustomAuthenticationStateProvider
```

---

# AuthApiService

Debe consumir:

```txt
POST api/v1/auth/login
```

No debe consumir:

- Repositorios.
- SQL.
- Infrastructure.
- Dapper.

---

# TokenStorageService

Debe manejar almacenamiento seguro.

Si es Blazor WebAssembly:

- localStorage cuando Recordarme = true.
- sessionStorage cuando Recordarme = false.

Si es Blazor Server:

- Validar ProtectedLocalStorage.

Nunca guardar:

- Contraseña.
- Información sensible innecesaria.

---

# Recordarme

Si Recordarme = true:

- Persistir sesión.

Si Recordarme = false:

- Mantener solo sesión temporal.

---

# reCAPTCHA

Debe quedar preparado mediante:

```json
"Recaptcha": {
  "SiteKey": "",
  "SecretKey": ""
}
```

WebUI solo debe usar:

```txt
SiteKey
```

No usar SecretKey en frontend.

---

# Endpoint esperado

Debe consumir:

```txt
POST api/v1/auth/login
```

Payload esperado:

```json
{
  "denominacionId": 1,
  "login": "correo@dominio.com",
  "password": "********",
  "iglesiaId": null,
  "rememberMe": true,
  "recaptchaToken": "token"
}
```

---

# Respuesta esperada

```json
{
  "success": true,
  "message": "Inicio de sesión exitoso.",
  "data": {
    "accessToken": "",
    "refreshToken": "",
    "usuario": {}
  }
}
```

---

# Buenas prácticas obligatorias

1. Separar UI de servicios.
2. Login.razor no debe tener lógica HTTP compleja.
3. Usar servicios inyectados.
4. Usar MudForm.
5. Usar validaciones limpias.
6. Usar MudSnackbar.
7. Usar MudProgressCircular.
8. No duplicar lógica.
9. No exponer información técnica.
10. No guardar password.
11. No dejar rutas privadas sin protección.
12. Mantener responsive.
13. Mantener tema global.

---

# Antes de implementar

Primero realiza un análisis técnico.

Entrégame:

1. Estructura actual del WebUI.
2. Layouts existentes.
3. Tema MudBlazor actual.
4. Configuración autenticación actual.
5. Si existe AuthenticationStateProvider.
6. Si existe AuthApiService.
7. Archivos a crear.
8. Archivos a modificar.
9. Riesgos técnicos.
10. Plan de implementación paso a paso.

---

# Importante

No implementes todavía.

Primero entrégame únicamente el análisis técnico.

No modifiques código aún.

No crees archivos todavía.

---

# Después de aprobar el análisis

Implementa:

1. AuthLayout.razor.
2. Login.razor.
3. CustomMudTheme.cs.
4. Integración del tema global.
5. Validaciones Login.
6. Estado de carga.
7. Recordarme.
8. Preparación reCAPTCHA.
9. Protección de rutas.
10. AuthApiService si no existe.
11. TokenStorageService si no existe.
12. CustomAuthenticationStateProvider si no existe.
13. Ajustes Program.cs.
14. Ajustes App.razor.
15. Ajustes Routes.razor.
16. Ajustes MainLayout si aplica.
17. Compilar solución.

---

# Al finalizar entrega

1. Archivos creados.
2. Archivos modificados.
3. Layout creado.
4. Tema global creado.
5. Pantalla Login creada.
6. Validaciones implementadas.
7. Protección de rutas implementada.
8. reCAPTCHA preparado.
9. Recordarme implementado.
10. Resultado compilación.
11. Riesgos detectados.
12. Pendientes detectados.