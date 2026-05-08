# SPEC-001 - Creación de Arquitectura Base ROCA.Emuna360

## 1. Objetivo

Crear la arquitectura base de la solución ROCA.Emuna360 aplicando Arquitectura Cebolla y principios de Arquitectura Limpia, manteniendo el proyecto actual de presentación ya existente.

Esta primera especificación no debe implementar módulos funcionales, entidades de negocio, login, usuarios, registros, denominaciones ni reglas del dominio.

---

# 2. Contexto actual

La solución actual se llama:

ROCA.Emuna360

Actualmente contiene un único proyecto:

src/Presentation/ROCA.Emuna360.Presentation.WebUI

El proyecto existente corresponde a la capa de presentación y ya está construido con:

- .NET 9
- Blazor
- MudBlazor

---

# 3. Alcance

Esta especificación cubre únicamente:

- Crear la estructura base de carpetas.
- Crear los proyectos base de la arquitectura.
- Configurar referencias entre proyectos.
- Preparar la capa de infraestructura.
- Preparar el acceso a SQL Server con Dapper y ADO.NET.
- Crear clases base para inyección de dependencias.
- Mantener el proyecto WebUI existente.
- Dejar la solución lista para futuras especificaciones funcionales.

---

# 4. Fuera de alcance

No se debe implementar todavía:

- Login
- Usuarios
- Roles
- Permisos
- Registros
- Denominaciones
- Iglesias
- Menús
- Dashboard
- CRUDs
- Entidades de negocio
- Reglas de negocio
- JWT
- Autenticación
- Autorización

---

# 5. Reglas obligatorias

1. No usar Entity Framework.
2. No crear DbContext.
3. No crear entidades de negocio en esta SPEC.
4. No implementar módulos funcionales.
5. Usar Dapper únicamente en la capa Infrastructure.
6. Usar ADO.NET para conexiones hacia SQL Server.
7. La base de datos será SQL Server.
8. Mantener .NET 9 en todos los proyectos.
9. Mantener el proyecto existente ROCA.Emuna360.Presentation.WebUI.
10. No eliminar ni dañar archivos existentes del WebUI.
11. Aplicar Arquitectura Cebolla.
12. Aplicar principios de Arquitectura Limpia.
13. Separar responsabilidades por capas.
14. Registrar dependencias mediante IServiceCollection.
15. La capa Domain no debe depender de ningún proyecto.
16. La capa Application solo debe depender de Domain.
17. La capa Infrastructure debe depender de Application y Domain.
18. La capa Presentation.WebUI debe depender de Application e Infrastructure.

---

# 6. Estructura esperada

```txt
src/
├── Core/
│   ├── ROCA.Emuna360.Domain/
│   └── ROCA.Emuna360.Application/
│
├── Infrastructure/
│   └── ROCA.Emuna360.Infrastructure/
│
└── Presentation/
    └── ROCA.Emuna360.Presentation.WebUI/
```

---

# 7. Proyectos a crear

## ROCA.Emuna360.Domain

### Tipo de proyecto

- Class Library
- .NET 9

### Responsabilidad

Contener el núcleo del dominio en futuras SPEC.

En esta SPEC solo debe quedar la estructura base.

### Carpetas iniciales

```txt
Common
Entities
Enums
Exceptions
ValueObjects
```

No crear entidades reales todavía.

---

## ROCA.Emuna360.Application

### Tipo de proyecto

- Class Library
- .NET 9

### Responsabilidad

Contener contratos, casos de uso y servicios de aplicación en futuras SPEC.

En esta SPEC solo debe quedar la estructura base y contratos técnicos mínimos.

### Carpetas iniciales

```txt
Common
DTOs
Interfaces
Services
Validators
```

---

## ROCA.Emuna360.Infrastructure

### Tipo de proyecto

- Class Library
- .NET 9

### Responsabilidad

Contener implementaciones técnicas.

Configurar acceso a SQL Server usando Dapper y ADO.NET.

Preparar la infraestructura para futuras SPEC.

### Carpetas iniciales

```txt
DependencyInjection
Persistence
Repositories
Security
Services
```

---

## ROCA.Emuna360.Presentation.WebUI

Proyecto existente.

### Responsabilidad

- Mantener la capa de presentación actual.
- Conservar Blazor y MudBlazor.
- Registrar las dependencias de Application e Infrastructure.

No se debe reemplazar ni recrear este proyecto.

---

# 8. Referencias entre proyectos

