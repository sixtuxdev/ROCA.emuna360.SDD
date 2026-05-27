SPEC-012 - Implementación del módulo de Registro

Yo: Sixto José Romero Martínez
Rol: Desarrollador FullStack
Proyecto: ROCA.Emuna360
Módulo: Registro
Componente: AdminRegistro.razor
Ubicación: ROCA.Emuna360.Presentation.WebUI/Components/Pages/Registry/

Objetivo:
Implementar el módulo de Registro dentro de la solución ROCA.Emuna360, respetando la arquitectura actual del proyecto basada en MVVM, MudBlazor y consumo de API mediante servicios en el Frontend.

El módulo de Registro será el punto principal para iniciar la creación de usuarios. Este módulo debe poder ser utilizado desde dos flujos diferentes:

1. Desde el Login, para registros externos.
2. Desde una opción del menú, según el rol permitido o configurado, para registros internos.

Alcance funcional:
Se debe crear el componente AdminRegistro.razor dentro de la carpeta Components/Pages/Registry/.

El componente debe estar construido siguiendo el mismo estilo visual, estructura y distribución de ConfigIglesias.razor, usando dos secciones principales:

- Sección izquierda: listado, búsqueda o consulta de registros relacionados con la denominación.
- Sección derecha: formulario para crear o administrar la información del registro.

El diseño debe implementarse con MudBlazor y respetar el patrón MVVM actualmente aplicado en el proyecto.

Reglas de negocio:
Cuando el módulo de Registro sea usado desde el Login, el campo Interno de la entidad Registro y RegistroDto debe enviarse en False.

Cuando el módulo de Registro sea usado desde una opción del menú, según el rol permitido o configurado, el campo Interno de la entidad Registro y RegistroDto debe enviarse en True.

Nota importante:
En el criterio de aceptación se indica que si se registran desde el login se debe setear Interno en False para identificar que fue desde el menú. Esto parece tener una inconsistencia en la redacción, ya que si viene desde el Login debe ser externo. Por lo tanto, se debe aplicar la siguiente regla correcta:

- Desde Login: Interno = False.
- Desde Menú: Interno = True.

Backend/API:
En el proyecto API ya existe el controlador:

Controllers/Registry/RegistroController.cs

Se deben consumir los endpoints existentes para:

- Crear registro.
- Consultar registros por Denominación.

No se debe crear lógica duplicada si ya existe en el controlador actual.

Frontend:
En el proyecto ROCA.Emuna360.Presentation.WebUI se debe crear el servicio:

Services/RegistroApiService.cs

Este servicio debe encargarse de consumir los endpoints del controlador RegistroController.cs.

Debe respetarse la forma actual en que el proyecto consume APIs, incluyendo:

- Inyección de HttpClient.
- Manejo del tipo de respuesta usado actualmente en la solución.
- Convenciones de nombres.
- Manejo de errores.
- Serialización y deserialización actual.
- Patrón aplicado en otros servicios existentes.

Componente:
Crear el componente:

Components/Pages/Registry/AdminRegistro.razor

El componente debe:

- Usar MudBlazor.
- Respetar el diseño visual de ConfigIglesias.razor.
- Tener dos secciones: izquierda y derecha.
- Cargar los registros por Denominación.
- Permitir crear nuevos registros.
- Determinar correctamente si el registro es Interno o Externo.
- Usar el servicio RegistroApiService.
- Aplicar el patrón MVVM actual del proyecto.
- Mantener separación entre lógica de UI, ViewModel y servicios.
- No romper la arquitectura existente.
- No duplicar lógica ya implementada.
- No introducir cambios innecesarios en otros módulos.

Acceso desde Login:
Se debe habilitar el acceso al módulo de Registro desde el Login.

Cuando el usuario ingrese al módulo desde el Login:

- El registro debe tratarse como externo.
- Registro.Interno debe ser False.
- RegistroDto.Interno debe ser False.

Acceso desde Menú:
Se debe agregar una opción de menú para acceder al módulo de Registro, únicamente para el rol permitido o configurado según la lógica actual del sistema.

Cuando el usuario ingrese al módulo desde el menú:

- El registro debe tratarse como interno.
- Registro.Interno debe ser True.
- RegistroDto.Interno debe ser True.

Criterios de aceptación:
1. El módulo AdminRegistro.razor existe en Components/Pages/Registry/.
2. El componente respeta el diseño de dos secciones usado en ConfigIglesias.razor.
3. El componente usa MudBlazor.
4. El componente respeta la arquitectura MVVM actual.
5. Existe el servicio RegistroApiService.cs dentro de la carpeta Services del Frontend.
6. RegistroApiService.cs consume correctamente el controlador Controllers/Registry/RegistroController.cs.
7. El módulo permite crear registros.
8. El módulo permite consultar registros por Denominación.
9. Desde el Login, el campo Interno se envía en False.
10. Desde el Menú, el campo Interno se envía en True.
11. La opción del menú solo debe estar disponible para el rol permitido o configurado.
12. No se debe romper ningún flujo existente del Login.
13. No se debe romper ningún flujo existente del menú.
14. No se debe modificar la arquitectura actual del proyecto.
15. No se deben inyectar errores ni realizar cambios innecesarios fuera del alcance de esta SPEC.

Consideraciones técnicas:
Antes de implementar, revisar cómo están construidos actualmente:

- ConfigIglesias.razor
- Su ViewModel asociado
- Los servicios API existentes en ROCA.Emuna360.Presentation.WebUI
- El patrón de consumo HTTP actual
- La forma en que se obtiene la Denominación actual
- La forma en que se controlan permisos o roles en el menú
- El controlador Controllers/Registry/RegistroController.cs
- La entidad Registro
- El DTO RegistroDto

Implementación esperada:
Crear o ajustar los archivos necesarios para implementar correctamente el módulo de Registro, manteniendo el mismo estándar del proyecto.

No se debe improvisar una arquitectura nueva. Se debe seguir la arquitectura existente.

Validaciones:
El formulario de Registro debe aplicar las validaciones necesarias según los campos requeridos por RegistroDto y según las reglas actuales del backend.

El sistema debe mostrar mensajes claros al usuario usando los mecanismos actuales del proyecto, por ejemplo MudSnackbar o el sistema ya implementado.

Resultado esperado:
Al finalizar, el usuario podrá acceder al módulo de Registro desde el Login o desde el Menú.

Cuando acceda desde el Login, los registros se crearán como externos con Interno = False.

Cuando acceda desde el Menú, los registros se crearán como internos con Interno = True.

El módulo debe quedar integrado visual, funcional y arquitectónicamente con ROCA.Emuna360.