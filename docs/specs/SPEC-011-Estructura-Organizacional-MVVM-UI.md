# SPEC-011-Estructura-Organizacional-MVVM-UI

## Información General

| Campo | Valor |
|---|---|
| SPEC | SPEC-011-Estructura-Organizacional-MVVM-UI |
| Proyecto | ROCA.Emuna360 |
| Tipo | UI / MVVM |
| Arquitectura | MVVM |
| Framework UI | Blazor + MudBlazor |
| Autor | Sixto José Romero Martínez |
| Estado | Pendiente |
| Prioridad | Alta |

---

# Historia de Usuario

## Yo:
Sixto José Romero Martínez

## Como:
Desarrollador FullStack

## Necesito:
Implementar el módulo de Estructura Organizacional.

La funcionalidad de Estructura Organizacional permitirá crear y administrar jerarquías dinámicas y multinivel dentro de la plataforma, donde cada elemento podrá tener hijos y estos a su vez nuevos niveles descendientes, formando una estructura tipo árbol recursiva.

Esto permitirá modelar organizaciones complejas como:
- Zonas
- Regiones
- Distritos
- Iglesias
- Ministerios
- Departamentos
- Equipos
- Subgrupos

La estructura debe soportar niveles ilimitados de profundidad manteniendo la relación Padre → Hijo entre los registros.

## Para:
Poder administrar estructuras organizacionales jerárquicas dinámicas y escalables dentro de la plataforma ROCA.Emuna360.

---

# Objetivo

Desarrollar el módulo de configuración de Estructura Organizacional utilizando el patrón MVVM y MudBlazor, permitiendo visualizar, crear, editar y administrar estructuras organizacionales jerárquicas mediante un TreeView dinámico.

---

# Alcance

La implementación aplica únicamente para:

- Proyecto:
  - `ROCA.Emuna360.Presentation.WebUI`

No se deben realizar modificaciones fuera del alcance requerido.

No se debe romper la arquitectura actual implementada.

---

# Arquitectura Obligatoria

## Arquitectura General

- Debe respetarse completamente la arquitectura MVVM ya implementada.
- Debe utilizarse MudBlazor.
- No se deben crear arquitecturas paralelas.
- No se debe romper el patrón actual de componentes, ViewModels y Services.
- Deben reutilizarse los componentes y servicios existentes cuando aplique.
- Debe mantenerse la separación de responsabilidades.
- No debe implementarse lógica de negocio directamente en los componentes Razor.

---

# Componente Obligatorio

## Ruta Obligatoria

El componente debe existir exactamente en:

```plaintext
Components/Pages/EstructuraOrganizacional/ConfigEstructuraOrganizacional.razor
```

## Nombre Obligatorio

```plaintext
ConfigEstructuraOrganizacional.razor
```

No se debe cambiar el nombre del componente.

---

# Diseño General del Componente

El componente debe contener obligatoriamente 2 secciones principales:

| Sección | Descripción |
|---|---|
| Izquierda | TreeView jerárquico de estructuras organizacionales |
| Derecha | Formulario de creación/edición |

---

# Plantilla Base Obligatoria del Componente

La estructura Razor/HTML compartida en esta SPEC debe utilizarse como guía base obligatoria para la implementación del componente `ConfigEstructuraOrganizacional.razor`.

La implementación debe respetar:

- Distribución visual de 2 columnas.
- Uso de MudGrid.
- Uso de MudCard.
- Uso de MudPaper.
- Uso de MudTreeView.
- Estados visuales:
  - Loading
  - Empty State
  - Data State
- Scroll vertical para el árbol.
- Formulario lateral derecho.
- Botones de acción.
- Organización visual general.

El desarrollador puede mejorar visualmente la implementación siempre que:
- Mantenga la arquitectura actual.
- Mantenga MudBlazor.
- Mantenga MVVM.
- No rompa la estructura funcional definida.
- No elimine funcionalidades definidas en esta SPEC.

La plantilla Razor suministrada en esta SPEC debe tomarse como referencia principal de diseño, comportamiento y organización del componente.

---

# Diseño UI Obligatorio

## Sección Izquierda

Debe contener:

- TreeView jerárquico
- Estado de carga
- Estado vacío
- Botón recargar
- Scroll vertical
- Expansión de nodos
- Selección de nodos
- Jerarquía visual Padre → Hijo

