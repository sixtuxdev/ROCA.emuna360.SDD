# SPEC-006 - Implementación Completa de Login, Manejo de Tokens, Persistencia de Sesión y Protección de APIs

## Información General

| Campo | Valor |
|---|---|
| Código | SPEC-006 |
| Proyecto | ROCA.Emuna360 |
| Tipo | Seguridad / Autenticación |
| Prioridad | Alta |
| Estado | Pendiente |
| Solicitante | Sixto José Romero Martínez |
| Rol | Desarrollador FullStack |
| Arquitectura | Onion Architecture |
| Frontend | Blazor .NET 9 + MudBlazor |
| Backend | ASP.NET Core .NET 9 |
| Base de Datos | SQL Server |

---

# 1. Objetivo

Implementar correctamente todo el flujo de autenticación y autorización de la solución ROCA.Emuna360 utilizando las APIs existentes, garantizando:

- Login funcional
- Persistencia segura de sesión
- Manejo correcto de JWT
- Manejo correcto de RefreshToken
- Protección de APIs
- Protección de navegación
- Persistencia de información del usuario
- Manejo de LocalStorage
- Logout seguro
- Renovación automática de sesión
- Validaciones reactivas del formulario Login
- Respeto total por la arquitectura actual

---

# 2. Historia de Usuario

## Historia

**Yo:** Sixto José Romero Martínez  
**Como:** Desarrollador FullStack  
**Necesito:** Que la funcionalidad del login quede funcionando correctamente usando las APIs que corresponden.

---

# 3. Criterios de Aceptación

---

## CA-001 - Consumo API Login

Debe utilizarse obligatoriamente la API ya implementada en:

```csharp
ROCA.Emuna360.Presentation.WebUI
Services/AuthApiService.cs
```

Método:

```csharp
LoginAsync(LoginRequestDto request)
```

Este método será el único autorizado para realizar el proceso de autenticación.

---

## CA-002 - Estructura de Respuesta Login

La API de Login retorna la siguiente estructura:

```json
{
  "accessToken": "",
  "refreshToken": "",
  "expiration": "",
  "user": {
    "usuarioId": 0,
    "denominacionId": 0,
    "correo": "",
    "emailVerificado": true,
    "rolId": 0,
    "registro": {},
    "roles": [],
    "menus": []
  }
}
```

La aplicación deberá mapear completamente toda la estructura devuelta.

---

## CA-003 - Persistencia Completa en LocalStorage

Debe almacenarse toda la información devuelta por Login en LocalStorage separando correctamente cada estructura.

---

### Key: AccessToken

```json
{
  "accessToken": "JWT_TOKEN"
}
```

---

### Key: RefreshToken

```json
{
  "refreshToken": "REFRESH_TOKEN"
}
```

---

### Key: TokenExpiration

```json
{
  "expiration": "2026-05-13T00:07:48.9030487Z"
}
```

---

### Key: InfoUser

```json
{
  "usuarioId": 4,
  "denominacionId": 1,
  "correo": "calyjuan@gmail",
  "emailVerificado": true,
  "rolId": 2
}
```

---

### Key: InfoRegister

```json
{
  "registroId": 1,
  "nombres": "Juan Bautista",
  "apellidos": "Caly Madariaga",
  "documento": "8265482",
  "nombreCompleto": "Juan Bautista Caly Madariaga"
}
```

---

### Key: Roles

```json
[
  {
    "rolId": 2,
    "nombre": "Administrador",
    "codigo": "ADMIN"
  }
]
```

---

### Key: Menus

```json
[
  {
    "menuId": 1,
    "descripcion": "Administrar Iglesias",
    "idGrupo": 4,
    "tipo": "S",
    "url": "/config-iglesias",
    "imagen": "AddHomeWork",
    "orden": 0
  }
]
```

---

## CA-004 - Persistencia de Sesión

La sesión deberá mantenerse activa utilizando:

- AccessToken
- RefreshToken
- Claims
- LocalStorage
- AuthenticationStateProvider

---

## CA-005 - Redirección después del Login

Cuando el usuario inicie sesión correctamente:

- Debe redireccionarse automáticamente:
  - Dashboard
  - Main Layout
  - Página principal de la aplicación

---

## CA-006 - Manejo Correcto de JWT

La aplicación debe:

- Aplicar automáticamente el AccessToken en cada petición HTTP protegida.
- Manejar expiración de tokens.
- Detectar expiración automáticamente.
- Renovar sesión usando RefreshToken.
- Reintentar solicitudes después de renovar token.

---

## CA-007 - Manejo Correcto de RefreshToken

Debe existir un flujo automático de renovación de sesión.

### Flujo esperado

```text
Token expirado
        ↓
Interceptor detecta 401
        ↓
Consume endpoint RefreshToken
        ↓
Obtiene nuevo JWT
        ↓
Actualiza LocalStorage
        ↓
Reintenta petición original
```

---

## CA-008 - Protección de APIs

Todos los controladores y endpoints protegidos deberán:

- Requerir autenticación JWT
- Validar:
  - issuer
  - audience
  - expiration
  - signing key

Debe utilizarse:

```csharp
[Authorize]
```

---

## CA-009 - Endpoints Públicos

Algunos endpoints NO requerirán autenticación.

Ejemplos:

- Registro
- Recuperación contraseña
- Validaciones públicas
- Confirmaciones externas

Debe utilizarse:

```csharp
[AllowAnonymous]
```

---

## CA-010 - Protección de Navegación

Las páginas protegidas de Blazor no deberán permitir acceso si:

- el usuario no está autenticado
- el token expiró
- la sesión fue eliminada

La navegación deberá redireccionar automáticamente al Login.

---

## CA-011 - Validación Reactiva del Login

El botón:

```text
INICIAR SESIÓN
```

Debe habilitarse automáticamente cuando:

- El usuario ingrese:
  - correo/documento válido
  - contraseña válida

- Las validaciones mínimas se cumplan.

NO debe requerirse pérdida de foco (`blur`) para habilitar el botón.

La validación debe ejecutarse en tiempo real mientras el usuario escribe.

---

## CA-012 - Logout Seguro

Cuando el usuario cierre sesión:

Debe eliminar:

- AccessToken
- RefreshToken
- Expiration
- Claims
- Estado autenticación
- LocalStorage
- Caché de sesión

Luego:

- Redireccionar al Login
- Bloquear navegación protegida
- Impedir volver atrás usando historial del navegador

---

## CA-013 - Buenas Prácticas

La implementación debe:

- Respetar Onion Architecture
- Mantener separación de responsabilidades
- Usar Dependency Injection
- Evitar código duplicado
- Mantener tipado fuerte
- Centralizar autenticación
- Centralizar autorización
- Manejar errores correctamente
- Mantener código desacoplado

---

# 4. Componentes Afectados

## Frontend

### Proyecto

```text
ROCA.Emuna360.Presentation.WebUI
```

### Componentes

- Login.razor
- AuthApiService.cs
- CustomAuthenticationStateProvider
- LocalStorageService
- JwtInterceptorHandler
- MainLayout
- App.razor
- Protected Routes
- NavigationMenu
- SessionManager

---

## Backend

### API

- AuthController
- RefreshToken endpoint
- JWT Middleware
- Authorization configuration
- Controladores protegidos

---

# 5. Requerimientos Técnicos

---

## RT-001 - JWT Authentication

Debe configurarse:

```csharp
builder.Services
    .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(...)
```

---

## RT-002 - Authorization

Debe configurarse:

```csharp
builder.Services.AddAuthorization();
```

---

## RT-003 - Http Interceptor

Debe existir un Handler HTTP encargado de:

- Agregar automáticamente:

```http
Authorization: Bearer {token}
```

- Detectar:
  - 401
  - 403

- Renovar tokens automáticamente

---

## RT-004 - AuthenticationStateProvider

Debe implementarse correctamente:

- ClaimsPrincipal
- Estado autenticación
- Persistencia sesión
- Actualización automática UI

---

## RT-005 - Manejo LocalStorage

Debe existir una capa centralizada para:

- Guardar sesión
- Leer sesión
- Eliminar sesión
- Renovar sesión

---

## RT-006 - Claims JWT

El sistema deberá manejar correctamente claims como:

```text
UsuarioId
RegistroId
DenominacionId
RolId
Roles
Documento
NombreCompleto
Email
```

---

## RT-007 - Seguridad

La aplicación deberá:

- Validar expiración JWT
- Invalidar sesión correctamente
- Evitar reutilización sesión
- Evitar navegación protegida después logout

---

# 6. Flujo Funcional

---

## Flujo Login

```text
Usuario ingresa credenciales
        ↓
Validación reactiva formulario
        ↓
Botón habilitado automáticamente
        ↓
Consume LoginAsync()
        ↓
API valida usuario
        ↓
Retorna JWT + RefreshToken + UserInfo
        ↓
Guardar información en LocalStorage
        ↓
Actualizar AuthenticationState
        ↓
Redireccionar Dashboard
```

---

## Flujo RefreshToken

```text
JWT expirado
        ↓
Interceptor detecta 401
        ↓
Consume endpoint Refresh
        ↓
Obtiene nuevo JWT
        ↓
Actualiza LocalStorage
        ↓
Reintenta petición original
```

---

## Flujo Logout

```text
Usuario cierra sesión
        ↓
Eliminar LocalStorage
        ↓
Eliminar Claims
        ↓
Limpiar AuthenticationState
        ↓
Redireccionar Login
        ↓
Bloquear navegación protegida
```

---

# 7. Validaciones Funcionales

| Código | Validación |
|---|---|
| VF-001 | Usuario no autenticado no puede acceder módulos privados |
| VF-002 | Usuario autenticado puede consumir APIs protegidas |
| VF-003 | JWT se aplica automáticamente |
| VF-004 | RefreshToken renueva sesión |
| VF-005 | Logout elimina completamente sesión |
| VF-006 | Validación Login funciona en tiempo real |
| VF-007 | Navegación protegida funciona |
| VF-008 | LocalStorage almacena correctamente toda la información |
| VF-009 | Menús quedan disponibles después Login |
| VF-010 | Roles quedan disponibles globalmente |

---

# 8. Riesgos

| Riesgo | Impacto |
|---|---|
| Tokens mal gestionados | Vulnerabilidad seguridad |
| Sesión persistente incorrectamente | Accesos inválidos |
| RefreshToken incorrecto | Pérdida sesión |
| Claims inconsistentes | Fallos autorización |
| Logout incompleto | Riesgo seguridad |

---

# 9. Definición de Terminado (DoD)

La SPEC se considerará completada cuando:

- Login funcione correctamente
- JWT funcione correctamente
- RefreshToken funcione correctamente
- APIs protegidas funcionen
- LocalStorage almacene correctamente toda la información
- Logout elimine completamente la sesión
- Navegación protegida funcione
- Validaciones reactivas funcionen
- Menús dinámicos funcionen
- Claims funcionen correctamente
- No existan errores de autenticación
- Código respete Onion Architecture

---

# 10. Resultado Esperado

El sistema debe permitir:

- Inicio de sesión seguro
- Persistencia correcta de sesión
- Renovación automática de tokens
- Protección de módulos privados
- Navegación segura
- Menús dinámicos por rol
- Manejo centralizado autenticación
- Logout seguro
- Arquitectura mantenible y escalable
- Excelente experiencia de usuario