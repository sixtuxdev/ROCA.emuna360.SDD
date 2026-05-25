using AutoMapper;
using ROCA.Emuna360.Application.DTOs.Auth;
using ROCA.Emuna360.Application.DTOs.Geography;
using ROCA.Emuna360.Application.DTOs.Menus;
using ROCA.Emuna360.Application.DTOs.Organization;
using ROCA.Emuna360.Application.DTOs.Parameters;
using ROCA.Emuna360.Application.DTOs.Registry;
using ROCA.Emuna360.Application.DTOs.Security;
using ROCA.Emuna360.Application.DTOs.Structure;
using ROCA.Emuna360.Domain.Entities.Geography;
using ROCA.Emuna360.Domain.Entities.Menus;
using ROCA.Emuna360.Domain.Entities.Organization;
using ROCA.Emuna360.Domain.Entities.Parameters;
using ROCA.Emuna360.Domain.Entities.Registry;
using ROCA.Emuna360.Domain.Entities.Security;
using ROCA.Emuna360.Domain.Entities.Structure;

namespace ROCA.Emuna360.Application.Mappers;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        CreateMap<ConfiguracionIglesiaColor, ConfiguracionIglesiaColorDto>().ReverseMap();
        CreateMap<ConfiguracionIglesia, ConfiguracionIglesiaDto>().ReverseMap();
        CreateMap<Denominacion, DenominacionDto>().ReverseMap();
        CreateMap<Iglesia, IglesiaDto>().ReverseMap();
        CreateMap<Ciudad, CiudadDto>().ReverseMap();
        CreateMap<Corregimiento, CorregimientoDto>().ReverseMap();
        CreateMap<Departamento, DepartamentoDto>().ReverseMap();
        CreateMap<Pais, PaisDto>().ReverseMap();
        CreateMap<Rol, RolDto>().ReverseMap();
        CreateMap<RefreshToken, RefreshTokenDto>().ReverseMap();
        CreateMap<TokenVerificacionCorreo, TokenVerificacionCorreoDto>().ReverseMap();
        CreateMap<UsuarioIglesia, UsuarioIglesiaDto>().ReverseMap();
        CreateMap<UsuarioPerfil, UsuarioPerfilDto>().ReverseMap();
        CreateMap<Usuario, UsuarioDto>().ReverseMap();
        CreateMap<UsuarioPastorResponse, UsuarioPastorResponseDTO>().ReverseMap();
        CreateMap<UsuarioRol, UsuarioRolDto>().ReverseMap();
        CreateMap<Registro, RegistroDto>().ReverseMap();
        CreateMap<Menu, MenuDto>().ReverseMap();
        CreateMap<MenuRol, MenuRolDto>().ReverseMap();
        CreateMap<MenuUsuario, MenuUsuarioDto>().ReverseMap();
        CreateMap<Clase, ClaseDto>().ReverseMap();
        CreateMap<Parametro, ParametroDto>().ReverseMap();
        CreateMap<EstructuraDenominacion, EstructuraDenominacionDto>().ReverseMap();
        CreateMap<EstructuraOrganizacional, EstructuraOrganizacionalDto>().ReverseMap();
        CreateMap<IglesiaEstructura, IglesiaEstructuraDto>().ReverseMap();
        CreateMap<TipoEstructura, TipoEstructuraDto>().ReverseMap();

        // Auth
        CreateMap<AuthUser, AuthUserDto>()
            .ForMember(dest => dest.IglesiaId, opt => opt.MapFrom(src => src.UsuarioIglesia != null ? src.UsuarioIglesia.IglesiaId : src.Registro != null ? src.Registro.IglesiaId : 0));
        CreateMap<AuthUserDto, AuthUser>();
        CreateMap<AuthRole, AuthRoleDto>().ReverseMap();
        CreateMap<AuthMenu, AuthMenuDto>().ReverseMap();
        CreateMap<Registro, AuthRegistroDto>().ReverseMap();
    }
}
