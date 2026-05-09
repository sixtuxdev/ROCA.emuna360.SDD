using Microsoft.AspNetCore.Mvc;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.Interfaces.Services.Menus;
using System.Threading.Tasks;
using ROCA.Emuna360.API.Common;

namespace ROCA.Emuna360.API.Controllers.Menus;

[Route("api/v1/menu")]
public class MenuController : MultiOrganizationalBaseController<MenuDto>
{
    public MenuController(IMenuService service) : base(service) 
    {
    }
}

