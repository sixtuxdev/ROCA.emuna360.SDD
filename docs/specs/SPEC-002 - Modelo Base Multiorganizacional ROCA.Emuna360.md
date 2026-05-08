# SPEC-002 - Modelo Base Multiorganizacional ROCA.Emuna360

## 1. Objetivo

Definir e implementar el modelo base inicial de dominio para ROCA.Emuna360 utilizando la arquitectura previamente creada en la SPEC-001.

Esta especificación tiene como finalidad analizar y representar correctamente la estructura actual de la base de datos SQL Server dentro de la Arquitectura Cebolla, preparando la solución para futuras implementaciones funcionales.

El objetivo principal es comenzar a crear:

- Entidades base del dominio.
- DTOs base.
- Interfaces de repositorio.
- Contratos iniciales.
- Modelos de respuesta.
- Estructura de módulos.
- Organización de contextos funcionales.

Todo basado estrictamente en la base de datos existente. :contentReference[oaicite:0]{index=0}

---

# 2. Contexto

La solución ya cuenta con:

- Arquitectura Cebolla implementada.
- Arquitectura Limpia configurada.
- Proyecto WebUI funcionando.
- Infrastructure configurado con:
  - Dapper
  - ADO.NET
  - SQL Server
- Dependency Injection configurado.
- Sin Entity Framework.
- Sin DbContext.

La base de datos SQL Server ya existe y contiene:
- Tablas.
- Relaciones.
- Índices.
- Constraints.
- Procedimientos almacenados.

Esta SPEC utilizará esa base de datos existente como fuente principal de verdad. :contentReference[oaicite:1]{index=1}

---

# 3. Alcance

Esta SPEC cubre únicamente:

- Analizar tablas existentes.
- Crear entidades base del dominio.
- Crear DTOs base.
- Crear contratos iniciales de repositorio.
- Organizar módulos funcionales.
- Preparar la solución para futuras SPEC.
- Crear modelos iniciales reutilizables.
- Crear Result Pattern base.
- Crear respuestas estándar base.

---

# 4. Fuera de alcance

No se debe implementar todavía:

- Login.
- JWT.
- Autenticación.
- Autorización.
- Pantallas.
- CRUDs completos.
- Validaciones complejas.
- Servicios funcionales.
- Consumo real desde UI.
- Lógica de negocio compleja.
- Integración de Menús.
- Claims.
- Policies.
- Middleware personalizado.
- Seguridad avanzada.

---

# 5. Reglas obligatorias

1. No usar Entity Framework.
2. No crear DbContext.
3. Usar únicamente Dapper y ADO.NET.
4. Mantener .NET 9.
5. Mantener Arquitectura Cebolla.
6. Mantener Arquitectura Limpia.
7. No modificar la base de datos.
8. No cambiar nombres de tablas existentes.
9. No cambiar procedimientos almacenados existentes.
10. No eliminar objetos SQL existentes.
11. Las entidades deben representar la estructura SQL actual.
12. Los DTOs deben orientarse al uso de aplicación.
13. Las entidades no deben contener lógica de infraestructura.
14. Las interfaces deben vivir en Application.
15. Las implementaciones futuras vivirán en Infrastructure.
16. Todo acceso futuro a SQL debe pasar por repositorios.
17. Mantener separación estricta de capas.
18. Preparar la arquitectura para escalabilidad multiorganizacional.

---

# 6. Modelo organizacional detectado

La aplicación está orientada a:

## Multi Denominación

Cada denominación funciona como una organización independiente.

Relaciones principales detectadas:

```txt
Denominaciones
    └── Iglesias
            └── Registro
                    └── Usuarios
                            └── Roles
```

También existen:

- Estructuras organizacionales.
- Configuración visual.
- Parámetros dinámicos.
- Menús dinámicos.
- Tokens de autenticación.
- Relaciones Usuario-Iglesia.
- Relaciones Usuario-Rol.

---

# 7. Módulos identificados

## 7.1 Organización

```txt
Denominaciones
Iglesias
ConfiguracionIglesia
ConfiguracionIglesiaColores
```

---

