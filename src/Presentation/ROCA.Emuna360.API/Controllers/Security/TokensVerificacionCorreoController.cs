using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.Interfaces.Repositories.Security;

namespace ROCA.Emuna360.API.Controllers.Security;

[Route("api/v1/tokens-verificacion-correo")]
public class TokensVerificacionCorreoController : BaseController<TokenVerificacionCorreoDto>
{
    public TokensVerificacionCorreoController(ITokenVerificacionCorreoRepository repository) : base(repository) { }
}
