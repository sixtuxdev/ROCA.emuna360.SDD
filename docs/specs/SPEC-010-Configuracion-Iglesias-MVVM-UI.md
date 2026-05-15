# SPEC-010 - Módulo de Administración de Iglesias - ROCA.Emuna360

## Historia de Usuario

**Yo:** Sixto José Romero Martínez  
**Como:** Desarrollador FullStack  
**Necesito:** Implementar el módulo de iglesias, el cual debe permitir administrarlas, teniendo en cuenta que las iglesias siempre deben estar asociadas a una Denominación.

---

## Objetivo

Implementar el módulo de administración de Iglesias dentro de la solución **ROCA.Emuna360**, permitiendo crear, consultar, actualizar, activar/inactivar y administrar iglesias asociadas a una Denominación.

El módulo debe respetar la arquitectura existente de la solución, el patrón MVVM en el proyecto WebUI, las capas actuales del sistema, los servicios existentes, el manejo de seguridad por roles y el modelo de datos definido para la aplicación.

---

## Alcance Funcional

El módulo debe permitir:

- Listar iglesias asociadas a una Denominación.
- Crear una nueva iglesia.
- Editar la información de una iglesia existente.
- Activar o inactivar una iglesia.
- Validar que una iglesia siempre esté asociada a una Denominación.
- Validar que no existan dos iglesias con el mismo nombre dentro del sistema.
- Administrar datos geográficos mediante selección dependiente:
  - País.
  - Departamento.
  - Ciudad.
  - Corregimiento.
- Controlar el acceso al módulo según roles configurados como Administrador, Pastor u otros definidos por el sistema.

---

## Criterios de Aceptación

### CA-001 - Acceso al módulo por roles

El módulo de Iglesias sólo debe ser accesible para usuarios autenticados que cumplan con el rol configurado para administrar iglesias.

Los roles permitidos son:

ADMINISTRADOR: Todo poder todo control. Importante: Sólo si el Usuario es administrador a nivel de denominacón puede administrar todas las iglesias existentes en la denominación de lo contrario puede administrar la iglesia a la que pertenece el usuario.

LIDER: Tiene el control solo de su regional, toda su zona y las iglesias que están debajo de el, de la regional y su zona

ZONA: Tiene el control sobre su zona y las iglesias que le competen

PASTOR: Tiene el control de su iglesia, todo lo que tiene que ver con registro, bautismo, aporte, gasto y todo lo que concierne a la iglesia a la que pertence

SECRETARIA: Si es de la denominación todo lo que es registro en todas las iglesias, anuncio, bautismo., si es de la iglesia solo de la iglesia a la que pertence

TESORERO: Solo tiene que ver con la parte financiera, si es de la denominación es de todas las iglesias. si es de la iglesia solo de la iglesia a la que pertence

MIEMBRO: Solo ve su información, sus aportes y anuncios o circular

INVITADO: No ve nada solo entra al sistema y le debe aparecer solo sus datos.

El sistema esta estructurado de manera jerárquica de mayor a menor, donde cada rol se centra en lo que le corresponde y se mira de arriba a bajo

# #Importante: Ahora mismo sólo valida el rol ADMINISTRADOR para que pueda administrar todas las iglesias en caso que sea un Administrador de la Denominación, de lo contrario es Administrado sólo debe ver y administrar a la iglesia que  pertenece.

Si el usuario no tiene un rol permitido:

- No debe poder acceder al módulo.
- No debe visualizar opciones del menú relacionadas con Iglesias.
- Si intenta ingresar directamente por URL, el sistema debe impedir el acceso.

---

### CA-002 - Asociación obligatoria con Denominación

Toda iglesia debe estar asociada obligatoriamente a una Denominación.

La Denominación debe obtenerse preferiblemente desde el contexto del usuario autenticado o desde el valor almacenado en el sistema, por ejemplo:

- Token JWT.
- LocalStorage.
- Servicio de autenticación.
- Estado global de la aplicación.

No se debe permitir registrar una iglesia sin DenominaciónId.

---

### CA-003 - Unicidad del nombre de la Iglesia

Una iglesia debe ser única.

No puede existir más de una iglesia con el mismo nombre.

La validación debe aplicarse al momento de crear y actualizar.

Reglas esperadas:

- No permitir nombres duplicados.
- La comparación debe evitar duplicados aunque existan diferencias de mayúsculas, minúsculas o espacios innecesarios.
- En edición, debe permitir conservar el mismo nombre de la iglesia actual.
- Si el nombre ya existe, debe mostrarse un mensaje claro al usuario.

Ejemplo de mensaje:

> Ya existe una iglesia registrada con este nombre.

---

### CA-004 - Administración de datos geográficos

El formulario de Iglesias debe permitir seleccionar los datos de geografía de forma dependiente.

La carga debe funcionar de la siguiente manera:

1. El usuario selecciona un País.
2. Sólo después de seleccionar el País, se deben cargar los Departamentos asociados a ese País.
3. El usuario selecciona un Departamento.
4. Sólo después de seleccionar el Departamento, se deben cargar las Ciudades asociadas a ese Departamento.
5. El usuario selecciona una Ciudad.
6. Sólo después de seleccionar la Ciudad, se deben cargar los Corregimientos asociados a esa Ciudad.

No se deben cargar todos los datos geográficos de forma masiva si no corresponde.

---

### CA-005 - Limpieza de selecciones dependientes

Cuando el usuario cambie una selección superior, las selecciones inferiores deben limpiarse automáticamente.