## 7.2 Ubicación geográfica

```txt
Pais
Departamento
Ciudad
Corregimiento
```

---

## 7.3 Seguridad

```txt
Usuarios
UsuariosPerfil
UsuariosIglesias
Roles
UsuarioRoles
TokensRefresh
TokensVerificacionCorreo
```

---

## 7.4 Personas y registros

```txt
Registro
```

---

## 7.5 Menús y permisos

```txt
Menu
Menu_rol
Menu_Usuario
```

---

## 7.6 Parámetros dinámicos

```txt
Clase
Parametro
```

---

## 7.7 Estructura organizacional

```txt
EstructuraOrganizacional
EstructurasDenominacion
TiposEstructura
IglesiasEstructuras
```

---

# 8. Referencia oficial de tablas SQL Server

## Tabla: Denominaciones

```txt
DenominacionId      INT              PK IDENTITY
Nombre              NVARCHAR(150)    NOT NULL
Slug                NVARCHAR(100)    NOT NULL
Activa              BIT              NOT NULL
IglesiaPrincipalId  INT              NOT NULL
FechaCreacion       DATETIME         NULL
```

---

## Tabla: Iglesias

```txt
IglesiaId           INT              PK IDENTITY
DenominacionId      INT              FK
Nombre              NVARCHAR(150)
Slug                NVARCHAR(100)
PersoneriaJuridica  NVARCHAR(MAX)
PaisId              INT
DepartamentoId      INT
CiudadId            INT
CorregimientoId     INT NULL
Direccion           NVARCHAR(250)
Telefono            NVARCHAR(30)
Correo              NVARCHAR(150)
Slogan              NVARCHAR(250)
Activa              BIT
FechaCreacion       DATETIME2(0)
```

Índices:
- UX_Iglesias_Slug
- UQ_Iglesias_Slug

---

## Tabla: Registro

```txt
RegistroId                  INT PK IDENTITY
DenominacionId              INT NULL
IglesiaId                   INT NOT NULL
Nombres                     NVARCHAR(250)
Apellidos                   NVARCHAR(250)
ParametroIdTipoDocumento    INT NULL
Documento                   NVARCHAR(50)
PaisId                      INT NULL
DepartamentoId              INT NULL
CiudadId                    INT NULL
CorregimientoId             INT NULL
Direccion                   NVARCHAR(550)
Correo                      NVARCHAR(500) NULL
Telefono                    NVARCHAR(20) NULL
ParametroIdSexo             INT NOT NULL
```

---

## Tabla: Usuarios

```txt
UsuarioId           INT PK IDENTITY
DenominacionId      INT NOT NULL
Correo              NVARCHAR(150)
PasswordHash        NVARCHAR(500)
EmailVerificado     BIT
Bloqueado           BIT
FechaCreacion       DATETIME2(0)
UltimoLogin         DATETIME2(0) NULL
SecurityStamp       NVARCHAR(64)
RolId               INT
```

Índices:
- IX_Usuarios_Correo
- UQ_Usuarios_Correo

---

## Tabla: UsuariosPerfil

```txt
UsuarioId           INT NULL
DenominacionId      INT NULL
TipoDocumento       NVARCHAR(30)
Documento           NVARCHAR(30)
Nombres             NVARCHAR(150)
Apellidos           NVARCHAR(150)
FechaCumple         DATE NULL
Telefono            NVARCHAR(30) NULL
Genero              NVARCHAR(30) NULL
Direccion           NVARCHAR(250) NULL
Avatar              NVARCHAR(250) NULL
Estado              TINYINT
FechaActualizacion  DATETIME2(0) NULL
```

Índice:
- IX_UsuariosPerfil_Documento

Unique:
- UQ_UsuariosPerfil_TipoDocumento_Documento

---

## Tabla: UsuariosIglesias

```txt
UsuarioIglesiaId    INT
DenominacionId      INT
UsuarioId           INT
IglesiaId           INT
Estado              TINYINT
EsAdministrador     BIT
FechaCreacion       DATETIME2(0)
```

---

## Tabla: Roles

