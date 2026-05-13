# SPEC-009 - Configuración de Clases y Parámetros con MVVM

## Historia de Usuario

**Yo:** Sixto José Romero Martínez  
**Como:** Desarrollador FullStack  
**Necesito:** Crear el componente de Clase Parámetros en el proyecto `ROCA.Emuna360.Presentation.WebUI`, el cual debe permitir administrar Clases y Parámetros desde una sola pantalla, aplicando el patrón MVVM y respetando la arquitectura actual de la solución.

---

# Objetivo

Implementar el componente:

```text
Components/Pages/Clases/ConfigClases.razor
```

El módulo debe permitir:

- Visualizar las Clases registradas.
- Seleccionar una Clase.
- Visualizar los Parámetros asociados a la Clase seleccionada.
- Crear, editar y eliminar Clases.
- Crear, editar y eliminar Parámetros.
- Asignar Parámetros Padre.
- Aplicar el patrón MVVM.
- Mantener compatibilidad con MudBlazor y el sistema de temas dinámicos institucionales.

---

# Alcance

El desarrollo debe incluir:

- Componente `ConfigClases.razor`.
- ViewModel del módulo.
- Servicios API necesarios.
- Integración completa con APIs existentes.
- Manejo de estados visuales.
- Formularios para CRUD.
- Gestión de Parámetros Padre.
- Integración con autenticación actual.
- Uso correcto del `denominacionId`.

---

# Arquitectura Obligatoria

## Aplicación del patrón MVVM

El módulo debe seguir estrictamente el patrón MVVM aplicado en el proyecto `ROCA.Emuna360.Presentation.WebUI`.

### Reglas obligatorias

- El `.razor` debe contener únicamente:
  - UI.
  - Binding.
  - Eventos mínimos.
- Toda la lógica debe ir en el ViewModel.
- No implementar lógica pesada en el componente Razor.
- Debe respetarse la estructura actual del proyecto.
- Deben reutilizarse servicios existentes.
- No romper Login.
- No romper Menú.
- No modificar arquitectura fuera de lo necesario.

---

# Nombre del Componente

```text
Components/Pages/Clases/ConfigClases.razor
```

---

# Diseño del Componente

La pantalla debe dividirse en dos columnas:

| Columna | Contenido |
|---|---|
| Izquierda | Clases |
| Derecha | Parámetros |

Debe utilizar MudBlazor y mantener diseño responsive.

---

# Columna Izquierda - Clases

Debe incluir:

- Título:
  - `Clases Registradas`
- Subtítulo:
  - `Gestione las clases del sistema`
- Listado de Clases.
- Estado de carga.
- Estado vacío.
- Botón:
  - `Nueva Clase`
- Botón:
  - `Recargar`
- Botón editar.
- Botón eliminar.
- Chip visual:
  - `Activa`
  - `Inactiva`

---

# Selección de Clase

Cuando una Clase sea seleccionada:

- Debe resaltarse visualmente.
- Debe cargarse automáticamente el listado de Parámetros.
- Debe actualizarse el subtítulo del panel derecho.
- Debe mantenerse el estilo institucional.

La selección no debe interferir con:

- Botón editar.
- Botón eliminar.

---

# Columna Derecha - Parámetros

Debe incluir:

- Título:
  - `Parámetros`
- Subtítulo dinámico:
  - `Parámetros de {ClaseSeleccionada}`
- Estado sin Clase seleccionada.
- Estado de carga.
- Estado vacío.
- Listado de Parámetros.
- Botón:
  - `Nuevo Parámetro`
- Botón:
  - `Recargar`
- Botón editar.
- Botón eliminar.
- Chip visual:
  - `Activo`
  - `Inactivo`

---

# Selección de Parámetro

Cuando un Parámetro sea seleccionado:

- Debe resaltarse visualmente.
- Debe mostrarse el panel de asignación de Padre.
- Debe mantenerse el diseño institucional.

La selección no debe interferir con:

- Botón editar.
- Botón eliminar.

---

# Asignación de Parámetro Padre

Cuando exista un Parámetro seleccionado, debe mostrarse una tarjeta adicional con:

- Título:
  - `Asignar Parámetro Padre`
- Subtítulo dinámico.
- Campo `MudAutocomplete`.
- Botón:
  - `Guardar Asociación`
- Botón:
  - `Quitar Padre`

---

# Comportamiento del Autocomplete

El autocomplete debe permitir:

- Buscar parámetros.
- Mostrar si pertenece:
  - A la misma clase.
  - A otra clase.
- Limpiar selección.
- Evitar asociaciones inválidas.

---

# API de Clases

La información de Clases debe consumirse desde:

```text
Controllers/Parameters/ClaseController.cs
```

Debe validarse que la API responda correctamente.

---

# Response esperado de Clases

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

# Crear Clase

Request esperado:

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

---

# Reglas para Crear Clase

- `claseId` no debe enviarse como valor real.
- Es autonumérico.
- `denominacionId` debe obtenerse del usuario autenticado.
- `descripcion` es obligatoria.
- Debe recargarse el listado después de insertar.

---

