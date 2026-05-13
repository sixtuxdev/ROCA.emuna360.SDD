# SPEC-009 - Configuración de Clases y Parámetros con MVVM

## Historia de Usuario

**Yo:** Sixto José Romero Martínez  
**Como:** Desarrollador FullStack  
**Necesito:** Crear el componente de Clase Parámetros en el proyecto `ROCA.Emuna360.Presentation.WebUI`, aplicando el patrón MVVM, para gestionar Clases y Parámetros desde una misma pantalla.

---

# Objetivo

Implementar el componente:

```text
Components/Pages/Clases/ConfigClases.razor
```

El componente debe permitir gestionar Clases y Parámetros en una sola pantalla:

- En el lado izquierdo se deben mostrar las Clases registradas.
- En el lado derecho se deben mostrar los Parámetros asociados a la Clase seleccionada.
- El módulo debe respetar el patrón MVVM.
- El diseño debe estar basado en MudBlazor.
- Debe usar los colores institucionales y el sistema de tema actual.

---

# Alcance

El desarrollo debe incluir:

- Componente Blazor `ConfigClases.razor`.
- ViewModel correspondiente para manejar la lógica del componente.
- Consumo de API de Clases.
- Consumo de API de Parámetros.
- Carga de Clases por Denominación.
- Carga de Parámetros por Clase seleccionada.
- Crear, editar y eliminar Clases.
- Crear, editar y eliminar Parámetros.
- Asignar Parámetro Padre.
- Quitar asociación de Parámetro Padre.
- Manejo de estados de carga, datos vacíos y errores.
- Validaciones necesarias antes de enviar información a la API.

---

# Criterios de Aceptación

## 1. Aplicación del patrón MVVM

- El componente `ConfigClases.razor` debe contener únicamente la estructura visual y enlaces a eventos.
- La lógica de negocio, carga de datos, selección, creación, edición, eliminación y guardado debe estar en un ViewModel.
- El ViewModel debe manejar los estados:
  - Cargando Clases.
  - Cargando Parámetros.
  - Clase seleccionada.
  - Parámetro seleccionado.
  - Parámetro padre seleccionado.
  - Guardando asociación de padre.
  - Listado de Clases.
  - Listado de Parámetros.
- No se debe implementar lógica pesada directamente en el `.razor`.

---

## 2. Componente principal

Debe crearse el componente:

```text
Components/Pages/Clases/ConfigClases.razor
```

Este componente debe estar basado en la estructura HTML/MudBlazor entregada como referencia, respetando la arquitectura actual del proyecto.

La pantalla debe estar dividida en dos columnas:

### Columna izquierda: Clases

Debe mostrar:

- Título: `Clases Registradas`.
- Subtítulo: `Gestione las clases del sistema`.
- Listado de Clases.
- Estado de carga.
- Estado vacío.
- Botón `Nueva Clase`.
- Botón `Recargar`.
- Botón para editar cada Clase.
- Botón para eliminar cada Clase.
- Chip de estado:
  - `Activa`
  - `Inactiva`

### Columna derecha: Parámetros

Debe mostrar:

- Título: `Parámetros`.
- Subtítulo dinámico según la Clase seleccionada.
- Estado cuando no hay Clase seleccionada.
- Estado de carga.
- Estado vacío.
- Listado de Parámetros.
- Botón `Nuevo Parámetro`.
- Botón `Recargar`.
- Botón para editar cada Parámetro.
- Botón para eliminar cada Parámetro.
- Chip de estado:
  - `Activo`
  - `Inactivo`

---

## 3. Selección de Clase

- Al seleccionar una Clase en la columna izquierda, se deben cargar automáticamente los Parámetros asociados a esa Clase.
- La Clase seleccionada debe tener un estilo visual diferente.
- El estilo seleccionado debe respetar los colores institucionales.
- La selección no debe interferir con los botones de editar y eliminar.

---

## 4. Selección de Parámetro

- Al seleccionar un Parámetro, debe mostrarse la sección para asignar Parámetro Padre.
- El Parámetro seleccionado debe tener un estilo visual diferente.
- El estilo seleccionado debe respetar los colores institucionales.
- La selección no debe interferir con los botones de editar y eliminar.

---

## 5. Asignar Parámetro Padre

Cuando exista un Parámetro seleccionado, se debe mostrar una tarjeta con:

