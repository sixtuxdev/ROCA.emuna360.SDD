# SPEC-006 – Autenticación UI Funcional – ROCA.Emuna360

## Información General

| Campo | Valor |
|---|---|
| Código | SPEC-006 |
| Nombre | Autenticación UI Funcional |
| Proyecto | ROCA.Emuna360 |
| Solicitado por | Sixto José Romero Martínez |
| Rol | Desarrollador FullStack |
| Tipo | Funcional / Seguridad |
| Prioridad | Alta |
| Estado | Pendiente |
| Arquitectura | .NET 9 + Blazor + MudBlazor + API REST + JWT |

---

# 1. Objetivo

Implementar y dejar completamente funcional el flujo de autenticación del proyecto ROCA.Emuna360.Presentation.WebUI utilizando las APIs existentes de autenticación, asegurando el correcto manejo de JWT, RefreshToken, almacenamiento seguro de sesión, protección de rutas, navegación autenticada y destrucción completa de sesión al cerrar sesión.

---

# 2. Historia de Usuario

## Historia de Usuario

**Yo:** Sixto José Romero Martínez  
**Como:** Desarrollador FullStack  
**Necesito:** Que la funcionalidad del login quede funcionando correctamente usando las APIs que corresponden.

---

# 3. Alcance Funcional

La implementación deberá cubrir:

- Inicio de sesión usando la API existente.
- Manejo completo de JWT.
- Manejo de RefreshToken.
- Persistencia de sesión.
- Protección de navegación y APIs.
- Administración de LocalStorage.
- Redirección segura.
- Logout seguro.
- Manejo de expiración de sesión.
- Integración con DTOs nuevos.
- Ajustes de arquitectura frontend para soportar la nueva respuesta de autenticación.

---

# 4. Arquitectura Impactada

## Frontend

Proyecto:

- ROCA.Emuna360.Presentation.WebUI

Componentes involucrados:

- Services/AuthApiService.cs
- CustomAuthenticationStateProvider
- TokenStorageService
- Login.razor
- Layouts protegidos
- HttpClient configuration
- DelegatingHandler JWT
- Guards / protección de navegación
- DTOs de autenticación
- Manejo de sesión

## Backend

APIs ya existentes:

- Endpoint Login
- Endpoint RefreshToken
- Endpoints protegidos con JWT

---

# 5. Respuesta Esperada de la API Login

La API Login retorna:

```json
{
  "accessToken": "JWT_TOKEN",
  "refreshToken": "REFRESH_TOKEN",
  "expiration": "2026-05-13T00:07:48.9030487Z",
  "user": {
    "usuarioId": 4,
    "denominacionId": 1,
    "correo": "calyjuan@gmail",
    "emailVerificado": true,
    "rolId": 2,
    "registro": {
      "registroId": 1,
      "nombres": "Juan Bautista",
      "apellidos": "Caly Madariaga",
      "documento": "8265482",
      "nombreCompleto": "Juan Bautista Caly Madariaga"
    },
    "roles": [
      {
        "rolId": 2,
        "nombre": "Administrador",
        "codigo": "ADMIN"
      }
    ],
    "menus": [
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
  }
}
```

---

# 6. Requerimientos Funcionales

## RF-001 – Consumo API Login

El sistema deberá consumir obligatoriamente la API existente:

```csharp
Services/AuthApiService.cs
LoginAsync(LoginRequestDto request)
```

La implementación NO deberá crear lógica paralela ni duplicada.

---

## RF-002 – Manejo Completo de DTOs

El frontend deberá adaptarse completamente a la nueva respuesta de autenticación usando DTOs tipados.

Se deberán crear o ajustar:

- LoginResponseDto
- UserInfoDto
- RegistroDto
- RolDto
- MenuDto
- RefreshTokenDto

No se permite usar objetos dinámicos.

---

## RF-003 – Persistencia de Sesión

La aplicación deberá almacenar la información del login en LocalStorage.

---

## RF-004 – Estructura LocalStorage

Se deberá almacenar la información separada por keys.

### Key: AccessToken

```json
"JWT_TOKEN"
```

---

### Key: RefreshToken

```json
"REFRESH_TOKEN"
```

---

### Key: TokenExpiration

