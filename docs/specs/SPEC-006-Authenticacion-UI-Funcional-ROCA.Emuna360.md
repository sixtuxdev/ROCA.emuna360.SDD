# SPEC-006 - Implementación Correcta del Login, Manejo de Tokens y Protección de Sesiones

## Información General

| Campo | Valor |
|---|---|
| Código | SPEC-006 |
| Proyecto | ROCA.Emuna360 |
| Tipo | Seguridad / Autenticación |
| Prioridad | Alta |
| Estado | Pendiente |
| Autor | Sixto José Romero Martínez |
| Rol | Desarrollador FullStack |
| Arquitectura | Onion Architecture |
| Frontend | Blazor .NET 9 + MudBlazor |
| Backend | ASP.NET Core .NET 9 |
| Base de Datos | SQL Server |

---

# 1. Objetivo

Implementar correctamente el flujo completo de autenticación y autorización de la aplicación ROCA.Emuna360 utilizando las APIs existentes, garantizando:

- Inicio de sesión funcional
- Manejo correcto de AccessToken y RefreshToken
- Protección de endpoints y controladores
- Persistencia segura de sesión
- Redirección automática
- Cierre de sesión seguro
- Validaciones reactivas del formulario Login
- Respeto por la arquitectura actual y mejores prácticas

---

# 2. Historia de Usuario

## Historia

**Yo:** Sixto José Romero Martínez  
**Como:** Desarrollador FullStack  
**Necesito:** Que la funcionalidad del login quede funcionando correctamente usando las APIs que corresponden.

---

# 3. Criterios de Aceptación

## CA-001 - Consumo API Login

Debe utilizarse la API ya implementada en:

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

## CA-002 - Redirección después del Login

Cuando el usuario inicie sesión correctamente:

- Debe redireccionarse automáticamente:
  - Dashboard
  - Main Layout
  - Página principal definida por la aplicación

---

## CA-003 - Manejo Correcto de Tokens

La aplicación debe:

- Almacenar correctamente:
  - AccessToken
  - RefreshToken

- Aplicar automáticamente el AccessToken en cada petición HTTP protegida.

- Renovar automáticamente el token cuando expire utilizando el RefreshToken.

- Evitar que el usuario pierda sesión mientras el RefreshToken sea válido.

---

## CA-004 - Protección de Endpoints y Controladores

Todos los controladores y endpoints protegidos deben:

- Requerir autenticación mediante JWT Bearer Token.
- Validar correctamente:
  - expiración
  - firma
  - issuer
  - audience

Solo usuarios autenticados podrán acceder a módulos protegidos.

---

## CA-005 - Exclusión de Endpoints Públicos

Algunos endpoints NO deberán requerir autenticación.

Ejemplos:

- Registro de usuarios
- Recuperación de contraseña
- Validaciones públicas
- Confirmaciones externas

Debe utilizarse:

```csharp
[AllowAnonymous]
```

En endpoints específicos que deban ser públicos.

---

## CA-006 - Validación Reactiva del Formulario Login

El botón:

```text
INICIAR SESIÓN
```

Debe habilitarse automáticamente cuando:

- El usuario ingrese:
  - correo electrónico válido o documento
  - contraseña válida

- Las validaciones mínimas se cumplan en tiempo real.

NO debe requerirse pérdida de foco (`blur`) para habilitar el botón.

La validación debe reaccionar mientras el usuario escribe.

---

## CA-007 - Cierre Seguro de Sesión

Cuando el usuario cierre sesión:

Debe:

- Eliminar:
  - AccessToken
  - RefreshToken
  - Claims
  - Estado de autenticación
  - Caché de sesión

- Redireccionar al Login

- Impedir navegación hacia páginas protegidas usando el botón atrás del navegador.

---

## CA-008 - Buenas Prácticas

La implementación debe:

- Respetar Onion Architecture
- Separar responsabilidades
- Usar Dependency Injection
- Mantener código limpio y desacoplado
- Evitar duplicación de lógica
- Centralizar autenticación y autorización
- Mantener tipado fuerte
- Manejar errores correctamente

---

# 4. Alcance

## Incluye

- Integración completa del Login
- Manejo JWT
- Manejo RefreshToken
- Protección de APIs
- Protección de rutas UI
- Logout seguro
- Validación reactiva formulario
- Persistencia de sesión
- Renovación automática de tokens