- Título: `Asignar Parámetro Padre`.
- Subtítulo dinámico con la descripción del Parámetro seleccionado.
- Campo `MudAutocomplete` para buscar Parámetro Padre.
- Botón `Guardar Asociación`.
- Botón `Quitar Padre`.

El campo de búsqueda debe permitir:

- Buscar Parámetros disponibles.
- Mostrar si el Parámetro pertenece a la misma Clase o a otra Clase.
- Limpiar la selección.
- Evitar asignaciones inválidas.

---

## 6. API de Clases

La información de Clases debe obtenerse desde:

```text
Controllers/Parameters/ClaseController.cs
```

Se debe validar que la API devuelva correctamente la información.

### Ejemplo de respuesta esperada

```json
{
  "success": true,
  "message": "Success",
  "data": [
    {
      "claseId": 2,
      "denominacionId": 1,
      "descripcion": "Sexo",
      "estado": true,
      "fechaCreacion": "0001-01-01T00:00:00",
      "fechaActualizacion": null
    },
    {
      "claseId": 1,
      "denominacionId": 1,
      "descripcion": "Tipos de Documentos",
      "estado": true,
      "fechaCreacion": "0001-01-01T00:00:00",
      "fechaActualizacion": null
    }
  ]
}
```

---

## 7. Crear Clase

Para crear una Clase, el request debe basarse en la siguiente estructura:

```json
{
  "fechaCreacion": "2026-05-13T22:25:36.062Z",
  "fechaActualizacion": "2026-05-13T22:25:36.062Z",
  "claseId": 0,
  "denominacionId": 0,
  "descripcion": "string",
  "estado": true
}
```

### Reglas

- `claseId` no debe enviarse como valor real al insertar, porque es autonumérico en base de datos.
- `denominacionId` debe tomarse desde el contexto del usuario autenticado.
- `descripcion` es obligatoria.
- `estado` debe enviarse correctamente.
- Después de crear, se debe recargar el listado de Clases.

---

## 8. Actualizar Clase

Para actualizar una Clase:

- Se debe usar la misma estructura del request de creación.
- Se debe enviar el `claseId` de la Clase seleccionada.
- Se debe actualizar la información en la API correspondiente.
- Después de actualizar, se debe recargar el listado de Clases.
- Si la Clase actualizada estaba seleccionada, debe mantenerse o refrescarse correctamente la selección.

---

## 9. API de Parámetros

La información de Parámetros debe obtenerse desde:

```text
Controllers/Parameters/ParametroController.cs
```

Se debe validar que la API devuelva correctamente la información.

### Ejemplo de respuesta esperada

```json
{
  "success": true,
  "message": "Success",
  "data": [{
    "parametroId": 1,
    "denominacionId": 1,
    "claseId": 1,
    "descripcion": "Registro Civil",
    "observacion": "Para menores de 7 años",
    "padreParametroId": null,
    "estado": true,
    "fechaCreacion": null,
    "fechaActualizacion": null
  }]
}
```

---

## 10. Crear Parámetro

Para crear un Parámetro, el request debe basarse en la siguiente estructura:

```json
{
  "fechaCreacion": "2026-05-13T22:29:34.100Z",
  "fechaActualizacion": "2026-05-13T22:29:34.100Z",
  "parametroId": 0,
  "denominacionId": 0,
  "claseId": 0,
  "descripcion": "string",
  "observacion": "string",
  "padreParametroId": 0,
  "estado": true
}
```

### Reglas

- `parametroId` no debe enviarse como valor real al insertar, porque es autonumérico en base de datos.
- `denominacionId` debe tomarse desde el contexto del usuario autenticado.
- `claseId` debe ser el ID de la Clase seleccionada.
- `descripcion` es obligatoria.
- `observacion` debe permitirse como campo opcional.
- `padreParametroId` debe permitirse como `null` cuando no tenga padre.
- Después de crear, se debe recargar el listado de Parámetros de la Clase seleccionada.

---

## 11. Actualizar Parámetro

Para actualizar un Parámetro:

- Se debe usar la misma estructura del request de creación.
- Se debe enviar el `parametroId` del Parámetro seleccionado.
- Se debe mantener el `claseId` correspondiente.
- Se debe actualizar la información en la API correspondiente.
- Después de actualizar, se debe recargar el listado de Parámetros.
- Si el Parámetro actualizado estaba seleccionado, debe mantenerse o refrescarse correctamente la selección.

