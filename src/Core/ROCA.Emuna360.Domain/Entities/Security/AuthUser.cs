using ROCA.Emuna360.Domain.Entities.Registry;

namespace ROCA.Emuna360.Domain.Entities.Security;

public class AuthUser : Usuario
{
    public Registro? Registro { get; set; }
    public IEnumerable<AuthRole> Roles { get; set; } = new List<AuthRole>();
    public IEnumerable<AuthMenu> Menus { get; set; } = new List<AuthMenu>();
}