```txt
RolId               INT PK IDENTITY
DenominacionId      INT NULL
Nombre              NVARCHAR(100)
Codigo              NVARCHAR(50)
Activo              BIT
FechaCreacion       DATETIME2(0)
```

---

## Tabla: UsuarioRoles

```txt
UsuarioRolId        INT PK IDENTITY
UsuarioId           INT NULL
DenominacionId      INT NULL
RolId               INT NULL
FechaAsignacion     DATETIME2(0)
```

---

## Tabla: Menu

```txt
MenuId              INT NULL
DenominacionId      INT NULL
Descripcion         NVARCHAR(150)
IdGrupo             INT NULL
Tipo                NCHAR(1)
Estado              BIT
Url                 NVARCHAR(500)
Imagen              NVARCHAR(500)
Fecha               DATETIME
Orden               INT
NuevaVentana        BIT
```

---

## Tabla: Menu_rol

```txt
Menu_Rol            INT PK IDENTITY
DenominacionId      INT
RolId               INT
MenuId              INT
Estado              BIT
```

---

## Tabla: Menu_Usuario

```txt
OpcUsuId            INT PK IDENTITY
DenominacionId      INT
UsuarioId           INT
MenuId              INT
```

---

## Tabla: Clase

```txt
ClaseId             INT PK IDENTITY
DenominacionId      INT
Descripcion         NVARCHAR(500)
Estado              BIT
FechaCreacion       DATETIME
```

---

## Tabla: Parametro

```txt
ParametroId         INT PK IDENTITY
DenominacionId      INT
ClaseId             INT
Descripcion         NVARCHAR(500)
Observacion         NVARCHAR(MAX) NULL
PadreParametroId    INT NULL
Estado              BIT
FechaCreacion       DATETIME NULL
```

---

## Tabla: Pais

```txt
PaisId              INT PK IDENTITY
Pais                NVARCHAR(250)
Descripcion         NVARCHAR(500) NULL
Estado              BIT
FechaCreacion       DATETIME
```

---

## Tabla: Departamento

```txt
DepartamentoId      INT PK IDENTITY
PaisId              INT
Departamento        NVARCHAR(250)
Descripcion         NVARCHAR(500) NULL
Estado              BIT
FechaCreacion       DATETIME
```

---

## Tabla: Ciudad

```txt
CiudadId            INT PK IDENTITY
DepartamentoId      INT
Ciudad              NVARCHAR(250)
Descripcion         NVARCHAR(500) NULL
Estado              BIT
FechaCreacion       DATETIME
```

---

## Tabla: Corregimiento

```txt
CorregimientoId     INT PK IDENTITY
Corregimiento       NVARCHAR(250)
Descripcion         NVARCHAR(500) NULL
Estado              BIT
FechaCreacion       DATETIME
```

---

## Tabla: ConfiguracionIglesia

```txt
ConfiguracionIglesiaId          INT PK IDENTITY
DenominacionId                  INT
IglesiaId                       INT
SitioWeb                        NVARCHAR(250) NULL
Logo                            NVARCHAR(150) NULL
HostEmail                       NVARCHAR(150) NULL
HostUsuarioEmail                NVARCHAR(250) NULL
Host                            NVARCHAR(150) NULL
FromEmail                       NVARCHAR(150) NULL
HostPort                        INT NULL
TextFromEmail                   NVARCHAR(MAX) NULL
KeySecretAPIRecaptcha           NVARCHAR(250) NULL
KeySecretWebRecaptcha           NVARCHAR(250) NULL
InfoTextoEncabezado             NVARCHAR(MAX) NULL
Activa                          BIT
FechaCreacion                   DATETIME2(0)
FechaActualizacion              DATETIME2(0) NULL
```

---

## Tabla: ConfiguracionIglesiaColores

```txt
ConfiguracionIglesiaId      INT PK IDENTITY
DenominacionId              INT
NombreColor                 NVARCHAR(30)
ValorColor                  NVARCHAR(80) NULL
```

Check Constraints:
- CK_ConfiguracionIglesiaColores_NombreColor
- CK_ConfiguracionIglesiaColores_ValorColor_Formato