```json
"2026-05-13T00:07:48.9030487Z"
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

# 7. Requerimientos de Seguridad

## RS-001 – Protección de Rutas

Todos los módulos autenticados deberán requerir sesión activa.

Se deberá implementar:

- Validación JWT.
- Protección de rutas.
- Protección de Layouts.
- Protección de navegación manual.
- Protección de llamadas API.

---

## RS-002 – Exclusión de Endpoints Públicos

No todos los endpoints deberán requerir JWT.

Ejemplo:

- Registro de usuarios.
- Formularios públicos.
- Recuperación de contraseña.
- Validaciones públicas.

Estos endpoints deberán permitir acceso sin autenticación.

---

## RS-003 – Manejo Automático de Token

El sistema deberá:

- Adjuntar automáticamente el JWT.
- Validar expiración.
- Renovar token usando RefreshToken.
- Reintentar solicitudes automáticamente.
- Cerrar sesión si el RefreshToken expira.

---

## RS-004 – Logout Seguro

Al cerrar sesión:

- Eliminar AccessToken.
- Eliminar RefreshToken.
- Eliminar información del usuario.
- Limpiar AuthenticationState.
- Limpiar HttpContext.
- Limpiar headers Authorization.
- Redireccionar al Login.
- Evitar navegación hacia atrás.
- Invalidar completamente la sesión activa.

---

# 8. Requerimientos UI/UX

## UI-001 – Validación Reactiva Login

El botón:

```text
INICIAR SESIÓN
```

deberá habilitarse inmediatamente cuando:

- El usuario ingrese correo/documento válido.
- La contraseña cumpla longitud mínima.
- El formulario sea válido.

La validación NO deberá depender del evento blur/focus lost.

La validación deberá ser reactiva en tiempo real.

---

## UI-002 – Redirección Post Login

Una vez autenticado:

- Redireccionar automáticamente al Dashboard/Main.
- Evitar regresar al Login si existe sesión activa.

---

## UI-003 – Manejo de Sesión Expirada

Si la sesión expira:

- Mostrar mensaje amigable.
- Intentar renovar sesión.
- Redireccionar al Login si no es posible renovar.

---

# 9. Requerimientos Técnicos

## RT-001 – DelegatingHandler JWT

Se deberá implementar o ajustar un DelegatingHandler para:

- Adjuntar JWT automáticamente.
- Renovar token.
- Interceptar 401.
- Manejar RefreshToken.

---

## RT-002 – AuthenticationStateProvider

Se deberá actualizar:

```csharp
CustomAuthenticationStateProvider
```

para soportar:

- Claims dinámicos.
- Roles.
- Persistencia.
- Restauración de sesión.
- Refresh automático.

---

## RT-003 – Claims JWT

Los claims deberán ser interpretados correctamente:

- UsuarioId
- RegistroId
- DenominacionId
- RolId
- NombreCompleto
- Documento
- Roles

---

## RT-004 – Arquitectura

La implementación deberá:

- Respetar arquitectura actual.
- Mantener separación de responsabilidades.
- Usar DTOs.
- Evitar lógica duplicada.
- Evitar código hardcodeado.
- Mantener principios SOLID.

---

# 10. Requerimientos de Navegación

## RN-001 – Protección Navegación Manual

Si un usuario intenta navegar manualmente:

```text
/admin-usuarios
/config-iglesias
/admin-estructura
```

sin autenticación:

- Redireccionar automáticamente al Login.

---

## RN-002 – Restauración de Sesión

Si el usuario refresca el navegador:

- Restaurar sesión automáticamente desde LocalStorage.
- Reconstruir ClaimsPrincipal.
- Mantener navegación autenticada.

---

# 11. Criterios de Aceptación

## CA-001

La autenticación deberá usar exclusivamente:

```csharp
AuthApiService.LoginAsync(LoginRequestDto request)
```

---

## CA-002

La respuesta de Login deberá mapearse completamente usando DTOs.

---

## CA-003

Toda la información del login deberá persistirse correctamente en LocalStorage.

---

## CA-004

El JWT deberá enviarse automáticamente en las llamadas autenticadas.

---

## CA-005

El RefreshToken deberá funcionar automáticamente.

---

## CA-006

Los módulos protegidos NO deberán permitir acceso sin autenticación.

---

## CA-007

Los endpoints públicos deberán seguir funcionando sin JWT.

---

## CA-008

El botón INICIAR SESIÓN deberá habilitarse dinámicamente sin perder focus.

---

## CA-009

El logout deberá destruir completamente la sesión.

---

## CA-010

El usuario NO deberá poder navegar hacia atrás después del logout.

---

## CA-011

Al refrescar navegador la sesión deberá mantenerse activa.

---

## CA-012

La aplicación deberá redireccionar automáticamente al Dashboard después del login.

---

## CA-013

La arquitectura implementada deberá respetar las buenas prácticas existentes del proyecto.

---

# 12. Consideraciones Técnicas

- Utilizar MudBlazor correctamente.
- Evitar lógica en Razor Pages.
- Centralizar autenticación.
- Centralizar manejo JWT.
- Centralizar manejo RefreshToken.
- Mantener DTOs desacoplados.
- Evitar almacenamiento redundante.
- Implementar manejo robusto de errores.

---

# 13. Resultado Esperado

La aplicación deberá quedar completamente funcional respecto a:

- Login.
- Persistencia de sesión.
- Seguridad JWT.
- RefreshToken.
- Protección de rutas.
- Navegación autenticada.
- Logout seguro.
- Restauración de sesión.
- Manejo de roles.
- Manejo dinámico de menús.
- Arquitectura desacoplada y mantenible.