**Yo:** Sixto José Romero Martínez  
**Como:** Desarrollador FullStack  
**Necesito:** Implementar el módulo de Registro, este módulo es el principal para poder empezar a crear usuarios, por este motivo es necesario
que se implemente pero debe poder usarse desde el login o en alguna opción del menú que se agregue sólo para el rol permitido o configurado, 
			  


Criterios de Aceptación:

* El módulo debe ser accesible desde el login. Si se registran desde el login debes setear el campo Interno en False de la entidad Registro y RegistroDto, para que se identifique que fué desde el menú.
* El módulo debe ser accesibe también desde una opción del menú según el rol del usuario, en esta ocación el campo Interno debe ser True  de la entidad Registro y RegistroDto.

Arquitectura:

* Debe respetar la arquitectura actual trabajada MVVM y con MudBlazor.
* El componente debe estar en Components/Pages/Registry/, con el nombre AdminRegistro.razor
* El componente debe tener 2 secciones la Izquierda y Derecha tal cual como está ConfigIglesias.razor, pero con lo relacionado de Registro.
* En el proyecto API ya existe su controlador, el cual está en Controllers/Registry/RegistroController.cs Para que uses el Crear y consultar por Denominación.
* En el proyecto ROCA.Emuna360.Presentation.WebUI en la carpeta Services, debes agregar RegistroApiService.cs y aplicar el llamado a la API nombrada anteriormente.
* Debes respetar la arquitectura del proyecto que está actualmente.