# Actualizar Clase

- Debe usar el mismo request.
- Debe enviarse el `claseId`.
- Debe mantenerse la selección actual después de actualizar.

---

# API de Parámetros

La información de Parámetros debe obtenerse desde:

```text
Controllers/Parameters/ParametroController.cs
```

---

# Endpoint de Consulta de Parámetros

El componente debe consumir el endpoint:

```text
parametros/clase/{claseId}/denominacion/{denominacionId}
```

Ejemplo:

```text
parametros/clase/1/denominacion/1
```

---

# Response esperado de Parámetros

```json
{
  "success": true,
  "message": "Success",
  "data": [
    {
      "parametroId": 3,
      "denominacionId": 1,
      "claseId": 1,
      "descripcion": "Cédula de Ciudadanía",
      "observacion": "",
      "padreParametroId": null,
      "estado": true,
      "fechaCreacion": null,
      "fechaActualizacion": null
    }
  ]
}
```

---

# Crear Parámetro

Request esperado:

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

---

# Reglas para Crear Parámetro

- `parametroId` es autonumérico.
- No debe enviarse como valor real al insertar.
- `denominacionId` debe obtenerse del usuario autenticado.
- `claseId` debe corresponder a la Clase seleccionada.
- `descripcion` es obligatoria.
- `observacion` es opcional.
- `padreParametroId` debe permitir null.
- Debe recargarse el listado después de insertar.

---

# Actualizar Parámetro

- Debe utilizar el mismo request.
- Debe enviarse el `parametroId`.
- Debe mantenerse el `claseId`.
- Debe mantenerse la selección después de actualizar.

---

# Eliminación de Clases

Debe existir:

- Confirmación antes de eliminar.
- Validación de dependencias.
- Recarga automática del listado.
- Limpieza de selección si la Clase eliminada estaba activa.

---

# Eliminación de Parámetros

Debe existir:

- Confirmación antes de eliminar.
- Validación de hijos asociados.
- Recarga automática.
- Limpieza de selección.

---

# Validaciones Visuales

El módulo debe mostrar:

- Estado cargando Clases.
- Estado cargando Parámetros.
- Estado vacío de Clases.
- Estado vacío de Parámetros.
- Estado sin Clase seleccionada.
- Mensajes de error.
- Mensajes de éxito.

---

# Diseño y Temas

El componente debe:

- Usar MudBlazor.
- Respetar colores institucionales.
- Respetar el tema dinámico.
- Mantener contraste visual correcto.
- Tener diseño moderno.
- Ser responsive.

---

# Servicios API

Deben existir servicios para:

- Obtener Clases.
- Crear Clase.
- Actualizar Clase.
- Eliminar Clase.
- Obtener Parámetros por Clase y Denominación.
- Crear Parámetro.
- Actualizar Parámetro.
- Eliminar Parámetro.
- Buscar Parámetros Padre.
- Asociar Padre.
- Quitar Padre.

---

# Manejo del DenominacionId

El `denominacionId`:

- Debe obtenerse desde el usuario autenticado.
- No debe quedar quemado.
- Debe reutilizar el mecanismo actual del proyecto.
- Puede obtenerse desde:
  - LocalStorage.
  - AuthStateProvider.
  - SessionService existente.

---

# Restricciones Técnicas

- No usar Entity Framework si la solución trabaja con API/Dapper.
- No inventar endpoints.
- No romper Login.
- No romper Menú.
- No romper navegación.
- No modificar arquitectura fuera del alcance.
- Respetar MVVM.
- Respetar la estructura actual del proyecto.

---

# Resultado Esperado

Al finalizar:

- El usuario podrá administrar Clases y Parámetros desde una sola pantalla.
- El módulo funcionará usando MVVM.
- Las APIs estarán integradas correctamente.
- El diseño será responsive.
- El sistema respetará MudBlazor y los colores institucionales.
- Las asociaciones Padre/Hijo funcionarán correctamente.

---

# Definition of Done

- Existe `ConfigClases.razor`.
- Existe el ViewModel del módulo.
- El módulo compila correctamente.
- Las APIs responden correctamente.
- Las Clases cargan correctamente.
- Los Parámetros cargan correctamente.
- CRUD de Clases funcionando.
- CRUD de Parámetros funcionando.
- Asociación de Padre funcionando.
- Eliminación funcionando.
- Responsive funcionando.
- Login intacto.
- Menú intacto.
- Arquitectura MVVM respetada.
- Tema institucional funcionando correctamente.

---

# Referencia Base del Diseño

El diseño debe basarse en el código MudBlazor entregado como referencia en el requerimiento original y adaptarse respetando la arquitectura MVVM actual del proyecto.

---

# Nota Importante

Antes de implementar:

- Analiza cómo está construido actualmente el proyecto `ROCA.Emuna360.Presentation.WebUI`.
- Analiza cómo están construidos:
  - Los servicios API.
  - Los ViewModels.
  - La navegación.
  - Los temas.
  - Los componentes MudBlazor.
- Reutiliza patrones existentes.
- No inventes nuevas estructuras si ya existen implementaciones equivalentes.