```txt
ROCA.Emuna360.Domain
  → Sin referencias internas

ROCA.Emuna360.Application
  → ROCA.Emuna360.Domain

ROCA.Emuna360.Infrastructure
  → ROCA.Emuna360.Application
  → ROCA.Emuna360.Domain

ROCA.Emuna360.Presentation.WebUI
  → ROCA.Emuna360.Application
  → ROCA.Emuna360.Infrastructure
```

---

# 9. Paquetes NuGet

Instalar únicamente en:

```txt
ROCA.Emuna360.Infrastructure
```

Paquetes:

```txt
Dapper
Microsoft.Data.SqlClient
```

No instalar Entity Framework ni paquetes relacionados.

---

# 10. Contrato de conexión

## Archivo

```txt
ROCA.Emuna360.Application/Interfaces/Persistence/ISqlConnectionFactory.cs
```

## Contenido esperado

```csharp
using System.Data;

namespace ROCA.Emuna360.Application.Interfaces.Persistence;

public interface ISqlConnectionFactory
{
    IDbConnection CreateConnection();
}
```

---

# 11. Implementación de conexión

## Archivo

```txt
ROCA.Emuna360.Infrastructure/Persistence/SqlConnectionFactory.cs
```

## Contenido esperado

```csharp
using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using ROCA.Emuna360.Application.Interfaces.Persistence;

namespace ROCA.Emuna360.Infrastructure.Persistence;

public sealed class SqlConnectionFactory : ISqlConnectionFactory
{
    private readonly string _connectionString;

    public SqlConnectionFactory(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection")
            ?? throw new InvalidOperationException("La cadena de conexión 'DefaultConnection' no está configurada.");
    }

    public IDbConnection CreateConnection()
    {
        return new SqlConnection(_connectionString);
    }
}
```

---

# 12. Dependency Injection en Application

## Archivo

```txt
ROCA.Emuna360.Application/DependencyInjection.cs
```

## Contenido esperado

```csharp
using Microsoft.Extensions.DependencyInjection;

namespace ROCA.Emuna360.Application;

public static class DependencyInjection
{
    public static IServiceCollection AddApplication(this IServiceCollection services)
    {
        return services;
    }
}
```

---

# 13. Dependency Injection en Infrastructure

## Archivo

```txt
ROCA.Emuna360.Infrastructure/DependencyInjection.cs
```

## Contenido esperado

```csharp
using Microsoft.Extensions.DependencyInjection;
using ROCA.Emuna360.Application.Interfaces.Persistence;
using ROCA.Emuna360.Infrastructure.Persistence;

namespace ROCA.Emuna360.Infrastructure;

public static class DependencyInjection
{
    public static IServiceCollection AddInfrastructure(this IServiceCollection services)
    {
        services.AddScoped<ISqlConnectionFactory, SqlConnectionFactory>();

        return services;
    }
}
```

---

# 14. Configuración en Presentation.WebUI

En el proyecto WebUI existente, configurar el registro de servicios:

```csharp
using ROCA.Emuna360.Application;
using ROCA.Emuna360.Infrastructure;

builder.Services.AddApplication();
builder.Services.AddInfrastructure();
```

Debe agregarse en `Program.cs` sin afectar las configuraciones existentes de Blazor y MudBlazor.

---

# 15. Cadena de conexión

Agregar o validar en:

```txt
appsettings.json
```

