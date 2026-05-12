yo: Sixto José Romero Martínez
Como: Desarrollador FullStack
Necito: Que la funcionalidad del login quede funcionando correctamente usando las APIS que corresponden.


Criterios de Aceptación:
* Debes invocar la API que ya se encuentra en el proyecto ROCA.Emuna360.Presentation.WebUI Clase Services/AuthApiService.cs en la función LoginAsync(LoginRequestDto request), ésta invoca la API de Login
* Una vez Inicie sesión debe llevarme al dashboard o al main.
* Aplicar correctamente los Tokens en la aplicacíón, a sí como el manejo de el refreshtoken.
* Proteger todos los controladores para que pueda ser usado únicamente cuando el usuario a iniciado sesión, manejar el token para que pueda acceder a las API
* Mejorar funcionalidad del formulario de Login para que el botón INICIAR SESION se habilite cuando pase la validación del formulario, ejemplo: si ingreso el correo electrónico o documento y ingreso la contraseña cumpliendo con la cantidad minima de caracteres se habilite inmediatamente el botón INICIAR SESIÓN y no cuando pierdo el focus en el campo de contraseña.
* Al cerrar la sesión debe destruir todo lo relacionado con la sesión activa para que redireccione al login correctamente y no se pueda navegar a la ventana anterior una vez haya cerrado sesión.
* Aplicar siempre las mejores prácticas, respetando la arquitectura que se tiene implementado actualmente.

Nota: En las API algunos Controladores o especificamente en algún endpoint de un controlador no se requiere que tenga la validación del token para consumir, ya que algunos se van a usar a sí el usuario no haya iniciado sesión, como por ejemplo el módulo de Registro, un usuario puede registrarse desde un formulario externo.