---

# Funcionalidad del TreeView

## El TreeView debe permitir:

- Visualizar estructuras organizacionales jerárquicas
- Expandir nodos
- Contraer nodos
- Seleccionar nodos
- Mostrar hijos dinámicamente
- Mostrar niveles ilimitados
- Reflejar correctamente la relación Padre → Hijo
- Mantener correctamente la jerarquía

---

# Sección Derecha

Debe contener el formulario de:

- Crear estructura organizacional
- Editar estructura organizacional

Debe contener:

| Campo | Tipo |
|---|---|
| Denominación | Solo lectura |
| Descripción | Requerido |
| Responsable | Requerido |
| Estructura Padre | Opcional |
| Estado | Requerido |

---

# DTO Obligatorio

## DTO Existente

Debe utilizarse obligatoriamente el DTO existente ubicado en:

```plaintext
ROCA.Emuna360.Application/DTOs/Structure/EstructuraOrganizacionalDto.cs
```

## Restricciones

- No se deben crear nuevos DTOs.
- No se deben duplicar modelos.
- No se deben crear clases paralelas.
- Debe reutilizarse el DTO existente.

---

# API Obligatoria

## Controlador Obligatorio

Debe utilizarse el controlador existente:

```plaintext
ROCA.Emuna360.API/Controllers/Structure/EstructuraOrganizacionalController.cs
```

## Restricciones

- No se deben crear nuevos controladores.
- No se deben duplicar endpoints.
- Debe respetarse la arquitectura actual de APIs.

---

# Servicios

## Servicios Requeridos

Debe crearse el servicio necesario para consumir las APIs.

## Restricciones

- Debe respetarse la arquitectura actual.
- Debe seguirse el patrón de servicios ya aplicado.
- No deben inventarse estructuras nuevas.
- Deben aplicarse buenas prácticas.

---

# Responsabilidad del Frontend

El Frontend únicamente será responsable de:

- Consumir correctamente las APIs existentes.
- Utilizar correctamente los DTOs existentes.
- Enviar correctamente la información requerida.
- Obtener correctamente la estructura jerárquica.
- Representar visualmente la jerarquía.
- Administrar el comportamiento visual del TreeView.
- Administrar el comportamiento visual del formulario.

---

# Responsabilidad de la API

La API ya contiene la lógica necesaria para:

- Persistencia
- Creación jerárquica
- Relaciones Padre → Hijo
- Validaciones internas
- Manejo de estructura organizacional

El Frontend NO debe duplicar lógica de negocio.

---

# Requerimientos Funcionales

## RF-001
El sistema debe permitir crear nodos raíz sin necesidad de un padre asociado.

## RF-002
El sistema debe permitir crear nodos hijos asociados a cualquier nodo existente.

## RF-003
Cada nodo debe mantener correctamente la relación Padre → Hijo.

## RF-004
La estructura organizacional debe soportar niveles ilimitados.

## RF-005
El sistema debe visualizar la estructura utilizando TreeView.

## RF-006
El usuario debe poder expandir nodos.

## RF-007
El usuario debe poder contraer nodos.

## RF-008
El usuario debe poder seleccionar nodos.

## RF-009
El usuario debe poder crear hijos desde el nodo seleccionado.

## RF-010
El sistema debe permitir editar estructuras organizacionales.

## RF-011
El sistema debe permitir eliminar estructuras organizacionales según reglas de negocio.

## RF-012
El sistema debe reflejar correctamente la relación jerárquica Padre → Hijo.

## RF-013
El sistema debe mantener la jerarquía correctamente después de guardar.

## RF-014
El sistema debe cargar hijos automáticamente al expandir nodos.

## RF-015
El sistema debe soportar estructuras profundas.

## RF-016
El sistema debe impedir ciclos jerárquicos.

## RF-017
Un nodo no podrá ser hijo de sí mismo.

## RF-018
Un nodo no podrá ser hijo de alguno de sus descendientes.

## RF-019
El módulo debe respetar completamente el patrón MVVM.

---

# Seguridad y Roles

## Roles Permitidos

El módulo únicamente debe ser accesible para usuarios que cumplan con roles autorizados definidos por negocio, por ejemplo:

- Administrador
- Pastor
- Otros roles configurados posteriormente