---

## Tabla: EstructuraOrganizacional

```txt
EstructuraOrganizacionalId      INT PK IDENTITY
DenominacionId                  INT
Descripcion                     NVARCHAR(250)
GrupoEstructuraOrganizacionalId INT
Orden                           INT
Responsable                     NVARCHAR(150) NULL
Estado                          BIT
FechaCreacion                   DATETIME
```

---

## Tabla: EstructurasDenominacion

```txt
EstructuraId        INT PK IDENTITY
DenominacionId      INT
IglesiaId           INT
TipoEstructuraId    INT
PadreId             INT
Nombre              NVARCHAR(150)
Codigo              NVARCHAR(50) NULL
Activa              BIT
FechaCreacion       DATETIME2(0)
```

---

## Tabla: TiposEstructura

```txt
TipoEstructuraId    INT PK IDENTITY
DenominacionId      INT
Nombre              NVARCHAR(30)
Orden               INT
```

---

## Tabla: TokensRefresh

```txt
RefreshTokenId      INT PK
DenominacionId      INT
UsuarioId           INT
IglesiaId           INT
TokenHash           NVARCHAR(128)
ExpiraEn            DATETIME2(0)
RevocadoEn          DATETIME2(0) NULL
ReemplazadoPor      INT NULL
UserAgent           NVARCHAR(256) NULL
Ip                  NVARCHAR(45) NULL
FechaCreacion       DATETIME2(0)
```

Índice:
- IX_TokensRefresh_Expira

---

## Tabla: TokensVerificacionCorreo

```txt
TokenId             INT PK IDENTITY
DenominacionId      INT NULL
UsuarioId           INT NULL
IglesiaId           INT NULL
TokenHash           NVARCHAR(128)
ExpiraEn            DATETIME2(0)
UsadoEn             DATETIME2(0) NULL
FechaCreacion       DATETIME2(0)
```

Índice:
- IX_TokensVerificacionCorreo_Expira

---

# 9. Procedimientos almacenados existentes

## Usuarios

```txt
sp_Usuarios_Insertar
sp_Usuarios_Actualizar
```

---

## Clase

```txt
usp_Clase_Insertar
usp_Clase_Actualizar
usp_Clase_Eliminar
usp_Clase_Listar
usp_Clase_Obtener
```

---

## Estructura Organizacional

```txt
usp_EstructuraOrganizacional_Insertar
usp_EstructuraOrganizacional_Actualizar
usp_EstructuraOrganizacional_Eliminar
usp_EstructuraOrganizacional_Listar
usp_EstructuraOrganizacional_Obtener
```

---

# 10. Entidades base a crear en Domain

## Organización

```txt
Denominacion
Iglesia
ConfiguracionIglesia
ConfiguracionIglesiaColor
```

---

## Ubicación

```txt
Pais
Departamento
Ciudad
Corregimiento
```

---

## Seguridad

```txt
Usuario
UsuarioPerfil
UsuarioIglesia
Rol
UsuarioRol
RefreshToken
TokenVerificacionCorreo
```

---

## Personas

```txt
Registro
```

---

## Menús

```txt
Menu
MenuRol
MenuUsuario
```

---

## Parámetros

```txt
Clase
Parametro
```

---

## Organización estructural

```txt
EstructuraOrganizacional
EstructuraDenominacion
TipoEstructura
IglesiaEstructura
```

---

# 11. DTOs base a crear en Application

## DTOs comunes

```txt
ApiResponseDto<T>
PagedResultDto<T>
SelectDto
```

---

## Organización

```txt
DenominacionDto
IglesiaDto
ConfiguracionIglesiaDto
```

---

## Ubicación

```txt
PaisDto
DepartamentoDto
CiudadDto
CorregimientoDto
```

---

## Seguridad

```txt
UsuarioDto
UsuarioPerfilDto
RolDto
UsuarioRolDto
UsuarioIglesiaDto
```

---

## Personas

```txt
RegistroDto
```

---

## Menús

```txt
MenuDto
MenuRolDto
MenuUsuarioDto
```

---

## Parámetros

