# SPEC-003 - Repositorios CRUD y API REST ROCA.Emuna360

## 1. Objetivo

Implementar la capa de repositorios y crear la API REST oficial de ROCA.Emuna360 utilizando la arquitectura creada en SPEC-001 y el modelo base creado en SPEC-002.

Esta SPEC debe permitir que cada tabla existente en SQL Server tenga su repositorio correspondiente usando Dapper con ADO.NET y reutilizando los procedimientos almacenados existentes.

También se debe crear el proyecto:

```txt
src/Presentation/ROCA.Emuna360.API
```

La API debe exponer controladores REST profesionales, configurar Swagger y respetar las mejores prácticas de desarrollo en .NET 9.

---

# 2. Contexto

La solución ya cuenta con:

- Arquitectura Cebolla.
- Arquitectura Limpia.
- Proyecto Domain creado.
- Proyecto Application creado.
- Proyecto Infrastructure creado.
- Proyecto Presentation.WebUI existente.
- Entidades base creadas.
- DTOs base creados.
- Interfaces base creadas.
- SQL Server como base de datos.
- Dapper y ADO.NET configurados.
- Sin Entity Framework.
- Sin DbContext.

La base de datos SQL Server contiene:
- Tablas.
- Relaciones.
- Índices.
- Constraints.
- Procedimientos almacenados.

Toda la implementación debe basarse en esa estructura SQL existente. :contentReference[oaicite:0]{index=0}

---

# 3. Alcance

Esta SPEC cubre:

- Crear proyecto API en .NET 9.
- Configurar Swagger.
- Configurar controladores REST.
- Crear repositorios en Infrastructure.
- Implementar CRUD por tabla.
- Reutilizar procedimientos almacenados existentes.
- Usar SQL parametrizado con Dapper cuando no exista SP.
- Registrar repositorios en Dependency Injection.
- Configurar referencias del proyecto API.
- Compilar solución.

---

# 4. Fuera de alcance

No implementar todavía:

- Login.
- JWT.
- Refresh Tokens.
- Autorización.
- Claims.
- Policies.
- Middleware de seguridad.
- Consumo desde Blazor.
- Pantallas.
- Cambios en SQL Server.
- Nuevos procedimientos almacenados.
- Modificación de procedimientos almacenados existentes.

---

# 5. Reglas obligatorias

1. No usar Entity Framework.
2. No crear DbContext.
3. Usar Dapper con ADO.NET.
4. Usar SQL Server.
5. Mantener .NET 9.
6. No modificar la base de datos.
7. No modificar procedimientos almacenados existentes.
8. Reutilizar SP existentes cuando existan.
9. Si una tabla no tiene SP, usar SQL parametrizado.
10. No escribir SQL en controladores.
11. No escribir SQL en WebUI.
12. Todo acceso a datos debe vivir en Infrastructure.
13. Las interfaces deben vivir en Application.
14. Los controladores deben depender de interfaces.
15. Configurar Swagger.
16. Usar respuestas estándar.
17. La solución debe compilar sin errores.
18. No implementar autenticación en esta SPEC.

---

# 6. Proyecto API a crear

Crear:

```txt
src/Presentation/ROCA.Emuna360.API
```

Tipo:

```txt
ASP.NET Core Web API
.NET 9
```

Referencias:

```txt
ROCA.Emuna360.Application
ROCA.Emuna360.Infrastructure
```

No debe depender directamente de:
- SQL.
- Dapper.
- Infrastructure concreta.

---

# 7. Configuración obligatoria de API

La API debe incluir:

```txt
Controllers
Swagger / OpenAPI
Dependency Injection
appsettings.json
ConnectionStrings
CORS preparado
Manejo básico de errores
Respuestas estándar
```

Paquetes requeridos:

```txt
Swashbuckle.AspNetCore
Microsoft.AspNetCore.OpenApi
```

---

# 8. Estructura esperada de API

```txt
ROCA.Emuna360.API/
├── Controllers/
│   ├── Organization/
│   ├── Geography/
│   ├── Security/
│   ├── Parameters/
│   ├── Registry/
│   ├── Structure/
│   └── Menu/
│
├── Common/
│   └── ApiResponseExtensions.cs
│
├── appsettings.json
├── appsettings.Development.json
└── Program.cs
```