Ejemplo:

- Si cambia el País:
  - Se limpia Departamento.
  - Se limpia Ciudad.
  - Se limpia Corregimiento.

- Si cambia el Departamento:
  - Se limpia Ciudad.
  - Se limpia Corregimiento.

- Si cambia la Ciudad:
  - Se limpia Corregimiento.

---

### CA-006 - Validaciones del formulario

El formulario debe validar (Reactivos) como mínimo:

- Nombre de la iglesia obligatorio.
- Denominación obligatoria.
- Slug
- Personería Jurídica
- País obligatorio, si el negocio lo requiere.
- Departamento obligatorio, si el negocio lo requiere.
- Ciudad obligatoria, si el negocio lo requiere.
- Corregimiento opcional u obligatorio según definición del modelo.
- Dirección
- Teléfono
- Correo (Validar correo)
- Slogan
- Estado de la iglesia.

Las validaciones deben mostrarse de forma clara usando los componentes existentes del proyecto y de forma reactiva.

---

### CA-007 - Listado de Iglesias

El módulo debe mostrar un listado de iglesias asociadas a la Denominación del usuario.

El listado debe permitir como mínimo:

- Visualizar nombre de la iglesia.
- Visualizar Slug
- Visualizar Ciudad/Corregimiento (Valida si tiene corregimiento muestra el corregimiento de lo contrario la Ciudad)
- Correo
- Visualizar estado Activo/Inactivo.

---

### CA-008 - Creación de Iglesia

Al crear una iglesia:

- Debe enviarse la DenominaciónId correspondiente.
- Debe validarse que el nombre no exista.
- Debe guardar los datos geográficos seleccionados.
- Debe mostrar mensaje de éxito si el proceso fue correcto.
- Debe mostrar mensaje de error si ocurre alguna validación o excepción.
- Debe actualizar el listado después de crear.

---

### CA-009 - Actualización de Iglesia

Al actualizar una iglesia:

- Debe conservar su identificación principal.
- Debe permitir modificar sus datos generales.
- Debe permitir modificar datos geográficos.
- Debe validar que el nombre no quede duplicado.
- Debe mostrar mensaje de éxito si el proceso fue correcto.
- Debe actualizar el listado después de guardar cambios.

---

### CA-010 - Activar/Inactivar Iglesia

El módulo debe permitir cambiar el estado de una iglesia.

Reglas:

- No eliminar físicamente la iglesia salvo que el sistema ya maneje eliminación lógica.
- Usar estado Activo/Inactivo.
- Confirmar la acción antes de cambiar el estado.
- Mostrar mensaje de éxito o error según corresponda.

---

## Reglas de Negocio

- Una iglesia siempre pertenece a una Denominación.
- No pueden existir iglesias duplicadas por nombre.
- Los datos geográficos deben cargarse de forma jerárquica.
- El usuario sólo debe administrar iglesias de su Denominación. 
	- Nota: Si el usuario es Administrador de Denominación debe permitir entrar al componente de Configuración Iglesias y pueda administrar todas las iglesias, de lo contrario debe entrar a otro componente distinto donde sólo se va a mostrar la iglesia a la que pertence
- El acceso debe estar protegido por roles.
- El módulo debe respetar la arquitectura existente de ROCA.Emuna360.
- El Frontend debe respetar el patrón MVVM ya definido.
- No se deben realizar cambios fuera del alcance de esta SPEC.

---

## Consideraciones Técnicas

### Backend

Se deben validar o implementar los elementos necesarios en las capas correspondientes:

- Entidades de dominio.
- DTOs.
- Interfaces de aplicación.
- Servicios de aplicación.
- Interfaces de repositorio.
- Repositorios.
- Controladores API.
- Procedimientos almacenados en SQL Server.
- Validaciones de negocio.

Se debe respetar la arquitectura actual de la solución.

---

### Frontend

En el proyecto:

`ROCA.Emuna360.Presentation.WebUI`

Se debe implementar el módulo usando:

- Blazor.
- MudBlazor.
- Patrón MVVM.
- Servicios existentes.
- Manejo de loading existente.
- Manejo de snackbar existente.
- Validaciones existentes.
- Componentes reutilizables existentes.

No se deben inventar componentes, servicios o estructuras que no correspondan con la arquitectura actual.

---

## Seguridad

El módulo debe estar protegido por autenticación y autorización.

Debe validarse:

- Usuario autenticado.
- Rol permitido.
- Denominación asociada al usuario.
- Restricción de acceso directo por URL.
- Restricción visual desde el menú.

---

## Datos Geográficos

El sistema debe consumir los servicios o endpoints correspondientes para cargar:

- Países.
- Departamentos por País.
- Ciudades por Departamento.
- Corregimientos por Ciudad.

La carga debe ser bajo demanda, según la selección realizada por el usuario.

---

## Resultado Esperado

Al finalizar esta SPEC, el sistema ROCA.Emuna360 debe contar con un módulo funcional de Iglesias que permita administrar iglesias asociadas a una Denominación, con control de acceso por roles, validación de unicidad por nombre y manejo correcto de datos geográficos dependientes.

---

## Fuera de Alcance

No hacen parte de esta SPEC:

- Administración de Denominaciones.
- Administración de usuarios.
- Administración de roles.
- Creación de nuevos módulos no relacionados con Iglesias.
- Modificación de arquitectura base.
- Cambios en autenticación que no estén directamente relacionados con proteger el módulo.
- Carga masiva de iglesias.
- Importación o exportación de iglesias.

---