---

## 12. Eliminación de Clases

- Debe existir una opción para eliminar una Clase.
- Antes de eliminar, debe mostrarse una confirmación.
- Si la Clase tiene Parámetros asociados, se debe validar el comportamiento permitido por la API.
- Después de eliminar, se debe recargar el listado de Clases.
- Si la Clase eliminada estaba seleccionada, se debe limpiar la selección y el listado de Parámetros.

---

## 13. Eliminación de Parámetros

- Debe existir una opción para eliminar un Parámetro.
- Antes de eliminar, debe mostrarse una confirmación.
- Si el Parámetro tiene hijos asociados, se debe validar el comportamiento permitido por la API.
- Después de eliminar, se debe recargar el listado de Parámetros.
- Si el Parámetro eliminado estaba seleccionado, se debe limpiar la selección.

---

## 14. Validaciones visuales

El componente debe mostrar correctamente:

- Estado cargando Clases.
- Estado cargando Parámetros.
- Estado sin Clases registradas.
- Estado sin Clase seleccionada.
- Estado sin Parámetros registrados.
- Mensajes de error cuando una operación falle.
- Mensajes de éxito cuando una operación se complete correctamente.

---

## 15. Diseño y colores institucionales

- El componente debe usar MudBlazor.
- Se deben respetar los colores institucionales configurados en el tema actual.
- Los ítems seleccionados deben tener buen contraste visual.
- Los botones principales deben usar `Color.Primary`.
- Los íconos deben usar colores coherentes con el estado visual.
- El diseño debe ser limpio, moderno y responsive.
- La vista debe funcionar correctamente en escritorio y pantallas medianas.

---

## 16. Servicios API

Deben existir o ajustarse los servicios necesarios para consumir:

```text
Controllers/Parameters/ClaseController.cs
Controllers/Parameters/ParametroController.cs
```

Los servicios deben manejar:

- Obtener Clases por Denominación.
- Crear Clase.
- Actualizar Clase.
- Eliminar Clase.
- Obtener Parámetros por Clase.
- Crear Parámetro.
- Actualizar Parámetro.
- Eliminar Parámetro.
- Asignar Parámetro Padre.
- Quitar Parámetro Padre.
- Buscar Parámetros para el autocomplete.

---

## 17. Manejo de Denominación

- El `denominacionId` debe obtenerse desde el contexto actual del usuario autenticado.
- No debe quedar quemado en el componente.
- Si el proyecto usa LocalStorage para almacenar `authDenominacionId`, se debe usar esa fuente.
- Si ya existe un servicio de sesión/autenticación, debe reutilizarse.

---

## 18. Restricciones Técnicas

- No romper el Login.
- No romper el Menú.
- No modificar arquitectura existente fuera de lo necesario.
- No implementar lógica pesada directamente en el componente `.razor`.
- No usar Entity Framework si el proyecto está trabajando con Dapper/API.
- No inventar endpoints si ya existen controladores para Clases y Parámetros.
- Validar primero la estructura actual de los controladores y servicios antes de implementar.

---

# Resultado Esperado

Al finalizar la implementación:

- El usuario podrá entrar al componente `ConfigClases.razor`.
- Podrá ver las Clases registradas por Denominación.
- Podrá crear, editar y eliminar Clases.
- Podrá seleccionar una Clase y ver sus Parámetros.
- Podrá crear, editar y eliminar Parámetros.
- Podrá asignar o quitar un Parámetro Padre.
- Todo el módulo funcionará usando MVVM.
- La pantalla respetará MudBlazor, el tema dinámico y los colores institucionales.
- Las APIs de Clases y Parámetros serán consumidas correctamente.

---

# Definition of Done

- El componente `ConfigClases.razor` existe y compila correctamente.
- El ViewModel del módulo existe y contiene la lógica principal.
- Los servicios API necesarios están implementados o ajustados.
- Las Clases se cargan correctamente desde la API.
- Los Parámetros se cargan correctamente según la Clase seleccionada.
- Crear, actualizar y eliminar Clases funciona correctamente.
- Crear, actualizar y eliminar Parámetros funciona correctamente.
- La asignación de Parámetro Padre funciona correctamente.
- La eliminación de Parámetro Padre funciona correctamente.
- El diseño es responsive.
- No se rompe el Login.
- No se rompe el Menú.
- No se rompe el patrón MVVM aplicado en el proyecto.