## Contenido

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=.;Database=ROCA.Emuna360;Trusted_Connection=True;TrustServerCertificate=True;"
  }
}
```

La cadena puede ajustarse según el entorno local.

---

# 16. Principios arquitectónicos obligatorios

La solución debe respetar:

- Separación de responsabilidades.
- Bajo acoplamiento.
- Alta cohesión.
- Inversión de dependencias.
- Infraestructura dependiente de contratos.
- Dominio independiente.
- Presentación sin acceso directo a SQL.
- Acceso a datos centralizado en Infrastructure.
- Código preparado para escalar por módulos futuros.

---

# 17. Resultado esperado

Al finalizar esta SPEC debe existir:

1. Solución organizada por capas.
2. Proyecto Domain creado.
3. Proyecto Application creado.
4. Proyecto Infrastructure creado.
5. Proyecto WebUI existente conservado.
6. Referencias configuradas correctamente.
7. Dapper instalado solo en Infrastructure.
8. Microsoft.Data.SqlClient instalado solo en Infrastructure.
9. ISqlConnectionFactory creado en Application.
10. SqlConnectionFactory creado en Infrastructure.
11. DependencyInjection creado en Application.
12. DependencyInjection creado en Infrastructure.
13. Program.cs del WebUI configurado.
14. appsettings.json preparado con ConnectionStrings.
15. Solución compilando correctamente.

---

# 18. Criterios de aceptación

- La solución compila sin errores.
- El proyecto WebUI sigue funcionando.
- No existe Entity Framework instalado.
- No existe DbContext.
- Dapper solo está instalado en Infrastructure.
- Domain no referencia ningún proyecto.
- Application referencia únicamente Domain.
- Infrastructure referencia Application y Domain.
- WebUI referencia Application e Infrastructure.
- No se crearon entidades funcionales.
- No se implementó Login ni ningún módulo de negocio.

---

# 19. Prompt para Antigravity

Necesito trabajar sobre la solución existente ROCA.Emuna360.

Actualmente la solución contiene un único proyecto:

src/Presentation/ROCA.Emuna360.Presentation.WebUI

Este proyecto ya existe, está construido con .NET 9, Blazor y MudBlazor.

Necesito implementar únicamente la SPEC-001: creación de arquitectura base aplicando Arquitectura Cebolla y principios de Arquitectura Limpia.

## Reglas obligatorias

- No implementar Login.
- No implementar Usuarios.
- No implementar Registros.
- No implementar Denominaciones.
- No implementar Iglesias.
- No implementar Roles.
- No implementar Permisos.
- No implementar entidades de negocio.
- No implementar módulos funcionales.
- No usar Entity Framework.
- No crear DbContext.
- Usar Dapper únicamente en Infrastructure.
- Usar ADO.NET para conexiones a SQL Server.
- Mantener .NET 9 en todos los proyectos.
- Mantener y respetar el proyecto WebUI existente.
- No eliminar ni dañar archivos existentes del WebUI.

## La solución debe quedar organizada así

```txt
src/Core/ROCA.Emuna360.Domain
src/Core/ROCA.Emuna360.Application
src/Infrastructure/ROCA.Emuna360.Infrastructure
src/Presentation/ROCA.Emuna360.Presentation.WebUI
```

## Crear los proyectos

- ROCA.Emuna360.Domain
- ROCA.Emuna360.Application
- ROCA.Emuna360.Infrastructure

## Configurar referencias

- Application referencia Domain.
- Infrastructure referencia Application y Domain.
- Presentation.WebUI referencia Application e Infrastructure.
- Domain no referencia ningún proyecto.

## Crear estructura base de carpetas

### Domain

```txt
Common
Entities
Enums
Exceptions
ValueObjects
```

### Application

```txt
Common
DTOs
Interfaces
Services
Validators
```

### Infrastructure

```txt
DependencyInjection
Persistence
Repositories
Security
Services
```

## Crear en Application la interfaz

```txt
ROCA.Emuna360.Application/Interfaces/Persistence/ISqlConnectionFactory.cs
```

Debe retornar IDbConnection.

## Crear en Infrastructure la implementación

```txt
ROCA.Emuna360.Infrastructure/Persistence/SqlConnectionFactory.cs
```

Debe usar IConfiguration, Microsoft.Data.SqlClient y retornar SqlConnection como IDbConnection.

## Crear clase DependencyInjection en Application

Debe contener:

```csharp
AddApplication()
```

## Crear clase DependencyInjection en Infrastructure

Debe contener:

```csharp
AddInfrastructure()
```

Y registrar:

```csharp
ISqlConnectionFactory
SqlConnectionFactory
```

## Instalar en Infrastructure únicamente

```txt
Dapper
Microsoft.Data.SqlClient
```

## Actualizar Program.cs del WebUI

Registrar:

```csharp
builder.Services.AddApplication();
builder.Services.AddInfrastructure();
```

## Agregar o validar en appsettings.json

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=.;Database=ROCA.Emuna360;Trusted_Connection=True;TrustServerCertificate=True;"
  }
}
```

## Al finalizar entregar

1. Estructura final de carpetas.
2. Proyectos creados.
3. Referencias configuradas.
4. Paquetes NuGet instalados.
5. Archivos creados.
6. Archivos modificados.
7. Validación de que no se usó Entity Framework.
8. Validación de que no se creó DbContext.
9. Confirmación de que no se implementó ningún módulo funcional.
10. Confirmación de que la solución compila correctamente.