```txt
ClaseDto
ParametroDto
```

---

## Organización estructural

```txt
EstructuraOrganizacionalDto
EstructuraDenominacionDto
TipoEstructuraDto
IglesiaEstructuraDto
```

---

# 12. Interfaces base de repositorio

## Organización

```txt
IDenominacionRepository
IIglesiaRepository
IConfiguracionIglesiaRepository
```

---

## Ubicación

```txt
IPaisRepository
IDepartamentoRepository
ICiudadRepository
ICorregimientoRepository
```

---

## Seguridad

```txt
IUsuarioRepository
IRolRepository
IUsuarioRolRepository
IUsuarioIglesiaRepository
```

---

## Personas

```txt
IRegistroRepository
```

---

## Menús

```txt
IMenuRepository
```

---

## Parámetros

```txt
IClaseRepository
IParametroRepository
```

---

## Organización estructural

```txt
IEstructuraOrganizacionalRepository
IEstructuraDenominacionRepository
ITipoEstructuraRepository
IIglesiaEstructuraRepository
```

---

# 13. Organización esperada de carpetas

## Domain

```txt
Entities/
    Organization/
    Security/
    Geography/
    Parameters/
    Structure/
    Registry/

Enums/
Common/
Exceptions/
ValueObjects/
```

---

## Application

```txt
DTOs/
    Organization/
    Security/
    Geography/
    Parameters/
    Structure/
    Registry/
    Common/

Interfaces/
    Persistence/
    Repositories/

Services/
Validators/
Common/
```

---

## Infrastructure

```txt
Repositories/
    Organization/
    Security/
    Geography/
    Parameters/
    Structure/
    Registry/

Persistence/
Security/
Services/
```

---

# 14. Result Pattern base

Crear modelos base reutilizables:

```txt
Result
Result<T>
PagedResult<T>
ErrorResult
SuccessResult
```

Ubicación:

```txt
ROCA.Emuna360.Application/Common/Results
```

---

# 15. Modelos comunes reutilizables

Crear:

```txt
PaginationRequest
PaginationResponse
BaseFilter
BaseAuditDto
```

Ubicación:

```txt
Application/Common
```

---

# 16. Instrucciones de ejecución

## Fase 1 - Análisis

- Revisar la estructura actual de la solución.
- Revisar las tablas SQL Server referenciadas en esta SPEC.
- Revisar los procedimientos almacenados referenciados en esta SPEC.
- Validar relaciones existentes.
- Validar módulos detectados.
- Proponer entidades exactas.
- Proponer DTOs exactos.
- Proponer interfaces exactas.
- Identificar inconsistencias.
- Identificar riesgos técnicos.
- No modificar código.

El análisis debe hacerse exclusivamente sobre:
- Las tablas listadas en esta SPEC.
- Los procedimientos almacenados listados en esta SPEC.
- La estructura SQL Server compartida previamente. :contentReference[oaicite:2]{index=2}

---

## Fase 2 - Implementación

Solo después de aprobar el análisis:

- Crear entidades base.
- Crear DTOs base.
- Crear interfaces base.
- Crear modelos comunes.
- Crear Result Pattern.
- Compilar la solución.
- Entregar resumen final.

---

# 17. Resultado esperado

Al finalizar esta SPEC debe existir:

1. Entidades base creadas.
2. DTOs base creados.
3. Interfaces base creadas.
4. Result Pattern implementado.
5. Modelos comunes implementados.
6. Organización modular de carpetas.
7. Arquitectura preparada para Login.
8. Arquitectura preparada para Roles.
9. Arquitectura preparada para Menús.
10. Arquitectura preparada para módulos futuros.

---

# 18. Criterios de aceptación

- La solución compila correctamente.
- No existe Entity Framework.
- No existe DbContext.
- No se modificó la base de datos.
- No se modificaron procedimientos almacenados.
- Las entidades representan las tablas SQL existentes.
- Los DTOs están organizados correctamente.
- Las interfaces están separadas correctamente.
- Las carpetas siguen Arquitectura Cebolla.
- No existen implementaciones funcionales todavía.