---

# 9. Tablas que deben tener repositorio

## Organización

```txt
Denominaciones
Iglesias
ConfiguracionIglesia
ConfiguracionIglesiaColores
```

## Ubicación geográfica

```txt
Pais
Departamento
Ciudad
Corregimiento
```

## Seguridad

```txt
Usuarios
UsuariosPerfil
UsuariosIglesias
Roles
UsuarioRoles
TokensRefresh
TokensVerificacionCorreo
```

## Personas y registros

```txt
Registro
```

## Menús

```txt
Menu
Menu_rol
Menu_Usuario
```

## Parámetros

```txt
Clase
Parametro
```

## Estructura organizacional

```txt
EstructuraOrganizacional
EstructurasDenominacion
TiposEstructura
IglesiasEstructuras
```

---

# 10. Interfaces requeridas

Ubicación:

```txt
ROCA.Emuna360.Application/Interfaces/Repositories
```

Interfaces:

```txt
IDenominacionRepository
IIglesiaRepository
IConfiguracionIglesiaRepository
IConfiguracionIglesiaColorRepository

IPaisRepository
IDepartamentoRepository
ICiudadRepository
ICorregimientoRepository

IUsuarioRepository
IUsuarioPerfilRepository
IUsuarioIglesiaRepository
IRolRepository
IUsuarioRolRepository
ITokenRefreshRepository
ITokenVerificacionCorreoRepository

IRegistroRepository

IMenuRepository
IMenuRolRepository
IMenuUsuarioRepository

IClaseRepository
IParametroRepository

IEstructuraOrganizacionalRepository
IEstructuraDenominacionRepository
ITipoEstructuraRepository
IIglesiaEstructuraRepository
```

---

# 11. Repositorios a crear en Infrastructure

Ubicación:

```txt
ROCA.Emuna360.Infrastructure/Repositories
```

Estructura:

```txt
Repositories/
├── Organization/
│   ├── DenominacionRepository.cs
│   ├── IglesiaRepository.cs
│   ├── ConfiguracionIglesiaRepository.cs
│   └── ConfiguracionIglesiaColorRepository.cs
│
├── Geography/
│   ├── PaisRepository.cs
│   ├── DepartamentoRepository.cs
│   ├── CiudadRepository.cs
│   └── CorregimientoRepository.cs
│
├── Security/
│   ├── UsuarioRepository.cs
│   ├── UsuarioPerfilRepository.cs
│   ├── UsuarioIglesiaRepository.cs
│   ├── RolRepository.cs
│   ├── UsuarioRolRepository.cs
│   ├── TokenRefreshRepository.cs
│   └── TokenVerificacionCorreoRepository.cs
│
├── Registry/
│   └── RegistroRepository.cs
│
├── Menu/
│   ├── MenuRepository.cs
│   ├── MenuRolRepository.cs
│   └── MenuUsuarioRepository.cs
│
├── Parameters/
│   ├── ClaseRepository.cs
│   └── ParametroRepository.cs
│
└── Structure/
    ├── EstructuraOrganizacionalRepository.cs
    ├── EstructuraDenominacionRepository.cs
    ├── TipoEstructuraRepository.cs
    └── IglesiaEstructuraRepository.cs
```

---

# 12. Métodos CRUD mínimos requeridos

Cada repositorio debe implementar:

```csharp
Task<IEnumerable<TDto>> GetAllAsync();
Task<TDto?> GetByIdAsync(int id);
Task<int> CreateAsync(CreateDto dto);
Task<bool> UpdateAsync(UpdateDto dto);
Task<bool> DeleteAsync(int id);
```

Cuando aplique multiorganización:

```csharp
Task<IEnumerable<TDto>> GetByDenominacionAsync(int denominacionId);
```

Cuando aplique relación por iglesia:

```csharp
Task<IEnumerable<TDto>> GetByIglesiaAsync(int iglesiaId);
```

---

# 13. Procedimientos almacenados existentes obligatorios

Cuando existan, deben usarse obligatoriamente.

## Usuarios

```txt
sp_Usuarios_Insertar
sp_Usuarios_Actualizar
```

## Clase

