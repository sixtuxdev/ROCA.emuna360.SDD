yo: Sixto José Romero Martínez
Como: Desarrollador FullStack
Necito: Que la funcionalidad del login quede funcionando correctamente usando las APIS que corresponden.


Criterios de Aceptación:
* Debes invocar la API que ya se encuentra en el proyecto ROCA.Emuna360.Presentation.WebUI Clase Services/AuthApiService.cs en la función LoginAsync(LoginRequestDto request), ésta invoca la API de Login
NOTA: La API de Login devuelve lo siguiente:
{
  "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0IiwiZW1haWwiOiJjYWx5anVhbkBnbWFpbCIsImp0aSI6ImIzNWNiNTFmLWZmODYtNDU0YS1iMjY3LTQwNzJiYjA1MTAzNiIsIlVzdWFyaW9JZCI6IjQiLCJSZWdpc3Ryb0lkIjoiMSIsIkRlbm9taW5hY2lvbklkIjoiMSIsIlJvbElkIjoiMiIsIlNlY3VyaXR5U3RhbXAiOiJBMkQ4OUYyQi1GQUQ0LTRGRTctQkU4OC1ENTdDQjA3M0I0MzMiLCJOb21icmVDb21wbGV0byI6Ikp1YW4gQmF1dGlzdGEgQ2FseSBNYWRhcmlhZ2EiLCJEb2N1bWVudG8iOiI4MjY1NDgyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQWRtaW5pc3RyYWRvciIsIlJvbGVzIjoiQURNSU4iLCJleHAiOjE3Nzg2MzA4MzQsImlzcyI6IlJPQ0EuRW11bmEzNjAiLCJhdWQiOiJST0NBLkVtdW5hMzYwLkNsaWVudCJ9.4awo3CIXQxFkglSGu8gsqtYjQra_99F0URVsa69vCRA",
  "refreshToken": "8ZnR0/WOEsidECQvV901KQrAzznR0u/qsAdhIwdgUQ0IrOqYJd3po77dGw/mJs8MxNQwNc3+Jr+/HolWZLk/Yg==",
  "expiration": "2026-05-13T00:07:48.9030487Z",
  "user": {
    "usuarioId": 4,
    "denominacionId": 1,
    "correo": "calyjuan@gmail",
    "emailVerificado": true,
    "rolId": 2,
    "registro": {
      "registroId": 1,
      "nombres": "Juan Bautista",
      "apellidos": "Caly Madariaga",
      "documento": "8265482",
      "nombreCompleto": "Juan Bautista Caly Madariaga"
    },
    "roles": [
      {
        "rolId": 2,
        "nombre": "Administrador",
        "codigo": "ADMIN"
      }
    ],
    "menus": [
      {
        "menuId": 1,
        "descripcion": "Administrar Iglesias",
        "idGrupo": 4,
        "tipo": "S",
        "url": "/config-iglesias",
        "imagen": "AddHomeWork",
        "orden": 0
      },
      {
        "menuId": 2,
        "descripcion": "Administrar Usuarios",
        "idGrupo": 4,
        "tipo": "S",
        "url": "/admin-usuarios",
        "imagen": "ManageAccounts",
        "orden": 0
      },
      {
        "menuId": 3,
        "descripcion": "Administrar Estructuras",
        "idGrupo": 4,
        "tipo": "S",
        "url": "/admin-estructura",
        "imagen": "Lan",
        "orden": 0
      },
      {
        "menuId": 4,
        "descripcion": "Administración",
        "idGrupo": null,
        "tipo": "G",
        "url": "#",
        "imagen": "Settings",
        "orden": 0
      },
      {
        "menuId": 5,
        "descripcion": "Administrar Clase Parámetro",
        "idGrupo": 4,
        "tipo": "S",
        "url": "/config-clases",
        "imagen": "Deck",
        "orden": 0
      }
    ]
  }
}
* Debes ajustar para que guardes el token y la información completa de lo que está retornando el Login, en el punto anterior te defino la respuesta que devuelve la api de Login. Adaptalo para tener toda esa información disponible en la Aplicación en el LocalStorage en el mismo formato json pero indicando cada set de datos obtenido de la API ejemplo:
LocalStora:
    Key: "InfoUser": {
        "usuarioId": 4,
    "denominacionId": 1,
    "correo": "calyjuan@gmail",
    "emailVerificado": true,
    "rolId": 2,
    }.

    Key: "InfoRegister": {
        "registroId": 1,
      "nombres": "Juan Bautista",
      "apellidos": "Caly Madariaga",
      "documento": "8265482",
      "nombreCompleto": "Juan Bautista Caly Madariaga"
    }.

    Key: "roles": [
      {
        "rolId": 2,
        "nombre": "Administrador",
        "codigo": "ADMIN"
      }
    ].

    Key: "menus": [
        {
        "menuId": 1,
        "descripcion": "Administrar Iglesias",
        "idGrupo": 4,
        "tipo": "S",
        "url": "/config-iglesias",
        "imagen": "AddHomeWork",
        "orden": 0
      },
      {
        "menuId": 2,
        "descripcion": "Administrar Usuarios",
        "idGrupo": 4,
        "tipo": "S",
        "url": "/admin-usuarios",
        "imagen": "ManageAccounts",
        "orden": 0
      },
      {
        "menuId": 3,
        "descripcion": "Administrar Estructuras",
        "idGrupo": 4,
        "tipo": "S",
        "url": "/admin-estructura",
        "imagen": "Lan",
        "orden": 0
      },
      {
        "menuId": 4,
        "descripcion": "Administración",
        "idGrupo": null,
        "tipo": "G",
        "url": "#",
        "imagen": "Settings",
        "orden": 0
      },
      {
        "menuId": 5,
        "descripcion": "Administrar Clase Parámetro",
        "idGrupo": 4,
        "tipo": "S",
        "url": "/config-clases",
        "imagen": "Deck",
        "orden": 0
      }
   ]

* Una vez Inicie sesión debe llevarme al dashboard o al main.
* Aplicar correctamente los Tokens en la aplicacíón, a sí como el manejo de el refreshtoken.
* Proteger todos los controladores para que pueda ser usado únicamente cuando el usuario a iniciado sesión, manejar el token para que pueda acceder a las API
* Mejorar funcionalidad del formulario de Login para que el botón INICIAR SESION se habilite cuando pase la validación del formulario, ejemplo: si ingreso el correo electrónico o documento y ingreso la contraseña cumpliendo con la cantidad minima de caracteres se habilite inmediatamente el botón INICIAR SESIÓN y no cuando pierdo el focus en el campo de contraseña.
* Al cerrar la sesión debe destruir todo lo relacionado con la sesión activa para que redireccione al login correctamente y no se pueda navegar a la ventana anterior una vez haya cerrado sesión.
* Aplicar siempre las mejores prácticas, respetando la arquitectura que se tiene implementado actualmente.
* Recientemente se hicieron cambios en la arquitectura para recibir bien lo que devuelve la API, tener en cuenta estos cambios para seguir haciendo lo  mismo en los demás llamado y ajustar el front para recibir este tipo de datos usando los DTOs requeridos o creados.

Nota: En las API algunos Controladores o especificamente en algún endpoint de un controlador no se requiere que tenga la validación del token para consumir, ya que algunos se van a usar a sí el usuario no haya iniciado sesión, como por ejemplo el módulo de Registro, un usuario puede registrarse desde un formulario externo.