## No Incluye

- Registro de usuarios
- Recuperación de contraseña
- MFA
- Login social
- OAuth externo

---

# 5. Arquitectura Objetivo

## Frontend

### Responsabilidades

- Consumir LoginAsync
- Gestionar estado autenticación
- Persistencia segura sesión
- Manejar redirecciones
- Aplicar AuthorizationView
- Interceptar HTTP Requests

---

## Backend

### Responsabilidades

- Emitir JWT
- Emitir RefreshToken
- Validar tokens
- Renovar tokens
- Proteger endpoints

---

# 6. Componentes Afectados

## Frontend

### Proyecto

```text
ROCA.Emuna360.Presentation.WebUI
```

### Componentes

- Login.razor
- AuthApiService.cs
- AuthenticationStateProvider
- HttpClient Handlers
- MainLayout
- App.razor
- Protected Routes

---

## Backend

### Proyecto API

- Controladores protegidos
- Middleware JWT
- Configuración Authentication
- RefreshToken endpoints

---

# 7. Requerimientos Técnicos

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

## RT-003 - Protección Global

Los controladores protegidos deberán usar:

```csharp
[Authorize]
```

---

## RT-004 - Endpoints Públicos

Los endpoints públicos deberán usar:

```csharp
[AllowAnonymous]
```

---

## RT-005 - Refresh Token

Debe existir un flujo de renovación automática.

### Flujo

1. Detectar expiración del AccessToken
2. Consumir endpoint Refresh
3. Obtener nuevos tokens
4. Reintentar solicitud original

---

## RT-006 - Http Interceptor

Debe existir un Handler o Interceptor HTTP que:

- Agregue automáticamente:

```http
Authorization: Bearer {token}
```

- Detecte respuestas:
  - 401
  - 403

---

## RT-007 - Persistencia Segura

Los tokens deben almacenarse utilizando mecanismos seguros definidos actualmente por la aplicación.

---

## RT-008 - Estado Global de Autenticación

Debe existir sincronización entre:

- UI
- Claims
- Session State
- AuthenticationStateProvider

---

# 8. Flujo Funcional

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
API valida credenciales
        ↓
Retorna JWT + RefreshToken
        ↓
Guardar sesión
        ↓
Actualizar AuthenticationState
        ↓
Redireccionar Dashboard
```

---

## Flujo RefreshToken

```text
Token expirado
        ↓
Interceptor detecta 401
        ↓
Consume RefreshToken API
        ↓
Obtiene nuevo AccessToken
        ↓
Reintenta request original
```

---

## Flujo Logout

```text
Usuario cierra sesión
        ↓
Eliminar tokens
        ↓
Eliminar claims
        ↓
Limpiar estado autenticación
        ↓
Redireccionar Login
        ↓
Bloquear navegación protegida
```

---

# 9. Validaciones Funcionales

| Código | Validación |
|---|---|
| VF-001 | Usuario no puede acceder al dashboard sin login |
| VF-002 | Usuario autenticado puede consumir APIs protegidas |
| VF-003 | Usuario anónimo no puede consumir APIs privadas |
| VF-004 | Botón login responde en tiempo real |
| VF-005 | Logout elimina completamente la sesión |
| VF-006 | RefreshToken renueva sesión automáticamente |
| VF-007 | Navegación protegida funciona correctamente |

---

# 10. Riesgos

| Riesgo | Impacto |
|---|---|
| Mal manejo de tokens | Accesos inválidos |
| Tokens persistentes después logout | Riesgo de seguridad |
| RefreshToken incorrecto | Pérdida de sesión |
| Validaciones incorrectas UI | Mala experiencia usuario |

---

# 11. Definición de Terminado (DoD)

La SPEC se considerará completada cuando:

- Login funcione correctamente
- Logout funcione correctamente
- Tokens funcionen correctamente
- RefreshToken funcione correctamente
- APIs protegidas funcionen
- Endpoints públicos funcionen
- Validación reactiva implementada
- Navegación protegida validada
- No existan errores de autenticación
- Código cumpla arquitectura definida

---

# 12. Resultado Esperado

El sistema debe permitir:

- Inicio de sesión seguro
- Persistencia correcta de autenticación
- Protección completa de módulos privados
- Renovación automática de sesión
- Cierre de sesión seguro
- Experiencia fluida para el usuario
- Arquitectura mantenible y escalable