```txt
usp_Clase_Insertar
usp_Clase_Actualizar
usp_Clase_Eliminar
usp_Clase_Listar
usp_Clase_Obtener
```

## EstructuraOrganizacional

```txt
usp_EstructuraOrganizacional_Insertar
usp_EstructuraOrganizacional_Actualizar
usp_EstructuraOrganizacional_Eliminar
usp_EstructuraOrganizacional_Listar
usp_EstructuraOrganizacional_Obtener
```

## Iglesias

```txt
usp_Iglesias_Actualizar
usp_Iglesias_Listar
usp_Iglesias_Obtener
```

## Parámetro

```txt
usp_Parametro_Listar_por_DenominacionId
usp_Parametro_Obtener
usp_Parametro_Obtener_por_Clase_Nombre
```

## Registro

```txt
usp_Registro_Actualizar
usp_Registro_Listar
usp_Registro_Obtener
```

## Menú

```txt
UspGetMenuPorUsuario
```

## Autenticación existente

```txt
usp_Obtener_Auth
```

Importante:

```txt
usp_Obtener_Auth NO debe implementarse funcionalmente todavía.
Debe quedar preparado para SPEC futura de autenticación.
```

---

# 14. Reglas para tablas sin SP

Si una tabla no tiene procedimiento almacenado:

- Implementar CRUD con SQL parametrizado usando Dapper.
- No usar concatenación insegura.
- No usar interpolación SQL insegura.

Permitido:

```csharp
const string sql = """
SELECT *
FROM dbo.Pais
WHERE PaisId = @PaisId
""";

await connection.QueryFirstOrDefaultAsync<PaisDto>(sql, new { PaisId = id });
```

No permitido:

```csharp
$"SELECT * FROM Pais WHERE PaisId = {id}"
```

---

# 15. Controladores requeridos

## Organization

```txt
DenominacionesController
IglesiasController
ConfiguracionIglesiaController
ConfiguracionIglesiaColoresController
```

## Geography

```txt
PaisesController
DepartamentosController
CiudadesController
CorregimientosController
```

## Security

```txt
UsuariosController
UsuariosPerfilController
UsuariosIglesiasController
RolesController
UsuarioRolesController
TokensRefreshController
TokensVerificacionCorreoController
```

## Registry

```txt
RegistroController
```

## Menu

```txt
MenuController
MenuRolController
MenuUsuarioController
```

## Parameters

```txt
ClaseController
ParametroController
```

## Structure

```txt
EstructuraOrganizacionalController
EstructurasDenominacionController
TiposEstructuraController
IglesiasEstructurasController
```

---

# 16. Rutas recomendadas

```txt
api/v1/denominaciones
api/v1/iglesias
api/v1/configuracion-iglesia
api/v1/configuracion-iglesia-colores

api/v1/paises
api/v1/departamentos
api/v1/ciudades
api/v1/corregimientos

api/v1/usuarios
api/v1/usuarios-perfil
api/v1/usuarios-iglesias
api/v1/roles
api/v1/usuario-roles
api/v1/tokens-refresh
api/v1/tokens-verificacion-correo

api/v1/registros

api/v1/menu
api/v1/menu-rol
api/v1/menu-usuario

api/v1/clases
api/v1/parametros

api/v1/estructura-organizacional
api/v1/estructuras-denominacion
api/v1/tipos-estructura
api/v1/iglesias-estructuras
```

---

# 17. Buenas prácticas obligatorias

Cada controlador debe:

1. Usar `[ApiController]`.
2. Usar rutas versionables.
3. Inyectar interfaces.
4. No usar Dapper directamente.
5. No usar SqlConnection directamente.
6. No contener lógica SQL.
7. Retornar respuestas estándar.
8. Manejar NotFound.
9. Manejar errores básicos.
10. No implementar autenticación todavía.

---

# 18. Swagger

Configurar:

```txt
SwaggerGen
SwaggerUI
```

Configuración:

```txt
Título: ROCA.Emuna360 API
Versión: v1
Descripción: API oficial de ROCA.Emuna360
```

Swagger debe funcionar en Development.

---

# 19. Dependency Injection

Actualizar:

```txt
ROCA.Emuna360.Infrastructure/DependencyInjection.cs
```

Registrar todos los repositorios:

```csharp
services.AddScoped<IDenominacionRepository, DenominacionRepository>();
services.AddScoped<IIglesiaRepository, IglesiaRepository>();
services.AddScoped<IRegistroRepository, RegistroRepository>();
...
```

La API debe usar:

```csharp
builder.Services.AddApplication();
builder.Services.AddInfrastructure();
```

---

# 20. Consideraciones técnicas detectadas

Antigravity debe analizar:

1. Tabla `Menu` no tiene PK explícita.
2. Tabla `UsuariosIglesias` no tiene PK explícita visible.
3. Hay tablas en singular y plural.
4. Algunos módulos tienen SP incompletos.
5. Algunos SP usan parámetros OUTPUT.
6. Algunos SP retornan `OK|Mensaje`.
7. Hay SP con eliminación física.
8. `usp_Obtener_Auth` existe pero no debe implementarse.
9. La API aún no debe implementar seguridad.

---

# 21. Fase 1 - Análisis obligatorio

Antes de implementar:

1. Validar SPEC-001.
2. Validar SPEC-002.
3. Validar entidades existentes.
4. Validar DTOs existentes.
5. Identificar interfaces faltantes.
6. Identificar repositorios faltantes.
7. Identificar controladores faltantes.
8. Identificar SP reutilizables.
9. Identificar tablas que requieren SQL parametrizado.
10. Identificar riesgos técnicos.
11. Proponer plan de implementación.

No modificar código todavía.

---

# 22. Fase 2 - Implementación

Solo después de aprobar análisis:

1. Crear proyecto `ROCA.Emuna360.API`.
2. Configurar Swagger.
3. Configurar Program.cs.
4. Configurar appsettings.json.
5. Crear controladores.
6. Crear repositorios.
7. Completar interfaces faltantes.
8. Registrar dependencias.
9. Implementar CRUD.
10. Reutilizar SP existentes.
11. Usar SQL parametrizado donde no exista SP.
12. Compilar solución.
13. Corregir errores.
14. Entregar resumen final.

---

# 23. Resultado esperado

Al finalizar esta SPEC debe existir:

1. Proyecto API creado.
2. Swagger configurado.
3. Controladores creados.
4. Repositorios implementados.
5. Interfaces completas.
6. Dependency Injection configurado.
7. CRUD funcional base.
8. SP reutilizados.
9. SQL parametrizado implementado.
10. Solución compilando correctamente.

---

# 24. Criterios de aceptación

- La solución compila correctamente.
- La API inicia correctamente.
- Swagger funciona correctamente.
- No existe Entity Framework.
- No existe DbContext.
- No se modifica SQL Server.
- No se modifican SP existentes.
- Los controladores no contienen SQL.
- Los repositorios usan Dapper/ADO.NET.
- Los repositorios reutilizan SP existentes.
- Los repositorios usan SQL parametrizado cuando aplica.
- Cada tabla tiene repositorio.
- Cada tabla tiene controlador.
- No existe login todavía.
- No existe JWT todavía.
- No existe autorización todavía.

---

# 25. Prompt para Antigravity - Fase de análisis

```md
Necesito que analices la SPEC-003 ubicada en:

docs/specs/SPEC-003 - Repositorios CRUD y API REST ROCA.Emuna360.md

No implementes nada todavía.

Primero realiza únicamente el análisis técnico.

Debes validar:
1. La solución actual.
2. Que SPEC-001 esté aplicada.
3. Que SPEC-002 esté aplicada.
4. Que las entidades y DTOs existan.
5. Qué interfaces faltan.
6. Qué repositorios faltan.
7. Qué controladores faltan.
8. Qué procedimientos almacenados existentes se pueden reutilizar.
9. Qué tablas no tienen procedimientos almacenados y requieren SQL parametrizado.
10. Qué riesgos técnicos existen.

No modifiques código.
No crees archivos.
No implementes nada todavía.

Entrégame:
- Análisis técnico.
- Plan de implementación.
- Lista de archivos a crear.
- Lista de archivos a modificar.
- Riesgos encontrados.
- Recomendaciones antes de ejecutar.
```

La SPEC se basa en las tablas, relaciones y procedimientos almacenados existentes del script SQL Server compartido previamente. :contentReference[oaicite:1]{index=1}