El acceso debe validarse utilizando el mecanismo de autenticación y autorización ya implementado en la solución.

---

# Criterios de Aceptación

- El módulo sólo debe ser accesible para los usuarios que cumplan con el rol configurado como Administrador, Pastor u otros definidos por negocio.

- El sistema debe permitir crear estructuras organizacionales principales (nodos raíz) sin necesidad de un padre asociado.

- El sistema debe permitir asociar un nodo hijo a cualquier nodo existente dentro de la estructura organizacional.

- Cada nodo hijo debe mantener la referencia del nodo padre al que pertenece.

- La estructura organizacional debe soportar niveles ilimitados de jerarquía.

- El sistema debe visualizar la estructura en forma jerárquica tipo árbol (TreeView).

- Al seleccionar un nodo del árbol, el sistema debe permitir crear nuevos hijos sobre dicho nodo.

- El sistema debe permitir editar la información de cualquier nodo existente sin afectar su relación jerárquica.

- El sistema debe permitir eliminar nodos siempre que las reglas de negocio lo permitan.

- La visualización debe reflejar correctamente la relación Padre → Hijo en todos los niveles.

- El sistema debe cargar automáticamente los hijos correspondientes al expandir un nodo del árbol.

- La estructura debe conservar el orden jerárquico correctamente después de crear, editar o eliminar nodos.

- El sistema debe validar que no existan ciclos jerárquicos.

- Un nodo no podrá ser asignado como hijo de sí mismo.

- Un nodo no podrá ser asignado como hijo de alguno de sus descendientes.

- La solución debe manejar correctamente estructuras profundas sin afectar la estabilidad de la aplicación.

- La implementación debe respetar la arquitectura actual de la solución ROCA.Emuna360 y el patrón MVVM aplicado en el proyecto de presentación.

---

# Requerimientos Técnicos

## RT-001
La implementación debe realizarse utilizando MudBlazor.

## RT-002
Debe utilizarse `MudTreeView`.

## RT-003
Debe respetarse el patrón MVVM.

## RT-004
No deben romperse funcionalidades existentes.

## RT-005
No deben crearse arquitecturas paralelas.

## RT-006
Debe reutilizarse la infraestructura actual:
- Snackbars
- Dialogs
- Loading
- Servicios
- DTOs existentes
- Componentes reutilizables

## RT-007
La carga de información debe realizarse utilizando APIs existentes.

## RT-008
La implementación debe compilar sin errores.

## RT-009
Debe utilizarse obligatoriamente el DTO existente:

```plaintext
ROCA.Emuna360.Application/DTOs/Structure/EstructuraOrganizacionalDto.cs
```

## RT-010
No deben crearse nuevos DTOs.

## RT-011
Debe utilizarse obligatoriamente el controlador existente:

```plaintext
ROCA.Emuna360.API/Controllers/Structure/EstructuraOrganizacionalController.cs
```

## RT-012
Debe crearse el servicio necesario respetando la arquitectura actual.

## RT-013
El Frontend no debe duplicar lógica de negocio.

## RT-014
La lógica jerárquica pertenece exclusivamente a la API.

## RT-015
Debe mantenerse consistencia visual con el resto de la aplicación.

---

# Validaciones

- Validar que Descripción sea requerida.
- Validar que Responsable sea requerido.
- Validar relaciones jerárquicas inválidas.
- Validar ciclos jerárquicos.
- Validar nodos duplicados según reglas de negocio.
- Validar correctamente la asignación de padre.
- Validar permisos de acceso al módulo.

---

# Consideraciones Técnicas

- Mantener separación de responsabilidades.
- Mantener componentes desacoplados.
- Mantener ViewModels independientes.
- Evitar lógica de negocio dentro de Razor.
- Utilizar servicios para comunicación con APIs.
- Mantener consistencia visual.
- Mantener reutilización de componentes existentes.
- Mantener reutilización de DTOs existentes.
- Mantener compatibilidad con MudBlazor.
- Mantener compatibilidad con el patrón MVVM existente.

---

# Resultado Esperado

El sistema debe permitir administrar estructuras organizacionales jerárquicas complejas mediante una visualización TreeView totalmente funcional, dinámica, escalable y compatible con el patrón MVVM implementado en ROCA.Emuna360.