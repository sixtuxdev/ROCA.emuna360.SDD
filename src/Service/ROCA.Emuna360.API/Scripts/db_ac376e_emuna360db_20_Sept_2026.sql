USE [master]
GO
/****** Object:  Database [db_ac376e_emuna360db]    Script Date: 20/09/2026 7:38:38 p. m. ******/
CREATE DATABASE [db_ac376e_emuna360db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_ac376e_emuna360db_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_ac376e_emuna360db_DATA.mdf' , SIZE = 10176KB , MAXSIZE = 3072000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'db_ac376e_emuna360db_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\db_ac376e_emuna360db_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [db_ac376e_emuna360db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_ac376e_emuna360db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_ac376e_emuna360db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET  MULTI_USER 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_ac376e_emuna360db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_ac376e_emuna360db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_ac376e_emuna360db] SET QUERY_STORE = ON
GO
ALTER DATABASE [db_ac376e_emuna360db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [db_ac376e_emuna360db]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[CiudadId] [int] IDENTITY(1,1) NOT NULL,
	[DepartamentoId] [int] NOT NULL,
	[CiudadNombre] [nvarchar](250) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[CiudadId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clase]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clase](
	[ClaseId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Clase_1] PRIMARY KEY CLUSTERED 
(
	[ClaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompletarDatos]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompletarDatos](
	[CompletarDatosId] [int] IDENTITY(1,1) NOT NULL,
	[RegistroId] [int] NOT NULL,
	[PaisResidenciaId] [int] NULL,
	[DepartamentoResidenciaId] [int] NULL,
	[CiudadResidenciaId] [int] NULL,
	[FechaNacimiento] [date] NULL,
	[ParametroIdEstadoCivil] [int] NULL,
	[ParametroIdEstudiosAcademicos] [int] NULL,
	[ParametroIdEstudiosTeologicos] [int] NULL,
	[ParametroIdSituacionLaboral] [int] NULL,
	[ParametroIdTipoMiembro] [int] NULL,
	[ParametroIdTipoPoblacion] [int] NULL,
	[FechaBautismo] [date] NULL,
	[PersonaContacto] [nvarchar](200) NULL,
	[TelefonoContacto] [nvarchar](40) NULL,
	[FechaCreacion] [datetime2](3) NOT NULL,
	[FechaModificacion] [datetime2](3) NULL,
	[IglesiaId] [int] NULL,
	[DenominacionId] [int] NULL,
	[IglesiaBautismo] [varchar](200) NULL,
	[PastorBautismo] [varchar](200) NULL,
 CONSTRAINT [PK_CompletarDatos] PRIMARY KEY CLUSTERED 
(
	[CompletarDatosId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfiguracionIglesia]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfiguracionIglesia](
	[ConfiguracionIglesiaId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[IglesiaId] [int] NOT NULL,
	[SitioWeb] [nvarchar](250) NULL,
	[Logo] [nvarchar](150) NULL,
	[HostEmail] [nvarchar](150) NULL,
	[HostUsuarioEmail] [nvarchar](250) NULL,
	[Host] [nvarchar](150) NULL,
	[FromEmail] [nvarchar](150) NULL,
	[HostPort] [int] NULL,
	[TextFromEmail] [nvarchar](max) NULL,
	[KeySecretAPIRecaptcha] [nvarchar](250) NULL,
	[KeySecretWebRecaptcha] [nvarchar](250) NULL,
	[InfoTextoEncabezado] [nvarchar](max) NULL,
	[Activa] [bit] NOT NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
	[FechaActualizacion] [datetime2](0) NULL,
 CONSTRAINT [PK_ConfiguracionIglesia_1] PRIMARY KEY CLUSTERED 
(
	[ConfiguracionIglesiaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConfiguracionIglesiaColores]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfiguracionIglesiaColores](
	[ConfiguracionIglesiaId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[NombreColor] [nvarchar](30) NOT NULL,
	[ValorColor] [nvarchar](80) NULL,
 CONSTRAINT [PK_ConfiguracionIglesiaColores] PRIMARY KEY CLUSTERED 
(
	[ConfiguracionIglesiaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Corregimiento]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corregimiento](
	[CorregimientoId] [int] IDENTITY(1,1) NOT NULL,
	[CiudadId] [int] NOT NULL,
	[CorregimientoNombre] [nvarchar](250) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Corregimiento] PRIMARY KEY CLUSTERED 
(
	[CorregimientoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Denominaciones]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Denominaciones](
	[DenominacionId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[Activa] [bit] NOT NULL,
	[IglesiaPrincipalId] [int] NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Denominacion] PRIMARY KEY CLUSTERED 
(
	[DenominacionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DenominacionesDominios]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DenominacionesDominios](
	[DenominacionDominioId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[Dominio] [nvarchar](250) NOT NULL,
	[Subdominio] [nvarchar](150) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_DenominacionesDominios] PRIMARY KEY CLUSTERED 
(
	[DenominacionDominioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[DepartamentoId] [int] IDENTITY(1,1) NOT NULL,
	[PaisId] [int] NOT NULL,
	[DepartamentoNombre] [nvarchar](250) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[DepartamentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstructuraOrganizacional]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstructuraOrganizacional](
	[EstructuraOrganizacionalId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[Descripcion] [nvarchar](250) NOT NULL,
	[GrupoEstructuraOrganizacionalId] [int] NULL,
	[Orden] [int] NOT NULL,
	[Responsable] [nvarchar](150) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_EstructuraOrganizacional] PRIMARY KEY CLUSTERED 
(
	[EstructuraOrganizacionalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstructurasDenominacion]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstructurasDenominacion](
	[EstructuraId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[IglesiaId] [int] NOT NULL,
	[TipoEstructuraId] [int] NOT NULL,
	[PadreId] [int] NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Codigo] [nvarchar](50) NULL,
	[Activa] [bit] NOT NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_EstructurasDenominacion] PRIMARY KEY CLUSTERED 
(
	[EstructuraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Iglesias]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iglesias](
	[IglesiaId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[Nombre] [nvarchar](150) NOT NULL,
	[Slug] [nvarchar](100) NOT NULL,
	[PersoneriaJuridica] [nvarchar](max) NULL,
	[PaisId] [int] NOT NULL,
	[DepartamentoId] [int] NOT NULL,
	[CiudadId] [int] NOT NULL,
	[CorregimientoId] [int] NULL,
	[Direccion] [nvarchar](250) NOT NULL,
	[PastorResponsableRegistroId] [int] NULL,
	[Telefono] [nvarchar](30) NOT NULL,
	[Correo] [nvarchar](150) NOT NULL,
	[Slogan] [nvarchar](250) NOT NULL,
	[Activa] [bit] NOT NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Iglesias] PRIMARY KEY CLUSTERED 
(
	[IglesiaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IglesiasEstructuras]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IglesiasEstructuras](
	[IglesiaEstructurasId] [int] IDENTITY(1,1) NOT NULL,
	[IglesiaId] [int] NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[EstructuraId] [int] NOT NULL,
	[FechaAsignacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_IglesiasEstructuras_1] PRIMARY KEY CLUSTERED 
(
	[IglesiaEstructurasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NULL,
	[Descripcion] [nvarchar](150) NOT NULL,
	[IdGrupo] [int] NULL,
	[Tipo] [nchar](1) NOT NULL,
	[Estado] [bit] NOT NULL,
	[Url] [nvarchar](500) NOT NULL,
	[Imagen] [nvarchar](500) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[Orden] [int] NOT NULL,
	[NuevaVentana] [bit] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_rol]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_rol](
	[Menu_Rol] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[RolId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Menu_rol] PRIMARY KEY CLUSTERED 
(
	[Menu_Rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu_Usuario]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Usuario](
	[OpcUsuId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Menu_Usuario] PRIMARY KEY CLUSTERED 
(
	[OpcUsuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[PaisId] [int] IDENTITY(1,1) NOT NULL,
	[PaisNombre] [nvarchar](250) NOT NULL,
	[Descripcion] [nvarchar](500) NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[PaisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametro](
	[ParametroId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[ClaseId] [int] NOT NULL,
	[Descripcion] [nvarchar](500) NOT NULL,
	[Observacion] [nvarchar](max) NULL,
	[PadreParametroId] [int] NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime] NULL,
 CONSTRAINT [PK_Parametro_1] PRIMARY KEY CLUSTERED 
(
	[ParametroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permisos](
	[PermisoId] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](250) NOT NULL,
	[Activo] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PermisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro](
	[RegistroId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NULL,
	[IglesiaId] [int] NOT NULL,
	[Nombres] [nvarchar](250) NOT NULL,
	[Apellidos] [nvarchar](250) NOT NULL,
	[ParametroIdTipoDocumento] [int] NULL,
	[Documento] [nvarchar](50) NOT NULL,
	[PaisId] [int] NULL,
	[DepartamentoId] [int] NULL,
	[CiudadId] [int] NULL,
	[CorregimientoId] [int] NULL,
	[Direccion] [nvarchar](550) NOT NULL,
	[Correo] [nvarchar](500) NULL,
	[Telefono] [nvarchar](20) NULL,
	[ParametroIdSexo] [int] NOT NULL,
	[Interno] [bit] NULL,
	[ParametroIdInteres] [int] NULL,
 CONSTRAINT [PK_Registro] PRIMARY KEY CLUSTERED 
(
	[RegistroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Codigo] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolPermisos]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolPermisos](
	[RolPermisoId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[RolId] [int] NOT NULL,
	[PermisoId] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[FechaCreacion] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolPermisoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposEstructura]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposEstructura](
	[TipoEstructuraId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Orden] [int] NOT NULL,
 CONSTRAINT [PK_TiposEstructura] PRIMARY KEY CLUSTERED 
(
	[TipoEstructuraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TokensRefresh]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokensRefresh](
	[RefreshTokenId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[IglesiaId] [int] NOT NULL,
	[TokenHash] [nvarchar](128) NOT NULL,
	[ExpiraEn] [datetime2](0) NOT NULL,
	[RevocadoEn] [datetime2](0) NULL,
	[ReemplazadoPor] [int] NULL,
	[UserAgent] [nvarchar](256) NULL,
	[Ip] [nvarchar](45) NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_TokensRefresh] PRIMARY KEY CLUSTERED 
(
	[RefreshTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TokensVerificacionCorreo]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TokensVerificacionCorreo](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NULL,
	[UsuarioId] [int] NULL,
	[IglesiaId] [int] NULL,
	[TokenHash] [nvarchar](128) NOT NULL,
	[ExpiraEn] [datetime2](0) NOT NULL,
	[UsadoEn] [datetime2](0) NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_TokensVerificacionCorreo] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioRoles]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioRoles](
	[UsuarioRolId] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioId] [int] NULL,
	[DenominacionId] [int] NULL,
	[IglesiaId] [int] NULL,
	[RolId] [int] NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_UsuarioRoles] PRIMARY KEY CLUSTERED 
(
	[UsuarioRolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[RegistroId] [int] NOT NULL,
	[Correo] [nvarchar](150) NOT NULL,
	[PasswordHash] [nvarchar](500) NOT NULL,
	[EmailVerificado] [bit] NOT NULL,
	[Bloqueado] [bit] NOT NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
	[UltimoLogin] [datetime2](0) NULL,
	[SecurityStamp] [nvarchar](64) NOT NULL,
	[RolId] [int] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[UsuarioId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosIglesias]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosIglesias](
	[UsuarioIglesiaId] [int] IDENTITY(1,1) NOT NULL,
	[DenominacionId] [int] NOT NULL,
	[UsuarioId] [int] NOT NULL,
	[IglesiaId] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
	[EsAdministrador] [bit] NOT NULL,
	[FechaCreacion] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_UsuariosIglesias] PRIMARY KEY CLUSTERED 
(
	[UsuarioIglesiaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuariosPerfil]    Script Date: 20/09/2026 7:38:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuariosPerfil](
	[UsuarioId] [int] NULL,
	[DenominacionId] [int] NULL,
	[TipoDocumento] [nvarchar](30) NOT NULL,
	[Documento] [nvarchar](30) NOT NULL,
	[Nombres] [nvarchar](150) NOT NULL,
	[Apellidos] [nvarchar](150) NOT NULL,
	[FechaCumple] [date] NULL,
	[Telefono] [nvarchar](30) NULL,
	[Genero] [nvarchar](30) NULL,
	[Direccion] [nvarchar](250) NULL,
	[Avatar] [nvarchar](250) NULL,
	[Estado] [tinyint] NOT NULL,
	[FechaActualizacion] [datetime2](0) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ciudad] ON 
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, 1, N'Leticia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (2, 1, N'Puerto Nariño', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (3, 2, N'Abejorral', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (4, 2, N'Abriaquí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (5, 2, N'Alejandría', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (6, 2, N'Amagá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (7, 2, N'Amalfi', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (8, 2, N'Andes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (9, 2, N'Angelópolis', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (10, 2, N'Angostura', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (11, 2, N'Anorí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (12, 2, N'Anzá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (13, 2, N'Apartadó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (14, 2, N'Arboletes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (15, 2, N'Argelia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (16, 2, N'Armenia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (17, 2, N'Barbosa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (18, 2, N'Bello', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (19, 2, N'Belmira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (20, 2, N'Betania', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (21, 2, N'Betulia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (22, 2, N'Briceño', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (23, 2, N'Buriticá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (24, 2, N'Cáceres', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (25, 2, N'Caicedo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (26, 2, N'Caldas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (27, 2, N'Campamento', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (28, 2, N'Cañasgordas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (29, 2, N'Caracolí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (30, 2, N'Caramanta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (31, 2, N'Carepa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (32, 2, N'Carolina del Príncipe', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (33, 2, N'Caucasia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (34, 2, N'Chigorodó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (35, 2, N'Cisneros', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (36, 2, N'Ciudad Bolívar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (37, 2, N'Cocorná', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (38, 2, N'Concepción', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (39, 2, N'Concordia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (40, 2, N'Copacabana', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (41, 2, N'Dabeiba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (42, 2, N'Donmatías', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (43, 2, N'Ebéjico', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (44, 2, N'El Bagre', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (45, 2, N'El Carmen de Viboral', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (46, 2, N'El Peñol', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (47, 2, N'El Retiro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (48, 2, N'El Santuario', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (49, 2, N'Entrerríos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (50, 2, N'Envigado', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (51, 2, N'Fredonia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (52, 2, N'Frontino', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (53, 2, N'Giraldo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (54, 2, N'Girardota', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (55, 2, N'Gómez Plata', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (56, 2, N'Granada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (57, 2, N'Guadalupe', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (58, 2, N'Guarne', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (59, 2, N'Guatapé', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (60, 2, N'Heliconia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (61, 2, N'Hispania', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (62, 2, N'Itagüí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (63, 2, N'Ituango', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (64, 2, N'Jardín', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (65, 2, N'Jericó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (66, 2, N'La Ceja', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (67, 2, N'La Estrella', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (68, 2, N'La Pintada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (69, 2, N'La Unión', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (70, 2, N'Liborina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (71, 2, N'Maceo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (72, 2, N'Marinilla', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (73, 2, N'Medellín', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (74, 2, N'Montebello', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (75, 2, N'Murindó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (76, 2, N'Mutatá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (77, 2, N'Nariño', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (78, 2, N'Nechí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (79, 2, N'Necoclí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (80, 2, N'Olaya', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (81, 2, N'Peque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (82, 2, N'Pueblorrico', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (83, 2, N'Puerto Berrío', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (84, 2, N'Puerto Nare', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (85, 2, N'Puerto Triunfo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (86, 2, N'Remedios', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (87, 2, N'Rionegro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (88, 2, N'Sabanalarga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (89, 2, N'Sabaneta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (90, 2, N'Salgar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (91, 2, N'San Andrés de Cuerquia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (92, 2, N'San Carlos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (93, 2, N'San Francisco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (94, 2, N'San Jerónimo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (95, 2, N'San José de la Montaña', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (96, 2, N'San Juan de Urabá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (97, 2, N'San Luis', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (98, 2, N'San Pedro de Urabá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (99, 2, N'San Pedro de los Milagros', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (100, 2, N'San Rafael', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (101, 2, N'San Roque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (102, 2, N'San Vicente', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (103, 2, N'Santa Bárbara', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (104, 2, N'Santa Fe de Antioquia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (105, 2, N'Santa Rosa de Osos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (106, 2, N'Santo Domingo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (107, 2, N'Segovia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (108, 2, N'Sonsón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (109, 2, N'Sopetrán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (110, 2, N'Támesis', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (111, 2, N'Tarazá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (112, 2, N'Tarso', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (113, 2, N'Titiribí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (114, 2, N'Toledo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (115, 2, N'Turbo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (116, 2, N'Uramita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (117, 2, N'Urrao', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (118, 2, N'Valdivia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (119, 2, N'Valparaíso', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (120, 2, N'Vegachí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (121, 2, N'Venecia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (122, 2, N'Vigía del Fuerte', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (123, 2, N'Yalí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (124, 2, N'Yarumal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (125, 2, N'Yolombó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (126, 2, N'Yondó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (127, 2, N'Zaragoza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (128, 3, N'Arauca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (129, 3, N'Arauquita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (130, 3, N'Cravo Norte', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (131, 3, N'Fortul', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (132, 3, N'Puerto Rondón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (133, 3, N'Saravena', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (134, 3, N'Tame', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (135, 4, N'Baranoa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (136, 4, N'Barranquilla', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (137, 4, N'Campo de la Cruz', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (138, 4, N'Candelaria', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (139, 4, N'Galapa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (140, 4, N'Juan de Acosta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (141, 4, N'Luruaco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (142, 4, N'Malambo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (143, 4, N'Manatí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (144, 4, N'Palmar de Varela', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (145, 4, N'Piojó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (146, 4, N'Polonuevo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (147, 4, N'Ponedera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (148, 4, N'Puerto Colombia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (149, 4, N'Repelón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (150, 4, N'Sabanagrande', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (151, 4, N'Sabanalarga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (152, 4, N'Santa Lucía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (153, 4, N'Santo Tomás', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (154, 4, N'Soledad', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (155, 4, N'Suán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (156, 4, N'Tubará', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (157, 4, N'Usiacurí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (158, 5, N'Achí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (159, 5, N'Altos del Rosario', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (160, 5, N'Arenal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (161, 5, N'Arjona', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (162, 5, N'Arroyohondo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (163, 5, N'Barranco de Loba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (164, 5, N'Brazuelo de Papayal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (165, 5, N'Calamar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (166, 5, N'Cantagallo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (167, 5, N'Cartagena de Indias', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (168, 5, N'Cicuco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (169, 5, N'Clemencia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (170, 5, N'Córdoba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (171, 5, N'El Carmen de Bolívar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (172, 5, N'El Guamo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (173, 5, N'El Peñón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (174, 5, N'Hatillo de Loba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (175, 5, N'Magangué', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (176, 5, N'Mahates', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (177, 5, N'Margarita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (178, 5, N'María la Baja', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (179, 5, N'Mompós', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (180, 5, N'Montecristo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (181, 5, N'Morales', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (182, 5, N'Norosí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (183, 5, N'Pinillos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (184, 5, N'Regidor', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (185, 5, N'Río Viejo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (186, 5, N'San Cristóbal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (187, 5, N'San Estanislao', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (188, 5, N'San Fernando', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (189, 5, N'San Jacinto del Cauca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (190, 5, N'San Jacinto', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (191, 5, N'San Juan Nepomuceno', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (192, 5, N'San Martín de Loba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (193, 5, N'San Pablo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (194, 5, N'Santa Catalina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (195, 5, N'Santa Rosa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (196, 5, N'Santa Rosa del Sur', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (197, 5, N'Simití', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (198, 5, N'Soplaviento', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (199, 5, N'Talaigua Nuevo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (200, 5, N'Tiquisio', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (201, 5, N'Turbaco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (202, 5, N'Turbaná', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (203, 5, N'Villanueva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (204, 5, N'Zambrano', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (205, 6, N'Almeida', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (206, 6, N'Aquitania', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (207, 6, N'Arcabuco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (208, 6, N'Belén', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (209, 6, N'Berbeo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (210, 6, N'Betéitiva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (211, 6, N'Boavita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (212, 6, N'Boyacá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (213, 6, N'Briceño', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (214, 6, N'Buenavista', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (215, 6, N'Busbanzá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (216, 6, N'Caldas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (217, 6, N'Campohermoso', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (218, 6, N'Cerinza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (219, 6, N'Chinavita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (220, 6, N'Chiquinquirá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (221, 6, N'Chíquiza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (222, 6, N'Chiscas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (223, 6, N'Chita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (224, 6, N'Chitaraque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (225, 6, N'Chivatá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (226, 6, N'Chivor', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (227, 6, N'Ciénega', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (228, 6, N'Cómbita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (229, 6, N'Coper', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (230, 6, N'Corrales', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (231, 6, N'Covarachía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (232, 6, N'Cubará', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (233, 6, N'Cucaita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (234, 6, N'Cuítiva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (235, 6, N'Duitama', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (236, 6, N'El Cocuy', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (237, 6, N'El Espino', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (238, 6, N'Firavitoba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (239, 6, N'Floresta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (240, 6, N'Gachantivá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (241, 6, N'Gámeza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (242, 6, N'Garagoa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (243, 6, N'Guacamayas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (244, 6, N'Guateque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (245, 6, N'Guayatá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (246, 6, N'Güicán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (247, 6, N'Iza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (248, 6, N'Jenesano', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (249, 6, N'Jericó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (250, 6, N'La Capilla', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (251, 6, N'La Uvita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (252, 6, N'La Victoria', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (253, 6, N'Labranzagrande', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (254, 6, N'Macanal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (255, 6, N'Maripí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (256, 6, N'Miraflores', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (257, 6, N'Mongua', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (258, 6, N'Monguí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (259, 6, N'Moniquirá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (260, 6, N'Motavita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (261, 6, N'Muzo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (262, 6, N'Nobsa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (263, 6, N'Nuevo Colón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (264, 6, N'Oicatá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (265, 6, N'Otanche', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (266, 6, N'Pachavita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (267, 6, N'Páez', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (268, 6, N'Paipa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (269, 6, N'Pajarito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (270, 6, N'Panqueba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (271, 6, N'Pauna', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (272, 6, N'Paya', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (273, 6, N'Paz del Río', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (274, 6, N'Pesca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (275, 6, N'Pisba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (276, 6, N'Puerto Boyacá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (277, 6, N'Quípama', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (278, 6, N'Ramiriquí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (279, 6, N'Ráquira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (280, 6, N'Rondón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (281, 6, N'Saboyá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (282, 6, N'Sáchica', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (283, 6, N'Samacá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (284, 6, N'San Eduardo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (285, 6, N'San José de Pare', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (286, 6, N'San Luis de Gaceno', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (287, 6, N'San Mateo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (288, 6, N'San Miguel de Sema', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (289, 6, N'San Pablo de Borbur', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (290, 6, N'Santa María', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (291, 6, N'Santa Rosa de Viterbo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (292, 6, N'Santa Sofía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (293, 6, N'Santana', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (294, 6, N'Sativanorte', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (295, 6, N'Sativasur', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (296, 6, N'Siachoque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (297, 6, N'Soatá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (298, 6, N'Socha', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (299, 6, N'Socotá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (300, 6, N'Sogamoso', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (301, 6, N'Somondoco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (302, 6, N'Sora', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (303, 6, N'Soracá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (304, 6, N'Sotaquirá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (305, 6, N'Susacón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (306, 6, N'Sutamarchán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (307, 6, N'Sutatenza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (308, 6, N'Tasco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (309, 6, N'Tenza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (310, 6, N'Tibaná', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (311, 6, N'Tibasosa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (312, 6, N'Tinjacá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (313, 6, N'Tipacoque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (314, 6, N'Toca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (315, 6, N'Togüí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (316, 6, N'Tópaga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (317, 6, N'Tota', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (318, 6, N'Tunja', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (319, 6, N'Tununguá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (320, 6, N'Turmequé', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (321, 6, N'Tuta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (322, 6, N'Tutazá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (323, 6, N'Úmbita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (324, 6, N'Ventaquemada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (325, 6, N'Villa de Leyva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (326, 6, N'Viracachá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (327, 6, N'Zetaquira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (328, 7, N'Aguadas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (329, 7, N'Anserma', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (330, 7, N'Aranzazu', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (331, 7, N'Belalcázar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (332, 7, N'Chinchiná', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (333, 7, N'Filadelfia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (334, 7, N'La Dorada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (335, 7, N'La Merced', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (336, 7, N'Manizales', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (337, 7, N'Manzanares', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (338, 7, N'Marmato', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (339, 7, N'Marquetalia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (340, 7, N'Marulanda', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (341, 7, N'Neira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (342, 7, N'Norcasia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (343, 7, N'Pácora', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (344, 7, N'Palestina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (345, 7, N'Pensilvania', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (346, 7, N'Riosucio', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (347, 7, N'Risaralda', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (348, 7, N'Salamina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (349, 7, N'Samaná', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (350, 7, N'San José', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (351, 7, N'Supía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (352, 7, N'Victoria', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (353, 7, N'Villamaría', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (354, 7, N'Viterbo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (355, 8, N'Albania', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (356, 8, N'Belén de los Andaquíes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (357, 8, N'Cartagena del Chairá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (358, 8, N'Curillo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (359, 8, N'El Doncello', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (360, 8, N'El Paujil', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (361, 8, N'Florencia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (362, 8, N'La Montañita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (363, 8, N'Milán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (364, 8, N'Morelia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (365, 8, N'Puerto Rico', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (366, 8, N'San José del Fragua', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (367, 8, N'San Vicente del Caguán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (368, 8, N'Solano', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (369, 8, N'Solita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (370, 8, N'Valparaíso', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (371, 9, N'Aguazul', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (372, 9, N'Chámeza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (373, 9, N'Hato Corozal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (374, 9, N'La Salina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (375, 9, N'Maní', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (376, 9, N'Monterrey', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (377, 9, N'Nunchía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (378, 9, N'Orocué', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (379, 9, N'Paz de Ariporo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (380, 9, N'Pore', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (381, 9, N'Recetor', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (382, 9, N'Sabanalarga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (383, 9, N'Sácama', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (384, 9, N'San Luis de Palenque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (385, 9, N'Támara', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (386, 9, N'Tauramena', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (387, 9, N'Trinidad', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (388, 9, N'Villanueva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (389, 9, N'Yopal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (390, 10, N'Almaguer', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (391, 10, N'Argelia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (392, 10, N'Balboa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (393, 10, N'Bolívar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (394, 10, N'Buenos Aires', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (395, 10, N'Cajibío', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (396, 10, N'Caldono', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (397, 10, N'Caloto', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (398, 10, N'Corinto', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (399, 10, N'El Tambo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (400, 10, N'Florencia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (401, 10, N'Guachené', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (402, 10, N'Guapí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (403, 10, N'Inzá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (404, 10, N'Jambaló', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (405, 10, N'La Sierra', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (406, 10, N'La Vega', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (407, 10, N'López de Micay', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (408, 10, N'Mercaderes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (409, 10, N'Miranda', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (410, 10, N'Morales', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (411, 10, N'Padilla', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (412, 10, N'Páez', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (413, 10, N'Patía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (414, 10, N'Piamonte', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (415, 10, N'Piendamó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (416, 10, N'Popayán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (417, 10, N'Puerto Tejada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (418, 10, N'Puracé', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (419, 10, N'Rosas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (420, 10, N'San Sebastián', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (421, 10, N'Santa Rosa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (422, 10, N'Santander de Quilichao', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (423, 10, N'Silvia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (424, 10, N'Sotará', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (425, 10, N'Suárez', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (426, 10, N'Sucre', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (427, 10, N'Timbío', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (428, 10, N'Timbiquí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (429, 10, N'Toribío', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (430, 10, N'Totoró', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (431, 10, N'Villa Rica', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (432, 11, N'Aguachica', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (433, 11, N'Agustín Codazzi', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (434, 11, N'Astrea', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (435, 11, N'Becerril', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (436, 11, N'Bosconia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (437, 11, N'Chimichagua', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (438, 11, N'Chiriguaná', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (439, 11, N'Curumaní', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (440, 11, N'El Copey', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (441, 11, N'El Paso', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (442, 11, N'Gamarra', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (443, 11, N'González', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (444, 11, N'La Gloria (Cesar)', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (445, 11, N'La Jagua de Ibirico', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (446, 11, N'La Paz', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (447, 11, N'Manaure Balcón del Cesar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (448, 11, N'Pailitas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (449, 11, N'Pelaya', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (450, 11, N'Pueblo Bello', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (451, 11, N'Río de Oro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (452, 11, N'San Alberto', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (453, 11, N'San Diego', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (454, 11, N'San Martín', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (455, 11, N'Tamalameque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (456, 11, N'Valledupar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (457, 12, N'Acandí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (458, 12, N'Alto Baudó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (459, 12, N'Bagadó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (460, 12, N'Bahía Solano', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (461, 12, N'Bajo Baudó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (462, 12, N'Bojayá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (463, 12, N'Cantón de San Pablo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (464, 12, N'Cértegui', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (465, 12, N'Condoto', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (466, 12, N'El Atrato', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (467, 12, N'El Carmen de Atrato', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (468, 12, N'El Carmen del Darién', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (469, 12, N'Istmina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (470, 12, N'Juradó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (471, 12, N'Litoral de San Juan', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (472, 12, N'Lloró', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (473, 12, N'Medio Atrato', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (474, 12, N'Medio Baudó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (475, 12, N'Medio San Juan', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (476, 12, N'Nóvita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (477, 12, N'Nuquí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (478, 12, N'Quibdó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (479, 12, N'Río Iró', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (480, 12, N'Río Quito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (481, 12, N'Riosucio', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (482, 12, N'San José del Palmar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (483, 12, N'Sipí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (484, 12, N'Tadó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (485, 12, N'Unión Panamericana', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (486, 12, N'Unguía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (487, 13, N'Ayapel', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (488, 13, N'Buenavista', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (489, 13, N'Canalete', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (490, 13, N'Cereté', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (491, 13, N'Chimá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (492, 13, N'Chinú', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (493, 13, N'Ciénaga de Oro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (494, 13, N'Cotorra', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (495, 13, N'La Apartada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (496, 13, N'Lorica', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (497, 13, N'Los Córdobas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (498, 13, N'Momil', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (499, 13, N'Montelíbano', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (500, 13, N'Montería', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (501, 13, N'Moñitos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (502, 13, N'Planeta Rica', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (503, 13, N'Pueblo Nuevo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (504, 13, N'Puerto Escondido', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (505, 13, N'Puerto Libertador', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (506, 13, N'Purísima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (507, 13, N'Sahagún', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (508, 13, N'San Andrés de Sotavento', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (509, 13, N'San Antero', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (510, 13, N'San Bernardo del Viento', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (511, 13, N'San Carlos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (512, 13, N'San José de Uré', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (513, 13, N'San Pelayo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (514, 13, N'Tierralta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (515, 13, N'Tuchín', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (516, 13, N'Valencia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (517, 14, N'Agua de Dios', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (518, 14, N'Albán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (519, 14, N'Anapoima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (520, 14, N'Anolaima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (521, 14, N'Apulo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (522, 14, N'Arbeláez', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (523, 14, N'Beltrán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (524, 14, N'Bituima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (525, 14, N'Bojacá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (526, 14, N'Cabrera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (527, 14, N'Cachipay', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (528, 14, N'Cajicá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (529, 14, N'Caparrapí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (530, 14, N'Cáqueza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (531, 14, N'Carmen de Carupa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (532, 14, N'Chaguaní', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (533, 14, N'Chía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (534, 14, N'Chipaque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (535, 14, N'Choachí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (536, 14, N'Chocontá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (537, 14, N'Cogua', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (538, 14, N'Cota', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (539, 14, N'Cucunubá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (540, 14, N'El Colegio', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (541, 14, N'El Peñón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (542, 14, N'El Rosal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (543, 14, N'Facatativá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (544, 14, N'Fómeque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (545, 14, N'Fosca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (546, 14, N'Funza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (547, 14, N'Fúquene', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (548, 14, N'Fusagasugá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (549, 14, N'Gachalá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (550, 14, N'Gachancipá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (551, 14, N'Gachetá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (552, 14, N'Gama', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (553, 14, N'Girardot', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (554, 14, N'Granada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (555, 14, N'Guachetá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (556, 14, N'Guaduas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (557, 14, N'Guasca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (558, 14, N'Guataquí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (559, 14, N'Guatavita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (560, 14, N'Guayabal de Síquima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (561, 14, N'Guayabetal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (562, 14, N'Gutiérrez', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (563, 14, N'Jerusalén', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (564, 14, N'Junín', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (565, 14, N'La Calera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (566, 14, N'La Mesa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (567, 14, N'La Palma', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (568, 14, N'La Peña', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (569, 14, N'La Vega', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (570, 14, N'Lenguazaque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (571, 14, N'Machetá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (572, 14, N'Madrid', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (573, 14, N'Manta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (574, 14, N'Medina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (575, 14, N'Mosquera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (576, 14, N'Nariño', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (577, 14, N'Nemocón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (578, 14, N'Nilo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (579, 14, N'Nimaima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (580, 14, N'Nocaima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (581, 14, N'Pacho', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (582, 14, N'Paime', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (583, 14, N'Pandi', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (584, 14, N'Paratebueno', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (585, 14, N'Pasca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (586, 14, N'Puerto Salgar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (587, 14, N'Pulí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (588, 14, N'Quebradanegra', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (589, 14, N'Quetame', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (590, 14, N'Quipile', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (591, 14, N'Ricaurte', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (592, 14, N'San Antonio del Tequendama', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (593, 14, N'San Bernardo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (594, 14, N'San Cayetano', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (595, 14, N'San Francisco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (596, 14, N'San Juan de Rioseco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (597, 14, N'Sasaima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (598, 14, N'Sesquilé', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (599, 14, N'Sibaté', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (600, 14, N'Silvania', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (601, 14, N'Simijaca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (602, 14, N'Soacha', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (603, 14, N'Sopó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (604, 14, N'Subachoque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (605, 14, N'Suesca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (606, 14, N'Supatá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (607, 14, N'Susa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (608, 14, N'Sutatausa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (609, 14, N'Tabio', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (610, 14, N'Tausa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (611, 14, N'Tena', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (612, 14, N'Tenjo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (613, 14, N'Tibacuy', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (614, 14, N'Tibirita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (615, 14, N'Tocaima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (616, 14, N'Tocancipá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (617, 14, N'Topaipí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (618, 14, N'Ubalá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (619, 14, N'Ubaque', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (620, 14, N'Ubaté', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (621, 14, N'Une', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (622, 14, N'Útica', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (623, 14, N'Venecia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (624, 14, N'Vergara', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (625, 14, N'Vianí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (626, 14, N'Villagómez', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (627, 14, N'Villapinzón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (628, 14, N'Villeta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (629, 14, N'Viotá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (630, 14, N'Yacopí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (631, 14, N'Zipacón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (632, 14, N'Zipaquirá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (633, 15, N'Inírida', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (634, 16, N'Calamar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (635, 16, N'El Retorno', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (636, 16, N'Miraflores', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (637, 16, N'San José del Guaviare', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (638, 17, N'Acevedo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (639, 17, N'Agrado', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (640, 17, N'Aipe', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (641, 17, N'Algeciras', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (642, 17, N'Altamira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (643, 17, N'Baraya', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (644, 17, N'Campoalegre', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (645, 17, N'Colombia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (646, 17, N'El Pital', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (647, 17, N'Elías', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (648, 17, N'Garzón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (649, 17, N'Gigante', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (650, 17, N'Guadalupe', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (651, 17, N'Hobo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (652, 17, N'Íquira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (653, 17, N'Isnos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (654, 17, N'La Argentina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (655, 17, N'La Plata', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (656, 17, N'Nátaga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (657, 17, N'Neiva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (658, 17, N'Oporapa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (659, 17, N'Paicol', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (660, 17, N'Palermo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (661, 17, N'Palestina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (662, 17, N'Pitalito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (663, 17, N'Rivera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (664, 17, N'Saladoblanco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (665, 17, N'San Agustín', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (666, 17, N'Santa María', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (667, 17, N'Suaza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (668, 17, N'Tarqui', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (669, 17, N'Tello', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (670, 17, N'Teruel', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (671, 17, N'Tesalia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (672, 17, N'Timaná', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (673, 17, N'Villavieja', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (674, 17, N'Yaguará', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (675, 18, N'Albania', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (676, 18, N'Barrancas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (677, 18, N'Dibulla', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (678, 18, N'Distracción', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (679, 18, N'El Molino', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (680, 18, N'Fonseca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (681, 18, N'Hatonuevo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (682, 18, N'La Jagua del Pilar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (683, 18, N'Maicao', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (684, 18, N'Manaure', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (685, 18, N'Riohacha', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (686, 18, N'San Juan del Cesar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (687, 18, N'Uribia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (688, 18, N'Urumita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (689, 18, N'Villanueva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (690, 19, N'Algarrobo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (691, 19, N'Aracataca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (692, 19, N'Ariguaní', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (693, 19, N'Cerro de San Antonio', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (694, 19, N'Chibolo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (695, 19, N'Ciénaga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (696, 19, N'Concordia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (697, 19, N'El Banco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (698, 19, N'El Piñón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (699, 19, N'El Retén', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (700, 19, N'Fundación', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (701, 19, N'Guamal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (702, 19, N'Nueva Granada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (703, 19, N'Pedraza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (704, 19, N'Pijiño del Carmen', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (705, 19, N'Pivijay', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (706, 19, N'Plato', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (707, 19, N'Pueblo Viejo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (708, 19, N'Remolino', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (709, 19, N'Sabanas de San Ángel', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (710, 19, N'Salamina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (711, 19, N'San Sebastián de Buenavista', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (712, 19, N'San Zenón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (713, 19, N'Santa Ana', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (714, 19, N'Santa Bárbara de Pinto', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (715, 19, N'Santa Marta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (716, 19, N'Sitionuevo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (717, 19, N'Tenerife', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (718, 19, N'Zapayán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (719, 19, N'Zona Bananera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (720, 20, N'Acacías', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (721, 20, N'Barranca de Upía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (722, 20, N'Cabuyaro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (723, 20, N'Castilla la Nueva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (724, 20, N'Cubarral', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (725, 20, N'Cumaral', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (726, 20, N'El Calvario', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (727, 20, N'El Castillo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (728, 20, N'El Dorado', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (729, 20, N'Fuente de Oro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (730, 20, N'Granada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (731, 20, N'Guamal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (732, 20, N'La Macarena', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (733, 20, N'La Uribe', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (734, 20, N'Lejanías', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (735, 20, N'Mapiripán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (736, 20, N'Mesetas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (737, 20, N'Puerto Concordia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (738, 20, N'Puerto Gaitán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (739, 20, N'Puerto Lleras', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (740, 20, N'Puerto López', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (741, 20, N'Puerto Rico', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (742, 20, N'Restrepo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (743, 20, N'San Carlos de Guaroa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (744, 20, N'San Juan de Arama', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (745, 20, N'San Juanito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (746, 20, N'San Martín', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (747, 20, N'Villavicencio', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (748, 20, N'Vista Hermosa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (749, 21, N'Aldana', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (750, 21, N'Ancuyá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (751, 21, N'Arboleda', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (752, 21, N'Barbacoas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (753, 21, N'Belén', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (754, 21, N'Buesaco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (755, 21, N'Chachagüí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (756, 21, N'Colón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (757, 21, N'Consacá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (758, 21, N'Contadero', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (759, 21, N'Córdoba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (760, 21, N'Cuaspud', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (761, 21, N'Cumbal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (762, 21, N'Cumbitara', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (763, 21, N'El Charco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (764, 21, N'El Peñol', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (765, 21, N'El Rosario', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (766, 21, N'El Tablón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (767, 21, N'El Tambo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (768, 21, N'Francisco Pizarro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (769, 21, N'Funes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (770, 21, N'Guachucal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (771, 21, N'Guaitarilla', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (772, 21, N'Gualmatán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (773, 21, N'Iles', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (774, 21, N'Imués', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (775, 21, N'Ipiales', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (776, 21, N'La Cruz', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (777, 21, N'La Florida', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (778, 21, N'La Llanada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (779, 21, N'La Tola', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (780, 21, N'La Unión', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (781, 21, N'Leiva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (782, 21, N'Linares', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (783, 21, N'Los Andes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (784, 21, N'Magüí Payán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (785, 21, N'Mallama', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (786, 21, N'Mosquera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (787, 21, N'Nariño', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (788, 21, N'Olaya Herrera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (789, 21, N'Ospina', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (790, 21, N'Pasto', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (791, 21, N'Policarpa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (792, 21, N'Potosí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (793, 21, N'Providencia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (794, 21, N'Puerres', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (795, 21, N'Pupiales', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (796, 21, N'Ricaurte', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (797, 21, N'Roberto Payán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (798, 21, N'Samaniego', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (799, 21, N'San Bernardo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (800, 21, N'San José de Albán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (801, 21, N'San Lorenzo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (802, 21, N'San Pablo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (803, 21, N'San Pedro de Cartago', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (804, 21, N'Sandoná', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (805, 21, N'Santa Bárbara', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (806, 21, N'Santacruz', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (807, 21, N'Sapuyes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (808, 21, N'Taminango', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (809, 21, N'Tangua', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (810, 21, N'Tumaco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (811, 21, N'Túquerres', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (812, 21, N'Yacuanquer', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (813, 22, N'Ábrego', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (814, 22, N'Arboledas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (815, 22, N'Bochalema', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (816, 22, N'Bucarasica', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (817, 22, N'Cáchira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (818, 22, N'Cácota', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (819, 22, N'Chinácota', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (820, 22, N'Chitagá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (821, 22, N'Convención', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (822, 22, N'Cúcuta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (823, 22, N'Cucutilla', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (824, 22, N'Durania', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (825, 22, N'El Carmen', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (826, 22, N'El Tarra', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (827, 22, N'El Zulia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (828, 22, N'Gramalote', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (829, 22, N'Hacarí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (830, 22, N'Herrán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (831, 22, N'La Esperanza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (832, 22, N'La Playa de Belén', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (833, 22, N'Labateca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (834, 22, N'Los Patios', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (835, 22, N'Lourdes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (836, 22, N'Mutiscua', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (837, 22, N'Ocaña', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (838, 22, N'Pamplona', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (839, 22, N'Pamplonita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (840, 22, N'Puerto Santander', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (841, 22, N'Ragonvalia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (842, 22, N'Salazar de Las Palmas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (843, 22, N'San Calixto', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (844, 22, N'San Cayetano', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (845, 22, N'Santiago', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (846, 22, N'Santo Domingo de Silos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (847, 22, N'Sardinata', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (848, 22, N'Teorama', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (849, 22, N'Tibú', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (850, 22, N'Toledo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (851, 22, N'Villa Caro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (852, 22, N'Villa del Rosario', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (853, 23, N'Colón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (854, 23, N'Mocoa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (855, 23, N'Orito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (856, 23, N'Puerto Asís', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (857, 23, N'Puerto Caicedo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (858, 23, N'Puerto Guzmán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (859, 23, N'Puerto Leguízamo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (860, 23, N'San Francisco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (861, 23, N'San Miguel', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (862, 23, N'Santiago', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (863, 23, N'Sibundoy', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (864, 23, N'Valle del Guamuez', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (865, 23, N'Villagarzón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (866, 24, N'Armenia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (867, 24, N'Buenavista', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (868, 24, N'Calarcá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (869, 24, N'Circasia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (870, 24, N'Córdoba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (871, 24, N'Filandia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (872, 24, N'Génova', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (873, 24, N'La Tebaida', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (874, 24, N'Montenegro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (875, 24, N'Pijao', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (876, 24, N'Quimbaya', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (877, 24, N'Salento', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (878, 25, N'Apía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (879, 25, N'Balboa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (880, 25, N'Belén de Umbría', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (881, 25, N'Dosquebradas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (882, 25, N'Guática', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (883, 25, N'La Celia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (884, 25, N'La Virginia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (885, 25, N'Marsella', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (886, 25, N'Mistrató', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (887, 25, N'Pereira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (888, 25, N'Pueblo Rico', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (889, 25, N'Quinchía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (890, 25, N'Santa Rosa de Cabal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (891, 25, N'Santuario', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (892, 26, N'Providencia y Santa Catalina Islas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (893, 26, N'San Andrés', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (894, 27, N'Aguada', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (895, 27, N'Albania', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (896, 27, N'Aratoca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (897, 27, N'Barbosa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (898, 27, N'Barichara', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (899, 27, N'Barrancabermeja', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (900, 27, N'Betulia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (901, 27, N'Bolívar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (902, 27, N'Bucaramanga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (903, 27, N'Cabrera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (904, 27, N'California', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (905, 27, N'Capitanejo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (906, 27, N'Carcasí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (907, 27, N'Cepitá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (908, 27, N'Cerrito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (909, 27, N'Charalá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (910, 27, N'Charta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (911, 27, N'Chima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (912, 27, N'Chipatá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (913, 27, N'Cimitarra', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (914, 27, N'Concepción', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (915, 27, N'Confines', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (916, 27, N'Contratación', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (917, 27, N'Coromoro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (918, 27, N'Curití', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (919, 27, N'El Carmen de Chucurí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (920, 27, N'El Guacamayo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (921, 27, N'El Peñón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (922, 27, N'El Playón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (923, 27, N'El Socorro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (924, 27, N'Encino', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (925, 27, N'Enciso', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (926, 27, N'Florián', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (927, 27, N'Floridablanca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (928, 27, N'Galán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (929, 27, N'Gámbita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (930, 27, N'Girón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (931, 27, N'Guaca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (932, 27, N'Guadalupe', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (933, 27, N'Guapotá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (934, 27, N'Guavatá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (935, 27, N'Güepsa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (936, 27, N'Hato', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (937, 27, N'Jesús María', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (938, 27, N'Jordán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (939, 27, N'La Belleza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (940, 27, N'La Paz', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (941, 27, N'Landázuri', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (942, 27, N'Lebrija', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (943, 27, N'Los Santos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (944, 27, N'Macaravita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (945, 27, N'Málaga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (946, 27, N'Matanza', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (947, 27, N'Mogotes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (948, 27, N'Molagavita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (949, 27, N'Ocamonte', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (950, 27, N'Oiba', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (951, 27, N'Onzaga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (952, 27, N'Palmar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (953, 27, N'Palmas del Socorro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (954, 27, N'Páramo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (955, 27, N'Piedecuesta', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (956, 27, N'Pinchote', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (957, 27, N'Puente Nacional', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (958, 27, N'Puerto Parra', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (959, 27, N'Puerto Wilches', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (960, 27, N'Rionegro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (961, 27, N'Sabana de Torres', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (962, 27, N'San Andrés', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (963, 27, N'San Benito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (964, 27, N'San Gil', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (965, 27, N'San Joaquín', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (966, 27, N'San José de Miranda', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (967, 27, N'San Miguel', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (968, 27, N'San Vicente de Chucurí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (969, 27, N'Santa Bárbara', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (970, 27, N'Santa Helena del Opón', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (971, 27, N'Simacota', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (972, 27, N'Suaita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (973, 27, N'Sucre', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (974, 27, N'Suratá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (975, 27, N'Tona', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (976, 27, N'Valle de San José', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (977, 27, N'Vélez', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (978, 27, N'Vetas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (979, 27, N'Villanueva', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (980, 27, N'Zapatoca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (981, 28, N'Buenavista', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (982, 28, N'Caimito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (983, 28, N'Chalán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (984, 28, N'Colosó', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (985, 28, N'Corozal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (986, 28, N'Coveñas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (987, 28, N'El Roble', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (988, 28, N'Galeras', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (989, 28, N'Guaranda', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (990, 28, N'La Unión', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (991, 28, N'Los Palmitos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (992, 28, N'Majagual', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (993, 28, N'Morroa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (994, 28, N'Ovejas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (995, 28, N'Sampués', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (996, 28, N'San Antonio de Palmito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (997, 28, N'San Benito Abad', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (998, 28, N'San Juan de Betulia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (999, 28, N'San Marcos', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1000, 28, N'San Onofre', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1001, 28, N'San Pedro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1002, 28, N'Sincé', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1003, 28, N'Sincelejo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1004, 28, N'Sucre', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1005, 28, N'Tolú', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1006, 28, N'Tolú Viejo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1007, 29, N'Alpujarra', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1008, 29, N'Alvarado', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1009, 29, N'Ambalema', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1010, 29, N'Anzoátegui', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1011, 29, N'Armero', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1012, 29, N'Ataco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1013, 29, N'Cajamarca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1014, 29, N'Carmen de Apicalá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1015, 29, N'Casabianca', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1016, 29, N'Chaparral', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1017, 29, N'Coello', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1018, 29, N'Coyaima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1019, 29, N'Cunday', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1020, 29, N'Dolores', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1021, 29, N'El Espinal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1022, 29, N'Falán', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1023, 29, N'Flandes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1024, 29, N'Fresno', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1025, 29, N'Guamo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1026, 29, N'Herveo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1027, 29, N'Honda', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1028, 29, N'Ibagué', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1029, 29, N'Icononzo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1030, 29, N'Lérida', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1031, 29, N'Líbano', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1032, 29, N'Mariquita', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1033, 29, N'Melgar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1034, 29, N'Murillo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1035, 29, N'Natagaima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1036, 29, N'Ortega', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1037, 29, N'Palocabildo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1038, 29, N'Piedras', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1039, 29, N'Planadas', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1040, 29, N'Prado', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1041, 29, N'Purificación', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1042, 29, N'Rioblanco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1043, 29, N'Roncesvalles', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1044, 29, N'Rovira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1045, 29, N'Saldaña', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1046, 29, N'San Antonio', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1047, 29, N'San Luis', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1048, 29, N'Santa Isabel', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1049, 29, N'Suárez', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1050, 29, N'Valle de San Juan', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1051, 29, N'Venadillo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1052, 29, N'Villahermosa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1053, 29, N'Villarrica', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1054, 30, N'Alcalá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1055, 30, N'Andalucía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1056, 30, N'Ansermanuevo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1057, 30, N'Argelia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1058, 30, N'Bolívar', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1059, 30, N'Buenaventura', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1060, 30, N'Buga', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1061, 30, N'Bugalagrande', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1062, 30, N'Caicedonia', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1063, 30, N'Cali', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1064, 30, N'Calima', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1065, 30, N'Candelaria', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1066, 30, N'Cartago', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1067, 30, N'Dagua', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1068, 30, N'El Águila', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1069, 30, N'El Cairo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1070, 30, N'El Cerrito', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1071, 30, N'El Dovio', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1072, 30, N'Florida', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1073, 30, N'Ginebra', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1074, 30, N'Guacarí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1075, 30, N'Jamundí', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1076, 30, N'La Cumbre', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1077, 30, N'La Unión', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1078, 30, N'La Victoria', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1079, 30, N'Obando', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1080, 30, N'Palmira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1081, 30, N'Pradera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1082, 30, N'Restrepo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1083, 30, N'Riofrío', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1084, 30, N'Roldanillo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1085, 30, N'San Pedro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1086, 30, N'Sevilla', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1087, 30, N'Toro', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1088, 30, N'Trujillo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1089, 30, N'Tuluá', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1090, 30, N'Ulloa', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1091, 30, N'Versalles', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1092, 30, N'Vijes', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1093, 30, N'Yotoco', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1094, 30, N'Yumbo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1095, 30, N'Zarzal', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1096, 31, N'Carurú', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1097, 31, N'Mitú', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1098, 31, N'Taraira', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1099, 32, N'Cumaribo', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1100, 32, N'La Primavera', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1101, 32, N'Puerto Carreño', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1102, 32, N'Santa Rosalía', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
INSERT [dbo].[Ciudad] ([CiudadId], [DepartamentoId], [CiudadNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1103, 33, N'Bogotá D.C.', NULL, 1, CAST(N'2026-05-06T20:20:44.710' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
GO
SET IDENTITY_INSERT [dbo].[Clase] ON 
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, 1, N'Tipos de Documentos', 1, CAST(N'2026-05-06T19:52:13.987' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (2, 1, N'Sexo', 1, CAST(N'2026-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1002, 1, N'Predicador', 1, CAST(N'2026-05-13T18:52:30.217' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1003, 1, N'ESCALAFON PASTORAL', 1, CAST(N'2026-05-21T13:14:49.263' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1004, 1, N'DIACONADO -a', 1, CAST(N'2026-05-21T13:28:41.827' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1005, 1, N'ESTADO DEL MIEMBRO', 1, CAST(N'2026-05-21T13:32:46.580' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1006, 1, N'Rol', 1, CAST(N'2026-05-21T13:36:40.010' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1007, 1, N'TIPO DE POBLACION', 1, CAST(N'2026-05-21T13:45:36.623' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1009, 1, N'ESTADO CIVIL', 1, CAST(N'2026-05-28T15:44:44.817' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1010, 1, N'ESTUDIOS REALIZADOS ', 1, CAST(N'2026-05-28T16:07:38.787' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1011, 1, N'Situación Laboral', 1, CAST(N'2026-05-28T16:36:19.390' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1012, 1, N'Interés', 1, CAST(N'2026-05-30T19:53:45.857' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1013, 2, N'Tipos de Documentos', 1, CAST(N'2026-05-06T19:52:13.987' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1014, 2, N'Sexo', 1, CAST(N'2026-05-06T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1015, 2, N'Predicador', 1, CAST(N'2026-05-13T18:52:30.217' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1016, 2, N'ESCALAFON PASTORAL', 1, CAST(N'2026-05-21T13:14:49.263' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1017, 2, N'DIACONADO -a', 1, CAST(N'2026-05-21T13:28:41.827' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1018, 2, N'ESTADO DEL MIEMBRO', 1, CAST(N'2026-05-21T13:32:46.580' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1019, 2, N'Rol', 1, CAST(N'2026-05-21T13:36:40.010' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1020, 2, N'TIPO DE POBLACION', 1, CAST(N'2026-05-21T13:45:36.623' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1021, 2, N'ESTADO CIVIL', 1, CAST(N'2026-05-28T15:44:44.817' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1022, 2, N'ESTUDIOS REALIZADOS ', 1, CAST(N'2026-05-28T16:07:38.787' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1023, 2, N'Situación Laboral', 1, CAST(N'2026-05-28T16:36:19.390' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1024, 2, N'Interés', 1, CAST(N'2026-05-30T19:53:45.857' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1025, 1, N'TIPO DE MIEMBRO', 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Clase] ([ClaseId], [DenominacionId], [Descripcion], [Estado], [FechaCreacion]) VALUES (1026, 1, N'ESTUDIOS TEOLÓGICOS', 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Clase] OFF
GO
SET IDENTITY_INSERT [dbo].[CompletarDatos] ON 
GO
INSERT [dbo].[CompletarDatos] ([CompletarDatosId], [RegistroId], [PaisResidenciaId], [DepartamentoResidenciaId], [CiudadResidenciaId], [FechaNacimiento], [ParametroIdEstadoCivil], [ParametroIdEstudiosAcademicos], [ParametroIdEstudiosTeologicos], [ParametroIdSituacionLaboral], [ParametroIdTipoMiembro], [ParametroIdTipoPoblacion], [FechaBautismo], [PersonaContacto], [TelefonoContacto], [FechaCreacion], [FechaModificacion], [IglesiaId], [DenominacionId], [IglesiaBautismo], [PastorBautismo]) VALUES (4, 1, 1, 1, 2, CAST(N'2026-09-23' AS Date), 2040, 2044, 2151, 2063, 2148, 2027, CAST(N'2026-09-16' AS Date), N'Juusue', N'2541222336', CAST(N'2026-09-17T00:14:30.6600000' AS DateTime2), NULL, 1, 1, N'Budu', N'Uru')
GO
SET IDENTITY_INSERT [dbo].[CompletarDatos] OFF
GO
SET IDENTITY_INSERT [dbo].[ConfiguracionIglesiaColores] ON 
GO
INSERT [dbo].[ConfiguracionIglesiaColores] ([ConfiguracionIglesiaId], [DenominacionId], [NombreColor], [ValorColor]) VALUES (1, 1, N'Background', N'#FFFFFF')
GO
INSERT [dbo].[ConfiguracionIglesiaColores] ([ConfiguracionIglesiaId], [DenominacionId], [NombreColor], [ValorColor]) VALUES (2, 1, N'Error', N'#EF4444')
GO
INSERT [dbo].[ConfiguracionIglesiaColores] ([ConfiguracionIglesiaId], [DenominacionId], [NombreColor], [ValorColor]) VALUES (3, 1, N'Info', N'#3B82F6')
GO
INSERT [dbo].[ConfiguracionIglesiaColores] ([ConfiguracionIglesiaId], [DenominacionId], [NombreColor], [ValorColor]) VALUES (4, 1, N'Primary', N'#634AFE')
GO
INSERT [dbo].[ConfiguracionIglesiaColores] ([ConfiguracionIglesiaId], [DenominacionId], [NombreColor], [ValorColor]) VALUES (5, 1, N'Secondary', N'#E1DBFF')
GO
INSERT [dbo].[ConfiguracionIglesiaColores] ([ConfiguracionIglesiaId], [DenominacionId], [NombreColor], [ValorColor]) VALUES (6, 1, N'Success', N'#22C55E')
GO
INSERT [dbo].[ConfiguracionIglesiaColores] ([ConfiguracionIglesiaId], [DenominacionId], [NombreColor], [ValorColor]) VALUES (7, 1, N'Surface', N'#F5F5F5')
GO
INSERT [dbo].[ConfiguracionIglesiaColores] ([ConfiguracionIglesiaId], [DenominacionId], [NombreColor], [ValorColor]) VALUES (8, 1, N'Tertiary', N'#1F2937')
GO
INSERT [dbo].[ConfiguracionIglesiaColores] ([ConfiguracionIglesiaId], [DenominacionId], [NombreColor], [ValorColor]) VALUES (9, 1, N'Warning', N'#F59E0B')
GO
SET IDENTITY_INSERT [dbo].[ConfiguracionIglesiaColores] OFF
GO
SET IDENTITY_INSERT [dbo].[Denominaciones] ON 
GO
INSERT [dbo].[Denominaciones] ([DenominacionId], [Nombre], [Slug], [Activa], [IglesiaPrincipalId], [FechaCreacion]) VALUES (1, N'Iglesia de Dios Guiada por el Espiritu Santo (IDGES)', N'IDGES', 1, 1, CAST(N'2026-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Denominaciones] ([DenominacionId], [Nombre], [Slug], [Activa], [IglesiaPrincipalId], [FechaCreacion]) VALUES (2, N'Iglesia Cristiana Centro Bíblico SHELEMUT', N'CBS', 1, 57, CAST(N'2026-06-12T18:34:08.657' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Denominaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[DenominacionesDominios] ON 
GO
INSERT [dbo].[DenominacionesDominios] ([DenominacionDominioId], [DenominacionId], [Dominio], [Subdominio], [Estado], [FechaCreacion]) VALUES (1, 1, N'https://www.emuna360.net', N'idges.emuna360.net', 1, CAST(N'2026-06-13T13:54:50.563' AS DateTime))
GO
INSERT [dbo].[DenominacionesDominios] ([DenominacionDominioId], [DenominacionId], [Dominio], [Subdominio], [Estado], [FechaCreacion]) VALUES (2, 2, N'https://www.emuna360.net', N'cbs.emuna360.net', 1, CAST(N'2026-06-13T13:57:20.200' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DenominacionesDominios] OFF
GO
SET IDENTITY_INSERT [dbo].[Departamento] ON 
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, 1, N'Amazonas', NULL, 1, CAST(N'2026-05-06T20:13:28.393' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (2, 1, N'Antioquia', NULL, 1, CAST(N'2026-05-06T20:13:28.393' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (3, 1, N'Arauca', NULL, 1, CAST(N'2026-05-06T20:13:28.393' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (4, 1, N'Atlántico', NULL, 1, CAST(N'2026-05-06T20:13:28.393' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (5, 1, N'Bolívar', NULL, 1, CAST(N'2026-05-06T20:13:28.393' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (6, 1, N'Boyacá', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (7, 1, N'Caldas', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (8, 1, N'Caquetá', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (9, 1, N'Casanare', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (10, 1, N'Cauca', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (11, 1, N'Cesar', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (12, 1, N'Chocó', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (13, 1, N'Córdoba', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (14, 1, N'Cundinamarca', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (15, 1, N'Guainía', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (16, 1, N'Guaviare', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (17, 1, N'Huila', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (18, 1, N'La Guajira', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (19, 1, N'Magdalena', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (20, 1, N'Meta', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (21, 1, N'Nariño', NULL, 1, CAST(N'2026-05-06T20:13:28.397' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (22, 1, N'Norte de Santander', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (23, 1, N'Putumayo', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (24, 1, N'Quindío', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (25, 1, N'Risaralda', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (26, 1, N'San Andrés y Providencia', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (27, 1, N'Santander', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (28, 1, N'Sucre', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (29, 1, N'Tolima', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (30, 1, N'Valle del Cauca', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (31, 1, N'Vaupés', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (32, 1, N'Vichada', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
INSERT [dbo].[Departamento] ([DepartamentoId], [PaisId], [DepartamentoNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (33, 1, N'Bogotá D.C.', NULL, 1, CAST(N'2026-05-06T20:13:28.400' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[EstructuraOrganizacional] ON 
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (1, 1, N'Regional Llanos', NULL, 1, N'Diana Patricia Castellanos Jimenez', 1, CAST(N'2026-05-17T23:16:00.573' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (2, 1, N'Zona 1', 1, 2, N'Dairo Mendivil Moreno', 1, CAST(N'2026-05-17T23:19:05.550' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (3, 1, N'Regional Oriente', NULL, 3, N'Umar Cruz Pizarro', 1, CAST(N'2026-05-21T14:01:01.623' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (4, 1, N'Regional Centro', NULL, 4, N'Juan Carlos Daza Avendaño', 1, CAST(N'2026-05-21T14:01:39.487' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (5, 1, N'Regional Costa - Antioquia', NULL, 5, N'Wilfredo de Jesús Ricardo Flórez', 1, CAST(N'2026-05-21T14:02:19.887' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (6, 1, N'zona 1', 4, 6, N'Juan carlos Daza Avendaño', 1, CAST(N'2026-05-21T14:03:54.157' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (7, 1, N'Zona 1', 5, 7, N'Diomidio Jose Caldera Suarez', 1, CAST(N'2026-05-21T14:08:04.997' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (9, 1, N'Zona 3', 5, 9, N'Wilfredo de Jesús Ricardo Flórez', 1, CAST(N'2026-05-21T14:09:26.683' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (10, 1, N'Zona 2', 5, 10, N'Hugo Nelson Arias Contreras', 1, CAST(N'2026-05-21T14:12:57.313' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (11, 1, N'Zona 4', 5, 11, N'Ariel Jose Ospino Nisperuza', 1, CAST(N'2026-05-21T14:13:47.787' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (12, 1, N'Zona 1', 3, 12, N'Umar Cruz Pizarro', 1, CAST(N'2026-05-21T14:14:40.360' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (13, 1, N'Zona 2', 1, 13, N'Gerardo Gamboa Aguilar', 1, CAST(N'2026-05-21T14:16:52.107' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (15, 1, N'Zona 3', 1, 15, N'Fernando Silva Vallejo', 1, CAST(N'2026-05-21T14:18:33.450' AS DateTime))
GO
INSERT [dbo].[EstructuraOrganizacional] ([EstructuraOrganizacionalId], [DenominacionId], [Descripcion], [GrupoEstructuraOrganizacionalId], [Orden], [Responsable], [Estado], [FechaCreacion]) VALUES (16, 1, N'Iglesia IDGES Principal  Villavicencio meta', NULL, 14, N'Juan Eliceo Avila Amortegui', 1, CAST(N'2026-06-02T14:19:13.370' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[EstructuraOrganizacional] OFF
GO
SET IDENTITY_INSERT [dbo].[Iglesias] ON 
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (1, 1, N'Iglesia de Dios Guiada por el Espirtu Santo', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 747, NULL, N'Calle 15 # 13-26', 9, N'3103042621', N'idges@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (2, 1, N'Iglesia IDGES Montería laGranja', N'IDGES', N'P.J. 1122/01/06/1998', 1, 13, 500, NULL, N'Diagonal 12 # 4- 51 Barrio la granja', 43, N'3022415477', N'montegranja@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (3, 1, N'Iglesia IDGES Reliquia Villavicencio Meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 747, NULL, N'Calle 27 # 59B – 10 Este', 29, N'3000000000', N'reliquia@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-01T11:47:08.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (8, 1, N'Iglesia IDGES Santa Inés Villavicencio Meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 747, NULL, N'Dirección. Calle 37 C.23 # 32 barrio villa Julia', 28, N'321341234', N'santaines@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-01T13:14:27.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (9, 1, N'Iglesia IDGES Pinilla Villavicencio Meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 747, NULL, N'Calle 24 # 13 -61', 27, N'+573103042621', N'opinilla@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-01T15:18:22.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (10, 1, N'Iglesia IDGES Villanueva Casanare', N'IDGES', N'P.J. 1122/01/06/1998', 1, 9, 388, NULL, N'Kr 9 # 5-06 Barrio el progreso', 30, N'3166879197', N'villanueva@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T10:17:05.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (11, 1, N'Iglesia IDGES Barranca de Upia', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 721, NULL, N'Carrera 2 N.º 11 – 34 Barrio El Centro', 31, N'3103536749', N'bcaupia@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T10:23:10.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (12, 1, N'Iglesia IDGES Playa Rica Villavicencio meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 747, NULL, N'Calle 20 A sur # 53 B 18', 34, N'3202022803', N'playarica@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:15:47.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (13, 1, N'Iglesia IDGES Puerto Gaitán meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 747, NULL, N'Cr7 14-42 Barrio El popular', 36, N'3236064556', N'ptogaitan@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:23:02.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (14, 1, N'Iglesia IDGES Puerto Lopez meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 740, NULL, N'Calle 5 # 02 – 11 Barrio porvenir', 35, N'3212486563', N'ptolopez@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:25:49.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (15, 1, N'Iglesia IDGES Porfia Villavicencio meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 747, NULL, N'CALLE 61N. 44- 90', 33, N'3213550761', N'porfia@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:31:46.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (16, 1, N'Iglesia IDGES Kirpas Villavicencio meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 747, NULL, N'Calle21sur#14-45este', 32, N'3226583515', N'kirpas@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:34:01.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (17, 1, N'Iglesia IDGES San José del Guaviare', N'IDGES', N'P.J. 1122/01/06/1998', 1, 16, 637, NULL, N'Calle 13 Nº 18- 60 Barrio el Modelo', 41, N'3142619263', N'siguaviare@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:43:33.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (18, 1, N'Iglesia IDGES Puerto Concordia meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 737, NULL, N'Carrera 5ª Nº 13-74', 39, N'3182386774', N'concordia@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:46:05.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (19, 1, N'Iglesia IDGES Mapiripan meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 735, NULL, N'Carrera 13 # 03-15', 42, N'3004131234', N'mapiripan@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:48:10.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (20, 1, N'Iglesia IDGES Pororio - Concordia meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 737, NULL, N'frente al coliseo principal', 39, N'3182386774', N'concordia@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:50:45.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (21, 1, N'Iglesia IDGES Granada meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 730, NULL, N'Mz 4 lt 2 ap .102 br villas de voguemonte', 38, N'3012846165', N'granada@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:52:47.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (22, 1, N'Iglesia IDGES Acacias meta', N'IDGES', N'P.J. 1122/01/06/1998', 1, 20, 720, NULL, N'Carrera 39 N.º 11ª -18 La Independencia', 37, N'3226369250', N'acacias@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T14:54:38.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (23, 1, N'Iglesia IDGES Inírida Guainía', N'IDGES', N'P.J. 1122/01/06/1998', 1, 15, 633, NULL, N'Calle 20#9-94', 61, N'3104622820', N'ptoinirida@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T15:05:21.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (25, 1, N'Iglesia IDGES Sabanitas Resguardo Indígena', N'IDGES', N'P.J. 1122/01/06/1998', 1, 15, 633, NULL, N'Resguardo Indígena Sabanitas', 61, N'3104622820', N'ptoinirida@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T15:26:50.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (27, 1, N'Iglesia IDGES Galán Bogotá', N'IDGES', N'P.J. 1122/01/06/1998', 1, 33, 1103, NULL, N'Carrera 56#2a-82 piso 2°', 59, N'345544829', N'galan@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T15:39:46.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (28, 1, N'Iglesia IDGES Suba Bogotá', N'IDGES', N'P.J. 1122/01/06/1998', 1, 33, 1103, NULL, N'Calle 139 # 99 b 28 piso 2 barrio las flores', 57, N'3144404491', N'suba@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T15:42:18.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (29, 1, N'Iglesia IDGES Corozal Sucre', N'IDGES', N'P.J. 1122/01/06/1998', 1, 28, 985, NULL, N'Carrera 26 Nº 35- 92 San Juan', 50, N'3144404491', N'corozal@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T15:44:38.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (30, 1, N'Iglesia IDGES Danubio Bogotá', N'IDGES', N'P.J. 1122/01/06/1998', 1, 33, 1103, NULL, N'Calle 56sur #5-14', 60, N'3112303277', N'danubio@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T15:48:53.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (32, 1, N'Iglesia IDGES Chuniza Bogotá', N'IDGES', N'P.J. 1122/01/06/1998', 1, 33, 1103, NULL, N'Carrera 8 # 88B SUR 43 Primer piso', 58, N'3208724729', N'chuniza@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T15:57:40.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (33, 1, N'Iglsia IDGES Urrao Antioquia', N'IDGES', N'P.J. 1122/01/06/1998', 1, 2, 117, NULL, N'Calle 32 N.º 31- 15 Barrio Palenque', 26, N'3115530191', N'urrao@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:00:30.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (34, 1, N'Iglesia IDGES Montelíbano Córdoba', N'IDGES', N'P.J. 1122/01/06/1998', 1, 13, 499, NULL, N'Carrera 3 No. 3-59 Centro', 45, N'3235009110', N'montelibano@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:06:05.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (35, 1, N'Iglesia IDGES Montería El Dorado', N'IDGES', N'P.J. 1122/01/06/1998', 1, 13, 500, NULL, N'CALLE 26 Nº 11W- 25', 44, N'3135874329', N'montedorado@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:08:39.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (36, 1, N'Iglesia Zaragoza Antioquia', N'IDGES', N'P.J. 1122/01/06/1998', 1, 2, 127, NULL, N'Kr 35 #36-98 Barrio San Gregorio', 46, N'3205762060', N'zaragoza@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:11:39.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (37, 1, N'Iglesia IDGES El Bagre Antioquia', N'IDGES', N'P.J. 1122/01/06/1998', 1, 2, 44, NULL, N'Calle 55 # 39a -48 Barrio Portugal Calle principal', 46, N'3205762060', N'elbagre@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:13:54.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (43, 1, N'Iglesia IDGES San Marcos Sucre', N'IDGES', N'P.J. 1122/01/06/1998', 1, 28, 999, NULL, N'Kr 30 # 26A -17 Barrio Primero De Junio', 47, N'310 7197608', N'sanmarcos@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:39:34.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (44, 1, N'Iglesia IDGES Sahagún Córdoba', N'IDGES', N'P.J. 1122/01/06/1998', 1, 13, 507, NULL, N'Calle 12 N° 6A -22', 48, N'311 8011418', N'sahagun@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:42:41.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (45, 1, N'Iglesia IDGES Los Palmitos Sucre', N'IDGES', N'P.J. 1122/01/06/1998', 1, 28, 991, NULL, N'Carrera 14 5Bis-75 plaza de la cruz', 50, N'3126418945', N'corozal@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:45:34.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (46, 1, N'Iglesia IDGES Alto Ford Sincelejo', N'IDGES', N'P.J. 1122/01/06/1998', 1, 28, 1003, NULL, N'Calle 13 # 22-41', 49, N'3002451654', N'altoford@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:48:03.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (47, 1, N'iglesia IDGES Ciénaga de Oro Cordobán', N'IDGES', N'P.J. 1122/01/06/1998', 1, 13, 493, NULL, N'Vía punta Yánez', 48, N'311 8011418', N'cdoro@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:49:31.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (49, 1, N'Iglesia IDGES Malambo Atlantico', N'IDGES', N'P.J. 1122/01/06/1998', 1, 4, 136, NULL, N'Calle 12#4-61 Barrio: el Carmen', 54, N'3106231091', N'malambo@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T16:53:34.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (50, 1, N'Iglesia IDGES El Pozón Cartgena', N'IDGES', N'P.J. 1122/01/06/1998', 1, 5, 167, NULL, N'Carrera 88# 71A-24', 56, N'3116859000', N'elpozon@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T17:15:35.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (52, 1, N'Iglesia IDGES Coloso Sucre', N'IDGES', N'P.J. 1122/01/06/1998', 1, 28, 984, NULL, N'CRA 15 Nº 4A -90 Calle las flores', 51, N'3116765070', N'coloso@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T17:20:16.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (53, 1, N'Iglesia IDGES Los Altos Tolú viejo', N'IDGES', N'P.J. 1122/01/06/1998', 1, 28, 1006, NULL, N'vereda Los Altos via principal', 52, N'3218860997', N'altoford@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T17:22:58.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (54, 1, N'Iglesia IDGES Turbaco Bolivar', N'IDGES', N'P.J. 1122/01/06/1998', 1, 5, 201, NULL, N'Carrera 25B Nº 13- 45', 55, N'3013711925', N'turbaco@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T17:54:08.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (55, 1, N'Iglesia IDGES Riohacha la Guajira', N'IDGES', N'P.J. 1122/01/06/1998', 1, 18, 685, NULL, N'Carrera 6# 24 – 65 siete de agosto', 53, N'3216564509', N'rioacha@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T17:58:49.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (56, 1, N'Iglesia IDGES Guaranda Sucre', N'IDGES', N'P.J. 1122/01/06/1998', 1, 28, 989, NULL, N'call 11 # 13 -  03', 47, N'3107197608', N'guaranda@iglesiaidges.org', N'Y conoceréis la verdad, y la verdad os hará libre. juan 8.32', 1, CAST(N'2026-06-02T18:02:28.0000000' AS DateTime2))
GO
INSERT [dbo].[Iglesias] ([IglesiaId], [DenominacionId], [Nombre], [Slug], [PersoneriaJuridica], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [PastorResponsableRegistroId], [Telefono], [Correo], [Slogan], [Activa], [FechaCreacion]) VALUES (57, 2, N'Iglesia Cristiana Centro Bíblico SHELEMUT', N'CBS', N'P.J. 0766/07/05/2026', 1, 28, 995, NULL, N'CL 27 #24 23', 29, N'3104131653', N'fe.plenitud@gmail.com', N'Formando vidas en la plenitud de Cristo.', 1, CAST(N'2026-06-12T18:38:51.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Iglesias] OFF
GO
SET IDENTITY_INSERT [dbo].[IglesiasEstructuras] ON 
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (1, 2, 1, 7, CAST(N'2026-05-23T08:01:20.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (3, 2, 1, 7, CAST(N'2026-05-23T10:25:36.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (13, 2, 1, 7, CAST(N'2026-05-23T14:54:04.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (14, 8, 1, 4, CAST(N'2026-06-01T13:14:33.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (15, 9, 1, 2, CAST(N'2026-06-01T15:18:22.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (16, 1, 1, 2, CAST(N'2026-06-01T17:28:20.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (17, 8, 1, 4, CAST(N'2026-06-01T17:30:19.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (18, 8, 1, 2, CAST(N'2026-06-02T10:04:11.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (19, 8, 1, 2, CAST(N'2026-06-02T10:04:56.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (20, 8, 1, 2, CAST(N'2026-06-02T10:05:34.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (21, 8, 1, 2, CAST(N'2026-06-02T10:06:22.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (22, 3, 1, 2, CAST(N'2026-06-02T10:08:40.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (23, 8, 1, 2, CAST(N'2026-06-02T10:09:45.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (24, 9, 1, 2, CAST(N'2026-06-02T10:11:16.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (25, 10, 1, 2, CAST(N'2026-06-02T10:17:05.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (26, 11, 1, 2, CAST(N'2026-06-02T10:23:10.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (27, 2, 1, 7, CAST(N'2026-06-02T14:06:11.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (28, 8, 1, 2, CAST(N'2026-06-02T14:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (29, 8, 1, 2, CAST(N'2026-06-02T14:07:44.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (30, 12, 1, 13, CAST(N'2026-06-02T14:15:47.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (31, 13, 1, 13, CAST(N'2026-06-02T14:23:02.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (32, 14, 1, 13, CAST(N'2026-06-02T14:25:49.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (33, 14, 1, 13, CAST(N'2026-06-02T14:29:28.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (34, 15, 1, 13, CAST(N'2026-06-02T14:31:46.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (35, 16, 1, 13, CAST(N'2026-06-02T14:34:01.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (36, 17, 1, 15, CAST(N'2026-06-02T14:43:33.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (37, 18, 1, 15, CAST(N'2026-06-02T14:46:05.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (38, 19, 1, 15, CAST(N'2026-06-02T14:48:10.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (39, 20, 1, 15, CAST(N'2026-06-02T14:50:45.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (40, 21, 1, 15, CAST(N'2026-06-02T14:52:47.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (41, 22, 1, 15, CAST(N'2026-06-02T14:54:38.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (42, 23, 1, 12, CAST(N'2026-06-02T15:05:21.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (43, 15, 1, 13, CAST(N'2026-06-02T15:06:59.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (44, 25, 1, 12, CAST(N'2026-06-02T15:26:50.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (45, 27, 1, 4, CAST(N'2026-06-02T15:39:46.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (46, 27, 1, 4, CAST(N'2026-06-02T15:40:23.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (47, 28, 1, 6, CAST(N'2026-06-02T15:42:18.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (48, 29, 1, 6, CAST(N'2026-06-02T15:44:38.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (49, 29, 1, 6, CAST(N'2026-06-02T15:45:52.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (50, 30, 1, 6, CAST(N'2026-06-02T15:48:53.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (51, 10, 1, 2, CAST(N'2026-06-02T15:55:01.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (52, 32, 1, 6, CAST(N'2026-06-02T15:57:40.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (53, 33, 1, 7, CAST(N'2026-06-02T16:00:30.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (54, 34, 1, 7, CAST(N'2026-06-02T16:06:05.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (55, 35, 1, 7, CAST(N'2026-06-02T16:08:39.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (56, 2, 1, 7, CAST(N'2026-06-02T16:09:13.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (57, 36, 1, 7, CAST(N'2026-06-02T16:11:39.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (58, 37, 1, 7, CAST(N'2026-06-02T16:13:54.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (59, 43, 1, 10, CAST(N'2026-06-02T16:39:34.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (60, 44, 1, 10, CAST(N'2026-06-02T16:42:41.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (61, 45, 1, 10, CAST(N'2026-06-02T16:45:34.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (62, 45, 1, 10, CAST(N'2026-06-02T16:46:01.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (63, 46, 1, 10, CAST(N'2026-06-02T16:48:03.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (64, 47, 1, 10, CAST(N'2026-06-02T16:49:31.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (65, 49, 1, 11, CAST(N'2026-06-02T16:53:34.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (66, 46, 1, 10, CAST(N'2026-06-02T16:55:43.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (67, 46, 1, 10, CAST(N'2026-06-02T16:57:06.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (68, 46, 1, 9, CAST(N'2026-06-02T16:59:26.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (69, 45, 1, 10, CAST(N'2026-06-02T17:00:11.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (70, 45, 1, 9, CAST(N'2026-06-02T17:02:19.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (71, 29, 1, 6, CAST(N'2026-06-02T17:04:27.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (72, 29, 1, 9, CAST(N'2026-06-02T17:05:58.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (73, 50, 1, 11, CAST(N'2026-06-02T17:15:35.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (74, 52, 1, 9, CAST(N'2026-06-02T17:20:16.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (75, 53, 1, 9, CAST(N'2026-06-02T17:22:58.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (76, 54, 1, 11, CAST(N'2026-06-02T17:54:08.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (77, 55, 1, 11, CAST(N'2026-06-02T17:58:49.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (78, 56, 1, 10, CAST(N'2026-06-02T18:02:28.0000000' AS DateTime2))
GO
INSERT [dbo].[IglesiasEstructuras] ([IglesiaEstructurasId], [IglesiaId], [DenominacionId], [EstructuraId], [FechaAsignacion]) VALUES (79, 57, 1, 1, CAST(N'2026-06-12T18:38:51.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[IglesiasEstructuras] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([MenuId], [DenominacionId], [Descripcion], [IdGrupo], [Tipo], [Estado], [Url], [Imagen], [Fecha], [Orden], [NuevaVentana]) VALUES (1, 1, N'Iglesias', 4, N'S', 1, N'/iglesias/configuracion', N'AddHomeWork', CAST(N'2026-01-09T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[Menu] ([MenuId], [DenominacionId], [Descripcion], [IdGrupo], [Tipo], [Estado], [Url], [Imagen], [Fecha], [Orden], [NuevaVentana]) VALUES (2, 1, N'Usuarios', 4, N'S', 1, N'/admin-usuarios', N'ManageAccounts', CAST(N'2026-01-09T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[Menu] ([MenuId], [DenominacionId], [Descripcion], [IdGrupo], [Tipo], [Estado], [Url], [Imagen], [Fecha], [Orden], [NuevaVentana]) VALUES (3, 1, N'Estructuras', 4, N'S', 1, N'/estructura-organizacional/configuracion', N'Lan', CAST(N'2026-01-09T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[Menu] ([MenuId], [DenominacionId], [Descripcion], [IdGrupo], [Tipo], [Estado], [Url], [Imagen], [Fecha], [Orden], [NuevaVentana]) VALUES (4, 1, N'Administración', NULL, N'G', 1, N'#', N'Settings', CAST(N'2026-01-09T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[Menu] ([MenuId], [DenominacionId], [Descripcion], [IdGrupo], [Tipo], [Estado], [Url], [Imagen], [Fecha], [Orden], [NuevaVentana]) VALUES (5, 1, N'Clase Parámetro', 4, N'S', 1, N'/clases/configuracion', N'Deck', CAST(N'2026-01-09T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[Menu] ([MenuId], [DenominacionId], [Descripcion], [IdGrupo], [Tipo], [Estado], [Url], [Imagen], [Fecha], [Orden], [NuevaVentana]) VALUES (6, 1, N'Registros', 4, N'S', 1, N'/registro', N'Deck', CAST(N'2026-05-30T19:56:47.410' AS DateTime), 1, 0)
GO
INSERT [dbo].[Menu] ([MenuId], [DenominacionId], [Descripcion], [IdGrupo], [Tipo], [Estado], [Url], [Imagen], [Fecha], [Orden], [NuevaVentana]) VALUES (8, 1, N'Completar Datos', 4, N'S', 1, N'//completar-datos', N'Deck', CAST(N'2026-05-05T00:00:00.000' AS DateTime), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu_rol] ON 
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (1, 1, 2, 1, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (2, 1, 2, 2, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (3, 1, 2, 3, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (4, 1, 2, 4, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (5, 1, 2, 5, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (6, 1, 1, 6, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (7, 1, 5, 6, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (8, 1, 11, 6, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (9, 2, 11, 1, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (10, 2, 11, 2, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (11, 2, 11, 3, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (12, 2, 11, 4, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (13, 2, 11, 5, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (14, 2, 10, 6, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (15, 2, 14, 6, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (16, 2, 11, 6, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (17, 1, 2, 6, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (18, 1, 5, 8, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (19, 1, 14, 8, 1)
GO
INSERT [dbo].[Menu_rol] ([Menu_Rol], [DenominacionId], [RolId], [MenuId], [Estado]) VALUES (21, 1, 14, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[Menu_rol] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu_Usuario] ON 
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (1, 1, 4, 1, CAST(N'2026-05-11T23:01:56.453' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (2, 1, 4, 2, CAST(N'2026-05-11T23:02:39.480' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (3, 1, 4, 3, CAST(N'2026-05-11T23:02:48.120' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (4, 1, 4, 4, CAST(N'2026-05-11T23:02:51.727' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (5, 1, 4, 5, CAST(N'2026-05-11T23:02:56.587' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (6, 1, 5, 1, CAST(N'2026-05-11T23:01:56.453' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (7, 1, 5, 2, CAST(N'2026-05-11T23:02:39.480' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (8, 1, 5, 3, CAST(N'2026-05-11T23:02:48.120' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (9, 1, 5, 4, CAST(N'2026-05-11T23:02:51.727' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (10, 1, 5, 5, CAST(N'2026-05-11T23:02:56.587' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (11, 2, 66, 6, CAST(N'2026-06-13T19:22:38.487' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (12, 2, 66, 1, CAST(N'2026-06-13T19:22:38.487' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (13, 2, 66, 2, CAST(N'2026-06-13T19:22:38.487' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (14, 2, 66, 3, CAST(N'2026-06-13T19:22:38.487' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (15, 2, 66, 4, CAST(N'2026-06-13T19:22:38.487' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (16, 2, 66, 5, CAST(N'2026-06-13T19:22:38.487' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (17, 2, 66, 6, CAST(N'2026-06-13T19:22:38.487' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (18, 1, 4, 6, CAST(N'2026-06-14T12:48:01.517' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (19, 1, 4, 8, CAST(N'2026-01-09T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (20, 1, 69, 1, CAST(N'2026-09-16T18:50:08.693' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (21, 1, 69, 2, CAST(N'2026-09-16T18:50:08.693' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (22, 1, 69, 3, CAST(N'2026-09-16T18:50:08.693' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (23, 1, 69, 4, CAST(N'2026-09-16T18:50:08.693' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (24, 1, 69, 5, CAST(N'2026-09-16T18:50:08.693' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (25, 1, 69, 6, CAST(N'2026-09-16T18:50:08.693' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (26, 1, 70, 6, CAST(N'2026-09-16T19:33:55.167' AS DateTime))
GO
INSERT [dbo].[Menu_Usuario] ([OpcUsuId], [DenominacionId], [UsuarioId], [MenuId], [FechaCreacion]) VALUES (27, 1, 70, 8, CAST(N'2026-09-16T19:33:55.167' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Menu_Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 
GO
INSERT [dbo].[Pais] ([PaisId], [PaisNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, N'Colombia', NULL, 1, CAST(N'2026-05-06T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Parametro] ON 
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (1, 1, 1, N'Registro Civil', N'Para menores de 7 años', NULL, 1, CAST(N'2026-05-06T19:55:33.930' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2, 1, 1, N'Tarjeta de Identidad', N'', NULL, 1, CAST(N'2026-05-06T19:56:20.437' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (3, 1, 1, N'Cédula de Ciudadanía', N'', NULL, 1, CAST(N'2026-05-06T19:56:37.110' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (4, 1, 1, N'Cédula de Extranjería', N'', NULL, 1, CAST(N'2026-05-06T19:57:14.753' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (5, 1, 1, N'Pasaporte', N'', NULL, 1, CAST(N'2026-05-06T19:57:30.037' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (1002, 1, 2, N'Hombre', N'', NULL, 1, CAST(N'2026-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (1005, 1, 2, N'Mujer', N'', NULL, 1, CAST(N'2026-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2004, 1, 1003, N'Pastor General ', N'Representante legal de la IDGES', NULL, 1, CAST(N'2026-05-21T13:18:40.067' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2005, 1, 1003, N'Pastor Ordenado', N'Líder pastoral con mas de 8 mil horas de estudio', NULL, 1, CAST(N'2026-05-21T13:19:40.090' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2006, 1, 1003, N'Pastor Licenciado', N'Líder con mas de 3 años de experiencia y 8 mil horas de estudio', NULL, 1, CAST(N'2026-05-21T13:20:30.023' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2007, 1, 1003, N'Pastor Encargado', N'Líder con mas de 5 horas de estudio y 2 años de experiencia como minimo', NULL, 1, CAST(N'2026-05-21T13:21:12.257' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2008, 1, 1003, N'Lider CFP o aspirante al pastorado', N'Dos años de experiencia y 3 mil horas de estudio', NULL, 1, CAST(N'2026-05-21T13:22:14.760' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2009, 1, 1003, N'Pastor Oxigenador', N'Las mismas características del pastor licenciado en adelante', NULL, 1, CAST(N'2026-05-21T13:24:37.957' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2010, 1, 1002, N'Predicador en Formación', N'Personal en preparación para predicar el evangelio o servicio pastoral', NULL, 1, CAST(N'2026-05-21T13:26:37.747' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2011, 1, 1004, N'Ministrador de Dones', N'Sirven en la iglesia en prestar el servicio en la ministración de dones del Espíritu santo', NULL, 1, CAST(N'2026-05-21T13:30:30.760' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2012, 1, 1004, N'Ujieres o servidores a la mesa', N'Son los servidores que no ministran dones y ayudan en la iglesia como soporte pastoral en los servicios de culto', NULL, 1, CAST(N'2026-05-21T13:31:28.910' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2013, 1, 1005, N'Activo', NULL, NULL, 1, CAST(N'2026-05-21T13:33:18.323' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2014, 1, 1005, N'Inactivo', NULL, NULL, 1, CAST(N'2026-05-21T13:33:36.887' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2015, 1, 1005, N'En Disciplina', NULL, NULL, 1, CAST(N'2026-05-21T13:33:52.260' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2016, 1, 1005, N'Seguimiento y Evaluacion', NULL, NULL, 1, CAST(N'2026-05-21T13:34:42.720' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2017, 1, 1005, N'Retirado', NULL, NULL, 1, CAST(N'2026-05-21T13:35:08.387' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2018, 1, 1005, N'Fallecido', NULL, NULL, 1, CAST(N'2026-05-21T13:36:03.853' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2019, 1, 1006, N'Visitante', NULL, NULL, 1, CAST(N'2026-05-21T13:37:00.430' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2020, 1, 1006, N'Miembro', NULL, NULL, 1, CAST(N'2026-05-21T13:37:07.887' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2021, 1, 1006, N'Pastor', NULL, NULL, 1, CAST(N'2026-05-21T13:37:16.817' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2022, 1, 1006, N'Líder Regional', N'Este campo es para el ejercicio del supervisor regional', NULL, 1, CAST(N'2026-05-21T13:39:32.000' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2023, 1, 1006, N'Líder zonal', N'Este campo es para los asignados como coordinador zonal', NULL, 1, CAST(N'2026-05-21T13:40:08.560' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2024, 1, 1006, N'Secretaria -o', N'Este campo es para el registro del secretario general e la IDGES', NULL, 1, CAST(N'2026-05-21T13:41:33.173' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2025, 1, 1006, N'contador -a', NULL, NULL, 1, CAST(N'2026-05-21T13:42:35.253' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2026, 1, 1006, N'Auxiliar Administrativo', NULL, NULL, 1, CAST(N'2026-05-21T13:42:49.720' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2027, 1, 1007, N'Afrocolombiano', NULL, NULL, 1, CAST(N'2026-05-21T13:46:13.653' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2028, 1, 1007, N'Indigena', NULL, NULL, 1, CAST(N'2026-05-21T13:46:22.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2029, 1, 1007, N'Blanco', NULL, NULL, 1, CAST(N'2026-05-21T13:46:37.440' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2030, 1, 1007, N'Mestizo', NULL, NULL, 0, CAST(N'2026-05-21T13:47:12.353' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2031, 1, 1007, N'Cabeza de Familia', NULL, NULL, 1, CAST(N'2026-05-21T13:48:50.863' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2032, 1, 1007, N'Desplazado', NULL, NULL, 1, CAST(N'2026-05-21T13:49:04.313' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2033, 1, 1007, N'Desmovilizado', NULL, NULL, 1, CAST(N'2026-05-21T13:49:16.420' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2034, 1, 1007, N'Reinsertado', NULL, NULL, 1, CAST(N'2026-05-21T13:49:30.577' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2038, 1, 1009, N'Soltero (a)', N'Eso es para los que viven solos o solas ', NULL, 1, CAST(N'2026-05-28T15:45:43.513' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2039, 1, 1009, N'Unión libre ', N'Esto es para los que viven sin ser casados', NULL, 1, CAST(N'2026-05-28T15:47:19.550' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2040, 1, 1009, N'Casado (a)', N'Esto para los que viven legal menta casados ante las autoridades civiles y eclesiástica', NULL, 1, CAST(N'2026-05-28T15:48:10.527' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2041, 1, 1009, N'Viudo (a)', N'Esto aplica para quienes hayan perdidos a su conyugue y estén solos o sola ', NULL, 1, CAST(N'2026-05-28T16:01:02.280' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2042, 1, 1010, N'Ninguno', N'Ninguna clase de estudio ', NULL, 1, CAST(N'2026-05-28T16:08:06.560' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2043, 1, 1010, N'Preescolar', N'Prejardín, Jardín y transición ', NULL, 1, CAST(N'2026-05-28T16:08:51.243' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2044, 1, 1010, N'Básica Primaria (1° a 5°)', N'Desde primero a quinto de primaria ', NULL, 1, CAST(N'2026-05-28T16:09:26.863' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2045, 1, 1010, N'Básica Secundaria (6° a 9°)', N'De sesto a noveno', NULL, 1, CAST(N'2026-05-28T16:10:23.923' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2046, 1, 1010, N'Educación Media Académica (10° y 11°)', N'Decimo y undécimo ', NULL, 1, CAST(N'2026-05-28T16:10:52.653' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2047, 1, 1010, N'Técnico Laboral', N'Técnico laboral ', NULL, 1, CAST(N'2026-05-28T16:11:18.073' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2048, 1, 1010, N'Técnico Profesional', N'Son certificados por instituciones para el trabajo y desarrollo humano ', NULL, 1, CAST(N'2026-05-28T16:12:42.710' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2049, 1, 1010, N'Tecnólogo', N'competencias técnicas, operativas y de gestión en un área específica.', NULL, 1, CAST(N'2026-05-28T16:14:35.113' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2050, 1, 1010, N'Pregrado Universitario', N'Nivel de educación superior que brinda formación profesional integral en una disciplina específica y conduce a la obtención de un título universitario', NULL, 1, CAST(N'2026-05-28T16:15:32.400' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2051, 1, 1010, N'Licenciatura', N'Programa de educación superior enfocado en la formación pedagógica y profesional para la enseñanza en áreas específicas del conocimiento.', NULL, 1, CAST(N'2026-05-28T16:16:15.663' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2052, 1, 1010, N'Especialización', N'Estudios avanzados orientados a profundizar conocimientos en un área específica profesional.', NULL, 1, CAST(N'2026-05-28T16:17:01.390' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2053, 1, 1010, N'Maestría', N'Posgrado avanzado orientado a la investigación y profundización profesional en un área específica.', NULL, 1, CAST(N'2026-05-28T16:18:00.130' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2054, 1, 1010, N'Doctorado', N'Máximo nivel académico orientado a la investigación y generación de nuevo conocimiento.', NULL, 1, CAST(N'2026-05-28T16:18:43.360' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2055, 1, 1010, N'Posdoctorado', N'Formación académica de investigación avanzada posterior al doctorado.', NULL, 1, CAST(N'2026-05-28T16:19:26.303' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2056, 1, 1010, N'Otro', N'Otro tipo de estudio', NULL, 1, CAST(N'2026-05-28T16:20:03.023' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2057, 1, 1011, N'Empleado (a)', N'Empleado', NULL, 1, CAST(N'2026-05-28T16:36:54.020' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2058, 1, 1011, N'Independiente', N'Persona que trabaja por cuenta propia sin vínculo laboral directo con una empresa.', NULL, 1, CAST(N'2026-05-28T16:38:09.010' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2059, 1, 1011, N'Desempleado', N'Persona que actualmente no tiene empleo o actividad laboral remunerada.', NULL, 1, CAST(N'2026-05-28T16:38:21.220' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2060, 1, 1011, N'Estudiante', N'Persona que se encuentra realizando estudios o procesos de formación académica.', NULL, 1, CAST(N'2026-05-28T16:38:32.967' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2061, 1, 1011, N'Emprendedor', N'Persona que desarrolla o impulsa un negocio, proyecto o iniciativa propia.', NULL, 1, CAST(N'2026-05-28T16:38:44.113' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2062, 1, 1011, N'Pensionado (a)', N'Persona retirada de la vida laboral activa que recibe una pensión por jubilación o derecho adquirido.', NULL, 1, CAST(N'2026-05-28T16:39:00.513' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2063, 1, 1011, N'Ama de Casa', N'Persona dedicada principalmente a las labores y administración del hogar.', NULL, 1, CAST(N'2026-05-28T16:39:12.230' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2064, 1, 1011, N'Trabajador Informal', N'Persona que realiza actividades económicas sin vinculación laboral formal o regulación legal establecida.', NULL, 1, CAST(N'2026-05-28T16:39:24.077' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2065, 1, 1011, N'Prestador de Servicios', N'Persona que ofrece servicios profesionales, técnicos u operativos de manera independiente o por contrato.', NULL, 1, CAST(N'2026-05-28T16:39:36.547' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2066, 1, 1011, N'Comerciante', N'Persona dedicada a la compra, venta o distribución de productos o servicios', NULL, 1, CAST(N'2026-05-28T16:39:49.210' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2067, 1, 1011, N'Aprendiz', N'Persona en proceso de formación práctica y aprendizaje en un área laboral o técnica específica.', NULL, 1, CAST(N'2026-05-28T16:40:01.023' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2068, 1, 1011, N'Ninguno', N'Actualmente no presenta una situación laboral definida', NULL, 1, CAST(N'2026-05-28T16:40:12.250' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2069, 1, 1011, N'Otro', N'Situación laboral diferente a las opciones anteriormente mencionadas', NULL, 1, CAST(N'2026-05-28T16:41:25.827' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2070, 1, 1012, N'Ser Miembro IDGES', N'Querer ser miembro de la Iglesia de Dios Guida por el Espíritu Santo ', NULL, 1, CAST(N'2026-05-30T19:54:53.170' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2071, 1, 1012, N'Asesoría ', NULL, NULL, 1, CAST(N'2026-05-30T19:55:08.067' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2072, 1, 1012, N'Dar una ofrenda ', NULL, NULL, 1, CAST(N'2026-05-30T19:55:27.137' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2073, 1, 1012, N'Dar una donación ', NULL, NULL, 1, CAST(N'2026-05-30T19:55:40.150' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2074, 2, 1013, N'Registro Civil', N'Para menores de 7 años', NULL, 1, CAST(N'2026-05-06T19:55:33.930' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2075, 2, 1013, N'Tarjeta de Identidad', N'', NULL, 1, CAST(N'2026-05-06T19:56:20.437' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2076, 2, 1013, N'Cédula de Ciudadanía', N'', NULL, 1, CAST(N'2026-05-06T19:56:37.110' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2077, 2, 1013, N'Cédula de Extranjería', N'', NULL, 1, CAST(N'2026-05-06T19:57:14.753' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2078, 2, 1013, N'Pasaporte', N'', NULL, 1, CAST(N'2026-05-06T19:57:30.037' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2079, 2, 1014, N'Hombre', N'', NULL, 1, CAST(N'2026-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2080, 2, 1014, N'Mujer', N'', NULL, 1, CAST(N'2026-05-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2081, 2, 1015, N'Predicador en Formación', N'Personal en preparación para predicar el evangelio o servicio pastoral', NULL, 1, CAST(N'2026-05-21T13:26:37.747' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2082, 2, 1016, N'Pastor General ', N'Representante legal de la IDGES', NULL, 1, CAST(N'2026-05-21T13:18:40.067' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2083, 2, 1016, N'Pastor Ordenado', N'Líder pastoral con mas de 8 mil horas de estudio', NULL, 1, CAST(N'2026-05-21T13:19:40.090' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2084, 2, 1016, N'Pastor Licenciado', N'Líder con mas de 3 años de experiencia y 8 mil horas de estudio', NULL, 1, CAST(N'2026-05-21T13:20:30.023' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2085, 2, 1016, N'Pastor Encargado', N'Líder con mas de 5 horas de estudio y 2 años de experiencia como minimo', NULL, 1, CAST(N'2026-05-21T13:21:12.257' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2086, 2, 1016, N'Lider CFP o aspirante al pastorado', N'Dos años de experiencia y 3 mil horas de estudio', NULL, 1, CAST(N'2026-05-21T13:22:14.760' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2087, 2, 1016, N'Pastor Oxigenador', N'Las mismas características del pastor licenciado en adelante', NULL, 1, CAST(N'2026-05-21T13:24:37.957' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2088, 2, 1017, N'Ministrador de Dones', N'Sirven en la iglesia en prestar el servicio en la ministración de dones del Espíritu santo', NULL, 1, CAST(N'2026-05-21T13:30:30.760' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2089, 2, 1017, N'Ujieres o servidores a la mesa', N'Son los servidores que no ministran dones y ayudan en la iglesia como soporte pastoral en los servicios de culto', NULL, 1, CAST(N'2026-05-21T13:31:28.910' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2090, 2, 1018, N'Activo', NULL, NULL, 1, CAST(N'2026-05-21T13:33:18.323' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2091, 2, 1018, N'Inactivo', NULL, NULL, 1, CAST(N'2026-05-21T13:33:36.887' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2092, 2, 1018, N'En Disciplina', NULL, NULL, 1, CAST(N'2026-05-21T13:33:52.260' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2093, 2, 1018, N'Seguimiento y Evaluacion', NULL, NULL, 1, CAST(N'2026-05-21T13:34:42.720' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2094, 2, 1018, N'Retirado', NULL, NULL, 1, CAST(N'2026-05-21T13:35:08.387' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2095, 2, 1018, N'Fallecido', NULL, NULL, 1, CAST(N'2026-05-21T13:36:03.853' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2096, 2, 1019, N'Visitante', NULL, NULL, 1, CAST(N'2026-05-21T13:37:00.430' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2097, 2, 1019, N'Miembro', NULL, NULL, 1, CAST(N'2026-05-21T13:37:07.887' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2098, 2, 1019, N'Pastor', NULL, NULL, 1, CAST(N'2026-05-21T13:37:16.817' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2099, 2, 1019, N'Líder Regional', N'Este campo es para el ejercicio del supervisor regional', NULL, 1, CAST(N'2026-05-21T13:39:32.000' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2100, 2, 1019, N'Líder zonal', N'Este campo es para los asignados como coordinador zonal', NULL, 1, CAST(N'2026-05-21T13:40:08.560' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2101, 2, 1019, N'Secretaria -o', N'Este campo es para el registro del secretario general e la IDGES', NULL, 1, CAST(N'2026-05-21T13:41:33.173' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2102, 2, 1019, N'contador -a', NULL, NULL, 1, CAST(N'2026-05-21T13:42:35.253' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2103, 2, 1019, N'Auxiliar Administrativo', NULL, NULL, 1, CAST(N'2026-05-21T13:42:49.720' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2104, 2, 1020, N'Afrocolombiano', NULL, NULL, 1, CAST(N'2026-05-21T13:46:13.653' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2105, 2, 1020, N'Indigena', NULL, NULL, 1, CAST(N'2026-05-21T13:46:22.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2106, 2, 1020, N'Blanco', NULL, NULL, 1, CAST(N'2026-05-21T13:46:37.440' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2107, 2, 1020, N'Mestizo', NULL, NULL, 0, CAST(N'2026-05-21T13:47:12.353' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2108, 2, 1020, N'Cabeza de Familia', NULL, NULL, 1, CAST(N'2026-05-21T13:48:50.863' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2109, 2, 1020, N'Desplazado', NULL, NULL, 1, CAST(N'2026-05-21T13:49:04.313' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2110, 2, 1020, N'Desmovilizado', NULL, NULL, 1, CAST(N'2026-05-21T13:49:16.420' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2111, 2, 1020, N'Reinsertado', NULL, NULL, 1, CAST(N'2026-05-21T13:49:30.577' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2112, 2, 1021, N'Soltero (a)', N'Eso es para los que viven solos o solas ', NULL, 1, CAST(N'2026-05-28T15:45:43.513' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2113, 2, 1021, N'Unión libre ', N'Esto es para los que viven sin ser casados', NULL, 1, CAST(N'2026-05-28T15:47:19.550' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2114, 2, 1021, N'Casado (a)', N'Esto para los que viven legal menta casados ante las autoridades civiles y eclesiástica', NULL, 1, CAST(N'2026-05-28T15:48:10.527' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2115, 2, 1021, N'Viudo (a)', N'Esto aplica para quienes hayan perdidos a su conyugue y estén solos o sola ', NULL, 1, CAST(N'2026-05-28T16:01:02.280' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2116, 2, 1022, N'Ninguno', N'Ninguna clase de estudio ', NULL, 1, CAST(N'2026-05-28T16:08:06.560' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2117, 2, 1022, N'Preescolar', N'Prejardín, Jardín y transición ', NULL, 1, CAST(N'2026-05-28T16:08:51.243' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2118, 2, 1022, N'Básica Primaria (1° a 5°)', N'Desde primero a quinto de primaria ', NULL, 1, CAST(N'2026-05-28T16:09:26.863' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2119, 2, 1022, N'Básica Secundaria (6° a 9°)', N'De sesto a noveno', NULL, 1, CAST(N'2026-05-28T16:10:23.923' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2120, 2, 1022, N'Educación Media Académica (10° y 11°)', N'Decimo y undécimo ', NULL, 1, CAST(N'2026-05-28T16:10:52.653' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2121, 2, 1022, N'Técnico Laboral', N'Técnico laboral ', NULL, 1, CAST(N'2026-05-28T16:11:18.073' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2122, 2, 1022, N'Técnico Profesional', N'Son certificados por instituciones para el trabajo y desarrollo humano ', NULL, 1, CAST(N'2026-05-28T16:12:42.710' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2123, 2, 1022, N'Tecnólogo', N'competencias técnicas, operativas y de gestión en un área específica.', NULL, 1, CAST(N'2026-05-28T16:14:35.113' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2124, 2, 1022, N'Pregrado Universitario', N'Nivel de educación superior que brinda formación profesional integral en una disciplina específica y conduce a la obtención de un título universitario', NULL, 1, CAST(N'2026-05-28T16:15:32.400' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2125, 2, 1022, N'Licenciatura', N'Programa de educación superior enfocado en la formación pedagógica y profesional para la enseñanza en áreas específicas del conocimiento.', NULL, 1, CAST(N'2026-05-28T16:16:15.663' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2126, 2, 1022, N'Especialización', N'Estudios avanzados orientados a profundizar conocimientos en un área específica profesional.', NULL, 1, CAST(N'2026-05-28T16:17:01.390' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2127, 2, 1022, N'Maestría', N'Posgrado avanzado orientado a la investigación y profundización profesional en un área específica.', NULL, 1, CAST(N'2026-05-28T16:18:00.130' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2128, 2, 1022, N'Doctorado', N'Máximo nivel académico orientado a la investigación y generación de nuevo conocimiento.', NULL, 1, CAST(N'2026-05-28T16:18:43.360' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2129, 2, 1022, N'Posdoctorado', N'Formación académica de investigación avanzada posterior al doctorado.', NULL, 1, CAST(N'2026-05-28T16:19:26.303' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2130, 2, 1022, N'Otro', N'Otro tipo de estudio', NULL, 1, CAST(N'2026-05-28T16:20:03.023' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2131, 2, 1023, N'Empleado (a)', N'Empleado', NULL, 1, CAST(N'2026-05-28T16:36:54.020' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2132, 2, 1023, N'Independiente', N'Persona que trabaja por cuenta propia sin vínculo laboral directo con una empresa.', NULL, 1, CAST(N'2026-05-28T16:38:09.010' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2133, 2, 1023, N'Desempleado', N'Persona que actualmente no tiene empleo o actividad laboral remunerada.', NULL, 1, CAST(N'2026-05-28T16:38:21.220' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2134, 2, 1023, N'Estudiante', N'Persona que se encuentra realizando estudios o procesos de formación académica.', NULL, 1, CAST(N'2026-05-28T16:38:32.967' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2135, 2, 1023, N'Emprendedor', N'Persona que desarrolla o impulsa un negocio, proyecto o iniciativa propia.', NULL, 1, CAST(N'2026-05-28T16:38:44.113' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2136, 2, 1023, N'Pensionado (a)', N'Persona retirada de la vida laboral activa que recibe una pensión por jubilación o derecho adquirido.', NULL, 1, CAST(N'2026-05-28T16:39:00.513' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2137, 2, 1023, N'Ama de Casa', N'Persona dedicada principalmente a las labores y administración del hogar.', NULL, 1, CAST(N'2026-05-28T16:39:12.230' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2138, 2, 1023, N'Trabajador Informal', N'Persona que realiza actividades económicas sin vinculación laboral formal o regulación legal establecida.', NULL, 1, CAST(N'2026-05-28T16:39:24.077' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2139, 2, 1023, N'Prestador de Servicios', N'Persona que ofrece servicios profesionales, técnicos u operativos de manera independiente o por contrato.', NULL, 1, CAST(N'2026-05-28T16:39:36.547' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2140, 2, 1023, N'Comerciante', N'Persona dedicada a la compra, venta o distribución de productos o servicios', NULL, 1, CAST(N'2026-05-28T16:39:49.210' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2141, 2, 1023, N'Aprendiz', N'Persona en proceso de formación práctica y aprendizaje en un área laboral o técnica específica.', NULL, 1, CAST(N'2026-05-28T16:40:01.023' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2142, 2, 1023, N'Ninguno', N'Actualmente no presenta una situación laboral definida', NULL, 1, CAST(N'2026-05-28T16:40:12.250' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2143, 2, 1023, N'Otro', N'Situación laboral diferente a las opciones anteriormente mencionadas', NULL, 1, CAST(N'2026-05-28T16:41:25.827' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2144, 2, 1024, N'Ser Miembro de CBS', N'Querer ser miembro de la Iglesia de Dios Guida por el Espíritu Santo ', NULL, 1, CAST(N'2026-05-30T19:54:53.170' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2145, 2, 1024, N'Asesoría ', NULL, NULL, 1, CAST(N'2026-05-30T19:55:08.067' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2146, 2, 1024, N'Dar una ofrenda ', NULL, NULL, 1, CAST(N'2026-05-30T19:55:27.137' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2147, 2, 1024, N'Dar una donación ', NULL, NULL, 1, CAST(N'2026-05-30T19:55:40.150' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2148, 1, 1025, N'Bautizado', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2149, 1, 1025, N'No Bautizado', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2150, 1, 1026, N'Ninguno', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2151, 1, 1026, N'Curso bíblico', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2152, 1, 1026, N'Escuela bíblica', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2153, 1, 1026, N'Seminario teológico', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2154, 1, 1026, N'Técnico en teología', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2155, 1, 1026, N'Licenciatura en teología', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2156, 1, 1026, N'Maestría en teología', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2157, 1, 1026, N'Doctorado en teología', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
INSERT [dbo].[Parametro] ([ParametroId], [DenominacionId], [ClaseId], [Descripcion], [Observacion], [PadreParametroId], [Estado], [FechaCreacion]) VALUES (2158, 1, 1026, N'Otro', NULL, NULL, 1, CAST(N'2026-09-04T14:55:12.380' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Parametro] OFF
GO
SET IDENTITY_INSERT [dbo].[Registro] ON 
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (1, 1, 1, N'Juan Bautista', N'Caly Madariaga', 3, N'10879758', 1, 28, 1004, 0, N'CL 45 #35 17', N'calyjuan@gmail.com', N'3104131653', 1002, NULL, NULL)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (2, 1, 1, N'Juan Eliseo', N'Ávila Amortegui', 3, N'18235296', 1, 20, 747, NULL, N'NA', N'pastorjuaneliceo@gmail.com', N'3103042621', 1002, NULL, NULL)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (25, 1, 1, N'Raúl', N'Fernández Quiroz', 3, N'15485045', 1, 2, 117, NULL, N'Calle 32 # 31-15.', N'rauferqui@hotmail.com', N'3115530191', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (26, 1, 1, N'Dairo', N'Mendivil Moreno', 3, N'72148690', 1, 20, 747, NULL, N'Calle 24  Nº 13-61', N'dairo.menmo@gmail.com', N'3012754650', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (27, 1, 1, N'Edgar Eduardo', N'Santos Ortiz', 3, N'1121875921', 1, 20, 747, NULL, N'Casa 10 Brisas Del Saman', N'edgareduardosantosortiz2014@gmail.com', N'3175776563', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (28, 1, 1, N'Alexander', N'Castillo Aragon', 3, N'86072205', 1, 20, 747, NULL, N'CALLE 37 BIS # 15 - 26 ESTE BARRIO PRADOS DE SIBERIA', N'alexandercastilloaragon@hotmail.es', N'3125623156', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (29, 1, 1, N'Luis Alberto', N'Rodas Orjuela', 3, N'93369768', 1, 20, 747, NULL, N'Calle 11 # 14-65 barrio centro', N'luis_rodas_69@hotmail.com', N'93369768', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (31, 1, 1, N'Anderson', N'Sanabria Santana', 3, N'1097664151', 1, 27, 939, NULL, N'Brisas del Upía  entrada 2', N'Sanabriaanderson80@gmail.com', N'3103536749', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (32, 1, 1, N'Arlex Mauricio', N'Montoya García', 3, N'1036939523', 1, 2, 87, NULL, N'Calle 21Sur Nº 14-45 Este', N'arlexmontoya22@gmail.com', N'3226583515', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (33, 1, 1, N'Gerardo', N'Gamboa Aguilar', 3, N'86040244', 1, 20, 747, NULL, N'manzana 8 casa 14 la Madrid PORFIA', N'elsalmista-200@hotmail.com', N'3144902832', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (34, 1, 1, N'Luis Eduardo', N'Barrero Rodrigues', 3, N'17387489', 1, 20, 740, NULL, N'Calle 37C  Sur Nº 23 - 32', N'luiseduardobarrerorodriguez@gmail.com', N'3202022803', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (35, 1, 1, N'José Ever', N'Castañeda preciado', 3, N'93090288', 1, 20, 740, NULL, N'Manzana B casa 11 barrio Juana Sofia', N'joseevercastaneda@gmail.com', N'93090288', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (36, 1, 1, N'Moisés', N'Quiroz Álvarez', 3, N'92642412', 1, 28, 1003, NULL, N'B/ ALDEAS FLOR AMARILLO ( SIN NOMENCLATURA)', N'quiroz_1983_@hotmail.com', N'3105047376', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (37, 1, 1, N'Sergio Luis', N'Paternina Rojas', 3, N'1102860656', 1, 28, 1003, NULL, N'Carrera 8a#  5-21', N'spaternina1994@gmail.com', N'3226369250', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (38, 1, 1, N'Luis Eduardo', N'Agudelo', 3, N'112191881', 1, 20, 747, NULL, N'Carrera 6b #27-26', N'luisagudelo95@hotmail.com', N'3012846165', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (39, 1, 1, N'FERNANDO', N'PIÑEROS', 3, N'17324577', 1, 20, 747, NULL, N'BARRIO SAMAN DE LA RIVERA', N'fernando.pinero19@gmail.com', N'3182386774', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (40, 1, 1, N'Wilmar Humberto', N'Cardona Niño', 3, N'86060140', 1, 20, 747, NULL, N'Carrera 13 b 26b 03 barrio maracos', N'wilmarcardona881@gmail.com', N'3143942269', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (41, 1, 1, N'Olimpo', N'Cárdenas Martínez', 3, N'17322636', 1, 20, 747, NULL, N'calle 12# 11 32', N'olimpocarmar@gmail.com', N'3142619263', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (42, 1, 1, N'Emilio José', N'Gutiérrez Delgadillo', 3, N'85489191', 1, 28, 985, NULL, N'calle42c17-18', N'85emiliojose@gmail.com', N'3126987080', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (43, 1, 1, N'DIOMIDIO JOSE', N'CALDERA SUAREZ', 3, N'15307791', 1, 2, 33, NULL, N'CALLE.16 # 9-71 BARRIO RISARALDA MONTERIA CORDOBA', N'calderadiomidio@gmail.com', N'3217535886', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (44, 1, 1, N'Gabriel', N'Dumar Herrera', 3, N'6865555', 1, 13, 500, NULL, N'Calle 16 No. 1B-92', N'gabrieldumar2011@hotmail.com', N'3135874329', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (45, 1, 1, N'Arley de Jesús', N'Bolaño Montiel', 3, N'10950929', 1, 13, 502, NULL, N'Calle 1 Casa No.10 la esperanza', N'arleybo2017@gmail.com', N'3235009110', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (46, 1, 1, N'Edilberto', N'Rivera', 3, N'11040986', 1, 28, 982, NULL, N'calle 31b-08', N'edilberto1973rivera@gmail.con', N'3205762060', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (47, 1, 1, N'Deibys Andrés', N'López Pérez', 3, N'1104410671', 1, 28, 999, NULL, N'Calle 20 # 30 - 121 Barrio Kennedy', N'deanlope861017@hotmail.com', N'3107197608', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (48, 1, 1, N'Hugo Nelson', N'Arias Contreras', 3, N'92521619', 1, 28, 1003, NULL, N'Cll 8 17b 36 Barrio Versalles', N'hugoariascontreras@gmail.com', N'3118011418', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (49, 1, 1, N'Wilfrido de Jesús', N'Ricardo Flórez', 3, N'92533118', 1, 28, 991, NULL, N'Cra14 calle 5 Bis 75 barrio plaza de la Cruz', N'wilfredoricardo@hotmail.com', N'3002451654', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (50, 1, 1, N'Juan Carlos', N'Medina solar', 3, N'8775007', 1, 28, 1003, NULL, N'CRA 24c #5-32 barrio tierra grata Sincelejo sucre', N'jcmedina015@gmail.com', N'3126418945', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (51, 1, 1, N'Esnaider Gregorio', N'Alquerque Borja', 3, N'92601362', 1, 28, 984, NULL, N'Calle 8 # 11-16', N'esnaiderborja810@gmail.com', N'3116765070', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (52, 1, 1, N'Álvaro Antonio', N'Vitola Paternina', 3, N'92499804', 1, 28, 1003, NULL, N'Cll 12 a · 1169', N'alvarovitola4@gmail.com', N'3218860997', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (53, 1, 1, N'Juan', N'Maldonado Ramos', 3, N'9156153', 1, 18, 685, NULL, N'Carrera 6#24 - 65 siete de agosto', N'juanmaldonado2030@hotmail.com', N'3216564509', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (54, 1, 1, N'Dionicio Rubén', N'Martínez Pérez', 3, N'92510671', 1, 4, 142, NULL, N'Calle 12#4-61 Barrio: El Carmen', N'dionicioidges@hotmail.com', N'3106231091', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (55, 1, 1, N'JOSE ENRIQUE', N'SUAREZ CARDOZO', 3, N'9098719', 1, 5, 167, NULL, N'Pozon m 144 l 20. Sector 1 de mayo', N'josesua78@hotmail.com', N'3013711925', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (56, 1, 1, N'Ariel José', N'Ospino Mesperuza', 3, N'10903982', 1, 5, 167, NULL, N'Kra 88# 71A-24 El Pozón', N'arielospino1980@gmail.com', N'3116859000', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (57, 1, 1, N'Alirio', N'Castro Mancera', 3, N'179134', 1, 33, 1103, NULL, N'CRA 94b # 42-51sur', N'aliriocastromancera@gmail.com', N'3144404491', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (58, 1, 1, N'John Harry', N'Copasachoa Jiménez', 3, N'1022995532', 1, 33, 1103, NULL, N'Carrera 7d #64h-65sur', N'Harry.copasachoa@gmail.com', N'333333333', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (59, 1, 1, N'Juan Carlos', N'Daza Avendaño', 3, N'1032415235', 1, 33, 1103, NULL, N'Calle 24 sur#12f-16este', N'Juancarlosdaza1@gmail.com', N'3145544829', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (60, 1, 1, N'Fredy', N'Rojas Serrano', 3, N'11228026', 1, 33, 1103, NULL, N'CRA 94 b # 42-15 sur', N'frojas2313@gmail.com', N'3112303277', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (61, 1, 1, N'Alvaro', N'Cruz Prato', 3, N'88196393', 1, 15, 633, NULL, N'calle 23 # 34 20', N'cruzpratoa@gmail.com', N'3104622820', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (62, 1, 1, N'Fernando', N'Silva Vallejo', 3, N'17265586', 1, 20, 747, NULL, N'la madrid apto 202 etapa 2', N'silvavallejo@hotmail.com', N'3103014814', 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (63, 1, 1, N'Diana Patricia', N'Castellanos Jiménez', 3, N'41930630', 1, 20, 747, NULL, N'calle 56 sutr # 45- 63', N'dianacastellanos74@gmil.com', N'3002255078', 1005, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (64, 1, 1, N'Carlos César', N'Contreras Cury', 3, N'92520594', 1, 28, 1003, NULL, N'Carrera 24 No 13-20', N'carloscesarcontrerascury@gmail.com', NULL, 1002, 1, 2070)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (65, 2, 57, N'Juan Bautista', N'Caly Madariaga', 3, N'10879758', 1, 28, 1004, 0, N'CL 45 #35 17', N'fe.integridad@gmail.com', N'3104131653', 1002, NULL, NULL)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (66, 2, 57, N'AIDA LUZ', N'MADRIGAL VILORIA', 2076, N'1007338929', 1, 2, 44, NULL, N'Calle 27 No 24-23', N'aidamadrigalv@gmail.com', N'3146282090', 2080, 1, 2144)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (67, 2, 57, N'LUIS ALBERTO', N'AVILA SININ', 2076, N'92257775', 1, 28, 995, NULL, N'Barrio 7 de Agosto', NULL, N'3104306088', 2079, 1, 2144)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (68, 1, 1, N'ASD', N'LDS', 3, N'22222222', 1, 2, 4, NULL, N'CRA 33 D # 101 212', N'andresl_ca2542n2@hotmail.com', N'3223234133', 1002, 1, 2071)
GO
INSERT [dbo].[Registro] ([RegistroId], [DenominacionId], [IglesiaId], [Nombres], [Apellidos], [ParametroIdTipoDocumento], [Documento], [PaisId], [DepartamentoId], [CiudadId], [CorregimientoId], [Direccion], [Correo], [Telefono], [ParametroIdSexo], [Interno], [ParametroIdInteres]) VALUES (69, 1, 1, N'Andres', N'Cano', 3, N'1020409198', 1, 1, 1, NULL, N'CRA 33 D # 101 212', N'andresl_can2@hotmail.com', N'3223934133', 1002, 1, 2070)
GO
SET IDENTITY_INSERT [dbo].[Registro] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (1, 1, N'Secretaria', N'SECRETARIA', 1, CAST(N'2026-01-04T18:07:03.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (2, 1, N'Administrador', N'ADMIN', 1, CAST(N'2026-01-04T18:07:03.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (3, 1, N'Tesorería', N'TESORERIA', 1, CAST(N'2026-01-04T18:07:03.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (4, 1, N'Pastor', N'PASTOR', 1, CAST(N'2026-01-04T18:07:03.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (5, 1, N'Miembro', N'MIEMBRO', 1, CAST(N'2026-05-26T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (6, 1, N'Visitante', N'VISITANTE', 1, CAST(N'2026-05-26T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (8, 1, N'Contador', N'CONTADOR', 1, CAST(N'2026-05-06T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (9, 1, N'Coordinador', N'COORDINADOR', 1, CAST(N'2026-05-06T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (10, 2, N'Secretaria', N'SECRETARIA', 1, CAST(N'2026-01-04T18:07:03.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (11, 2, N'Administrador', N'ADMIN', 1, CAST(N'2026-01-04T18:07:03.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (12, 2, N'Tesorería', N'TESORERIA', 1, CAST(N'2026-01-04T18:07:03.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (13, 2, N'Pastor', N'PASTOR', 1, CAST(N'2026-01-04T18:07:03.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (14, 2, N'Miembro', N'MIEMBRO', 1, CAST(N'2026-05-26T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (15, 2, N'Visitante', N'VISITANTE', 1, CAST(N'2026-05-26T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (16, 2, N'Contador', N'CONTADOR', 1, CAST(N'2026-05-06T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Roles] ([RolId], [DenominacionId], [Nombre], [Codigo], [Activo], [FechaCreacion]) VALUES (17, 2, N'Coordinador', N'COORDINADOR', 1, CAST(N'2026-05-06T00:00:00.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposEstructura] ON 
GO
INSERT [dbo].[TiposEstructura] ([TipoEstructuraId], [DenominacionId], [Nombre], [Orden]) VALUES (1, 1, N'Regional', 1)
GO
INSERT [dbo].[TiposEstructura] ([TipoEstructuraId], [DenominacionId], [Nombre], [Orden]) VALUES (2, 1, N'Zona', 2)
GO
INSERT [dbo].[TiposEstructura] ([TipoEstructuraId], [DenominacionId], [Nombre], [Orden]) VALUES (3, 1, N'Distrito', 3)
GO
SET IDENTITY_INSERT [dbo].[TiposEstructura] OFF
GO
SET IDENTITY_INSERT [dbo].[TokensRefresh] ON 
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1, 1, 4, 1, N'rYf0O21ozRUos3o0v75/ZpHryCGgedBRDbOmcK2zYhA=', CAST(N'2026-05-12T20:46:51.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-12T18:16:51.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (2, 1, 4, 1, N'57YCKm/5f2wmlkIbcp5U8YZM1ui0d30LjLm1ygK1ULQ=', CAST(N'2026-05-12T21:07:17.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-12T18:37:17.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (3, 1, 4, 1, N'5QpFvBWJ0KTu5Yk+g0t/224aQtvKQ0ndnlm0X51EmR0=', CAST(N'2026-05-12T22:40:13.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-12T20:10:13.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (4, 1, 4, 1, N'9w2fvi8U4CWOJ2/Jb/u2gv+5lhtmXkDr2uhRPh/RglE=', CAST(N'2026-05-12T23:06:29.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-12T20:36:29.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (5, 1, 4, 1, N'ow2sfRePMsYTgGtJNNv53xkh8AsYyf/M5puCq7Cw1XQ=', CAST(N'2026-05-13T12:40:13.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-13T10:10:13.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (6, 1, 4, 1, N'nqxoK+v5KGwSsemDv0vE8b7wyhqdOjSg9/MjkW27fgY=', CAST(N'2026-05-13T13:42:45.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-13T11:12:45.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (7, 1, 4, 1, N'yQJQ0Dn1CqN4tB8x/YPbhuEIP7ifm4atkRmkHIONlP0=', CAST(N'2026-05-13T17:08:39.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-13T14:38:39.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (8, 1, 4, 1, N'GaErrk15hP17rh1/q5+0IaSwpNeAumRaZesXI+HiW9A=', CAST(N'2026-05-13T18:58:10.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-13T16:28:10.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (9, 1, 4, 1, N'YVs5Xemet6s1O92J8JNaaw63vE6qEDsB/MfpZaH8qCs=', CAST(N'2026-05-13T19:38:30.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-13T17:08:30.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (10, 1, 4, 1, N'd/ZRgx8LALumTpTaHR/miHVkli4zeJ956lOQL/XYNyE=', CAST(N'2026-05-13T20:58:51.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-13T18:28:51.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (11, 1, 4, 1, N'Bey4pYl0g9tGZpqA3VDDnc9gDfwNQs6nMO6rPmueyV8=', CAST(N'2026-05-13T21:07:14.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-13T18:37:14.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (12, 1, 4, 1, N'RojUZzM6AJ2dr9/qI7LA+pyw7w7KLQjOtmE7xX3uytg=', CAST(N'2026-05-13T22:02:49.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-13T19:32:49.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1005, 1, 4, 1, N'BAOdzlp3TbWrJ1r/EzCobk7SoeGi5rqRnml+W3BDACg=', CAST(N'2026-05-14T02:13:28.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-13T23:43:28.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1006, 1, 4, 1, N'IMBIjRp30cxarmCADxbjpkj3L6CRAcqLrgZK7Bm0P9A=', CAST(N'2026-05-14T02:45:43.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-14T00:15:43.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1007, 1, 4, 1, N'WLqThF9w4N4d3UWBYKQwZ62orWtdgXnyHyjWOOolSDM=', CAST(N'2026-05-14T03:25:48.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-14T00:55:48.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1008, 1, 4, 1, N'zom37GGkUFVUBRvYgok9zOZ+pYzxQXcTIx6tw1vYT5M=', CAST(N'2026-05-14T20:01:39.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-14T17:31:39.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1009, 1, 4, 1, N'Agi4x/n7bsoUNN3a31H7iIQLXAJbxCtl8YdKtLEbIHU=', CAST(N'2026-05-14T20:04:31.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-14T17:34:31.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1010, 1, 4, 1, N'udrxMIyJqwOSw1/4z+7Zx+nEcIFYHAbd/BqIAigQwR8=', CAST(N'2026-05-15T00:14:09.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-14T21:44:09.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1011, 1, 4, 1, N'rJwARSgqBtisQd/EJYiNGAA9DWCQtHrqfZ3c10u4yEs=', CAST(N'2026-05-15T07:09:18.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-15T04:39:18.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1012, 1, 4, 1, N'Vf9VilJjzq/oREq4jAYUVzxUNxH3ssTtIRMmGIZBH7M=', CAST(N'2026-05-17T08:10:18.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-17T05:40:18.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1013, 1, 4, 1, N'm0yDoT3aCSblPiXAFZyzmZDtcwWkR1basUqGGe1tTic=', CAST(N'2026-05-17T16:06:57.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-17T13:36:57.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1014, 1, 4, 1, N'btib/UOIO0iNQbOgOYKTHw3Sb7jz9dmbnsl2CTImkqg=', CAST(N'2026-05-18T01:43:47.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-17T23:13:47.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1015, 1, 4, 1, N'A1tCjvECOaGmKsjPA3JNwMp7MUrvcRR4kXlgW4JHvQg=', CAST(N'2026-05-18T01:45:24.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-17T23:15:24.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1016, 1, 4, 1, N'3WZRl2UPwNV3S0kyDKR4a6x2U2nKWYmzV/yZu+tgmVw=', CAST(N'2026-05-18T01:50:18.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-17T23:20:18.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1017, 1, 4, 1, N'mJWD87dYblFc759qkNEGZ/h7oLQBe9TDZ7pxsHFSHDk=', CAST(N'2026-05-18T16:25:39.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-18T13:55:39.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1018, 1, 4, 1, N'gSHxgFaXannssBQZZAYXt1eqcxbxJbp5eKFlJjS7GKM=', CAST(N'2026-05-18T16:42:18.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-18T14:12:18.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1019, 1, 4, 1, N'F3i3QLTk+tVXttsHbuyoL2rZjxzLKvTwPVbk9778Hnk=', CAST(N'2026-05-18T17:01:29.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-18T14:31:29.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1020, 1, 4, 1, N'csgH3Kwiu+8d+IPZtr4r17GUcL9jXGbjsHz/9AlMNMs=', CAST(N'2026-05-20T07:12:54.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-20T04:42:54.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1021, 1, 4, 1, N'nslUoAV3WoMtxq6/vte9dWg/Sa+0JZfvcpKdYAkvkfU=', CAST(N'2026-05-21T08:33:18.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-21T06:03:18.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1022, 1, 4, 1, N'dph8QsXE6JjSYi5jVGZOlqP8MvwZ4uCpD/R9obj1+WE=', CAST(N'2026-05-21T09:33:37.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-21T07:03:37.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1023, 1, 4, 1, N'bafVjA8U764lxpSoRv4TgtqnLTxj2Jmp6YuGl48Bim4=', CAST(N'2026-05-21T09:35:07.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-21T07:05:07.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1024, 1, 5, 1, N'g6KG25Ei9RcuGMM0mB6FOlf8YXJh/5eiaWDvSE7qJDM=', CAST(N'2026-05-21T09:40:33.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-05-21T07:10:33.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1025, 1, 4, 1, N'gQZL7i11xOJB8zqrzIWAxTcm86bXex4cQeBogppWKd4=', CAST(N'2026-05-21T11:17:41.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-21T08:47:41.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1026, 1, 4, 1, N'p7JYPPxOFZuqadiiikpDEBHJhiaLV6WbsVm9eZg6XFE=', CAST(N'2026-05-21T14:28:33.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-21T11:58:33.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1027, 1, 5, 1, N'xLlEclbJmfCbVLai9lxJZiSu6ULvg4MTe7uDK/Fzj2w=', CAST(N'2026-05-21T15:18:00.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-05-21T12:48:00.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1028, 1, 4, 1, N'h3MpS1CQYsxL53l2sEtXR+nqQmtlLw+/acn4J0x0IC0=', CAST(N'2026-05-21T15:33:43.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-21T13:03:43.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1029, 1, 5, 1, N'ygcTzSTaQH3hyMaqSB/Uf+2ibGcUHDU9aTWyDlSQANI=', CAST(N'2026-05-21T15:53:37.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-05-21T13:23:37.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1030, 1, 4, 1, N'VYYGbDku3ioGOxwprBFCivJUB2Z5uJQV4v1wZStILNQ=', CAST(N'2026-05-21T15:53:50.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-21T13:23:50.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1031, 1, 4, 1, N'z16rKfPJ0HnCo+iXzr6yD1hEpM3hF3IDlhODeQwwf+k=', CAST(N'2026-05-21T16:25:16.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-21T13:55:16.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1032, 1, 5, 1, N'fLbtVVgDhtF6BG3eqpeSsZmxeK/gk4RvTIt8gV87/Ew=', CAST(N'2026-05-21T16:41:00.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-05-21T14:11:00.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1033, 1, 4, 1, N'K0YG+yr9LsJJ+P3GMJDPlMtWyzszj8/3egCcOaC+73k=', CAST(N'2026-05-21T21:21:52.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-21T18:51:52.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1034, 1, 4, 1, N'/+599xQc7ZHxWsjCMQMgNl3A+axRAOP5yNyxsv+SJpE=', CAST(N'2026-05-22T07:47:23.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-22T05:17:23.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1035, 1, 4, 1, N'AqHv1FLAyKZPwIud+RlgrALPctSnF3eDrv0FwP6wfus=', CAST(N'2026-05-22T12:23:16.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-22T09:53:16.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1036, 1, 5, 1, N'7jscrngTltuCziYp+Ij+iqrOJkvFUcPxVHLC3NlQxMs=', CAST(N'2026-05-22T17:45:13.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-05-22T15:15:13.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1037, 1, 5, 1, N'oFGlZ3H88gt7VI/PgIxrgaRQqf0PhYaUJHx7Y/yVn8w=', CAST(N'2026-05-22T22:17:18.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-05-22T19:47:18.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1038, 1, 4, 1, N'I5Cemb9Mwa4UD8HxeSqFdoru1aEDb+Sl6fCer3J/PSQ=', CAST(N'2026-05-22T23:00:19.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-22T20:30:19.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1039, 1, 4, 1, N'AJwRm6YrhAr9oUvZncIVAgOEJo7z6qCGNVAjfBKZqK4=', CAST(N'2026-05-23T10:23:38.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-23T07:53:38.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1040, 1, 4, 1, N'hYssNay3PAwuTi3TtMe0inp/GAOGFU+cO7aV37rx0G4=', CAST(N'2026-05-23T10:25:15.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-23T07:55:15.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1041, 1, 4, 1, N'kKjZNGaaDgYKPgD9CbAfSmw6RBXeTCbggJDhoPwhidg=', CAST(N'2026-05-23T10:28:00.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-23T07:58:00.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1042, 1, 4, 1, N'tioc2Em6L6Rt7TOs3OsFQkNj9ljceocfAjtujUjZ0ro=', CAST(N'2026-05-23T12:34:35.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-23T10:04:35.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1043, 1, 5, 1, N'F/t7ODtzPRU2dQLBoA76ijAF+M7jJ2oZGfZsLqdFayE=', CAST(N'2026-05-23T12:52:43.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-05-23T10:22:43.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1044, 1, 5, 1, N'oC5+8QIozH0Zq/gWUqmLCM+/uWvEmrdqX3NRzmt75+4=', CAST(N'2026-05-23T12:58:36.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-05-23T10:28:36.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1045, 1, 4, 1, N'nAGn5ta7rPSJt35okP2NbfkzeoCd3xZrmqTvH9Grjd4=', CAST(N'2026-05-23T13:21:10.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-23T10:51:10.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1046, 1, 4, 1, N'MQZ+fC25kXHl4eOh6qZRKY1+UjaFzkdM7qy/b8O319U=', CAST(N'2026-05-23T14:23:07.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-23T11:53:07.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1047, 1, 4, 1, N'45Iifk2dNLxN4zRqpKQrxc/v9cQj4JUQkw/VW57mbdg=', CAST(N'2026-05-23T14:56:38.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-23T12:26:38.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1048, 1, 4, 1, N'B56SPhBwuoA2OpyA4n0BsT5UK0/LbBtHINbGqMzGdBg=', CAST(N'2026-05-23T17:22:48.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-23T14:52:48.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1049, 1, 4, 1, N'kII069o84GUfnFmMZbxymE5Z3LiotS8G9xlUmmuM30Q=', CAST(N'2026-05-23T20:08:07.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-23T17:38:07.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1050, 1, 5, 1, N'B9sGyajVJgkJDrOq7vbTiIz4FgHv9jpfC8s7pZ49RZE=', CAST(N'2026-05-23T20:09:41.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-05-23T17:39:41.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1051, 1, 4, 1, N'Yy8BF0t8DtWN1rbijBwt9C5hkNO1svvfflbQcnDiMZY=', CAST(N'2026-05-24T19:31:11.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-24T17:01:11.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1052, 1, 4, 1, N'9qJtrPgKc/lgDf9ZU1R2hctKEhgoSvJhN3S7DH7xY3g=', CAST(N'2026-05-24T19:35:43.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-24T17:05:43.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1053, 1, 4, 1, N'XkrDkursKz/XiuM6bBEtvdnTSsVroHwEIjCqgxXzSS4=', CAST(N'2026-05-25T09:34:39.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-25T07:04:39.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1054, 1, 4, 1, N'BhUSDKGYLoJCucMmAdptcI+YkqVCNhNlDlRxVM1hTGQ=', CAST(N'2026-05-28T18:11:27.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-28T15:41:27.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1055, 1, 4, 1, N'QUXHuyCqDJpzB6imXZX7ItrWnmLH6JEJH+wK5qVi3xs=', CAST(N'2026-05-28T19:07:41.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-28T16:37:41.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1056, 1, 4, 1, N'obwvXuK1EsAdReJxYtTyhdr9sMWBvDkTKag8p4I4Mqo=', CAST(N'2026-05-30T22:19:27.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-30T19:49:27.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1057, 1, 4, 1, N'EsPEr26vAZIqKgBB1hhpqPUCMuagjxT3dJK12ewUk3Q=', CAST(N'2026-05-30T22:30:13.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-30T20:00:13.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1058, 1, 4, 1, N'r8Eyl8PCckY0w85bN8zFGAweWit5X/w7kZ5efiD34f0=', CAST(N'2026-05-30T22:30:39.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-30T20:00:39.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1059, 1, 4, 1, N'j3+CccZqV/KSatIj9MqNNxSWg0BRK0EQFsaw6OCNgI4=', CAST(N'2026-05-31T14:24:03.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T11:54:03.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1060, 1, 4, 1, N'yvFcSIEkwbDlAhR0uPBKjo9FeHhtDNapz2m3CEfyjxo=', CAST(N'2026-05-31T14:55:46.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T12:25:46.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1061, 1, 4, 1, N'24TbqCzsbc6bidZJfi2Vo3iCoo8zJkhG6vzRLR7iJjQ=', CAST(N'2026-05-31T18:05:59.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T15:35:59.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1062, 1, 4, 1, N'KE/Y6nAArFEFVTKrw3qRvrRxOBWNEBkzlQ+8PCayuIQ=', CAST(N'2026-05-31T19:47:28.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T17:17:28.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1063, 1, 4, 1, N'xhcfGywskO/8y5XWGGQ6jjsdgVXH/25EPevgZSeIbRA=', CAST(N'2026-05-31T20:04:50.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T17:34:50.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1064, 1, 4, 1, N'/CUq3Gu9ib0/ZhQel1E3lmoYdAJr1k0ywP4N4RRZccE=', CAST(N'2026-05-31T20:21:03.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T17:51:03.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1065, 1, 4, 1, N'/l6xoxxF7DQ6UPC3hGyt4aXTGHE3IBedncHkX4FTmG8=', CAST(N'2026-05-31T22:26:03.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T19:56:03.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1066, 1, 4, 1, N'+64GJqOcSwOOCrnOzRUEPxhJDdlwerQCRwq6N8VK784=', CAST(N'2026-05-31T22:29:32.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T19:59:32.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1067, 1, 4, 1, N'mroLHhQlsTbapc9Ek6BlYNzAGp0zXU7VR8tWDju14Go=', CAST(N'2026-05-31T22:39:12.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T20:09:12.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1068, 1, 4, 1, N'Wi8QoWeZ0AZ0irNkL2Z0ClVHPIhoCQYkkf0kFjSjWvc=', CAST(N'2026-05-31T22:44:36.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-05-31T20:14:36.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1069, 1, 4, 1, N'QPgk8Fg6oDKboG97ZCWKFVsLQ9NDW0fE7eRpaUYCgxg=', CAST(N'2026-06-01T09:15:23.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T06:45:23.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1070, 1, 4, 1, N'Xoq0ndvVHxKBmKyWX985ENjWMY/NMEpbnRxhpEouJ7w=', CAST(N'2026-06-01T09:36:40.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T07:06:40.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1071, 1, 5, 1, N'qb506z17wBPKLEG5ez4EswO5Ya5xZA9auhJphU4lKCE=', CAST(N'2026-06-01T10:52:25.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-06-01T08:22:25.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1072, 1, 5, 1, N'D7MgvU8zOwUW7Jp5zi0ZwUhJXCpcy67O/ChXkD0Lpzs=', CAST(N'2026-06-01T10:56:30.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-06-01T08:26:30.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1073, 1, 4, 1, N'KXRLjoWcKzsaKY5heifZqlBop9HuFqdK4yUVCWrYC8s=', CAST(N'2026-06-01T11:49:01.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T09:19:01.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1074, 1, 4, 1, N'evExP2s+IoGRzujcP0+QtIFRp12/4ZKDbqMq9AOeiCA=', CAST(N'2026-06-01T11:49:56.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T09:19:56.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1075, 1, 4, 1, N'4Ftw7xJ+7V6HblIMnSNlIVFifXrbo720qP1mG22Ox1w=', CAST(N'2026-06-01T12:25:26.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T09:55:26.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1076, 1, 4, 1, N'b+qgzU3lHbLQzZIesSL8PRJ8UJVtoo5uD5XV4Fx9aUo=', CAST(N'2026-06-01T13:14:34.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T10:44:34.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1077, 1, 4, 1, N'UiTtKSsDvIYN9ggYLcVz1/Xj6FRxy3zP91FSfaiEoyY=', CAST(N'2026-06-01T13:23:58.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T10:53:58.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1078, 1, 4, 1, N'YNCPqruQ0En45gCwta9hvINkflQ1JCDOgXUzwXSwLGg=', CAST(N'2026-06-01T14:40:58.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T12:10:58.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1079, 1, 4, 1, N'QXB6F3f1p6cM/pr3az8q7W8JuUYB1qNAPzOjaf0sdEg=', CAST(N'2026-06-01T14:43:23.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T12:13:23.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1080, 1, 4, 1, N'jGqVEd6NvB+GPTJoANSrCe4FarcbsAbEX/zZecj6O18=', CAST(N'2026-06-01T14:45:35.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T12:15:35.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1081, 1, 4, 1, N'1z1jomDwhOHWa7g6EkLx5ciEaeMWtnqDqHRFyv+LQ6I=', CAST(N'2026-06-01T14:59:19.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T12:29:19.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1082, 1, 4, 1, N'03iB67ftHOh8HfZEdVm2eSQCQaRhPVEqc/znC+OrSB0=', CAST(N'2026-06-01T15:00:51.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T12:30:51.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1083, 1, 4, 1, N'2hfW71pYPuit2fcF75oiLcs0n3FwTUK8f1J4sTHF7u8=', CAST(N'2026-06-01T15:15:40.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T12:45:40.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1084, 1, 5, 1, N'DSnMSAQGaKM5ZPGKx1pWKs/juUJNo5+4TfrWnGA58Kc=', CAST(N'2026-06-01T15:19:40.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-06-01T12:49:40.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1085, 1, 4, 1, N'eBR9iI4Sjnn/wpSzeXv5wXCq8G8EHu3nq9lLphHT1JI=', CAST(N'2026-06-01T15:32:46.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T13:02:46.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1086, 1, 5, 1, N'95NnrnYVrDz4NatAqPCRYAQzL00/XBV51Y2cv30jgIQ=', CAST(N'2026-06-01T15:35:48.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-06-01T13:05:48.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1087, 1, 4, 1, N'e1tiZZdb4tX2xp4FsCyQNsOD2DtHnfud6s8YscTRgbA=', CAST(N'2026-06-01T17:36:51.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T15:06:51.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1088, 1, 4, 1, N'qrlRCvda3od4xGTzBitNg83fyhYJgB9DmEbgDHvkenQ=', CAST(N'2026-06-01T17:45:08.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T15:15:08.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1089, 1, 4, 1, N'qvv01xUG9YcKaN4nDL9PVXe8lpPx11Sc8rNavaWdfBI=', CAST(N'2026-06-01T19:03:36.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T16:33:36.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1090, 1, 4, 1, N'oC4pvH5w63Pv9xDUVNk3tlCSrZXX3DF/TyYNMeKydak=', CAST(N'2026-06-01T19:25:24.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T16:55:24.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1091, 1, 4, 1, N'uCges4pwS/XzPtmUWpiGbuU4PixV8v/KtqBGuZ1bkYA=', CAST(N'2026-06-01T20:15:20.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T17:45:20.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1092, 1, 4, 1, N'8ullAIWkP84d5ZXOoSmEMudlWhLW8uGJWCqNItAlwng=', CAST(N'2026-06-01T20:15:38.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T17:45:38.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1093, 1, 4, 1, N'JIPdzTF+8qTDxuD5+sHV9d/NFVxiwcCIxh+WxxqeCzY=', CAST(N'2026-06-01T20:42:47.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T18:12:47.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1094, 1, 4, 1, N'dKyLlVZienQmgaKQ8uT9LvWsedX+7fq47RFN5x47a6A=', CAST(N'2026-06-01T20:57:02.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T18:27:02.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1095, 1, 4, 1, N'HNbHiZj84Wojgk19MsMqO8zyiEqEEoGObWp9e8gr9aA=', CAST(N'2026-06-01T21:19:22.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T18:49:22.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1096, 1, 4, 1, N'GB6VWoJCoFT4wf++oJ1uDolQgoQdSWxZ8UIh2TK/Xi4=', CAST(N'2026-06-01T21:26:05.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T18:56:05.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1097, 1, 4, 1, N'6yUoR8kK60pu2SNc0tXTgb+SzxhQks62PgArx0G8JFw=', CAST(N'2026-06-01T21:59:02.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T19:29:02.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1098, 1, 4, 1, N'gnXeZNNmGToUBfKRRM4s/+NBIZhHiZBo0P76kvWqnlM=', CAST(N'2026-06-01T22:31:15.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T20:01:15.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1099, 1, 4, 1, N'JluQKljn+0LRRBjMQiPJ31h+KgV5tJ3vLeEuVTt06xs=', CAST(N'2026-06-01T22:38:28.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-01T20:08:28.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1100, 1, 4, 1, N'vg5blHre4dmfhuEN7P+aqwVCAQzfw/PfGS+/AFUC8TM=', CAST(N'2026-06-02T11:05:57.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-02T08:35:57.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1101, 1, 4, 1, N'tqxTd/vSmEkjk0c4u9NonJugmySXVtxaytBPNrDzBEU=', CAST(N'2026-06-02T12:23:04.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-02T09:53:04.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1102, 1, 4, 1, N's2grFjBIKv4kMhl9DUmgQANpNeobYi1c/L+hn5l52co=', CAST(N'2026-06-02T12:54:13.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-02T10:24:13.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1103, 1, 4, 1, N'6BmLXBbHDsLQcofgYB2kMpm9n07Nx64V6d7wkgI0/kw=', CAST(N'2026-06-02T13:48:07.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-02T11:18:07.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1104, 1, 4, 1, N'kiIJ7ZVVgIhFitcJvN5z6NNiPBgnjqmRSV/pSK0dblA=', CAST(N'2026-06-02T15:33:41.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-02T13:03:41.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1105, 1, 4, 1, N'PWFQNFfs1Y1KIiC2OT1lq5qGMimKgS+L6dDfVezc3Us=', CAST(N'2026-06-02T16:25:56.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-02T13:55:56.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1106, 1, 5, 1, N'X2pgkSr1KTkxQowJmbsc0xKz9QR5VB3OFgHFWarDyZA=', CAST(N'2026-06-02T16:32:51.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-06-02T14:02:51.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1107, 1, 5, 1, N'4XbKJwGB5rtKq3cPnaZRLhY7NuRqDIX3Ufm/1lDAd2M=', CAST(N'2026-06-02T17:53:17.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-06-02T15:23:17.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1108, 1, 4, 1, N'84+TbhyC3DeoJsqoYbMDIVl4v8cKIdx2FsZ/v4+3wK8=', CAST(N'2026-06-02T18:51:59.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-02T16:21:59.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1109, 1, 4, 1, N'YuIutKK5SkVytdCJdtjI6BdeYcqV/MG1dEsRYjWrgS8=', CAST(N'2026-06-03T08:27:41.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-03T05:57:41.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1110, 1, 4, 1, N'PogciUjRhq1+CsRqKDKycBkuFAEOOTp8Q7/ovo/mRpw=', CAST(N'2026-06-03T08:56:54.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-03T06:26:54.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1111, 1, 4, 1, N'XOSaUvSG8OlBk485zv4Z0VPxZtaChdbrx+bBOvQXPt8=', CAST(N'2026-06-03T10:09:35.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-03T07:39:35.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1112, 1, 4, 1, N'IKW4sWDZb64p7OxdVvI+LCtUyFP4SnWdrdPNiRyA94w=', CAST(N'2026-06-05T19:24:40.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-05T16:54:40.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1113, 1, 4, 1, N'yBA2bRsJbUURMMvTJMfky2XEfJSBgI8edVsYtCvZURs=', CAST(N'2026-06-05T20:07:47.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-05T17:37:47.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1114, 1, 4, 1, N'C6Gjk04tOjKDbmPa/23VBarSCiojC99cNkjo0/r5ckg=', CAST(N'2026-06-05T20:56:25.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-05T18:26:25.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1115, 1, 4, 1, N'X7H2Eq8/tz0O5pbxJxARWeDXxKfAjcha4+ylc7C198k=', CAST(N'2026-06-05T21:51:29.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-05T19:21:29.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1116, 1, 4, 1, N'apTco8w+fm9A4Rc4nls7myJosVfiTjS5+lBFAlCYOy0=', CAST(N'2026-06-08T11:29:57.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-08T08:59:57.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1117, 1, 4, 1, N'FoWl81M5r8X+DLCQGPlLxl1BGFs16DjEwxMrJ3xGNHQ=', CAST(N'2026-06-12T21:06:18.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-12T18:36:18.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1118, 1, 4, 1, N'KjiFKthiZoo+wjmMMM2b0Q/2GdFuj0wiKmQyJYUrXro=', CAST(N'2026-06-13T18:34:02.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-13T16:04:02.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1119, 2, 66, 57, N'FF0zL2K1SMlNl+fjP4MW4wIoe5tf80IqQ4WXouMO2VI=', CAST(N'2026-06-13T21:04:51.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-13T18:34:51.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1120, 1, 4, 1, N'BEC9QJvpCIklcTxNw3IfZHS0oZkVrhjpebVvpXBQ5Lw=', CAST(N'2026-06-13T21:29:13.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-13T18:59:13.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1121, 1, 4, 1, N'ApM0N4UXworlMvVfkoMbmcIceGeHESFKPkGst3SoHek=', CAST(N'2026-06-14T14:34:01.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-14T12:04:01.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1122, 1, 4, 1, N'5JZ4lP3LqUcMb7nr5fsDXSVRA25HhiXB5CrD9t3nDzk=', CAST(N'2026-06-14T14:34:47.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-14T12:04:47.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1123, 1, 4, 1, N'EsgH7Jx00AfG/MJpSHIlz4qnZR5hTEpNg9Q2f4K3Nnw=', CAST(N'2026-06-14T14:37:38.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-14T12:07:38.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1124, 1, 4, 1, N'MzHemoNiUTayGJCoNK7pDY1ewC1M8c9Ld56+GE1vuNE=', CAST(N'2026-06-14T14:41:52.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-14T12:11:52.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1125, 1, 4, 1, N'vQ77BgyUudMl2QeLHlHGLEdJW+0bZBDUWr2VXXeLFUE=', CAST(N'2026-06-14T14:50:16.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-14T12:20:16.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1126, 1, 4, 1, N'RVrR8buvfayybZCRDzm5zH9A1ZfRzPhi181whsjVBao=', CAST(N'2026-06-14T14:58:56.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-14T12:28:56.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1127, 1, 4, 1, N'FSr8d0dudohDOREWQK/9aVHle/LqaPUVe1zhWwMQ2fA=', CAST(N'2026-06-14T15:08:35.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-14T12:38:35.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1128, 1, 4, 1, N'+MfFLoiIBIe5skzSBjwoi7KDs5yHXYF5KdS8D8ySOd0=', CAST(N'2026-06-14T15:19:01.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-14T12:49:01.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1129, 1, 5, 1, N'FI/voFKxmtMwC7w3u7laHXpP8XX6DxmeYlbuhNXIOVA=', CAST(N'2026-06-14T15:27:31.0000000' AS DateTime2), NULL, 5, NULL, NULL, CAST(N'2026-06-14T12:57:31.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1130, 1, 4, 1, N'GCvZnvJj3FOWFCUCniosLwaNFYxlay9YhCMlYzvENqQ=', CAST(N'2026-06-14T19:27:26.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-14T16:57:26.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1131, 2, 66, 57, N'MvAjf6MHmfjVqLzrb7SasUDLVuAAFDfer9xycPIRHuE=', CAST(N'2026-06-16T15:55:48.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-16T13:25:48.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1132, 2, 66, 57, N'R53uJ93qH4JvaQGzccsj/RA/jrU8tYJ4xhoYa8qIIOk=', CAST(N'2026-06-17T09:34:08.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-17T07:04:08.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1133, 1, 4, 1, N'dlXohs0ggY3YNgj+fQ5uRjKYKIhYXe8dzOAFEwqoC8U=', CAST(N'2026-06-18T20:37:12.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-18T18:07:12.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1134, 1, 43, 1, N'kjDyKMh830J2yddd4UlVh/bG841yvH5PV9cpRfNDo4I=', CAST(N'2026-06-18T20:55:48.0000000' AS DateTime2), NULL, 43, NULL, NULL, CAST(N'2026-06-18T18:25:48.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1135, 2, 66, 57, N'r5dvm9No/ExLmnZ/kfCq5+gpfOmOl5v/7+ThyCg9yro=', CAST(N'2026-06-19T21:29:14.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-19T18:59:14.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1136, 2, 66, 57, N'JgPFJCeODX30VPxFnSlClMM3q227JAnv4GPhLvKu3Hw=', CAST(N'2026-06-24T13:28:31.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-24T10:58:31.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1137, 2, 66, 57, N'TL+zkEvLU7ERa7JjPIql7J5/DIhxnf1NELHYqdo+bls=', CAST(N'2026-06-24T19:10:39.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-24T16:40:39.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1138, 2, 66, 57, N'icMnk/FtLgbrUK/xcPnmbCd2MK3GSerDOnfjZ8Hf9q4=', CAST(N'2026-06-24T21:49:49.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-24T19:19:49.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1139, 2, 66, 57, N'2dYOYEs0eYsNZnTuhCdB255q8+gX0F0qOVhqj4AtprY=', CAST(N'2026-06-24T21:53:17.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-24T19:23:17.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1140, 2, 66, 57, N'FAkjE9wsXnwKJZUw6/9mXaikKX5odsOFbKPPjRJaI6Q=', CAST(N'2026-06-25T09:03:56.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-25T06:33:56.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1141, 2, 66, 57, N'TF839qKsMsrPD3Ze0dZLLztseVHF/1Kr6F/xjXSGhas=', CAST(N'2026-06-26T09:54:49.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-26T07:24:49.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1142, 2, 66, 57, N'2WrD4IRe1ibzk6dy9psZOzXpH9j1BE+CSS9nRSPawjw=', CAST(N'2026-06-26T10:58:17.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-26T08:28:17.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1143, 1, 4, 1, N'se1a4K4y0q+FmJdOMUDcHGqO4jGPvW4Eule9tsqHPLY=', CAST(N'2026-06-27T12:28:04.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-27T09:58:04.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1144, 1, 4, 1, N'aopCCnbhnZQSn6Fbue+CFTkRoGyNualNzriA1PUvlAw=', CAST(N'2026-06-27T12:39:56.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-06-27T10:09:56.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1145, 2, 66, 57, N'bXL7JSmSL5EYKQgyd2TCr3nE9CV9xz7NDDh932XT9t0=', CAST(N'2026-06-27T12:42:07.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-27T10:12:07.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1146, 2, 66, 57, N'8JSR64bJUeSSq5vr4Aa7IYE+68FCWjlXS3Bf0osb3eM=', CAST(N'2026-06-27T12:47:25.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-27T10:17:25.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1147, 2, 66, 57, N'xyQgaoQdiV5TfOGz0IvoKrknKX9krvQ0ZqXfNEfRl5I=', CAST(N'2026-06-28T11:11:24.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-06-28T08:41:24.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1148, 1, 4, 1, N'rY/i0K7GwMeeTHNhNbaQOz+OECVbQM7p4KFjGqW+QlQ=', CAST(N'2026-07-18T11:35:38.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-07-18T09:05:38.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1149, 1, 4, 1, N'0tIU2KdCZhrrDgnvEdvFVATKnBQ1RYMGC2f+Jlf1akY=', CAST(N'2026-07-30T11:37:24.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-07-30T09:07:24.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1150, 2, 66, 57, N'X/JEH7C0Z1RrHmZs1cAq79N9ufqqvV1jYX/P+qBdaz8=', CAST(N'2026-07-30T12:43:06.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-07-30T10:13:06.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1151, 2, 66, 57, N'v5qieibeF4HLodbf/QFDFHy6mVcbHdtu70ACZMJI8Ak=', CAST(N'2026-07-30T19:03:36.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-07-30T16:33:36.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1152, 2, 66, 57, N'Pg5vA8NNr9vdrymcGCiUYuSjqbv/Qy8cuGuneE4MfrE=', CAST(N'2026-07-30T19:25:56.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-07-30T16:55:56.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1153, 2, 66, 57, N'QUhjXzkZSBN2QdnCi6nedot0QNswMl9IJ9yFe7IhBqE=', CAST(N'2026-08-03T14:27:32.0000000' AS DateTime2), NULL, 66, NULL, NULL, CAST(N'2026-08-03T11:57:32.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1154, 1, 4, 1, N'ujpH/MIXni9pn/Mw5hF+CGlQNF4ncfwJtUdvUsuFOns=', CAST(N'2026-08-06T16:27:44.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-08-06T13:57:44.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1155, 1, 4, 1, N'shNrHn+tUWAXBQJYFIx1OHsLuKPp3nHJj+qb7KwiDuA=', CAST(N'2026-08-06T16:52:44.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-08-06T14:22:44.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1156, 1, 4, 1, N'EP/HNLhnvLzqF3DT7Yqh3iKch9URG+xQyGljeFCGY3k=', CAST(N'2026-09-04T13:54:34.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-04T11:24:34.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1157, 1, 4, 1, N'G3w2SnCVLuyB2uD3fxH1SbNbyYVQWRpP0al1UFLjm00=', CAST(N'2026-09-04T14:30:03.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-04T12:00:03.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1158, 1, 4, 1, N'RAoFsEIQivaCDuhdu5T3UDgXe80LjonhAXbDHiFfuHI=', CAST(N'2026-09-04T15:15:45.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-04T12:45:45.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1159, 1, 4, 1, N'T/nfSAROQLDMY2ZhGUmeTSMeSHrrnsVW5OL4uzwplE0=', CAST(N'2026-09-04T15:16:26.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-04T12:46:26.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1160, 1, 4, 1, N'euDfIh4hdDl5fVaiRYdqrYIfx3S2zd7m6FfxrK2K6d0=', CAST(N'2026-09-04T15:23:12.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-04T12:53:12.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1161, 1, 4, 1, N'8koZ2XOAx/Sqv5lGa1WSeC5KsmZbgZkqu9Lx0Cpq5oo=', CAST(N'2026-09-04T15:23:41.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-04T12:53:41.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1162, 1, 4, 1, N'364syzKNB65g9lLaGx1gdDQuUj+dZSMfvcEDRQPxU1w=', CAST(N'2026-09-04T15:41:01.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-04T13:11:01.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1163, 1, 4, 1, N'b+nhWsi5Cj1iCSMGvmaSMvfP0CraO/0mY8GLpj/G3tU=', CAST(N'2026-09-04T16:27:29.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-04T13:57:29.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1164, 1, 4, 1, N'949xF5TDjiKvsbMj5b0aXy4hXXEhuM2sh30UQmQhxds=', CAST(N'2026-09-05T13:29:03.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-05T10:59:03.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1165, 1, 4, 1, N'oTtMyYHH5QKo4qhEByejcojSjSJnUnfuCodK0362fas=', CAST(N'2026-09-05T13:42:39.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-05T11:12:39.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1166, 1, 4, 1, N'aXlIqufOs7hLGavnk29JqP6FNcrm6HhSnFtWq79jV3s=', CAST(N'2026-09-05T14:21:44.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-05T11:51:44.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1167, 1, 4, 1, N'S+FiVPXiaLseF2RlGIm53aQi0thvN7ATQixzf6aCUZ0=', CAST(N'2026-09-05T14:41:07.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-05T12:11:07.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1168, 1, 4, 1, N'xxowP05X7tEmNy9pgScb3Zw4v81txs6itGdq8jDgmMQ=', CAST(N'2026-09-05T18:45:43.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-05T16:15:43.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1169, 1, 4, 1, N'WXioPEH3hjqBwPECqTMO8vZbxZHnfMFvZhLa0b2Dejs=', CAST(N'2026-09-08T12:37:04.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T10:07:04.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1170, 1, 4, 1, N'/GSStpXL7SpIrIEgljJyym1a/9dUIQ6oE5r5OAyOBT0=', CAST(N'2026-09-08T13:11:02.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T10:41:02.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1171, 1, 4, 1, N'B4DYhEXzN8oJnE70ZUbWIERCIT92s34/yU6YTLSlp+0=', CAST(N'2026-09-08T13:45:46.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T11:15:46.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1172, 1, 4, 1, N'pDWNcnk2JXLN3WSpPvSQqcppP1Ih/kBykL6m6AYgsNQ=', CAST(N'2026-09-08T14:37:49.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T12:07:49.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1173, 1, 4, 1, N'd+XC/PcNaSz8NTNBiaI7ADA3d7kreZjyzx+ij3bi7no=', CAST(N'2026-09-08T14:39:05.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T12:09:05.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1174, 1, 4, 1, N'2CGpC6J8O9gf861ZU9LA+J3HuMdfhPPBU4gGIpfnoOw=', CAST(N'2026-09-08T15:09:45.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T12:39:45.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1175, 1, 4, 1, N'hZn67Wt5Fs52jl9t8jVBzTVOkj+mlV0YQvdF9w8eGpI=', CAST(N'2026-09-08T15:12:06.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T12:42:06.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1176, 1, 4, 1, N'8C5FFD+/iCD+z/VNWVuOF3v5QzOIbsjCYG5gS645QSw=', CAST(N'2026-09-08T16:00:16.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T13:30:16.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1177, 1, 4, 1, N'mr63IXF1pkoJeHzgA31je7EuiJRPIVVSfHD8uWF/HI0=', CAST(N'2026-09-08T16:00:46.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T13:30:46.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1178, 1, 4, 1, N'Fzgnw9xnRVCikS39ckONhl0SbNu9QmzZp4jMF5iKJ7E=', CAST(N'2026-09-08T16:49:52.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T14:19:52.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1179, 1, 4, 1, N'n4aLLidCLgr3hYjkzFpKHeYPFqP+e3oNpC4qBeOfky8=', CAST(N'2026-09-08T17:03:28.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T14:33:28.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1180, 1, 4, 1, N'G6q5b/a86E+BzK55jjCkBIn54wxYdutRxxAO/nO7LEU=', CAST(N'2026-09-08T18:36:56.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T16:06:56.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1181, 1, 4, 1, N'0NHmkinF5WdNlTbYAnOckWTEhIQQ+LgG5C0NDyiMh9Q=', CAST(N'2026-09-08T18:39:13.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-08T16:09:13.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1182, 1, 4, 1, N'nOAmsbWB/TLO6utxrJWYificfG/DmallccDB/HtBXUA=', CAST(N'2026-09-09T08:44:34.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-09T06:14:34.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1183, 1, 4, 1, N'yiL9MDrNnauR8GGeg9d+GgKuHcbFCL7LewK+TBQYkJw=', CAST(N'2026-09-09T12:00:27.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-09T09:30:27.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1184, 1, 4, 1, N'a7BTtOmcROvUlahhOeXZSqhxvG+IHKb70kdowkboEoY=', CAST(N'2026-09-09T12:31:21.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-09T10:01:21.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1185, 1, 4, 1, N'DgzKTZPf2VKFjtnYFysVhwSjZR0y1EKINsnNS0zfIng=', CAST(N'2026-09-09T14:30:55.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-09T12:00:55.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1186, 1, 4, 1, N'5LIN2TRxnauBL4UYty4v1NXtvdjOWeFVZEjWEm7tfBA=', CAST(N'2026-09-10T12:21:05.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-10T09:51:05.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1187, 1, 4, 1, N'CkPkOWKk7e4PBeR/mxY94lsqgx0J4oX/oPKrRw+PVaE=', CAST(N'2026-09-10T13:01:56.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-10T10:31:56.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1188, 1, 4, 1, N'q8uQ2NX1qsEbkvkWcb03b0pgdth6Zxy5u5uD7zEDRUY=', CAST(N'2026-09-10T14:20:05.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-10T11:50:05.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1189, 1, 4, 1, N'ecE+9gHBJ20Xbc/INw59Y4okkAqm5NiLwu/XOTzr6p8=', CAST(N'2026-09-10T18:29:50.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-10T15:59:50.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1190, 1, 4, 1, N'1l2CaIQhFaF0iKtDSYNCMwoxPIe0iOVmBLomkoZ/a9U=', CAST(N'2026-09-11T14:54:52.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-11T12:24:52.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1191, 1, 4, 1, N'RDzDmll8fvsSVen5e+Ul655zk3hmj+hADtxR7zVfSa4=', CAST(N'2026-09-13T09:08:49.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-13T06:38:49.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1192, 1, 4, 1, N'ekve13zbY3QVw3x2xDtU/d70vpuCefkn3MH3SZPwglg=', CAST(N'2026-09-13T09:51:31.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-13T07:21:31.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1193, 1, 4, 1, N'UkNT1nNftUEb561S5f/cWvgIkBbyOAp5FZaCBJW+hCA=', CAST(N'2026-09-14T15:51:21.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-14T13:21:21.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1194, 1, 4, 1, N'Dj+mkbz9hkvGzHSu/pC+4i/RadTYNujMZEMCAUWNCgk=', CAST(N'2026-09-15T13:19:37.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-15T10:49:37.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1195, 1, 4, 1, N'Y7RCkPlW9W2JUmgB9r2UFvnKaTx2tT2jf6NkkRBd78s=', CAST(N'2026-09-15T14:26:44.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-15T11:56:44.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1196, 1, 4, 1, N'360/qzH2DdXTGDy5hHzCsIqq897jq6SC9Zck81VIQbg=', CAST(N'2026-09-15T14:37:14.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-15T12:07:14.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1197, 1, 4, 1, N'eWGHrpi1eReYyKiNiCHx+9YrfBiuLmaThRpgPBwS/zw=', CAST(N'2026-09-16T13:06:24.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T10:36:24.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1198, 1, 4, 1, N'QXWXDkaF/iojjhfziqv+HZwZglhA7ypyZ3/68KQlu64=', CAST(N'2026-09-16T13:38:43.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T11:08:43.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1199, 1, 4, 1, N'b0oLxiCrKeZi45/YNaW/fLn/9JmQzvNTzkYQWr/e3gI=', CAST(N'2026-09-16T13:47:38.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T11:17:38.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1200, 1, 4, 1, N'2MOyB9vKie5zGPlHpDv3H8VH0zXPiPvJyo3Sjn91Wmg=', CAST(N'2026-09-16T13:50:08.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T11:20:08.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1201, 1, 4, 1, N'y8zSyCTFMqfG1WiHTFYKhnnsd6z7UoTP+h1AISHe7CE=', CAST(N'2026-09-16T14:36:09.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T12:06:09.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1202, 1, 4, 1, N'nXTOlkLAkMDWS39AuVmtKlTB4ry7vn/g69+Cub9yY+E=', CAST(N'2026-09-16T15:04:44.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T12:34:44.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1203, 1, 4, 1, N'Hi0Rf/HnP8ZfA/JO545qu7W8ifYhC9RG1Qc7BYy7Dpw=', CAST(N'2026-09-16T18:28:38.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T15:58:38.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1204, 1, 4, 1, N'qmLCAGDdQ49JUy2ltP9g4kocP0EfdyuxAYQ9tV5pIrk=', CAST(N'2026-09-16T19:12:53.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T16:42:53.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1205, 1, 4, 1, N'yHvgqXX3DtbjyhWPTFxlKkW9xnsI0d7TklAc8F84/40=', CAST(N'2026-09-16T19:13:04.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T16:43:04.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1206, 1, 4, 1, N'kvCdw/GMRc2N8dlfSZw9XHAzSkxh3jLXnRUGas+5eRg=', CAST(N'2026-09-16T19:39:35.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T17:09:35.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1207, 1, 4, 1, N'i4aJe1DsAu/w0LC7khWLnlbX2Fhs5atuEZ1JAKpnJ8E=', CAST(N'2026-09-16T19:44:56.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T17:14:56.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1208, 1, 4, 1, N'DIe3lZ1GQ3v2YaJoWh5u3lDmcpDyhycB0lD49mrX7Hs=', CAST(N'2026-09-16T20:35:52.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-16T18:05:52.0000000' AS DateTime2))
GO
INSERT [dbo].[TokensRefresh] ([RefreshTokenId], [DenominacionId], [UsuarioId], [IglesiaId], [TokenHash], [ExpiraEn], [RevocadoEn], [ReemplazadoPor], [UserAgent], [Ip], [FechaCreacion]) VALUES (1209, 1, 4, 1, N'ggnm5i9WQqtRLiVGz0YC2hIDk1AwAZUnIk7OloycC/Q=', CAST(N'2026-09-20T18:27:31.0000000' AS DateTime2), NULL, 4, NULL, NULL, CAST(N'2026-09-20T15:57:31.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[TokensRefresh] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioRoles] ON 
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (1, 4, 1, 1, 5, CAST(N'2026-05-11T20:40:15.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (2, 5, 1, 1, 2, CAST(N'2026-05-20T12:10:03.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (18, 26, 1, 1, 4, CAST(N'2026-06-01T20:07:59.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (19, 27, 1, 1, 4, CAST(N'2026-06-02T03:11:29.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (20, 28, 1, 1, 4, CAST(N'2026-06-02T15:48:34.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (21, 29, 1, 1, 4, CAST(N'2026-06-02T15:51:03.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (22, 30, 1, 1, 4, CAST(N'2026-06-02T15:54:24.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (23, 31, 1, 1, 4, CAST(N'2026-06-02T16:59:49.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (24, 32, 1, 1, 4, CAST(N'2026-06-02T17:28:32.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (25, 33, 1, 1, 4, CAST(N'2026-06-02T17:31:04.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (26, 34, 1, 1, 4, CAST(N'2026-06-02T17:33:54.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (27, 35, 1, 1, 4, CAST(N'2026-06-02T17:36:27.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (28, 36, 1, 1, 4, CAST(N'2026-06-02T17:39:30.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (29, 37, 1, 1, 4, CAST(N'2026-06-02T17:42:52.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (30, 38, 1, 1, 4, CAST(N'2026-06-02T17:45:56.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (31, 39, 1, 1, 4, CAST(N'2026-06-02T17:49:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (32, 40, 1, 1, 4, CAST(N'2026-06-02T17:53:49.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (33, 41, 1, 1, 4, CAST(N'2026-06-02T17:56:27.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (34, 42, 1, 1, 4, CAST(N'2026-06-02T17:58:30.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (35, 43, 1, 1, 4, CAST(N'2026-06-02T20:07:05.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (36, 44, 1, 1, 4, CAST(N'2026-06-02T20:10:58.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (37, 45, 1, 1, 4, CAST(N'2026-06-02T20:14:23.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (38, 46, 1, 1, 4, CAST(N'2026-06-02T20:16:34.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (39, 47, 1, 1, 4, CAST(N'2026-06-02T20:19:34.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (40, 48, 1, 1, 4, CAST(N'2026-06-02T20:22:16.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (41, 49, 1, 1, 4, CAST(N'2026-06-02T20:25:53.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (42, 50, 1, 1, 4, CAST(N'2026-06-02T20:28:06.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (43, 51, 1, 1, 4, CAST(N'2026-06-02T20:30:48.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (44, 52, 1, 1, 4, CAST(N'2026-06-02T20:32:58.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (45, 53, 1, 1, 4, CAST(N'2026-06-02T20:35:28.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (46, 54, 1, 1, 4, CAST(N'2026-06-02T20:38:05.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (47, 55, 1, 1, 4, CAST(N'2026-06-02T20:41:01.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (48, 56, 1, 1, 4, CAST(N'2026-06-02T20:43:48.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (50, 58, 1, 1, 4, CAST(N'2026-06-02T20:49:34.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (51, 59, 1, 1, 4, CAST(N'2026-06-02T20:52:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (52, 60, 1, 1, 4, CAST(N'2026-06-02T20:54:39.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (53, 61, 1, 1, 4, CAST(N'2026-06-02T22:03:41.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (54, 62, 1, 1, 4, CAST(N'2026-06-03T00:42:55.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (55, 63, 1, 1, 4, CAST(N'2026-06-03T00:46:27.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (56, 64, 1, 1, 4, CAST(N'2026-06-06T00:40:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (57, 57, 1, 1, 4, CAST(N'2026-06-13T11:49:27.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (58, 66, 2, 57, 11, CAST(N'2026-06-13T19:02:07.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (59, 67, 2, 57, 13, CAST(N'2026-06-25T13:36:48.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (60, 68, 2, 57, 13, CAST(N'2026-06-26T14:19:29.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (66, 69, 1, 1, 2, CAST(N'2026-09-16T18:50:09.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (67, 70, 1, 1, 5, CAST(N'2026-09-16T19:33:55.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[UsuarioRoles] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (4, 1, 1, N'calyjuan@gmail.com', N'$2a$11$sQYa3hG68c34gfxK2UgDOursQSho624D77h/uc.fk8inBSdLMKyzq', 1, 0, CAST(N'2026-05-11T01:33:04.0000000' AS DateTime2), CAST(N'2026-09-20T15:57:31.0000000' AS DateTime2), N'A2D89F2B-FAD4-4FE7-BE88-D57CB073B433', 5)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (5, 1, 2, N'pastorjuaneliceo@gmail.com', N'$2a$11$pNI8m3kZop6f72qRezrio.vQAQkkdXuf6/Xv.TUzHOhp1LWrU1Qte', 1, 0, CAST(N'2026-05-20T17:30:09.0000000' AS DateTime2), CAST(N'2026-06-14T12:57:31.0000000' AS DateTime2), N'D33BE479-D163-497B-BFF1-17998748D2BB', 2)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (26, 1, 25, N'urrao@iglesiaidges.org', N'$2a$11$KVNKje5uY8zrtiYUU7.fiel0hB/Yxkr534G3gCV.blFzq3VzI6yKi', 0, 0, CAST(N'2026-06-02T01:30:35.0000000' AS DateTime2), NULL, N'6EDF3950-D806-4744-9612-CF10557F9483', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (27, 1, 26, N'dairo.menmo@gmail.com', N'$2a$11$5KrqMvO1Z512diOGv14LM.Oy1gQZPOGb2HDoVNrObqopSpNce3AVe', 0, 0, CAST(N'2026-06-02T03:11:29.0000000' AS DateTime2), NULL, N'C5B987A2-F6A9-4084-96C8-59F9E6B9D221', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (28, 1, 27, N'edgareduardosantosortiz2014@gmail.com', N'$2a$11$HQDdhvLrCMTVpJYIkG4hQ.mQ7tAtNU.oyVyRQh1RLZ.50666zfgT6', 0, 0, CAST(N'2026-06-02T15:48:34.0000000' AS DateTime2), NULL, N'C0290876-60D4-4E0D-9E85-E119174D0042', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (29, 1, 28, N'alexandercastilloaragon@hotmail.es', N'$2a$11$LdaIyw7QFfkTFWMrepwSIepgEmZ3U11VSXCrjF8MqCW5HFS6uivG6', 0, 0, CAST(N'2026-06-02T15:51:03.0000000' AS DateTime2), NULL, N'39A54464-2638-4FD9-9679-49160B3837F2', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (30, 1, 29, N'luis_rodas_69@hotmail.com', N'$2a$11$MFa.AsYQZbQQBfiwchyi3end603zUywLryOW/E115rUGcPzrNbLc2', 0, 0, CAST(N'2026-06-02T15:54:24.0000000' AS DateTime2), NULL, N'FF921A7B-DA36-408B-9811-005398F884C2', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (31, 1, 31, N'sanabriaanderson80@gmail.com', N'$2a$11$cYDLCtdFQl8rVEQzI2mkB.9EbhJ8hXJPPebRh6gCTQrDIlmM.oeqq', 0, 0, CAST(N'2026-06-02T16:59:49.0000000' AS DateTime2), NULL, N'93222A90-C1DD-4260-81B6-E57738EAA3F3', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (32, 1, 32, N'arlexmontoya22@gmail.com', N'$2a$11$ijUvw38IDpa/boBEeEwpQeInsMLVAjjFtQsfDP2dmwVbVnTlytkWq', 0, 0, CAST(N'2026-06-02T17:28:32.0000000' AS DateTime2), NULL, N'51147E4A-2A2D-4E54-93AD-A98387E426BD', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (33, 1, 33, N'elsalmista-200@hotmail.com', N'$2a$11$cet5dJGFH5MMbv8bztkPbu0CLcf1DplrhEF5fqxnpq6PrZB9hzWJy', 0, 0, CAST(N'2026-06-02T17:31:04.0000000' AS DateTime2), NULL, N'751B1B26-A3E4-4655-BDB5-A2A5D5C93688', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (34, 1, 34, N'luiseduardobarrerorodriguez@gmail.com', N'$2a$11$6pA8GttujpImAI6C5pvCS.pP4KsW/wrvE5B4H6FE2/DDnvj8AG04W', 0, 0, CAST(N'2026-06-02T17:33:54.0000000' AS DateTime2), NULL, N'3FEA1DD3-D4A3-4D1C-A823-3F038E04E80C', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (35, 1, 35, N'ptolopez@iglesiaidges.org', N'$2a$11$v.QtCxoJMJlcXTgd.xMK/OMsuju4O8byt9ndW3kTsH/7jiUtvnxTu', 0, 0, CAST(N'2026-06-02T17:36:27.0000000' AS DateTime2), NULL, N'9A84582E-C46C-49E0-A437-6C1475A9FB4E', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (36, 1, 36, N'quiroz_1983_@hotmail.com', N'$2a$11$1Bx3GWEt7H4nUvjuUzzJsefdHKVNtkOt24M3IvfgRHuv3Lxk2Spdq', 0, 0, CAST(N'2026-06-02T17:39:30.0000000' AS DateTime2), NULL, N'E460CB28-4BD9-40B8-8C23-1967D2CD692D', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (37, 1, 37, N'spaternina1994@gmail.com', N'$2a$11$7h3eT4QrzvY.F5sxF6gnBe7ks34v8FuFsbM.oEQZKdefB2L1JnUS2', 0, 0, CAST(N'2026-06-02T17:42:52.0000000' AS DateTime2), NULL, N'C02CF465-A6AC-4049-B7EF-FA8008A45AFA', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (38, 1, 38, N'luisagudelo95@hotmail.com', N'$2a$11$4U4re1HXD3Z/a7jZWKhIR.twZTk0NxuTnlX8lRKBhDRKPeTvHHLsO', 0, 0, CAST(N'2026-06-02T17:45:56.0000000' AS DateTime2), NULL, N'B5161494-9BD0-4199-BED7-7B937DAD0B30', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (39, 1, 39, N'fernando.pinero19@gmail.com', N'$2a$11$zUuL1L0e/3fnNMPwIS5hAezOo8EcT5qDwraRBn/ZWbVKERTmz1fxO', 0, 0, CAST(N'2026-06-02T17:49:12.0000000' AS DateTime2), NULL, N'FE5D7546-4742-454E-A8AF-8F6DB88397FD', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (40, 1, 40, N'wilmarcardona881@gmail.com', N'$2a$11$PuJR6073PN8.o8rHMXoVd.sJ18lypPKrOY1q9oQsjjFxcWVkBr4ne', 0, 0, CAST(N'2026-06-02T17:53:49.0000000' AS DateTime2), NULL, N'C45B4924-B70E-431B-89CB-DD23C6E0B128', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (41, 1, 41, N'olimpocarmar@gmail.com', N'$2a$11$I3wZrZfqLLwcxkkoLk.pdO48k/zOQ35YB/FrHTI/T8BDbRb6tENvu', 0, 0, CAST(N'2026-06-02T17:56:27.0000000' AS DateTime2), NULL, N'96670D2E-A038-4818-BF4E-7162AD205F80', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (42, 1, 42, N'85emiliojose@gmail.com', N'$2a$11$YqJEZ0iJODCy9xQQRMtuIejQ7fsfOC6N4GP.Z5GKyuDw3IKLbpjWu', 0, 0, CAST(N'2026-06-02T17:58:30.0000000' AS DateTime2), NULL, N'656992AA-DD7D-4281-AED9-C79E4AF2F356', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (43, 1, 43, N'calderadiomidio@gmail.com', N'$2a$11$5kGn8CVRVsKguhCBZoGb2.GVQ6JiGrGLe.IV6m1GbrzabMWENoLoO', 1, 0, CAST(N'2026-06-02T20:07:05.0000000' AS DateTime2), CAST(N'2026-06-18T18:25:48.0000000' AS DateTime2), N'8C8B3421-D4D1-4890-B275-D576AD998FC2', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (44, 1, 44, N'gabrieldumar2011@hotmail.com', N'$2a$11$iBSzI6rq9UD/w4cE6XjMTO.KvxejfIu6j2KcwEpVI7YVm3JJ7RI6a', 0, 0, CAST(N'2026-06-02T20:10:58.0000000' AS DateTime2), NULL, N'6D1E79E6-2C0A-445F-A92A-3AFB34129C18', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (45, 1, 45, N'arleybo2017@gmail.com', N'$2a$11$lrIrVxTMsYxlp3NdIFbJ9uPeMTUrUY4seD0k.cm2SXig5sPFltaIW', 0, 0, CAST(N'2026-06-02T20:14:23.0000000' AS DateTime2), NULL, N'735425E0-4695-4B7F-B3FD-CE47A145E69A', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (46, 1, 46, N'zaragoza@iglesiaidges.org', N'$2a$11$/lqARPaJxC75G702wrmONuxNO5fB9d1VANkTJxvRFgOTHJMwujvOG', 0, 0, CAST(N'2026-06-02T20:16:34.0000000' AS DateTime2), NULL, N'27086CC3-4465-4D15-8ECF-510E1DA30D42', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (47, 1, 47, N'deanlope861017@hotmail.com', N'$2a$11$wCGY8Ves4BhiAO7Uq3l9jO.H8jtcip7XVru/DA6ksfXVm8jQADJi2', 0, 0, CAST(N'2026-06-02T20:19:34.0000000' AS DateTime2), NULL, N'A9127C1C-C48A-4B05-BF45-D9B3BF13D08A', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (48, 1, 48, N'hugoariascontreras@gmail.com', N'$2a$11$a5pxQtOFQDrrMDlkp6HEFe/Ior4ptIonp6uMwn/8Tace3ZLIa0zKO', 0, 0, CAST(N'2026-06-02T20:22:16.0000000' AS DateTime2), NULL, N'5DA1088D-3951-4CFD-920D-3B323799EAB6', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (49, 1, 49, N'wilfredoricardo@hotmail.com', N'$2a$11$6sJ/Tb3AXowmJZiVoy92LOqMPHoVA2tdQ1w5Sw8.zp6rtR59dfFLy', 0, 0, CAST(N'2026-06-02T20:25:53.0000000' AS DateTime2), NULL, N'B5DE5B03-B3D9-4EE8-82E1-B10DA72D4325', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (50, 1, 50, N'jcmedina015@gmail.com', N'$2a$11$fpjdkR/or5Dp2VWJCPM.pONZLtr6JMl05fj6n1zlI32O9IQabI6MS', 0, 0, CAST(N'2026-06-02T20:28:06.0000000' AS DateTime2), NULL, N'2DF3848D-0DF3-4348-B02D-A12AFAC60E8E', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (51, 1, 51, N'esnaiderborja810@gmail.com', N'$2a$11$hwgSHZ7fGrWEodw3IrCSFOVK0QcXrxdlNVGq7CrgGEfWclqMwBIGe', 0, 0, CAST(N'2026-06-02T20:30:48.0000000' AS DateTime2), NULL, N'5B0F0B4F-2E3B-4CB1-9FAE-D69C4F83D84A', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (52, 1, 52, N'alvarovitola4@gmail.com', N'$2a$11$hTtkHvGt1zH/Waxb6dCXHOCQc/YDvF8PPdWP2V7jq33q.VSCdWH12', 0, 0, CAST(N'2026-06-02T20:32:58.0000000' AS DateTime2), NULL, N'3708EF82-3E02-4297-B828-62E7D8D1A89C', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (53, 1, 53, N'juanmaldonado2030@hotmail.com', N'$2a$11$Fe7W26NoFxUsFSa3CGxQR.m3VgCGthZu5eR1uI9wIooalQ89k41gq', 0, 0, CAST(N'2026-06-02T20:35:28.0000000' AS DateTime2), NULL, N'A8E14CC6-A2AC-4521-BC22-FEA1D6FCB083', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (54, 1, 54, N'dionicioidges@hotmail.com', N'$2a$11$ezO4ijThHxesPeM4sK3ltuzy7JKGYoHI1op7sbIeE4hf12vlVNGfW', 0, 0, CAST(N'2026-06-02T20:38:05.0000000' AS DateTime2), NULL, N'C256B39D-AC97-4830-9F09-6B40B1C02192', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (55, 1, 55, N'josesua78@hotmail.com', N'$2a$11$qSVUmpXT3AkWuD.eKrPKV.acAPC7/p1M5txqAdtCsYim2iWbJRb16', 0, 0, CAST(N'2026-06-02T20:41:01.0000000' AS DateTime2), NULL, N'BFE2E3E8-3E81-4CD1-B05F-4FB59566AD55', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (56, 1, 56, N'arielospino1980@gmail.com', N'$2a$11$T2MTUsuj50ZzKGANrj4/pupbtgHcUHlCuPo/c2XjI8OfJubHVSUZy', 0, 0, CAST(N'2026-06-02T20:43:48.0000000' AS DateTime2), NULL, N'829C09D9-A5D2-4D69-B74A-784A373D37EB', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (57, 1, 57, N'aliriocastromancera@gmail.com', N'$2a$11$nSr4OXRRmUx7zGEiG67VROGNlZPzet38KkZqmZPeSzJbTcOjC4MQi', 0, 0, CAST(N'2026-06-02T20:46:51.0000000' AS DateTime2), NULL, N'0A9757B2-29A6-4B95-A632-6EE65EF83B14', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (58, 1, 58, N'harry.copasachoa@gmail.com', N'$2a$11$.30WhR9OvIE1v/wdC4PaoudJ8mmmAXqzFHotfOTTAh1kisAx9VevO', 0, 0, CAST(N'2026-06-02T20:49:34.0000000' AS DateTime2), NULL, N'37DDC5EA-A55D-4D49-973F-149AA15B890C', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (59, 1, 59, N'juancarlosdaza1@gmail.com', N'$2a$11$RpSFYT3P3FA1HB0QAESVi.wYhT8Wno1lGusSIr/4yhLEy/.eUC.lS', 0, 0, CAST(N'2026-06-02T20:52:12.0000000' AS DateTime2), NULL, N'01CB128C-0C86-4088-9FAC-BFEBE5565985', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (60, 1, 60, N'frojas2313@gmail.com', N'$2a$11$odQk3GrqiNI6uCb1EIlpK.OVy5aPnU5lSSRVyI2MWDhBpSwE/hsOe', 0, 0, CAST(N'2026-06-02T20:54:39.0000000' AS DateTime2), NULL, N'B1D12BF9-AB68-4893-A4DA-0BD99E2D61A1', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (61, 1, 61, N'cruzpratoa@gmail.com', N'$2a$11$korY33EwAU6x4pg8TJ8zkODDC2.EN242z27Q.J2wwkkKzDMcAJ7LG', 0, 0, CAST(N'2026-06-02T22:03:41.0000000' AS DateTime2), NULL, N'B2F430BF-DDD0-454B-98DF-3C09A47A8B73', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (62, 1, 62, N'17265586', N'$2a$11$V.0bHhsJJ1Xhm3/3MSS55.7UEaCBXRr0N6IA1nSitiFo7mKWEZsiC', 0, 0, CAST(N'2026-06-03T00:42:55.0000000' AS DateTime2), NULL, N'87056041-9B2B-4A11-8134-A11981EEC359', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (63, 1, 63, N'41930630', N'$2a$11$27kq5irU2I6mR5xrxif3xeqvKRdWma.mvtScrQliPdnA9etZ3bDzy', 0, 0, CAST(N'2026-06-03T00:46:27.0000000' AS DateTime2), NULL, N'938FB909-6198-4B03-94F5-9800C6C538CC', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (64, 1, 64, N'carloscesarcontrerascury@gmail.com', N'$2a$11$phBBEZEHVuh/ih4iU25w/uvuEKJfmzalsAmmoiOJG6.tSTxgJWEAa', 0, 0, CAST(N'2026-06-06T00:40:12.0000000' AS DateTime2), NULL, N'847A6224-3419-4F44-A368-BCB4CE9FCDD7', 4)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (66, 2, 65, N'fe.integridad@gmail.com', N'$2a$11$fuJHqWd5Z6YeuAFF1EAjCOw4Kn2XL691fIxkp7BJargzzduMspX8e', 1, 0, CAST(N'2026-06-13T19:02:07.0000000' AS DateTime2), CAST(N'2026-08-03T11:57:32.0000000' AS DateTime2), N'BF010439-6C95-43C0-9815-9D0B0460E029', 11)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (67, 2, 66, N'aidamadrigalv@gmail.com', N'$2a$11$M9zQCQGHV4thCRbsynVM6.bqxmoq.Ke944bn7ooa0zHVpQZL0ExMO', 1, 0, CAST(N'2026-06-25T13:36:48.0000000' AS DateTime2), NULL, N'E2C566D6-B8F6-4228-95E5-AE4841F4AB72', 13)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (68, 2, 67, N'92257775', N'$2a$11$SvtfmpJWYLcbNJ2G2F/oDORmmB7H3Vk6bu01MMe7h24.ubKQGKC2a', 0, 0, CAST(N'2026-06-26T14:19:29.0000000' AS DateTime2), NULL, N'37E2B2FC-DDAE-4D6B-9FF7-4764F2EF6A2D', 13)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (69, 1, 68, N'22222222', N'$2a$11$pJGavnHcJ5KZ2doYELyHce1xhPuNH5Y21iOVAXgxpbE.Zmpsv0fSW', 0, 0, CAST(N'2026-09-16T18:50:09.0000000' AS DateTime2), NULL, N'865B5256-703A-49C7-B1C4-C6092454EF5A', 2)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (70, 1, 69, N'1020409198', N'$2a$11$DCpe7IPhm/yBeKhWVmaU1uvZbcu21wUP/C2uaUP0g4dXS.RNIV0Na', 0, 0, CAST(N'2026-09-16T19:33:55.0000000' AS DateTime2), NULL, N'FA451E46-D7A4-4AB7-B3AA-71F79B0BC53C', 5)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuariosIglesias] ON 
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (1, 1, 4, 1, 1, 1, CAST(N'2026-05-11T11:27:01.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (2, 1, 5, 1, 1, 1, CAST(N'2026-05-21T07:10:11.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (4, 1, 27, 1, 1, 0, CAST(N'2026-06-02T03:11:29.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (5, 1, 28, 1, 1, 0, CAST(N'2026-06-02T15:48:34.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (6, 1, 29, 1, 1, 0, CAST(N'2026-06-02T15:51:03.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (7, 1, 30, 1, 1, 0, CAST(N'2026-06-02T15:54:24.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (8, 1, 31, 1, 1, 0, CAST(N'2026-06-02T16:59:49.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (9, 1, 32, 1, 1, 0, CAST(N'2026-06-02T17:28:32.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (10, 1, 33, 1, 1, 0, CAST(N'2026-06-02T17:31:04.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (11, 1, 34, 1, 1, 0, CAST(N'2026-06-02T17:33:54.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (12, 1, 35, 1, 1, 0, CAST(N'2026-06-02T17:36:27.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (13, 1, 36, 1, 1, 0, CAST(N'2026-06-02T17:39:30.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (14, 1, 37, 1, 1, 0, CAST(N'2026-06-02T17:42:52.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (15, 1, 38, 1, 1, 0, CAST(N'2026-06-02T17:45:56.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (16, 1, 39, 1, 1, 0, CAST(N'2026-06-02T17:49:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (17, 1, 40, 1, 1, 0, CAST(N'2026-06-02T17:53:49.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (18, 1, 41, 1, 1, 0, CAST(N'2026-06-02T17:56:27.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (19, 1, 42, 1, 1, 0, CAST(N'2026-06-02T17:58:30.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (20, 1, 43, 1, 1, 0, CAST(N'2026-06-02T20:07:05.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (21, 1, 44, 1, 1, 0, CAST(N'2026-06-02T20:10:58.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (22, 1, 45, 1, 1, 0, CAST(N'2026-06-02T20:14:23.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (23, 1, 46, 1, 1, 0, CAST(N'2026-06-02T20:16:34.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (24, 1, 47, 1, 1, 0, CAST(N'2026-06-02T20:19:34.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (25, 1, 48, 1, 1, 0, CAST(N'2026-06-02T20:22:16.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (26, 1, 49, 1, 1, 0, CAST(N'2026-06-02T20:25:53.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (27, 1, 50, 1, 1, 0, CAST(N'2026-06-02T20:28:06.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (28, 1, 51, 1, 1, 0, CAST(N'2026-06-02T20:30:48.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (29, 1, 52, 1, 1, 0, CAST(N'2026-06-02T20:32:58.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (30, 1, 53, 1, 1, 0, CAST(N'2026-06-02T20:35:28.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (31, 1, 54, 1, 1, 0, CAST(N'2026-06-02T20:38:05.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (32, 1, 55, 1, 1, 0, CAST(N'2026-06-02T20:41:01.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (33, 1, 56, 1, 1, 0, CAST(N'2026-06-02T20:43:48.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (34, 1, 57, 1, 1, 0, CAST(N'2026-06-02T20:46:51.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (35, 1, 58, 1, 1, 0, CAST(N'2026-06-02T20:49:34.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (36, 1, 59, 1, 1, 0, CAST(N'2026-06-02T20:52:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (37, 1, 60, 1, 1, 0, CAST(N'2026-06-02T20:54:39.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (38, 1, 61, 1, 1, 0, CAST(N'2026-06-02T22:03:41.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (39, 1, 62, 1, 1, 0, CAST(N'2026-06-03T00:42:55.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (40, 1, 63, 1, 1, 0, CAST(N'2026-06-03T00:46:27.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (41, 1, 64, 1, 1, 0, CAST(N'2026-06-06T00:40:12.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (42, 2, 66, 57, 1, 1, CAST(N'2026-06-13T19:02:07.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (43, 2, 67, 57, 1, 0, CAST(N'2026-06-25T13:36:48.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (44, 2, 68, 57, 1, 0, CAST(N'2026-06-26T14:19:29.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (45, 1, 69, 1, 1, 0, CAST(N'2026-09-16T18:50:09.0000000' AS DateTime2))
GO
INSERT [dbo].[UsuariosIglesias] ([UsuarioIglesiaId], [DenominacionId], [UsuarioId], [IglesiaId], [Estado], [EsAdministrador], [FechaCreacion]) VALUES (46, 1, 70, 1, 1, 0, CAST(N'2026-09-16T19:33:55.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[UsuariosIglesias] OFF
GO
/****** Object:  Index [UQ_CompletarDatos_Registro]    Script Date: 20/09/2026 7:38:44 p. m. ******/
ALTER TABLE [dbo].[CompletarDatos] ADD  CONSTRAINT [UQ_CompletarDatos_Registro] UNIQUE NONCLUSTERED 
(
	[RegistroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UX_DenominacionesDominios_Dominio_Subdominio_Activo]    Script Date: 20/09/2026 7:38:44 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_DenominacionesDominios_Dominio_Subdominio_Activo] ON [dbo].[DenominacionesDominios]
(
	[Dominio] ASC,
	[Subdominio] ASC
)
WHERE ([Estado]=(1))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TokensRefresh_Expira]    Script Date: 20/09/2026 7:38:44 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_TokensRefresh_Expira] ON [dbo].[TokensRefresh]
(
	[ExpiraEn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TokensVerificacionCorreo_Expira]    Script Date: 20/09/2026 7:38:44 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_TokensVerificacionCorreo_Expira] ON [dbo].[TokensVerificacionCorreo]
(
	[ExpiraEn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Usuarios_Correo]    Script Date: 20/09/2026 7:38:44 p. m. ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UQ_Usuarios_Correo] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Usuarios_Correo]    Script Date: 20/09/2026 7:38:44 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_Usuarios_Correo] ON [dbo].[Usuarios]
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_UsuariosPerfil_TipoDocumento_Documento]    Script Date: 20/09/2026 7:38:44 p. m. ******/
ALTER TABLE [dbo].[UsuariosPerfil] ADD  CONSTRAINT [UQ_UsuariosPerfil_TipoDocumento_Documento] UNIQUE NONCLUSTERED 
(
	[TipoDocumento] ASC,
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UsuariosPerfil_Documento]    Script Date: 20/09/2026 7:38:44 p. m. ******/
CREATE NONCLUSTERED INDEX [IX_UsuariosPerfil_Documento] ON [dbo].[UsuariosPerfil]
(
	[TipoDocumento] ASC,
	[Documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompletarDatos] ADD  CONSTRAINT [DF_CompletarDatos_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[ConfiguracionIglesia] ADD  CONSTRAINT [DF_ConfiguracionIglesia_Activa]  DEFAULT ((1)) FOR [Activa]
GO
ALTER TABLE [dbo].[ConfiguracionIglesia] ADD  CONSTRAINT [DF_ConfiguracionIglesia_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[DenominacionesDominios] ADD  CONSTRAINT [DF_DenominacionesDominios_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[DenominacionesDominios] ADD  CONSTRAINT [DF_DenominacionesDominios_FechaCreacion]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[EstructurasDenominacion] ADD  CONSTRAINT [DF_EstructurasDenominacion_Activa]  DEFAULT ((1)) FOR [Activa]
GO
ALTER TABLE [dbo].[EstructurasDenominacion] ADD  CONSTRAINT [DF_EstructurasDenominacion_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Iglesias] ADD  CONSTRAINT [DF_Iglesias_Activa]  DEFAULT ((1)) FOR [Activa]
GO
ALTER TABLE [dbo].[Iglesias] ADD  CONSTRAINT [DF_Iglesias_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[IglesiasEstructuras] ADD  CONSTRAINT [DF_IglesiasEstructuras_FechaAsignacion]  DEFAULT (sysdatetime()) FOR [FechaAsignacion]
GO
ALTER TABLE [dbo].[Permisos] ADD  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_Activo]  DEFAULT ((1)) FOR [Activo]
GO
ALTER TABLE [dbo].[Roles] ADD  CONSTRAINT [DF_Roles_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[RolPermisos] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[RolPermisos] ADD  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[TokensRefresh] ADD  CONSTRAINT [DF_TokensRefresh_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[TokensVerificacionCorreo] ADD  CONSTRAINT [DF_TokensVerificacionCorreo_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[UsuarioRoles] ADD  CONSTRAINT [DF_UsuarioRoles_FechaAsignacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_EmailVerificado]  DEFAULT ((0)) FOR [EmailVerificado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_Bloqueado]  DEFAULT ((0)) FOR [Bloqueado]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_FechaCreacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [DF_Usuarios_SecurityStamp]  DEFAULT (CONVERT([nvarchar](64),newid())) FOR [SecurityStamp]
GO
ALTER TABLE [dbo].[UsuariosIglesias] ADD  CONSTRAINT [DF_UsuariosIglesias_Estado]  DEFAULT ((0)) FOR [Estado]
GO
ALTER TABLE [dbo].[UsuariosIglesias] ADD  CONSTRAINT [DF_UsuariosIglesias_EsAdministrador]  DEFAULT ((0)) FOR [EsAdministrador]
GO
ALTER TABLE [dbo].[UsuariosIglesias] ADD  CONSTRAINT [DF_UsuariosIglesias_FechaAsignacion]  DEFAULT (sysdatetime()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[UsuariosPerfil] ADD  CONSTRAINT [DF_UsuariosPerfil_Estado]  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[Clase]  WITH CHECK ADD  CONSTRAINT [FK_Clase_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[Clase] CHECK CONSTRAINT [FK_Clase_Denominaciones]
GO
ALTER TABLE [dbo].[CompletarDatos]  WITH CHECK ADD  CONSTRAINT [FK_CompletarDatos_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[CompletarDatos] CHECK CONSTRAINT [FK_CompletarDatos_Denominaciones]
GO
ALTER TABLE [dbo].[CompletarDatos]  WITH CHECK ADD  CONSTRAINT [FK_CompletarDatos_Iglesias] FOREIGN KEY([IglesiaId])
REFERENCES [dbo].[Iglesias] ([IglesiaId])
GO
ALTER TABLE [dbo].[CompletarDatos] CHECK CONSTRAINT [FK_CompletarDatos_Iglesias]
GO
ALTER TABLE [dbo].[CompletarDatos]  WITH CHECK ADD  CONSTRAINT [FK_CompletarDatos_Registro] FOREIGN KEY([RegistroId])
REFERENCES [dbo].[Registro] ([RegistroId])
GO
ALTER TABLE [dbo].[CompletarDatos] CHECK CONSTRAINT [FK_CompletarDatos_Registro]
GO
ALTER TABLE [dbo].[ConfiguracionIglesia]  WITH CHECK ADD  CONSTRAINT [FK_ConfiguracionIglesia_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[ConfiguracionIglesia] CHECK CONSTRAINT [FK_ConfiguracionIglesia_Denominaciones]
GO
ALTER TABLE [dbo].[ConfiguracionIglesia]  WITH CHECK ADD  CONSTRAINT [FK_ConfiguracionIglesia_Iglesias] FOREIGN KEY([IglesiaId])
REFERENCES [dbo].[Iglesias] ([IglesiaId])
GO
ALTER TABLE [dbo].[ConfiguracionIglesia] CHECK CONSTRAINT [FK_ConfiguracionIglesia_Iglesias]
GO
ALTER TABLE [dbo].[ConfiguracionIglesiaColores]  WITH CHECK ADD  CONSTRAINT [FK_ConfiguracionIglesiaColores_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[ConfiguracionIglesiaColores] CHECK CONSTRAINT [FK_ConfiguracionIglesiaColores_Denominaciones]
GO
ALTER TABLE [dbo].[DenominacionesDominios]  WITH CHECK ADD  CONSTRAINT [FK_DenominacionesDominios_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[DenominacionesDominios] CHECK CONSTRAINT [FK_DenominacionesDominios_Denominaciones]
GO
ALTER TABLE [dbo].[EstructuraOrganizacional]  WITH CHECK ADD  CONSTRAINT [FK_EstructuraOrganizacional_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[EstructuraOrganizacional] CHECK CONSTRAINT [FK_EstructuraOrganizacional_Denominaciones]
GO
ALTER TABLE [dbo].[EstructurasDenominacion]  WITH CHECK ADD  CONSTRAINT [FK_EstructurasDenominacion_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[EstructurasDenominacion] CHECK CONSTRAINT [FK_EstructurasDenominacion_Denominaciones]
GO
ALTER TABLE [dbo].[Iglesias]  WITH CHECK ADD  CONSTRAINT [FK_Iglesias_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[Iglesias] CHECK CONSTRAINT [FK_Iglesias_Denominaciones]
GO
ALTER TABLE [dbo].[IglesiasEstructuras]  WITH CHECK ADD  CONSTRAINT [FK_IglesiasEstructuras_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[IglesiasEstructuras] CHECK CONSTRAINT [FK_IglesiasEstructuras_Denominaciones]
GO
ALTER TABLE [dbo].[IglesiasEstructuras]  WITH CHECK ADD  CONSTRAINT [FK_IglesiasEstructuras_Iglesias] FOREIGN KEY([IglesiaId])
REFERENCES [dbo].[Iglesias] ([IglesiaId])
GO
ALTER TABLE [dbo].[IglesiasEstructuras] CHECK CONSTRAINT [FK_IglesiasEstructuras_Iglesias]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Denominaciones]
GO
ALTER TABLE [dbo].[Menu_rol]  WITH CHECK ADD  CONSTRAINT [FK_Menu_rol_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[Menu_rol] CHECK CONSTRAINT [FK_Menu_rol_Denominaciones]
GO
ALTER TABLE [dbo].[Menu_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Usuario_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[Menu_Usuario] CHECK CONSTRAINT [FK_Menu_Usuario_Denominaciones]
GO
ALTER TABLE [dbo].[Parametro]  WITH CHECK ADD  CONSTRAINT [FK_Parametro_Clase] FOREIGN KEY([ClaseId])
REFERENCES [dbo].[Clase] ([ClaseId])
GO
ALTER TABLE [dbo].[Parametro] CHECK CONSTRAINT [FK_Parametro_Clase]
GO
ALTER TABLE [dbo].[Parametro]  WITH CHECK ADD  CONSTRAINT [FK_Parametro_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[Parametro] CHECK CONSTRAINT [FK_Parametro_Denominaciones]
GO
ALTER TABLE [dbo].[Registro]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[Registro] CHECK CONSTRAINT [FK_Registro_Denominaciones]
GO
ALTER TABLE [dbo].[Registro]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Iglesias] FOREIGN KEY([IglesiaId])
REFERENCES [dbo].[Iglesias] ([IglesiaId])
GO
ALTER TABLE [dbo].[Registro] CHECK CONSTRAINT [FK_Registro_Iglesias]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_Denominaciones]
GO
ALTER TABLE [dbo].[TiposEstructura]  WITH CHECK ADD  CONSTRAINT [FK_TiposEstructura_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[TiposEstructura] CHECK CONSTRAINT [FK_TiposEstructura_Denominaciones]
GO
ALTER TABLE [dbo].[TokensRefresh]  WITH CHECK ADD  CONSTRAINT [FK_TokensRefresh_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[TokensRefresh] CHECK CONSTRAINT [FK_TokensRefresh_Denominaciones]
GO
ALTER TABLE [dbo].[TokensVerificacionCorreo]  WITH CHECK ADD  CONSTRAINT [FK_TokensVerificacionCorreo_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[TokensVerificacionCorreo] CHECK CONSTRAINT [FK_TokensVerificacionCorreo_Denominaciones]
GO
ALTER TABLE [dbo].[UsuarioRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRoles_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[UsuarioRoles] CHECK CONSTRAINT [FK_UsuarioRoles_Denominaciones]
GO
ALTER TABLE [dbo].[UsuarioRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRoles_Roles] FOREIGN KEY([RolId])
REFERENCES [dbo].[Roles] ([RolId])
GO
ALTER TABLE [dbo].[UsuarioRoles] CHECK CONSTRAINT [FK_UsuarioRoles_Roles]
GO
ALTER TABLE [dbo].[UsuarioRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioRoles_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[UsuarioRoles] CHECK CONSTRAINT [FK_UsuarioRoles_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Denominaciones]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Registro] FOREIGN KEY([RegistroId])
REFERENCES [dbo].[Registro] ([RegistroId])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Registro]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Roles] FOREIGN KEY([RolId])
REFERENCES [dbo].[Roles] ([RolId])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Roles]
GO
ALTER TABLE [dbo].[UsuariosIglesias]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosIglesias_Denominaciones] FOREIGN KEY([DenominacionId])
REFERENCES [dbo].[Denominaciones] ([DenominacionId])
GO
ALTER TABLE [dbo].[UsuariosIglesias] CHECK CONSTRAINT [FK_UsuariosIglesias_Denominaciones]
GO
ALTER TABLE [dbo].[UsuariosIglesias]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosIglesias_Iglesias] FOREIGN KEY([IglesiaId])
REFERENCES [dbo].[Iglesias] ([IglesiaId])
GO
ALTER TABLE [dbo].[UsuariosIglesias] CHECK CONSTRAINT [FK_UsuariosIglesias_Iglesias]
GO
ALTER TABLE [dbo].[UsuariosIglesias]  WITH CHECK ADD  CONSTRAINT [FK_UsuariosIglesias_Usuarios] FOREIGN KEY([UsuarioId])
REFERENCES [dbo].[Usuarios] ([UsuarioId])
GO
ALTER TABLE [dbo].[UsuariosIglesias] CHECK CONSTRAINT [FK_UsuariosIglesias_Usuarios]
GO
ALTER TABLE [dbo].[CompletarDatos]  WITH CHECK ADD  CONSTRAINT [CK_CompletarDatos_Bautismo] CHECK  (([FechaBautismo] IS NULL OR [ParametroIdTipoMiembro] IS NOT NULL))
GO
ALTER TABLE [dbo].[CompletarDatos] CHECK CONSTRAINT [CK_CompletarDatos_Bautismo]
GO
ALTER TABLE [dbo].[ConfiguracionIglesiaColores]  WITH CHECK ADD  CONSTRAINT [CK_ConfiguracionIglesiaColores_NombreColor] CHECK  (([NombreColor]='Surface' OR [NombreColor]='Background' OR [NombreColor]='Success' OR [NombreColor]='Warning' OR [NombreColor]='Error' OR [NombreColor]='Info' OR [NombreColor]='Tertiary' OR [NombreColor]='Secondary' OR [NombreColor]='Primary'))
GO
ALTER TABLE [dbo].[ConfiguracionIglesiaColores] CHECK CONSTRAINT [CK_ConfiguracionIglesiaColores_NombreColor]
GO
ALTER TABLE [dbo].[ConfiguracionIglesiaColores]  WITH CHECK ADD  CONSTRAINT [CK_ConfiguracionIglesiaColores_ValorColor_Formato] CHECK  (([ValorColor] IS NULL OR [ValorColor] like '#%'))
GO
ALTER TABLE [dbo].[ConfiguracionIglesiaColores] CHECK CONSTRAINT [CK_ConfiguracionIglesiaColores_ValorColor_Formato]
GO
/****** Object:  StoredProcedure [dbo].[sp_auth_actualizar_ultimo_login]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_auth_actualizar_ultimo_login]
(    
    @DenominacionId INT,
    @UsuarioId INT,    
    -- Parámetros de salida
    @OutUsuarioId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Validaciones básicas
        IF @DenominacionId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La Denominación es obligatoria.';
            SET @UsuarioId = NULL;
            RETURN;
        END                
        
        -- Insertar registro
        UPDATE Usuarios
        SET UltimoLogin = GETDATE()
        WHERE DenominacionId = @DenominacionId AND UsuarioId = @UsuarioId
        
        SET @OutUsuarioId = @UsuarioId;

        -- Respuesta exitosa
        SET @Resultado = 'OK';
        SET @Mensaje = 'Ultimo Login actualizado correctamente.';

    END TRY
    BEGIN CATCH

        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
        SET @UsuarioId = NULL;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_auth_crear_refresh_token]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_auth_crear_refresh_token]
(
    @DenominacionId INT,
    @UsuarioId INT,
    @IglesiaId INT,
    @TokenHash NVARCHAR(128),
    @UserAgent NVARCHAR(256),
    @Ip NVARCHAR(45),
    -- Parámetros de salida
    @OutRefreshTokenId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Validaciones básicas
        IF @DenominacionId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La Denominación es obligatoria.';
            SET @OutRefreshTokenId = NULL;
            RETURN;
        END                

        -- Insertar registro
        INSERT INTO TokensRefresh
        (            
            DenominacionId,
            UsuarioId,
            IglesiaId,
            TokenHash,
            ExpiraEn,
            ReemplazadoPor,
            UserAgent,
            Ip,
            FechaCreacion
        )
        VALUES
        (
            @DenominacionId,
            @UsuarioId,
            @IglesiaId,
            @TokenHash,
            DATEADD(MINUTE, 150, GETDATE()),            
            @UsuarioId,
            @UserAgent,
            @Ip,
            GETDATE()
        );        

        -- Obtener IDENTITY generado
        SET @OutRefreshTokenId = SCOPE_IDENTITY();

        -- Respuesta exitosa
        SET @Resultado = 'OK';
        SET @Mensaje = 'RefreshToken creada correctamente.';

    END TRY
    BEGIN CATCH

        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
        SET @OutRefreshTokenId = NULL;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_auth_obtener_refresh_token]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_auth_obtener_refresh_token]
    @DenominacionId    INT,
	@TokenHash            NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
        
    SELECT  
        RefreshTokenId
        ,DenominacionId
        ,UsuarioId
        ,IglesiaId
        ,TokenHash
        ,ExpiraEn
        ,RevocadoEn
        ,ReemplazadoPor
        ,UserAgent
        ,Ip
        ,FechaCreacion
        FROM TokensRefresh
     WHERE TokenHash = @TokenHash AND DenominacionId = @DenominacionId
    
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_auth_obtener_registro_por_id]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_auth_obtener_usuario_por_correo 1, 'calyjuan@gmail'
CREATE PROCEDURE [dbo].[sp_auth_obtener_registro_por_id]
    @DenominacionId    INT,
	@RegistroId        INT,
	@IglesiaId		   INT
AS
BEGIN
	SELECT 
		RegistroId
		,DenominacionId
		,IglesiaId
		,Nombres
		,Apellidos
		,ParametroIdTipoDocumento
		,Documento
		,PaisId
		,DepartamentoId
		,CiudadId
		,CorregimientoId
		,Direccion
		,Correo
		,Telefono
		,ParametroIdSexo
	FROM 
	Registro 
	WHERE 
	DenominacionId = @DenominacionId AND RegistroId = @RegistroId AND IglesiaId = @IglesiaId
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_auth_obtener_usuario_por_correo]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_auth_obtener_usuario_por_correo]
    @DenominacionId    INT,
	@Correo            NVARCHAR(150)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @RegistroId INT
    
    SELECT  
        UsuarioId
        ,U.DenominacionId    
        ,U.RegistroId
        ,D.Nombre AS Denominacion
        ,U.Correo            
        ,U.PasswordHash
        ,U.EmailVerificado
        ,U.Bloqueado
        ,U.FechaCreacion
        ,U.UltimoLogin
        ,U.SecurityStamp
        ,U.RolId FROM Usuarios U 
     INNER JOIN Denominaciones D ON U.DenominacionId = D.DenominacionId
     WHERE U.Correo = @Correo AND D.DenominacionId = @DenominacionId
    
    SELECT  
        @RegistroId = U.RegistroId        
    FROM Usuarios U 
     INNER JOIN Denominaciones D ON U.DenominacionId = D.DenominacionId
     WHERE U.Correo = @Correo AND D.DenominacionId = @DenominacionId     

    -------------------------------------------------------------------
    -- 2) Información del perfil del usuario
    -------------------------------------------------------------------
    SELECT
            r.RegistroId
            ,r.DenominacionId
            ,r.IglesiaId
            ,r.Nombres
            ,r.Apellidos
            ,r.ParametroIdTipoDocumento
            ,r.Documento
            ,r.PaisId
            ,r.DepartamentoId
            ,r.CiudadId
            ,r.CorregimientoId
            ,r.Direccion
            ,r.Correo
            ,r.Telefono
            ,r.ParametroIdSexo
		FROM Registro as r        
        WHERE r.RegistroId = @RegistroId

        SELECT 
            r.RolId            
            ,r.Nombre
            ,r.Codigo            
        FROM 
        Roles as r
        INNER JOIN UsuarioRoles ur ON ur.RolId = r.RolId
        INNER JOIN Usuarios u ON u.UsuarioId = ur.UsuarioId
        WHERE u.RegistroId = @RegistroId and r.Activo = 1
        
        SELECT 
            m.MenuId
            ,m.Descripcion
            ,m.IdGrupo
            ,m.Tipo      
            ,m.Url
            ,m.Imagen        
        FROM Usuarios u
        INNER JOIN Roles r
	        ON u.RolId = r.RolId
        INNER JOIN Menu_rol rm
	        ON r.RolId = rm.RolId
        INNER JOIN Menu m
	        ON rm.MenuId = m.MenuId
        WHERE u.RegistroId = @RegistroId
        AND m.Estado = 1
        AND rm.Estado = 1
        
        SELECT ui.UsuarioIglesiaId
            ,ui.DenominacionId
            ,ui.UsuarioId
            ,ui.IglesiaId
            ,ui.Estado
            ,ui.EsAdministrador
            ,ui.FechaCreacion 
        FROM UsuariosIglesias ui
        INNER JOIN Usuarios u ON ui.UsuarioId = u.UsuarioId
        WHERE u.RegistroId = @RegistroId
        
        
END;

GO
/****** Object:  StoredProcedure [dbo].[sp_auth_revocar_refresh_token]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_auth_revocar_refresh_token]
(

    @DenominacionId INT,    
    @RefreshTokenId INT,
    @ReemplazadoPor INT,

    -- Parámetros de salida
    @OutRefreshTokenId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Validaciones básicas
        IF @DenominacionId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La Denominación es obligatoria.';
            SET @OutRefreshTokenId = NULL;
            RETURN;
        END

        

        -- Obtener IDENTITY generado
        SET @OutRefreshTokenId = @RefreshTokenId;

        -- Respuesta exitosa
        SET @Resultado = 'OK';
        SET @Mensaje = 'Token revocado correctamente.';

    END TRY
    BEGIN CATCH

        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
        SET @OutRefreshTokenId = NULL;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Get_EsAdminDenominacion]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec sp_Get_EsAdminDenominacion 1, 4
CREATE PROCEDURE [dbo].[sp_Get_EsAdminDenominacion]
	@DenominacionId INT,
	@UsuarioId INT
AS
SELECT 
EsAdministrador
FROM UsuariosIglesias WHERE DenominacionId = @DenominacionId AND UsuarioId = @UsuarioId
GO
/****** Object:  StoredProcedure [dbo].[sp_Usuarios_Actualizar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_Usuarios_Actualizar]
(
    -- Clave
    @UsuarioId           INT,

    -- Usuarios (NULL = no cambia)
    @Correo              NVARCHAR(256) = NULL,
    @PasswordHash        NVARCHAR(500) = NULL,
    @EmailVerificado     BIT = NULL,
    @Bloqueado           BIT = NULL,
    @UltimoLogin         DATETIME2 = NULL,
    @SecurityStamp       NVARCHAR(200) = NULL,
    @RolId               INT = NULL,

    -- UsuariosPerfil (NULL = no cambia)
    @TipoDocumento       NVARCHAR(50) = NULL,
    @Documento           NVARCHAR(50) = NULL,
    @Nombres             NVARCHAR(150) = NULL,
    @Apellidos           NVARCHAR(150) = NULL,
    @FechaCumple         DATE = NULL,
    @Telefono            NVARCHAR(30) = NULL,
    @Genero              NVARCHAR(30) = NULL,
    @Direccion           NVARCHAR(250) = NULL,
    @Avatar              NVARCHAR(500) = NULL,
    @Estado              TINYINT = NULL,

    -- Salida
    @OutUsuarioId        INT OUTPUT,
    @Resultado           VARCHAR(20) OUTPUT,
    @Mensaje             NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        IF (@UsuarioId IS NULL)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'UsuarioId es obligatorio.';
            SET @OutUsuarioId = NULL;
            RETURN;
        END

        SET @OutUsuarioId = @UsuarioId;

        BEGIN TRAN;

        -- Validar existencia usuario
        IF NOT EXISTS (SELECT 1 FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK) WHERE UsuarioId = @UsuarioId)
        BEGIN
            ROLLBACK TRAN;
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'No existe el usuario con el UsuarioId indicado.';
            RETURN;
        END

        -- Normalizar correo si viene
        IF (@Correo IS NOT NULL)
            SET @Correo = LOWER(LTRIM(RTRIM(@Correo)));

        -- Validar duplicado de correo (si viene)
        IF (@Correo IS NOT NULL)
        BEGIN
            IF EXISTS (
                SELECT 1
                FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
                WHERE Correo = @Correo
                  AND UsuarioId <> @UsuarioId
            )
            BEGIN
                ROLLBACK TRAN;
                SET @Resultado = 'ERROR';
                SET @Mensaje = 'Ya existe otro usuario registrado con ese correo.';
                RETURN;
            END
        END

        -- ---------------------- UPDATE Usuarios ----------------------
        UPDATE u
        SET
            u.Correo          = COALESCE(@Correo, u.Correo),
            u.PasswordHash    = COALESCE(@PasswordHash, u.PasswordHash),
            u.EmailVerificado = COALESCE(@EmailVerificado, u.EmailVerificado),
            u.Bloqueado       = COALESCE(@Bloqueado, u.Bloqueado),
            u.UltimoLogin     = COALESCE(@UltimoLogin, u.UltimoLogin),
            u.SecurityStamp   = COALESCE(@SecurityStamp, u.SecurityStamp),
            u.RolId           = COALESCE(@RolId, u.RolId)
        FROM dbo.Usuarios u
        WHERE u.UsuarioId = @UsuarioId;

        -- ---------------------- UPSERT UsuariosPerfil ----------------------
        IF EXISTS (SELECT 1 FROM dbo.UsuariosPerfil WITH (UPDLOCK, HOLDLOCK) WHERE UsuarioId = @UsuarioId)
        BEGIN
            UPDATE p
            SET
                p.TipoDocumento       = COALESCE(@TipoDocumento, p.TipoDocumento),
                p.Documento           = COALESCE(@Documento, p.Documento),
                p.Nombres             = COALESCE(@Nombres, p.Nombres),
                p.Apellidos           = COALESCE(@Apellidos, p.Apellidos),
                p.FechaCumple         = COALESCE(@FechaCumple, p.FechaCumple),
                p.Telefono            = COALESCE(@Telefono, p.Telefono),
                p.Genero              = COALESCE(@Genero, p.Genero),
                p.Direccion           = COALESCE(@Direccion, p.Direccion),
                p.Avatar              = COALESCE(@Avatar, p.Avatar),
                p.Estado              = COALESCE(@Estado, p.Estado),
                p.FechaActualizacion  = SYSUTCDATETIME()
            FROM dbo.UsuariosPerfil p
            WHERE p.UsuarioId = @UsuarioId;
        END
        ELSE
        BEGIN
            INSERT INTO dbo.UsuariosPerfil
            (
                UsuarioId,
                TipoDocumento,
                Documento,
                Nombres,
                Apellidos,
                FechaCumple,
                Telefono,
                Genero,
                Direccion,
                Avatar,
                Estado,
                FechaActualizacion
            )
            VALUES
            (
                @UsuarioId,
                @TipoDocumento,
                @Documento,
                @Nombres,
                @Apellidos,
                @FechaCumple,
                @Telefono,
                @Genero,
                @Direccion,
                @Avatar,
                ISNULL(@Estado, 1),
                SYSUTCDATETIME()
            );
        END

        COMMIT TRAN;

        SET @Resultado = 'OK';
        SET @Mensaje = 'Usuario y perfil actualizados correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRAN;

        SET @Resultado = 'ERROR';
        SET @Mensaje = CONCAT(
            'Error al actualizar usuario. ',
            'Msg: ', ERROR_MESSAGE(),
            ' | Line: ', ERROR_LINE(),
            ' | Proc: ', ISNULL(ERROR_PROCEDURE(), 'N/A')
        );
        SET @OutUsuarioId = @UsuarioId;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudad_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Ciudad_Listar]	
	@DepartamentoId INT
AS
SELECT CiudadId
,DepartamentoId
,CiudadNombre
,Descripcion
,Estado
,FechaCreacion FROM Ciudad where DepartamentoId = @DepartamentoId
GO
/****** Object:  StoredProcedure [dbo].[usp_Ciudad_Obtener]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Ciudad_Obtener]
	@CiudadId INT
AS
	SELECT 
		CiudadId
		DepartamentoId,
		CiudadNombre,
		Descripcion,
		Estado,
		FechaCreacion
	FROM Ciudad
	WHERE CiudadId = @CiudadId
GO
/****** Object:  StoredProcedure [dbo].[usp_Clase_Actualizar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Clase_Actualizar]
(
    @ClaseId INT,
    @DenominacionId INT,
    @Descripcion NVARCHAR(255),
    @Estado BIT,

    -- Parámetros de salida
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Validaciones básicas
        IF @ClaseId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'El ClaseId es obligatorio.';
            RETURN;
        END

        IF @Descripcion IS NULL OR LTRIM(RTRIM(@Descripcion)) = ''
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La descripción es obligatoria.';
            RETURN;
        END

        -- Validar existencia
        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Clase
            WHERE ClaseId = @ClaseId
        )
        BEGIN
            SET @Resultado = 'NOEXISTE';
            SET @Mensaje = 'La clase no existe.';
            RETURN;
        END

        -- Validar duplicado por descripción dentro de la misma tabla excluyendo el mismo registro
        IF EXISTS (
            SELECT 1
            FROM dbo.Clase
            WHERE Descripcion = @Descripcion
              AND ClaseId <> @ClaseId
        )
        BEGIN
            SET @Resultado = 'EXISTE';
            SET @Mensaje = 'Ya existe una clase con esa descripción.';
            RETURN;
        END

        -- Actualización
        UPDATE dbo.Clase
        SET
            Descripcion = @Descripcion,
            Estado = @Estado
        WHERE ClaseId = @ClaseId;

        SET @Resultado = 'OK';
        SET @Mensaje = 'Clase actualizada correctamente.';

    END TRY
    BEGIN CATCH
        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Clase_Eliminar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Clase_Eliminar]
(
    @ClaseId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT OFF;

    BEGIN TRY

        IF @ClaseId IS NULL
        BEGIN
            THROW 50001, 'El ClaseId es obligatorio.', 1;
        END;

        IF @DenominacionId IS NULL
        BEGIN
            THROW 50002, 'El DenominacionId es obligatorio.', 1;
        END;

        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Clase
            WHERE ClaseId = @ClaseId
              AND DenominacionId = @DenominacionId
        )
        BEGIN
            THROW 50003, 'La clase no existe para la denominación indicada.', 1;
        END;

        IF EXISTS (
            SELECT 1
            FROM dbo.Parametro
            WHERE ClaseId = @ClaseId
              AND DenominacionId = @DenominacionId
        )
        BEGIN
            THROW 50004, 'No se puede eliminar la clase porque tiene parámetros asociados.', 1;
        END;

        DELETE FROM dbo.Clase
        WHERE ClaseId = @ClaseId
          AND DenominacionId = @DenominacionId;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Clase_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Clase_Insertar]
(
    @DenominacionId INT,
    @Descripcion NVARCHAR(255),
    @Estado BIT,

    -- Parámetros de salida
    @OutClaseId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Validaciones básicas
        IF @DenominacionId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La Denominación es obligatoria.';
            SET @OutClaseId = NULL;
            RETURN;
        END

        IF @Descripcion IS NULL OR LTRIM(RTRIM(@Descripcion)) = ''
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La descripción es obligatoria.';
            SET @OutClaseId = NULL;
            RETURN;
        END        

        -- Validar duplicados
        IF EXISTS (
            SELECT 1 
            FROM dbo.Clase 
            WHERE DenominacionId = @DenominacionId 
              AND Descripcion = @Descripcion
        )
        BEGIN
            SET @Resultado = 'EXISTE';
            SET @Mensaje = 'Ya existe una clase con esa descripción para la denominación.';
            SET @OutClaseId = NULL;
            RETURN;
        END

        -- Insertar registro
        INSERT INTO dbo.Clase
        (
            DenominacionId,
            Descripcion,
            Estado,
            FechaCreacion
        )
        VALUES
        (
            @DenominacionId,
            @Descripcion,
            @Estado,
            GETDATE()
        );

        -- Obtener IDENTITY generado
        SET @OutClaseId = SCOPE_IDENTITY();

        -- Respuesta exitosa
        SET @Resultado = 'OK';
        SET @Mensaje = 'Clase creada correctamente.';

    END TRY
    BEGIN CATCH

        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
        SET @OutClaseId = NULL;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Clase_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Clase_Listar]
(
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Validación básica
        IF @DenominacionId IS NULL
        BEGIN
            -- Retorna vacío si no envían denominación
            SELECT 
                CAST(NULL AS INT) AS ClaseId,
                CAST(NULL AS INT) AS DenominacionId,
                CAST(NULL AS NVARCHAR(255)) AS Descripcion,
                CAST(NULL AS BIT) AS Estado
            WHERE 1 = 0; -- evita registros
            RETURN;
        END

        -- Consulta principal
        SELECT 
            ClaseId,
            DenominacionId,
            Descripcion,
            Estado
        FROM dbo.Clase
        WHERE DenominacionId = @DenominacionId
        ORDER BY Descripcion ASC;

    END TRY
    BEGIN CATCH

        -- En caso de error devuelve vacío (para no romper Dapper)
        SELECT 
            CAST(NULL AS INT) AS ClaseId,
            CAST(NULL AS INT) AS DenominacionId,
            CAST(NULL AS NVARCHAR(255)) AS Descripcion,
            CAST(NULL AS BIT) AS Estado
        WHERE 1 = 0;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Clase_Obtener]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Clase_Obtener]
    @ClaseId INT
AS
SELECT ClaseId
      ,DenominacionId
      ,Descripcion
      ,Estado
      ,FechaCreacion
  FROM Clase WHERE ClaseId = @ClaseId
GO
/****** Object:  StoredProcedure [dbo].[usp_CompletarDatos_Actualizar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_CompletarDatos_Actualizar]
(
    @CompletarDatosId INT,
    @RegistroId INT,
    @PaisResidenciaId INT = NULL,
    @DepartamentoResidenciaId INT = NULL,
    @CiudadResidenciaId INT = NULL,
    @FechaNacimiento DATE = NULL,
    @ParametroIdEstadoCivil INT = NULL,
    @ParametroIdEstudiosAcademicos INT = NULL,
    @ParametroIdEstudiosTeologicos INT = NULL,
    @ParametroIdSituacionLaboral INT = NULL,
    @ParametroIdTipoMiembro INT = NULL,
    @ParametroIdTipoPoblacion INT = NULL,
    @FechaBautismo DATE = NULL,
    @PersonaContacto NVARCHAR(200) = NULL,
    @TelefonoContacto NVARCHAR(50) = NULL,
    @IglesiaId INT = NULL,
    @DenominacionId INT = NULL,
    @IglesiaBautismo NVARCHAR(200) = NULL,
    @PastorBautismo NVARCHAR(200) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        UPDATE CompletarDatos
        SET
            RegistroId = @RegistroId,
            PaisResidenciaId = @PaisResidenciaId,
            DepartamentoResidenciaId = @DepartamentoResidenciaId,
            CiudadResidenciaId = @CiudadResidenciaId,
            FechaNacimiento = @FechaNacimiento,
            ParametroIdEstadoCivil = @ParametroIdEstadoCivil,
            ParametroIdEstudiosAcademicos = @ParametroIdEstudiosAcademicos,
            ParametroIdEstudiosTeologicos = @ParametroIdEstudiosTeologicos,
            ParametroIdSituacionLaboral = @ParametroIdSituacionLaboral,
            ParametroIdTipoMiembro = @ParametroIdTipoMiembro,
            ParametroIdTipoPoblacion = @ParametroIdTipoPoblacion,
            FechaBautismo = @FechaBautismo,
            PersonaContacto = @PersonaContacto,
            TelefonoContacto = @TelefonoContacto,
            FechaModificacion = GETUTCDATE(),
            IglesiaId = @IglesiaId,
            DenominacionId = @DenominacionId,
            IglesiaBautismo = @IglesiaBautismo,
            PastorBautismo = @PastorBautismo
        WHERE CompletarDatosId = @CompletarDatosId;

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_CompletarDatos_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_CompletarDatos_Insertar]
(
    @RegistroId INT,
    @PaisResidenciaId INT = NULL,
    @DepartamentoResidenciaId INT = NULL,
    @CiudadResidenciaId INT = NULL,
    @FechaNacimiento DATE = NULL,
    @ParametroIdEstadoCivil INT = NULL,
    @ParametroIdEstudiosAcademicos INT = NULL,
    @ParametroIdEstudiosTeologicos INT = NULL,
    @ParametroIdSituacionLaboral INT = NULL,
    @ParametroIdTipoMiembro INT = NULL,
    @ParametroIdTipoPoblacion INT = NULL,
    @FechaBautismo DATE = NULL,
    @PersonaContacto NVARCHAR(200) = NULL,
    @TelefonoContacto NVARCHAR(50) = NULL,
    @IglesiaId INT = NULL,
    @DenominacionId INT = NULL,
    @IglesiaBautismo NVARCHAR(200) = NULL,
    @PastorBautismo NVARCHAR(200) = NULL,
    @OutCompletarDatosId INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRAN;

        INSERT INTO CompletarDatos
        (
            RegistroId,
            PaisResidenciaId,
            DepartamentoResidenciaId,
            CiudadResidenciaId,
            FechaNacimiento,
            ParametroIdEstadoCivil,
            ParametroIdEstudiosAcademicos,
            ParametroIdEstudiosTeologicos,
            ParametroIdSituacionLaboral,
            ParametroIdTipoMiembro,
            ParametroIdTipoPoblacion,
            FechaBautismo,
            PersonaContacto,
            TelefonoContacto,
            FechaCreacion,
            IglesiaId,
            DenominacionId,
            IglesiaBautismo,
            PastorBautismo
        )
        VALUES
        (
            @RegistroId,
            @PaisResidenciaId,
            @DepartamentoResidenciaId,
            @CiudadResidenciaId,
            @FechaNacimiento,
            @ParametroIdEstadoCivil,
            @ParametroIdEstudiosAcademicos,
            @ParametroIdEstudiosTeologicos,
            @ParametroIdSituacionLaboral,
            @ParametroIdTipoMiembro,
            @ParametroIdTipoPoblacion,
            @FechaBautismo,
            @PersonaContacto,
            @TelefonoContacto,
            GETUTCDATE(),
            @IglesiaId,
            @DenominacionId,
            @IglesiaBautismo,
            @PastorBautismo
        );

        SET @OutCompletarDatosId = SCOPE_IDENTITY();

        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK;

        THROW;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_CompletarDatos_ObtenerPorRegistro]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE   PROCEDURE [dbo].[usp_CompletarDatos_ObtenerPorRegistro]
    @RegistroId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (1)
        *
    FROM CompletarDatos
    WHERE RegistroId = @RegistroId
    ORDER BY CompletarDatosId DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Corregimiento_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Corregimiento_Listar]
	@CiudadId INT
AS
SELECT 
	CorregimientoId,
	CorregimientoNombre,
	Descripcion,
	Estado,
	FechaCreacion
FROM Corregimiento where CiudadId = @CiudadId
GO
/****** Object:  StoredProcedure [dbo].[usp_Denominacion_Obtener]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC usp_Denominacion_Obtener 1
CREATE PROCEDURE [dbo].[usp_Denominacion_Obtener]
	@DenominacionId INT
AS

DECLARE @IglesiaId INT;

SELECT 
	DenominacionId
	,Nombre
	,Slug
	,Activa
	,IglesiaPrincipalId
	,FechaCreacion
FROM Denominaciones
WHERE DenominacionId = @DenominacionId

SELECT 	
	@IglesiaId = IglesiaPrincipalId	
FROM Denominaciones
WHERE DenominacionId = @DenominacionId

SELECT 
IglesiaId
,DenominacionId
,Nombre
,Slug
,PersoneriaJuridica
,PaisId
,DepartamentoId
,CiudadId
,CorregimientoId
,Direccion
,PastorResponsableRegistroId
,Telefono
,Correo
,Slogan
,Activa
,FechaCreacion FROM Iglesias 
WHERE IglesiaId = @IglesiaId AND DenominacionId = @DenominacionId
GO
/****** Object:  StoredProcedure [dbo].[usp_Denominaciones_ObtenerPorDominio]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROCEDURE [dbo].[usp_Denominaciones_ObtenerPorDominio]
    @Dominio NVARCHAR(250)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @DominioNormalizado NVARCHAR(250) =
        LOWER(
            CASE
                WHEN RIGHT(LTRIM(RTRIM(@Dominio)), 1) = '.'
                    THEN LEFT(LTRIM(RTRIM(@Dominio)), LEN(LTRIM(RTRIM(@Dominio))) - 1)
                ELSE LTRIM(RTRIM(@Dominio))
            END
        );

    SELECT TOP (1)
        dd.DenominacionId,
        dd.Dominio,
        dd.Subdominio,
        d.Nombre AS NombreDenominacion
    FROM dbo.DenominacionesDominios dd
    INNER JOIN dbo.Denominaciones d
        ON d.DenominacionId = dd.DenominacionId
    WHERE dd.Estado = 1 AND
      dd.Subdominio = @DominioNormalizado
    ORDER BY dd.DenominacionDominioId;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Departamento_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Departamento_Listar]
	@PaisId INT
AS
SELECT 
DepartamentoId
,PaisId
,DepartamentoNombre
,Descripcion
,Estado
,FechaCreacion FROM Departamento WHERE PaisId = @PaisId
GO
/****** Object:  StoredProcedure [dbo].[usp_Departamento_Obtener]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Departamento_Obtener]
(
    @DepartamentoId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
       
        -- Consulta principal
        SELECT TOP (1000) DepartamentoId
            ,PaisId
            ,Departamento
            ,Descripcion
            ,Estado
            ,FechaCreacion
        FROM Departamento
        WHERE DepartamentoId = @DepartamentoId
        ORDER BY Departamento ASC;

    END TRY
    BEGIN CATCH

        -- En caso de error devuelve vacío (para no romper Dapper)
        SELECT 
            CAST(NULL AS INT) AS DepartamentoId,
            CAST(NULL AS INT) AS PaisId,
            CAST(NULL AS NVARCHAR(255)) AS Descripcion,
            CAST(NULL AS NVARCHAR(255)) AS Descripcion,
            CAST(NULL AS BIT) AS Estado
        WHERE 1 = 0;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EstructuraOrganizacional_Actualizar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_EstructuraOrganizacional_Actualizar]
(
    @EstructuraOrganizacionalId INT,
    @DenominacionId INT,
    @Descripcion NVARCHAR(500),
    @GrupoEstructuraOrganizacionalId INT,
    @Responsable NVARCHAR(150),
    @Estado BIT,

    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY        
        IF ISNULL(LTRIM(RTRIM(@Descripcion)), '') = ''
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La descripción es obligatoria.';
            RETURN;
        END       

        IF NOT EXISTS
        (
            SELECT 1
            FROM dbo.EstructuraOrganizacional
            WHERE EstructuraOrganizacionalId = @EstructuraOrganizacionalId
        )
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'No existe el registro que desea actualizar.';
            RETURN;
        END

        UPDATE dbo.EstructuraOrganizacional
        SET            
            Descripcion = @Descripcion,
            Responsable = @Responsable,
            Estado = @Estado
        WHERE EstructuraOrganizacionalId = @EstructuraOrganizacionalId;

        SET @Resultado = 'OK';
        SET @Mensaje = 'Registro actualizado correctamente.';
    END TRY
    BEGIN CATCH
        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_EstructuraOrganizacional_Eliminar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_EstructuraOrganizacional_Eliminar]
(
    @EstructuraOrganizacionalId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validación
        IF @EstructuraOrganizacionalId IS NULL
           OR @EstructuraOrganizacionalId = '00000000-0000-0000-0000-000000000000'
        BEGIN
            SELECT 'ERROR|El Id es obligatorio.' AS Resultado;
            RETURN;
        END

        -- Validar existencia
        IF NOT EXISTS
        (
            SELECT 1
            FROM dbo.EstructuraOrganizacional
            WHERE EstructuraOrganizacionalId = @EstructuraOrganizacionalId
        )
        BEGIN
            SELECT 'ERROR|No existe el registro.' AS Resultado;
            RETURN;
        END

        -- 🔴 OPCIÓN 1: Eliminación física
        DELETE FROM dbo.EstructuraOrganizacional
        WHERE EstructuraOrganizacionalId = @EstructuraOrganizacionalId;

        SELECT 'OK|Registro eliminado correctamente.' AS Resultado;

        /*
        -- 🟡 OPCIÓN 2 (RECOMENDADA): Eliminación lógica
        UPDATE dbo.EstructuraOrganizacional
        SET Estado = 0
        WHERE EstructuraOrganizacionalId = @EstructuraOrganizacionalId;

        SELECT 'OK|Registro desactivado correctamente.' AS Resultado;
        */

    END TRY
    BEGIN CATCH
        SELECT 
            'ERROR|' + ERROR_MESSAGE() AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_EstructuraOrganizacional_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_EstructuraOrganizacional_Insertar]
(    
    @DenominacionId INT = NULL,
    @Descripcion NVARCHAR(500),
    @GrupoEstructuraOrganizacionalId INT = NULL,
    @Responsable NVARCHAR(500),
    @Estado BIT,

    @OutEstructuraOrganizacionalId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Orden INT;

    BEGIN TRY
        -- Validaciones básicas        

        IF ISNULL(LTRIM(RTRIM(@Descripcion)), '') = ''
        BEGIN
            SET @OutEstructuraOrganizacionalId = NULL;
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La descripción es obligatoria.';
            RETURN;
        END        

        -- Calcular el siguiente orden por DenominacionId
        SELECT @Orden = COUNT(1) + 1
        FROM dbo.EstructuraOrganizacional
        WHERE DenominacionId = @DenominacionId;

        -- Si no existe ninguno, COUNT será 0 y quedará en 1
        IF @Orden IS NULL OR @Orden <= 0
            SET @Orden = 1;

        INSERT INTO dbo.EstructuraOrganizacional
        (            
            DenominacionId,
            Descripcion,
            GrupoEstructuraOrganizacionalId,
            Orden,
            Responsable,
            Estado,
            FechaCreacion
        )
        VALUES
        (            
            @DenominacionId,
            @Descripcion,
            @GrupoEstructuraOrganizacionalId,
            @Orden,
            @Responsable,
            @Estado,
            GETDATE()
        );

        SET @OutEstructuraOrganizacionalId = SCOPE_IDENTITY();
        SET @Resultado = 'OK';
        SET @Mensaje = 'Registro insertado correctamente.';
    END TRY
    BEGIN CATCH
        SET @OutEstructuraOrganizacionalId = NULL;
        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_EstructuraOrganizacional_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [dbo].[usp_EstructuraOrganizacional_Listar] '5edae597-043b-4104-a1c4-911267e5c916'
CREATE PROCEDURE [dbo].[usp_EstructuraOrganizacional_Listar]
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        eo.EstructuraOrganizacionalId,
        eo.DenominacionId,
        d.Nombre AS Denominacion,        

        -- 🔹 Descripción propia
        eo.Descripcion,

        -- 🔥 Nueva columna: DescripcionPadre
        COALESCE(eoPadre.Descripcion, eo.Descripcion) AS DescripcionPadre,

        eo.GrupoEstructuraOrganizacionalId,
        eo.Orden,
        eo.Responsable,
        eo.Estado,
        eo.FechaCreacion
        
    FROM dbo.EstructuraOrganizacional eo

        INNER JOIN dbo.Denominaciones d
            ON eo.DenominacionId = d.DenominacionId

        -- 👇 Self Join para obtener el padre
        LEFT JOIN dbo.EstructuraOrganizacional eoPadre
            ON eo.GrupoEstructuraOrganizacionalId = eoPadre.EstructuraOrganizacionalId

    WHERE eo.DenominacionId = @DenominacionId

    ORDER BY eo.Orden;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_EstructuraOrganizacional_Obtener]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_EstructuraOrganizacional_Obtener]
    @EstructuraId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY        
        SELECT
            EstructuraOrganizacionalId,
            DenominacionId,
            Descripcion,
            GrupoEstructuraOrganizacionalId,
            Orden,
            Responsable,
            Estado,
            FechaCreacion
        FROM dbo.EstructuraOrganizacional
        WHERE EstructuraOrganizacionalId = @EstructuraId AND DenominacionId = @DenominacionId;
    END TRY
    BEGIN CATCH
        DECLARE @MensajeError NVARCHAR(4000) = ERROR_MESSAGE();
        DECLARE @Severidad INT = ERROR_SEVERITY();
        DECLARE @Estado INT = ERROR_STATE();

        RAISERROR(@MensajeError, @Severidad, @Estado);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Iglesias_Actualizar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Iglesias_Actualizar]
(
    @IglesiaId                  INT,
    @DenominacionId             INT,
    @Nombre                     NVARCHAR(255),
    @Slug                       NVARCHAR(255),
    @PersoneriaJuridica         NVARCHAR(255),
    @PaisId            INT,
    @DepartamentoId    INT,
    @CiudadId          INT,
    @CorregimientoId   INT,
    @Direccion            NVARCHAR(255),
    @Telefono             NVARCHAR(50),
    @Correo               NVARCHAR(255),
    @Slogan               NVARCHAR(255),
    @PastorResponsableRegistroId INT,
    @Activa               BIT,    

    -- Salidas
    @Resultado            NVARCHAR(20) OUTPUT,
    @Mensaje              NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validaciones básicas
        IF (@IglesiaId IS NULL)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'IglesiaId es requerido.';
            RETURN;
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Iglesias WHERE IglesiaId = @IglesiaId)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La iglesia no existe.';
            RETURN;
        END

        IF (@DenominacionId IS NULL)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'DenominacionId es requerido.';
            RETURN;
        END

        IF (NULLIF(LTRIM(RTRIM(@Nombre)), '') IS NULL)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'Nombre es requerido.';
            RETURN;
        END

        IF (NULLIF(LTRIM(RTRIM(@Slug)), '') IS NULL)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'Slug es requerido.';
            RETURN;
        END        

        -- Update
        UPDATE dbo.Iglesias
        SET
            DenominacionId          = @DenominacionId,
            Nombre                  = @Nombre,
            Slug                    = @Slug,
            PersoneriaJuridica      = @PersoneriaJuridica,
            PaisId         = @PaisId,
            DepartamentoId = @DepartamentoId,
            CiudadId = @CiudadId,
            CorregimientoId = @CorregimientoId,
            Direccion           = @Direccion,
            Telefono            = @Telefono,
            Correo              = @Correo,
            Slogan              = @Slogan,
            PastorResponsableRegistroId = @PastorResponsableRegistroId,
            Activa              = @Activa
        WHERE IglesiaId = @IglesiaId;

        SET @Resultado = 'OK';
        SET @Mensaje = 'Iglesia actualizada correctamente.';
    END TRY
    BEGIN CATCH
        SET @Resultado = 'ERROR';
        SET @Mensaje = CONCAT(
            'Error en usp_Iglesias_Actualizar: ',
            ERROR_MESSAGE(),
            ' (Linea ',
            ERROR_LINE(),
            ')'
        );
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Iglesias_Eliminar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Iglesias_Eliminar]
(
    @IglesiaId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF (@IglesiaId IS NULL OR @IglesiaId = '00000000-0000-0000-0000-000000000000')
        BEGIN
            SELECT 'ERROR|IglesiaId es requerido.' AS Resultado;
            RETURN;
        END

        IF NOT EXISTS (SELECT 1 FROM dbo.Iglesias WHERE IglesiaId = @IglesiaId)
        BEGIN
            SELECT 'ERROR|La iglesia no existe.' AS Resultado;
            RETURN;
        END

        DELETE FROM dbo.Iglesias
        WHERE IglesiaId = @IglesiaId;

        SELECT 'OK|Iglesia eliminada correctamente.' AS Resultado;
    END TRY
    BEGIN CATCH
        SELECT CONCAT(
            'ERROR|Error en usp_Iglesias_Eliminar: ',
            ERROR_MESSAGE(),
            ' (Linea ',
            ERROR_LINE(),
            ')'
        ) AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Iglesias_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Iglesias_Insertar]
(    
    @DenominacionId       INT,
    @Nombre               NVARCHAR(255),
    @Slug                 NVARCHAR(255),
    @PersoneriaJuridica   NVARCHAR(255),
    
    @PaisId               INT,
    @DepartamentoId       INT,
    @CiudadId             INT,
    @CorregimientoId      INT,

    @Direccion            NVARCHAR(255),
    @Telefono             NVARCHAR(50),
    @Correo               NVARCHAR(255),
    @Slogan               NVARCHAR(255),
    @PastorResponsableRegistroId INT,
    @Activa               BIT, 

    -- Salidas
    @OutIglesiaId         INT OUTPUT,
    @Resultado            NVARCHAR(20) OUTPUT,
    @Mensaje              NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;       

    BEGIN TRY
        -- Validaciones básicas        
        IF (NULLIF(LTRIM(RTRIM(@Nombre)), '') IS NULL)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'Nombre es requerido.';
            SET @OutIglesiaId = NULL;
            RETURN;
        END

        IF (NULLIF(LTRIM(RTRIM(@Slug)), '') IS NULL)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'Slug es requerido.';
            SET @OutIglesiaId = NULL;
            RETURN;
        END        

        -- Insert
        INSERT INTO dbo.Iglesias
        (
            DenominacionId,
            Nombre,
            Slug,
            PersoneriaJuridica,
            Direccion,
            PaisId,
            DepartamentoId,
            CiudadId,
            CorregimientoId,
            Telefono,
            Correo,
            Slogan,
            PastorResponsableRegistroId,
            Activa,
            FechaCreacion
        )
        VALUES
        (            
            @DenominacionId,
            @Nombre,
            @Slug,
            @PersoneriaJuridica,
            @Direccion,
            @PaisId,
            @DepartamentoId,
            @CiudadId,
            @CorregimientoId,
            @Telefono,
            @Correo,
            @Slogan,
            @PastorResponsableRegistroId,
            @Activa,
            getdate()
        );

        -- OK
        SET @OutIglesiaId = SCOPE_IDENTITY();
        SET @Resultado = 'OK';
        SET @Mensaje = 'Iglesia creada correctamente.';
    END TRY
    BEGIN CATCH
        SET @OutIglesiaId = NULL;
        SET @Resultado = 'ERROR';
        SET @Mensaje = CONCAT(
            'Error en usp_Iglesias_Insertar: ',
            ERROR_MESSAGE(),
            ' (Linea ',
            ERROR_LINE(),
            ')'
        );
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Iglesias_Insertar_COPIA]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Iglesias_Insertar_COPIA]
(
    @IglesiaId            INT,
    @DenominacionId       INT,
    @Nombre               NVARCHAR(255),
    @Slug                 NVARCHAR(255),
    @PersoneriaJuridica   NVARCHAR(255),
    
    @PaisId               INT,
    @DepartamentoId       INT,
    @CiudadId             INT,
    @CorregimientoId      INT,

    @Direccion            NVARCHAR(255),
    @Telefono             NVARCHAR(50),
    @Correo               NVARCHAR(255),
    @Slogan               NVARCHAR(255),
    @Activa               BIT, 

    -- Salidas
    @OutIglesiaId         INT OUTPUT,
    @Resultado            NVARCHAR(20) OUTPUT,
    @Mensaje              NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validaciones básicas        
        IF (NULLIF(LTRIM(RTRIM(@Nombre)), '') IS NULL)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'Nombre es requerido.';
            SET @OutIglesiaId = NULL;
            RETURN;
        END

        IF (NULLIF(LTRIM(RTRIM(@Slug)), '') IS NULL)
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'Slug es requerido.';
            SET @OutIglesiaId = NULL;
            RETURN;
        END

        -- Slug ÚNICO GLOBAL
        IF EXISTS (
            SELECT 1
            FROM dbo.Iglesias
            WHERE Slug = @Slug
        )
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'Ya existe una iglesia con el mismo Slug.';
            SET @OutIglesiaId = NULL;
            RETURN;
        END

        -- Insert
        INSERT INTO dbo.Iglesias
        (
            IglesiaId,
            DenominacionId,
            Nombre,
            Slug,
            PersoneriaJuridica,
            Direccion,
            PaisId,
            DepartamentoId,
            CiudadId,
            CorregimientoId,
            Telefono,
            Correo,
            Slogan,
            Activa,
            FechaCreacion
        )
        VALUES
        (
            @IglesiaId,
            @DenominacionId,
            @Nombre,
            @Slug,
            @PersoneriaJuridica,
            @Direccion,
            @PaisId,
            @DepartamentoId,
            @CiudadId,
            @CorregimientoId,
            @Telefono,
            @Correo,
            @Slogan,
            @Activa,
            getdate()
        );

        -- OK
        SET @OutIglesiaId = @IglesiaId;
        SET @Resultado = 'OK';
        SET @Mensaje = 'Iglesia creada correctamente.';
    END TRY
    BEGIN CATCH
        SET @OutIglesiaId = NULL;
        SET @Resultado = 'ERROR';
        SET @Mensaje = CONCAT(
            'Error en usp_Iglesias_Insertar: ',
            ERROR_MESSAGE(),
            ' (Linea ',
            ERROR_LINE(),
            ')'
        );
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Iglesias_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [dbo].[usp_Iglesias_Listar] 1

CREATE PROCEDURE [dbo].[usp_Iglesias_Listar]
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        i.IglesiaId,
        i.DenominacionId,
        i.Nombre,
        i.Slug,
        i.PersoneriaJuridica,
        i.PastorResponsableRegistroId,

        LTRIM(RTRIM(
            ISNULL(r.Nombres, '') + ' ' + ISNULL(r.Apellidos, '')
        )) AS PastorResponsable,

        i.PaisId,
        p.PaisNombre,

        i.DepartamentoId,
        d.DepartamentoNombre,

        i.CiudadId,
        c.CiudadNombre,

        i.CorregimientoId,
        co.CorregimientoNombre,

        CASE
            WHEN i.CorregimientoId IS NOT NULL 
                 AND co.CorregimientoNombre IS NOT NULL
                THEN co.CorregimientoNombre
            ELSE c.CiudadNombre
        END AS CiudadCorregimiento,

        i.Direccion,
        i.Telefono,
        i.Correo,
        i.Slogan,
        i.Activa,
        i.FechaCreacion,

        CASE 
            WHEN EXISTS (
                SELECT 1
                FROM dbo.Denominaciones de
                WHERE de.IglesiaPrincipalId = i.IglesiaId
                  AND de.DenominacionId = i.DenominacionId
            )
            THEN CAST(1 AS BIT)
            ELSE CAST(0 AS BIT)
        END AS EsDenominacion

    FROM dbo.Iglesias i

    INNER JOIN dbo.Pais p
        ON p.PaisId = i.PaisId

    INNER JOIN dbo.Departamento d
        ON d.DepartamentoId = i.DepartamentoId

    INNER JOIN dbo.Ciudad c
        ON c.CiudadId = i.CiudadId

    LEFT JOIN dbo.Corregimiento co
        ON co.CorregimientoId = i.CorregimientoId

    LEFT JOIN dbo.Usuarios u
        ON u.UsuarioId = i.PastorResponsableRegistroId

    LEFT JOIN dbo.Registro r
        ON r.RegistroId = u.RegistroId

    WHERE i.DenominacionId = @DenominacionId

    ORDER BY i.Nombre ASC;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Iglesias_Obtener]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Iglesias_Obtener]
    @IglesiaId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        IglesiaId,
        DenominacionId,
        Nombre,
        Slug,
        PersoneriaJuridica,
        PaisId,
        DepartamentoId,
        CiudadId,
        CorregimientoId,
        Direccion,
        Telefono,
        Correo,
        Slogan,
        Activa,
        FechaCreacion
    FROM dbo.Iglesias WHERE DenominacionId = @DenominacionId AND IglesiaId = @IglesiaId
    ORDER BY Nombre ASC;
END;

GO
/****** Object:  StoredProcedure [dbo].[usp_IglesiasEstructuras_Eliminar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_IglesiasEstructuras_Eliminar]
(
    @IglesiaEstructurasId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY                
        -- 🔴 OPCIÓN 1: Eliminación física
        DELETE FROM IglesiasEstructuras
        WHERE IglesiaEstructurasId = @IglesiaEstructurasId AND DenominacionId = @DenominacionId;

        SELECT 'OK' AS Resultado;

    END TRY
    BEGIN CATCH
        SELECT 
            'ERROR|' + ERROR_MESSAGE() AS Resultado;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_IglesiasEstructuras_EliminarPorIglesia]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_IglesiasEstructuras_EliminarPorIglesia]
(
    @IglesiaId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM IglesiasEstructuras
    WHERE IglesiaId = @IglesiaId
      AND DenominacionId = @DenominacionId;

    SELECT @@ROWCOUNT AS RowsAffected;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_IglesiasEstructuras_GuardarPorIglesia]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_IglesiasEstructuras_GuardarPorIglesia]
(    
    @DenominacionId       INT,
    @IglesiaId            INT,
    @EstructuraId         INT,    
    -- Salidas
    @OutIglesiaEstructurasId INT OUTPUT,
    @Resultado            NVARCHAR(20) OUTPUT,
    @Mensaje              NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;           
    BEGIN TRY        
        -- Insert
        INSERT INTO dbo.IglesiasEstructuras
        (                        
            IglesiaId,
            DenominacionId,
            EstructuraId,
            FechaAsignacion
        )
        VALUES
        (            
            @IglesiaId,
            @DenominacionId,
            @EstructuraId,
            getdate()
        );

        -- OK
        SET @OutIglesiaEstructurasId = SCOPE_IDENTITY();
        SET @Resultado = 'OK';
        SET @Mensaje = 'Estructura de la Iglesia creada correctamente.';
    END TRY
    BEGIN CATCH
        SET @OutIglesiaEstructurasId = NULL;
        SET @Resultado = 'ERROR';
        SET @Mensaje = CONCAT(
            'Error en usp_IglesiasEstructuras_GuardarPorIglesia: ',
            ERROR_MESSAGE(),
            ' (Linea ',
            ERROR_LINE(),
            ')'
        );
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_IglesiasEstructuras_ObtenerPorIglesia]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec usp_IglesiasEstructuras_ObtenerPorIglesia
CREATE PROCEDURE [dbo].[usp_IglesiasEstructuras_ObtenerPorIglesia]
    @IglesiaId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        ie.IglesiaEstructurasId, 
        ie.IglesiaId, 
        ie.DenominacionId, 
        ie.EstructuraId,
        eo.Descripcion as Estructura
    FROM IglesiasEstructuras ie
    INNER JOIN EstructuraOrganizacional eo
    ON ie.EstructuraId = eo.EstructuraOrganizacionalId
    WHERE ie.IglesiaId = @IglesiaId AND ie.DenominacionId = @DenominacionId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Menu_ObtenerPorUsuario]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec usp_Menu_ObtenerPorUsuario 4, 1
CREATE   PROCEDURE [dbo].[usp_Menu_ObtenerPorUsuario]
(
    @UsuarioId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    WITH MenusPermitidos AS
    (
        SELECT DISTINCT
            m.MenuId,
            m.DenominacionId,
            m.Descripcion,
            m.IdGrupo,
            LTRIM(RTRIM(m.Tipo)) AS Tipo,
            m.Estado,
            m.Url,
            m.Imagen,
            m.Fecha,
            m.Orden,
            m.NuevaVentana
        FROM Menu m
        WHERE m.DenominacionId = @DenominacionId
          AND m.Estado = 1
          AND
          (
              EXISTS (
                  SELECT 1
                  FROM UsuarioRoles ur
                  INNER JOIN Menu_rol mr
                      ON mr.RolId = ur.RolId
                     AND mr.DenominacionId = ur.DenominacionId
                     AND mr.MenuId = m.MenuId
                     AND mr.Estado = 1
                  WHERE ur.UsuarioId = @UsuarioId
                    AND ur.DenominacionId = @DenominacionId
              )
              OR EXISTS (
                  SELECT 1
                  FROM Menu_Usuario mu
                  WHERE mu.UsuarioId = @UsuarioId
                    AND mu.DenominacionId = @DenominacionId
                    AND mu.MenuId = m.MenuId
              )
          )
    ),
    GruposPadre AS
    (
        SELECT DISTINCT
            g.MenuId,
            g.DenominacionId,
            g.Descripcion,
            g.IdGrupo,
            LTRIM(RTRIM(g.Tipo)) AS Tipo,
            g.Estado,
            g.Url,
            g.Imagen,
            g.Fecha,
            g.Orden,
            g.NuevaVentana
        FROM Menu g
        INNER JOIN MenusPermitidos mp
            ON mp.IdGrupo = g.MenuId
        WHERE g.DenominacionId = @DenominacionId
          AND g.Estado = 1
          AND LTRIM(RTRIM(g.Tipo)) = 'G'
    ),
    Resultado AS
    (
        SELECT * FROM MenusPermitidos
        UNION
        SELECT * FROM GruposPadre
    )
    SELECT
        MenuId,
        DenominacionId,
        Descripcion,
        IdGrupo,
        Tipo,
        Estado,
        Url,
        Imagen,
        Fecha,
        Orden,
        NuevaVentana
    FROM Resultado
    ORDER BY
        CASE WHEN Tipo = 'G' THEN Orden ELSE 999999 END,
        IdGrupo,
        Tipo,
        Orden;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_MenuUsuario_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_MenuUsuario_Insertar]
(    
    @DenominacionId INT,
    @UsuarioId INT,
    @MenuId INT,
    -- Parámetros de salida
    @OutOpcUsuId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY

        -- Validaciones básicas
        IF @DenominacionId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La Denominación es obligatoria.';
            SET @OutOpcUsuId = NULL;
            RETURN;
        END    

        -- Validar duplicados
        IF EXISTS (
            SELECT 1 
            FROM Menu_Usuario
            WHERE DenominacionId = @DenominacionId 
              AND UsuarioId = @UsuarioId
              AND MenuId = @MenuId              
        )
        BEGIN
            SET @Resultado = 'EXISTE';
            SET @Mensaje = 'Ya existe una asignación del menú a este usuario.';
            SET @OutOpcUsuId = NULL;
            RETURN;
        END

        -- Insertar registro
        INSERT INTO Menu_Usuario
        (
            DenominacionId,
            UsuarioId,
            MenuId,
            FechaCreacion
        )
        VALUES
        (
            @DenominacionId,
            @UsuarioId,
            @MenuId,
            GETDATE()
        );

        -- Obtener IDENTITY generado
        SET @OutOpcUsuId = SCOPE_IDENTITY();

        -- Respuesta exitosa
        SET @Resultado = 'OK';
        SET @Mensaje = 'Asociacón rol creada correctamente.';

    END TRY
    BEGIN CATCH

        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
        SET @OutOpcUsuId = NULL;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Pais_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Pais_Listar]
AS
	SELECT 
		PaisId,
		PaisNombre,
		Descripcion,
		Estado,
		FechaCreacion
	FROM Pais

	
GO
/****** Object:  StoredProcedure [dbo].[usp_Parametro_Actualizar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Parametro_Actualizar]
(
    @ParametroId INT,
    @DenominacionId INT,
    @ClaseId INT,
    @Descripcion NVARCHAR(255),
    @Observacion NVARCHAR(500),
    @PadreParametroId INT,
    @Estado BIT,

    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF @ParametroId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'El ParametroId es obligatorio.';
            RETURN;
        END

        IF @Descripcion IS NULL OR LTRIM(RTRIM(@Descripcion)) = ''
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La descripción es obligatoria.';
            RETURN;
        END

        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Parametro
            WHERE ParametroId = @ParametroId
        )
        BEGIN
            SET @Resultado = 'NOEXISTE';
            SET @Mensaje = 'El parámetro no existe.';
            RETURN;
        END

        -- Validar duplicado dentro de la misma clase
        IF EXISTS (
            SELECT 1
            FROM dbo.Parametro P1
            INNER JOIN dbo.Parametro P2
                ON P1.ClaseId = P2.ClaseId
            WHERE P1.ParametroId = @ParametroId
              AND P2.Descripcion = @Descripcion
              AND P2.ParametroId <> @ParametroId
        )
        BEGIN
            SET @Resultado = 'EXISTE';
            SET @Mensaje = 'Ya existe un parámetro con esa descripción dentro de la misma clase.';
            RETURN;
        END

        UPDATE dbo.Parametro
        SET
            Descripcion = @Descripcion,
            Observacion = @Observacion,
            Estado = @Estado
        WHERE ParametroId = @ParametroId;

        SET @Resultado = 'OK';
        SET @Mensaje = 'Parámetro actualizado correctamente.';
    END TRY
    BEGIN CATCH
        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Parametro_ActualizarPadre]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Parametro_ActualizarPadre]
    @ParametroId INT,
    @PadreParametroId INT = NULL,
    @Resultado VARCHAR(20) OUTPUT,
    @Mensaje VARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        UPDATE Parametro
        SET PadreParametroId = @PadreParametroId
        WHERE ParametroId = @ParametroId;
        
        SET @Resultado = 'Exito';
        SET @Mensaje = 'Padre actualizado correctamente';
    END TRY
    BEGIN CATCH
        SET @Resultado = 'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Parametro_Eliminar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Parametro_Eliminar]
(
    @ParametroId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT OFF;

    BEGIN TRY
    
        DELETE FROM dbo.Parametro
        WHERE ParametroId = @ParametroId
          AND DenominacionId = @DenominacionId;

    END TRY
    BEGIN CATCH
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Parametro_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Parametro_Insertar]
(
    @DenominacionId INT,
    @ClaseId INT,
    @Descripcion NVARCHAR(255),
    @Observacion NVARCHAR(500),
    @PadreParametroId INT = NULL,
    @Estado BIT,

    @OutParametroId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF @DenominacionId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La Denominación es obligatoria.';
            SET @OutParametroId = NULL;
            RETURN;
        END

        IF @ClaseId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La Clase es obligatoria.';
            SET @OutParametroId = NULL;
            RETURN;
        END

        IF @Descripcion IS NULL OR LTRIM(RTRIM(@Descripcion)) = ''
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La descripción es obligatoria.';
            SET @OutParametroId = NULL;
            RETURN;
        END        

        -- Validar existencia de la clase
        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Clase
            WHERE ClaseId = @ClaseId
        )
        BEGIN
            SET @Resultado = 'NOEXISTE';
            SET @Mensaje = 'La clase asociada no existe.';
            SET @OutParametroId = NULL;
            RETURN;
        END

        -- Validar duplicado por clase + descripción
        IF EXISTS (
            SELECT 1
            FROM dbo.Parametro
            WHERE ClaseId = @ClaseId
              AND Descripcion = @Descripcion
        )
        BEGIN
            SET @Resultado = 'EXISTE';
            SET @Mensaje = 'Ya existe un parámetro con esa descripción para la clase.';
            SET @OutParametroId = NULL;
            RETURN;
        END
        
        INSERT INTO dbo.Parametro
        (            
            DenominacionId,
            ClaseId,
            Descripcion,
            Observacion,
            PadreParametroId,
            Estado,
            FechaCreacion
        )
        VALUES
        (            
            @DenominacionId,
            @ClaseId,
            @Descripcion,
            @Observacion,
            @PadreParametroId,
            @Estado,
            GETDATE()
        );

        SET @OutParametroId = SCOPE_IDENTITY();
        SET @Resultado = 'OK';
        SET @Mensaje = 'Parámetro creado correctamente.';
    END TRY
    BEGIN CATCH
        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
        SET @OutParametroId = NULL;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Parametro_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec usp_Parametro_Listar 1
CREATE PROCEDURE [dbo].[usp_Parametro_Listar]
(
    @DenominacionId INT = NULL,
    @ClaseId INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT
            p.ParametroId,
            p.DenominacionId,
            p.ClaseId,
            p.Descripcion,
            p.Observacion,
            p.PadreParametroId,
            p.Estado
        FROM Parametro p        
        WHERE
        p.ClaseId = @ClaseId AND (@DenominacionId IS NULL OR p.DenominacionId = @DenominacionId)            
        ORDER BY p.Descripcion ASC;
    END TRY
    BEGIN CATCH
        -- Retorna conjunto vacío para no romper el mapeo de Dapper
        SELECT
            CAST(NULL AS INT) AS ParametroId,
            CAST(NULL AS INT) AS DenominacionId,
            CAST(NULL AS INT) AS ClaseId,
            CAST(NULL AS NVARCHAR(255)) AS Descripcion,
            CAST(NULL AS NVARCHAR(500)) AS Observacion,
            CAST(NULL AS INT) AS PadreParametroId,
            CAST(NULL AS BIT) AS Estado
        WHERE 1 = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Parametro_Listar_por_DenominacionId]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec usp_Parametro_Listar 1
CREATE PROCEDURE [dbo].[usp_Parametro_Listar_por_DenominacionId]
(
    @DenominacionId INT = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT
            p.ParametroId,
            p.DenominacionId,
            p.ClaseId,
            p.Descripcion,
            p.Observacion,
            p.PadreParametroId,
            p.Estado
        FROM Parametro p        
        WHERE
        p.DenominacionId = @DenominacionId
        ORDER BY p.Descripcion ASC;
    END TRY
    BEGIN CATCH
        -- Retorna conjunto vacío para no romper el mapeo de Dapper
        SELECT
            CAST(NULL AS INT) AS ParametroId,
            CAST(NULL AS INT) AS DenominacionId,
            CAST(NULL AS INT) AS ClaseId,
            CAST(NULL AS NVARCHAR(255)) AS Descripcion,
            CAST(NULL AS NVARCHAR(500)) AS Observacion,
            CAST(NULL AS INT) AS PadreParametroId,
            CAST(NULL AS BIT) AS Estado
        WHERE 1 = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Parametro_Obtener]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Parametro_Obtener]
(
    @ParametroId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT TOP 1
            ParametroId,
            DenominacionId,
            ClaseId,
            Descripcion,
            Observacion,
            Estado
        FROM dbo.Parametro
        WHERE ParametroId = @ParametroId AND DenominacionId = @DenominacionId;
    END TRY
    BEGIN CATCH
        -- Retorna vacío
        SELECT
            CAST(NULL AS INT) AS ParametroId,
            CAST(NULL AS INT) AS DenominacionId,
            CAST(NULL AS INT) AS ClaseId,
            CAST(NULL AS NVARCHAR(255)) AS Descripcion,
            CAST(NULL AS NVARCHAR(500)) AS Observacion,
            CAST(NULL AS BIT) AS Estado
        WHERE 1 = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Parametro_Obtener_por_Clase_Nombre]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec usp_Parametro_Obtener_por_Clase_Nombre 'Paises'
CREATE PROCEDURE [dbo].[usp_Parametro_Obtener_por_Clase_Nombre]
(
    @Descripcion NVARCHAR(500),
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT
            p.ParametroId,
            p.DenominacionId,
            p.ClaseId,
            p.Descripcion,
            p.Observacion,
            p.PadreParametroId,
            p.Estado
        FROM Parametro p
        INNER JOIN Clase c
        ON p.ClaseId = c.ClaseId
        WHERE c.Descripcion = @Descripcion AND p.DenominacionId = @DenominacionId;
    END TRY
    BEGIN CATCH
        -- Retorna vacío
        SELECT
            CAST(NULL AS INT) AS ParametroId,
            CAST(NULL AS INT) AS DenominacionId,
            CAST(NULL AS INT) AS ClaseId,
            CAST(NULL AS NVARCHAR(255)) AS Descripcion,
            CAST(NULL AS NVARCHAR(500)) AS Observacion,
            CAST(NULL AS BIT) AS Estado
        WHERE 1 = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Registro_Actualizar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Registro_Actualizar]
    @RegistroId INT,
    @DenominacionId INT,
    @IglesiaId INT,
    @Nombres NVARCHAR(150),
    @Apellidos NVARCHAR(150),
    @ParametroIdTipoDocumento INT,
    @Documento NVARCHAR(50),
    
    @PaisId INT,
    @DepartamentoId INT,
    @CiudadId INT,
    @CorregimientoId INT,

    @Direccion NVARCHAR(250),
    @Correo NVARCHAR(150) = NULL,
    @Telefono NVARCHAR(50) = NULL,
    @ParametroIdSexo INT,
    @ParametroIdInteres INT,

    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1
            FROM Registro
            WHERE RegistroId = @RegistroId
        )
        BEGIN
            SET @Resultado = 'NoExiste';
            SET @Mensaje = 'El registro no existe.';
            RETURN;
        END

        IF EXISTS (
            SELECT 1
            FROM Registro
            WHERE Documento = @Documento
              AND DenominacionId = @DenominacionId
              AND RegistroId <> @RegistroId
        )
        BEGIN
            SET @Resultado = 'Duplicado';
            SET @Mensaje = 'Ya existe otro registro con el mismo documento para esta denominación.';
            RETURN;
        END
        
        UPDATE Registro
        SET
            IglesiaId = @IglesiaId,
            DenominacionId = @DenominacionId,
            Nombres = @Nombres,
            Apellidos = @Apellidos,
            ParametroIdTipoDocumento = @ParametroIdTipoDocumento,
            Documento = @Documento,
            PaisId = @PaisId,
            DepartamentoId = @DepartamentoId,
            CiudadId = @CiudadId,
            CorregimientoId = @CorregimientoId,
            Direccion = @Direccion,
            Correo = @Correo,
            Telefono = @Telefono,
            ParametroIdSexo = @ParametroIdSexo,
            ParametroIdInteres = @ParametroIdInteres
        WHERE RegistroId = @RegistroId;

        SET @Resultado = 'Ok';
        SET @Mensaje = 'Registro actualizado correctamente.';
    END TRY
    BEGIN CATCH
        SET @Resultado = 'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Registro_Eliminar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Registro_Eliminar]
    @RegistroId INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF NOT EXISTS (
            SELECT 1 
            FROM Registro 
            WHERE RegistroId = @RegistroId
        )
        BEGIN
            SELECT 'NoExiste|El registro no existe.' AS Resultado;
            RETURN;
        END

        DELETE FROM Registro
        WHERE RegistroId = @RegistroId;

        SELECT 'Ok|Registro eliminado correctamente.' AS Resultado;
    END TRY
    BEGIN CATCH
        SELECT 'Error|' + ERROR_MESSAGE() AS Resultado;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Registro_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Registro_Insertar]    
    @DenominacionId INT,
    @IglesiaId INT,
    @Nombres NVARCHAR(150),
    @Apellidos NVARCHAR(150),
    @ParametroIdTipoDocumento INT,
    @Documento NVARCHAR(50),

    @PaisId INT,
    @DepartamentoId INT,
    @CiudadId   INT,
    @CorregimientoId INT,
    
    @Direccion NVARCHAR(250),
    @Correo NVARCHAR(150) = NULL,
    @Telefono NVARCHAR(50) = NULL,
    @ParametroIdSexo INT,
    @Interno bit,
    @ParametroIdInteres INT,

    @OutRegistroId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
    
        IF EXISTS (
            SELECT 1
            FROM Registro
            WHERE Documento = @Documento
              AND DenominacionId = @DenominacionId
        )
        BEGIN
            SET @OutRegistroId = NULL;
            SET @Resultado = 'Duplicado';
            SET @Mensaje = 'Ya existe un registro con el mismo documento para esta denominación.';
            RETURN;
        END
        
        INSERT INTO Registro
        (
            DenominacionId,
            IglesiaId,
            Nombres,
            Apellidos,
            ParametroIdTipoDocumento,
            Documento,
            PaisId,
            DepartamentoId,
            CiudadId,
            CorregimientoId,
            Direccion,
            Correo,
            Telefono,
            ParametroIdSexo,
            Interno,
            ParametroIdInteres
        )
        VALUES
        (
            @DenominacionId,
            @IglesiaId,
            @Nombres,
            @Apellidos,
            @ParametroIdTipoDocumento,
            @Documento,
            @PaisId,
            @DepartamentoId,
            @CiudadId,
            @CorregimientoId,
            @Direccion,
            @Correo,
            @Telefono,
            @ParametroIdSexo,
            @Interno,
            @ParametroIdInteres
        );

        SET @OutRegistroId = @@IDENTITY;
        SET @Resultado = 'Ok';
        SET @Mensaje = 'Registro creado correctamente.';
    END TRY
    BEGIN CATCH
        SET @OutRegistroId = NULL;
        SET @Resultado = 'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Registro_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Registro_Listar]
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        RegistroId,
        DenominacionId,
        Nombres,
        Apellidos,
        ParametroIdTipoDocumento,
        Documento,
        PaisId,
        DepartamentoId,
        CiudadId,
        CorregimientoId,
        Direccion,
        Correo,
        Telefono,
        ParametroIdSexo
    FROM Registro
    WHERE DenominacionId = @DenominacionId
    ORDER BY Nombres, Apellidos;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Registro_ListarPorIglesia]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Registro_ListarPorIglesia]
    @IglesiaId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        RegistroId,
        DenominacionId,
        IglesiaId,
        Nombres,
        Apellidos,
        ParametroIdTipoDocumento,
        Documento,
        PaisId,
        DepartamentoId,
        CiudadId,
        CorregimientoId,
        Direccion,
        Correo,
        Telefono,
        ParametroIdSexo,
        Interno,
        ParametroIdInteres
    FROM Registro r    
    WHERE r.DenominacionId = @DenominacionId AND r.IglesiaId = @IglesiaId
    ORDER BY r.RegistroId ASC;
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Registro_Obtener]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[usp_Registro_Obtener]
    @RegistroId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        RegistroId,
        DenominacionId,
        Nombres,
        Apellidos,
        ParametroIdTipoDocumento,
        Documento,
        PaisId,
        DepartamentoId,
        CiudadId,
        CorregimientoId,
        Direccion,
        Correo,
        Telefono,
        ParametroIdSexo
    FROM Registro
    WHERE RegistroId = @RegistroId;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Rol_Listar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Rol_Listar]
(
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;
    -- Consulta principal
    SELECT 
        RolId,
        DenominacionId,
        Nombre,
        Codigo,
        Activo,
        FechaCreacion
    FROM Roles
    WHERE DenominacionId = @DenominacionId
    ORDER BY Nombre ASC;    
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuario_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Usuario_Insertar]
(    
    @DenominacionId         INT,
    @RegistroId             INT,
    @Correo                 NVARCHAR(256),
    @PasswordHash           NVARCHAR(500),
    @EmailVerificado        BIT = 0,
    @Bloqueado              BIT = 0,
    @SecurityStamp          NVARCHAR(200) = NULL,
    @RolId                  INT,

    @OutUsuarioId           INT OUTPUT,
    @Resultado              VARCHAR(20) OUTPUT,
    @Mensaje                NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    SET @OutUsuarioId = 0;
    SET @Resultado = 'ERROR';
    SET @Mensaje = NULL;

    BEGIN TRY

        SET @Correo = LOWER(LTRIM(RTRIM(ISNULL(@Correo, ''))));
        SET @PasswordHash = LTRIM(RTRIM(ISNULL(@PasswordHash, '')));

        IF (@DenominacionId IS NULL OR @DenominacionId <= 0)
        BEGIN
            SET @Mensaje = 'La DenominacionId es obligatoria.';
            RETURN;
        END;

        IF (@RegistroId IS NULL OR @RegistroId <= 0)
        BEGIN
            SET @Mensaje = 'El RegistroId es obligatorio.';
            RETURN;
        END;

        IF (@Correo = '')
        BEGIN
            SET @Mensaje = 'El correo es obligatorio.';
            RETURN;
        END;

        IF (@PasswordHash = '')
        BEGIN
            SET @Mensaje = 'El PasswordHash es obligatorio.';
            RETURN;
        END;

        IF (@RolId IS NULL OR @RolId <= 0)
        BEGIN
            SET @Mensaje = 'El RolId es obligatorio.';
            RETURN;
        END;

        IF (@SecurityStamp IS NULL OR LTRIM(RTRIM(@SecurityStamp)) = '')
        BEGIN
            SET @SecurityStamp = CONVERT(NVARCHAR(200), NEWID());
        END;

        DECLARE @IglesiaId INT;

        SELECT 
            @IglesiaId = IglesiaId
        FROM dbo.Registro
        WHERE RegistroId = @RegistroId
          AND DenominacionId = @DenominacionId;

        IF (@IglesiaId IS NULL)
        BEGIN
            SET @Mensaje = 'No se encontró el registro o no tiene IglesiaId asociado.';
            RETURN;
        END;

        BEGIN TRANSACTION;

        IF EXISTS (
            SELECT 1
            FROM dbo.Usuarios WITH (UPDLOCK, HOLDLOCK)
            WHERE Correo = @Correo
        )
        BEGIN
            SET @Mensaje = 'Ya existe un usuario registrado con ese correo.';
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        INSERT INTO dbo.Usuarios
        (
            DenominacionId,
            RegistroId,
            Correo,
            PasswordHash,
            EmailVerificado,
            Bloqueado,
            FechaCreacion,
            SecurityStamp,
            RolId
        )
        VALUES
        (
            @DenominacionId,
            @RegistroId,
            @Correo,
            @PasswordHash,
            ISNULL(@EmailVerificado, 0),
            ISNULL(@Bloqueado, 0),
            SYSUTCDATETIME(),
            @SecurityStamp,
            @RolId
        );

        SET @OutUsuarioId = CONVERT(INT, SCOPE_IDENTITY());

        INSERT INTO dbo.UsuarioRoles
        (
            UsuarioId,
            DenominacionId,
            IglesiaId,
            RolId,
            FechaCreacion
        )
        VALUES 
        (
            @OutUsuarioId,
            @DenominacionId,
            @IglesiaId,
            @RolId,
            SYSUTCDATETIME()
        );

        INSERT INTO dbo.UsuariosIglesias
        (            
            DenominacionId,
            UsuarioId,
            IglesiaId,
            Estado,
            EsAdministrador,
            FechaCreacion
        )
        VALUES
        (
            @DenominacionId,
            @OutUsuarioId,
            @IglesiaId,
            1,
            0,
            SYSUTCDATETIME()
        );

        INSERT INTO dbo.Menu_Usuario 
        (
            DenominacionId, 
            UsuarioId, 
            MenuId, 
            FechaCreacion
        )
        SELECT 
            @DenominacionId,
            @OutUsuarioId,
            mr.MenuId,
            SYSUTCDATETIME()
        FROM dbo.Menu_rol mr
        WHERE mr.RolId = @RolId
          AND NOT EXISTS
          (
              SELECT 1
              FROM dbo.Menu_Usuario mu
              WHERE mu.DenominacionId = @DenominacionId
                AND mu.UsuarioId = @OutUsuarioId
                AND mu.MenuId = mr.MenuId
          );

        COMMIT TRANSACTION;

        SET @Resultado = 'OK';
        SET @Mensaje = 'Usuario creado correctamente.';

    END TRY
    BEGIN CATCH

        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @OutUsuarioId = 0;
        SET @Resultado = 'ERROR';
        SET @Mensaje = CONCAT(
            'Error al registrar usuario. ',
            'Msg: ', ERROR_MESSAGE(),
            ' | Line: ', ERROR_LINE(),
            ' | Proc: ', ISNULL(ERROR_PROCEDURE(), 'N/A')
        );

    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_UsuarioIglesia_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UsuarioIglesia_Insertar]
(
    @DenominacionId INT,
    @UsuarioId INT,
    @IglesiaId INT,
    @Estado BIT,
    @EsAdministrador BIT,

    -- Parámetros de salida
    @OutUsuarioIglesiaId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY

        -- Validaciones básicas
        IF @DenominacionId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La Denominación es obligatoria.';
            SET @OutUsuarioIglesiaId = NULL;
            RETURN;
        END            

        -- Validar duplicados
        IF EXISTS (
            SELECT 1 
            FROM UsuariosIglesias
            WHERE DenominacionId = @DenominacionId 
              AND UsuarioId = @UsuarioId
        )
        BEGIN
            SET @Resultado = 'EXISTE';
            SET @Mensaje = 'Ya existe el usuario asociado a la iglesia.';
            SET @OutUsuarioIglesiaId = NULL;
            RETURN;
        END
        
        -- Insertar registro
        INSERT INTO UsuariosIglesias
        (
            DenominacionId
            ,UsuarioId
            ,IglesiaId
            ,Estado
            ,EsAdministrador
            ,FechaCreacion
        )
        VALUES
        (
            @DenominacionId
            ,@UsuarioId
            ,@IglesiaId
            ,@Estado
            ,@EsAdministrador
            ,GETDATE()
        );

        -- Obtener IDENTITY generado
        SET @OutUsuarioIglesiaId = SCOPE_IDENTITY();

        -- Respuesta exitosa
        SET @Resultado = 'OK';
        SET @Mensaje = 'Asociación creada correctamente.';

    END TRY
    BEGIN CATCH

        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
        SET @OutUsuarioIglesiaId = NULL;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_UsuarioRol_Insertar]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UsuarioRol_Insertar]
(
    @UsuarioId INT,
    @DenominacionId INT,
    @IglesiaId INT,
    @RolId INT,
    -- Parámetros de salida
    @OutUsuarioRolId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY

        -- Validaciones básicas
        IF @DenominacionId IS NULL
        BEGIN
            SET @Resultado = 'ERROR';
            SET @Mensaje = 'La Denominación es obligatoria.';
            SET @OutUsuarioRolId = NULL;
            RETURN;
        END    

        -- Validar duplicados
        IF EXISTS (
            SELECT 1 
            FROM UsuarioRoles
            WHERE DenominacionId = @DenominacionId 
              AND RolId = @RolId
              AND IglesiaId = @IglesiaId
              AND RolId = @RolId
        )
        BEGIN
            SET @Resultado = 'EXISTE';
            SET @Mensaje = 'Ya existe una asignación del rol a este usuario.';
            SET @OutUsuarioRolId = NULL;
            RETURN;
        END

        -- Insertar registro
        INSERT INTO UsuarioRoles
        (
            UsuarioId,
            DenominacionId,
            IglesiaId,
            RolId,
            FechaCreacion
        )
        VALUES
        (
            @UsuarioId,
            @DenominacionId,
            @IglesiaId,
            @RolId,
            GETDATE()
        );

        -- Obtener IDENTITY generado
        SET @OutUsuarioRolId = SCOPE_IDENTITY();

        -- Respuesta exitosa
        SET @Resultado = 'OK';
        SET @Mensaje = 'Asociacón rol creada correctamente.';

    END TRY
    BEGIN CATCH

        SET @Resultado = 'ERROR';
        SET @Mensaje = ERROR_MESSAGE();
        SET @OutUsuarioRolId = NULL;

    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuarios_ObtenerIglesiasPermitidas]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC dbo.usp_Usuarios_ObtenerIglesiasPermitidas 4, 1
CREATE PROCEDURE [dbo].[usp_Usuarios_ObtenerIglesiasPermitidas]
(
    @UsuarioId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @EsAdministradorDenominacion BIT = 0;

    SELECT TOP 1
        @EsAdministradorDenominacion = 1
    FROM dbo.UsuariosIglesias ui
    WHERE ui.UsuarioId = @UsuarioId
      AND ui.DenominacionId = @DenominacionId
      AND ui.Estado = 1
      AND ui.EsAdministrador = 1;

    ;WITH EstructurasBase AS
    (
        SELECT DISTINCT
            ie.EstructuraId
        FROM dbo.UsuarioRoles ur
        INNER JOIN dbo.Roles r
            ON r.RolId = ur.RolId
           AND r.DenominacionId = ur.DenominacionId
           AND r.Activo = 1
        INNER JOIN dbo.IglesiasEstructuras ie
            ON ie.IglesiaId = ur.IglesiaId
           AND ie.DenominacionId = ur.DenominacionId
        WHERE ur.UsuarioId = @UsuarioId
          AND ur.DenominacionId = @DenominacionId
          AND ur.RolId IN (2, 4)
    ),
    EstructuraPermitida AS
    (
        SELECT
            eo.EstructuraOrganizacionalId,
            eo.Descripcion,
            eo.GrupoEstructuraOrganizacionalId
        FROM dbo.EstructuraOrganizacional eo
        INNER JOIN EstructurasBase eb
            ON eb.EstructuraId = eo.EstructuraOrganizacionalId
        WHERE eo.DenominacionId = @DenominacionId
          AND eo.Estado = 1

        UNION ALL

        SELECT
            hijo.EstructuraOrganizacionalId,
            hijo.Descripcion,
            hijo.GrupoEstructuraOrganizacionalId
        FROM dbo.EstructuraOrganizacional hijo
        INNER JOIN EstructuraPermitida padre
            ON hijo.GrupoEstructuraOrganizacionalId = padre.EstructuraOrganizacionalId
        WHERE hijo.DenominacionId = @DenominacionId
          AND hijo.Estado = 1
    )
    SELECT DISTINCT
        i.IglesiaId,
        i.Nombre AS Iglesia,

        ie.EstructuraId,
        eo.Descripcion AS EstructuraOrganizacional,

        i.DenominacionId,
        i.Nombre,
        i.Slug,
        i.PersoneriaJuridica,
        i.PastorResponsableRegistroId,

        NULLIF(LTRIM(RTRIM(
            ISNULL(r.Nombres, '') + ' ' + ISNULL(r.Apellidos, '')
        )), '') AS PastorResponsable,

        i.PaisId,
        p.PaisNombre,

        i.DepartamentoId,
        d.DepartamentoNombre,

        i.CiudadId,
        c.CiudadNombre,

        i.CorregimientoId,
        co.CorregimientoNombre,

        CASE
            WHEN i.CorregimientoId IS NOT NULL 
                 AND co.CorregimientoNombre IS NOT NULL
                THEN co.CorregimientoNombre
            ELSE c.CiudadNombre
        END AS CiudadCorregimiento,

        i.Direccion,
        i.Telefono,
        i.Correo,
        i.Slogan,
        i.Activa,
        i.FechaCreacion,

        CASE 
            WHEN de.IglesiaPrincipalId IS NOT NULL
            THEN CAST(1 AS BIT)
            ELSE CAST(0 AS BIT)
        END AS EsDenominacion

    FROM dbo.Iglesias i

    LEFT JOIN dbo.IglesiasEstructuras ie
        ON ie.IglesiaId = i.IglesiaId
       AND ie.DenominacionId = i.DenominacionId

    LEFT JOIN dbo.EstructuraOrganizacional eo
        ON eo.EstructuraOrganizacionalId = ie.EstructuraId
       AND eo.DenominacionId = i.DenominacionId

    LEFT JOIN dbo.Pais p
        ON p.PaisId = i.PaisId

    LEFT JOIN dbo.Departamento d
        ON d.DepartamentoId = i.DepartamentoId

    LEFT JOIN dbo.Ciudad c
        ON c.CiudadId = i.CiudadId

    LEFT JOIN dbo.Corregimiento co
        ON co.CorregimientoId = i.CorregimientoId

    LEFT JOIN dbo.Registro r
        ON r.RegistroId = i.PastorResponsableRegistroId
       AND r.DenominacionId = i.DenominacionId

    LEFT JOIN dbo.Denominaciones de
        ON de.IglesiaPrincipalId = i.IglesiaId
       AND de.DenominacionId = i.DenominacionId

    WHERE i.DenominacionId = @DenominacionId
      AND
      (
            @EsAdministradorDenominacion = 1
            OR EXISTS
            (
                SELECT 1
                FROM EstructuraPermitida ep
                WHERE ep.EstructuraOrganizacionalId = ie.EstructuraId
            )
      )

    ORDER BY i.Nombre ASC
    OPTION (MAXRECURSION 0);
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuarios_ObtenerIglesiasPermitidas_18_06_2026]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- EXEC dbo.usp_Usuarios_ObtenerIglesiasPermitidas 43, 1
CREATE PROCEDURE [dbo].[usp_Usuarios_ObtenerIglesiasPermitidas_18_06_2026]
(
    @UsuarioId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH IglesiasUsuario AS
    (
        SELECT DISTINCT
            ui.IglesiaId,
            ie.EstructuraId
        FROM dbo.UsuariosIglesias ui
        LEFT JOIN dbo.IglesiasEstructuras ie
            ON ie.IglesiaId = ui.IglesiaId
           AND ie.DenominacionId = ui.DenominacionId
        WHERE ui.UsuarioId = @UsuarioId
          AND ui.DenominacionId = @DenominacionId
          AND ui.Estado = 1
    ),
    EstructuraPermitida AS
    (
        SELECT
            eo.EstructuraOrganizacionalId,
            eo.Descripcion
        FROM dbo.EstructuraOrganizacional eo
        INNER JOIN IglesiasUsuario iu
            ON iu.EstructuraId = eo.EstructuraOrganizacionalId
        WHERE eo.DenominacionId = @DenominacionId
          AND eo.Estado = 1

        UNION ALL

        SELECT
            hijo.EstructuraOrganizacionalId,
            hijo.Descripcion
        FROM dbo.EstructuraOrganizacional hijo
        INNER JOIN EstructuraPermitida padre
            ON hijo.GrupoEstructuraOrganizacionalId = padre.EstructuraOrganizacionalId
        WHERE hijo.DenominacionId = @DenominacionId
          AND hijo.Estado = 1
    )
    SELECT DISTINCT
        i.IglesiaId,
        i.Nombre AS Iglesia,

        ie.EstructuraId,
        eo.Descripcion AS EstructuraOrganizacional,

        i.DenominacionId,
        i.Nombre,
        i.Slug,
        i.PersoneriaJuridica,
        i.PastorResponsableRegistroId,

        NULLIF(LTRIM(RTRIM(
            ISNULL(r.Nombres, '') + ' ' + ISNULL(r.Apellidos, '')
        )), '') AS PastorResponsable,

        i.PaisId,
        p.PaisNombre,

        i.DepartamentoId,
        d.DepartamentoNombre,

        i.CiudadId,
        c.CiudadNombre,

        i.CorregimientoId,
        co.CorregimientoNombre,

        CASE
            WHEN i.CorregimientoId IS NOT NULL 
                 AND co.CorregimientoNombre IS NOT NULL
                THEN co.CorregimientoNombre
            ELSE c.CiudadNombre
        END AS CiudadCorregimiento,

        i.Direccion,
        i.Telefono,
        i.Correo,
        i.Slogan,
        i.Activa,
        i.FechaCreacion,

        CASE 
            WHEN de.IglesiaPrincipalId IS NOT NULL
            THEN CAST(1 AS BIT)
            ELSE CAST(0 AS BIT)
        END AS EsDenominacion

    FROM dbo.Iglesias i

    LEFT JOIN dbo.IglesiasEstructuras ie
        ON ie.IglesiaId = i.IglesiaId
       AND ie.DenominacionId = i.DenominacionId

    LEFT JOIN EstructuraPermitida ep
        ON ep.EstructuraOrganizacionalId = ie.EstructuraId

    LEFT JOIN dbo.EstructuraOrganizacional eo
        ON eo.EstructuraOrganizacionalId = ie.EstructuraId
       AND eo.DenominacionId = i.DenominacionId

    LEFT JOIN dbo.Pais p
        ON p.PaisId = i.PaisId

    LEFT JOIN dbo.Departamento d
        ON d.DepartamentoId = i.DepartamentoId

    LEFT JOIN dbo.Ciudad c
        ON c.CiudadId = i.CiudadId

    LEFT JOIN dbo.Corregimiento co
        ON co.CorregimientoId = i.CorregimientoId

    LEFT JOIN dbo.Registro r
        ON r.RegistroId = i.PastorResponsableRegistroId
       AND r.DenominacionId = i.DenominacionId

    LEFT JOIN dbo.Denominaciones de
        ON de.IglesiaPrincipalId = i.IglesiaId
       AND de.DenominacionId = i.DenominacionId

    WHERE i.DenominacionId = @DenominacionId

    ORDER BY i.Nombre ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_Usuarios_ObtenerIglesiasPermitidas_backup_08-06-2026]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec usp_Usuarios_ObtenerIglesiasPermitidas 4, 1
CREATE PROCEDURE [dbo].[usp_Usuarios_ObtenerIglesiasPermitidas_backup_08-06-2026]
(
    @UsuarioId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH IglesiasUsuario AS
    (
        SELECT 
            ui.IglesiaId,
            ie.EstructuraId
        FROM UsuariosIglesias ui
        INNER JOIN IglesiasEstructuras ie 
            ON ie.IglesiaId = ui.IglesiaId
           AND ie.DenominacionId = ui.DenominacionId
        WHERE ui.UsuarioId = @UsuarioId
          AND ui.DenominacionId = @DenominacionId
          AND ui.Estado = 1
    ),
    EstructuraPermitida AS
    (
        SELECT 
            eo.EstructuraOrganizacionalId
        FROM EstructuraOrganizacional eo
        INNER JOIN IglesiasUsuario iu
            ON iu.EstructuraId = eo.EstructuraOrganizacionalId
        WHERE eo.DenominacionId = @DenominacionId
          AND eo.Estado = 1

        UNION ALL

        SELECT 
            hijo.EstructuraOrganizacionalId
        FROM EstructuraOrganizacional hijo
        INNER JOIN EstructuraPermitida padre
            ON hijo.GrupoEstructuraOrganizacionalId = padre.EstructuraOrganizacionalId
        WHERE hijo.DenominacionId = @DenominacionId
          AND hijo.Estado = 1
    )
    SELECT DISTINCT
        i.IglesiaId,
        i.Nombre
    FROM Iglesias i
    INNER JOIN IglesiasEstructuras ie
        ON ie.IglesiaId = i.IglesiaId
       AND ie.DenominacionId = i.DenominacionId
    INNER JOIN EstructuraPermitida ep
        ON ep.EstructuraOrganizacionalId = ie.EstructuraId
    WHERE i.DenominacionId = @DenominacionId;
END

GO
/****** Object:  StoredProcedure [dbo].[usp_Usuarios_ObtenerIglesiasPermitidas_copia_14062026]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec usp_Usuarios_ObtenerIglesiasPermitidas 4, 1
CREATE PROCEDURE [dbo].[usp_Usuarios_ObtenerIglesiasPermitidas_copia_14062026]
(
    @UsuarioId INT,
    @DenominacionId INT
)
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH IglesiasUsuario AS
    (
        SELECT DISTINCT
            ui.IglesiaId,
            ie.EstructuraId
        FROM dbo.UsuariosIglesias ui
        INNER JOIN dbo.IglesiasEstructuras ie
            ON ie.IglesiaId = ui.IglesiaId
           AND ie.DenominacionId = ui.DenominacionId
        WHERE ui.UsuarioId = @UsuarioId
          AND ui.DenominacionId = @DenominacionId
          AND ui.Estado = 1
    ),
    EstructuraPermitida AS
    (
        SELECT
            eo.EstructuraOrganizacionalId,
            eo.Descripcion
        FROM dbo.EstructuraOrganizacional eo
        INNER JOIN IglesiasUsuario iu
            ON iu.EstructuraId = eo.EstructuraOrganizacionalId
        WHERE eo.DenominacionId = @DenominacionId
          AND eo.Estado = 1

        UNION ALL

        SELECT
            hijo.EstructuraOrganizacionalId,
            hijo.Descripcion
        FROM dbo.EstructuraOrganizacional hijo
        INNER JOIN EstructuraPermitida padre
            ON hijo.GrupoEstructuraOrganizacionalId = padre.EstructuraOrganizacionalId
        WHERE hijo.DenominacionId = @DenominacionId
          AND hijo.Estado = 1
    )
    SELECT DISTINCT
        i.IglesiaId,
        i.Nombre AS Iglesia,

        ie.EstructuraId,
        eo.Descripcion AS EstructuraOrganizacional,

        i.DenominacionId,
        i.Nombre,
        i.Slug,
        i.PersoneriaJuridica,
        i.PastorResponsableRegistroId,

        LTRIM(RTRIM(
            ISNULL(r.Nombres, '') + ' ' + ISNULL(r.Apellidos, '')
        )) AS PastorResponsable,

        i.PaisId,
        p.PaisNombre,

        i.DepartamentoId,
        d.DepartamentoNombre,

        i.CiudadId,
        c.CiudadNombre,

        i.CorregimientoId,
        co.CorregimientoNombre,

        CASE
            WHEN i.CorregimientoId IS NOT NULL 
                 AND co.CorregimientoNombre IS NOT NULL
                THEN co.CorregimientoNombre
            ELSE c.CiudadNombre
        END AS CiudadCorregimiento,

        i.Direccion,
        i.Telefono,
        i.Correo,
        i.Slogan,
        i.Activa,
        i.FechaCreacion,

        CASE 
            WHEN EXISTS (
                SELECT 1
                FROM dbo.Denominaciones de
                WHERE de.IglesiaPrincipalId = i.IglesiaId
                  AND de.DenominacionId = i.DenominacionId
            )
            THEN CAST(1 AS BIT)
            ELSE CAST(0 AS BIT)
        END AS EsDenominacion

    FROM dbo.Iglesias i

    INNER JOIN dbo.IglesiasEstructuras ie
        ON ie.IglesiaId = i.IglesiaId
       AND ie.DenominacionId = i.DenominacionId

    INNER JOIN EstructuraPermitida ep
        ON ep.EstructuraOrganizacionalId = ie.EstructuraId

    INNER JOIN dbo.EstructuraOrganizacional eo
        ON eo.EstructuraOrganizacionalId = ie.EstructuraId
       AND eo.DenominacionId = i.DenominacionId

    INNER JOIN dbo.Pais p
        ON p.PaisId = i.PaisId

    INNER JOIN dbo.Departamento d
        ON d.DepartamentoId = i.DepartamentoId

    INNER JOIN dbo.Ciudad c
        ON c.CiudadId = i.CiudadId

    LEFT JOIN dbo.Corregimiento co
        ON co.CorregimientoId = i.CorregimientoId

    LEFT JOIN dbo.Usuarios u
        ON u.UsuarioId = i.PastorResponsableRegistroId

    LEFT JOIN dbo.Registro r
        ON r.RegistroId = u.RegistroId

    WHERE i.DenominacionId = @DenominacionId

    ORDER BY i.Nombre ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[UspGetMenuPorUsuario]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC UspGetMenuPorUsuario 'sixto.jose@gmail.com'
CREATE PROCEDURE [dbo].[UspGetMenuPorUsuario]
    @Correo NVARCHAR(250)
AS
SELECT 
        m.MenuId,
        m.Descripcion,
        m.IdGrupo,
        m.Tipo,        
        m.Url,
        m.Imagen
        
FROM [dbo].[Usuarios] u
INNER JOIN [dbo].[Roles] r
	ON u.RolId = r.RolId
INNER JOIN [dbo].[Menu_rol] rm
	ON r.RolId = rm.RolId
INNER JOIN [dbo].[Menu] m
	ON rm.MenuId = m.MenuId
WHERE u.Correo = @Correo
AND m.Estado = 1
AND rm.Estado = 1

GO
/****** Object:  StoredProcedure [dbo].[UspGetParametrosbyNombreClase]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec UspGetParametrosbyNombreClase 1, 'Sexo'
CREATE PROCEDURE [dbo].[UspGetParametrosbyNombreClase]
(
    @DenominacionId INT = NULL,
    @NombreClase NVARCHAR(500) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        SELECT
            p.ParametroId,
            p.DenominacionId,
            p.ClaseId,
            p.Descripcion,
            p.Observacion,
            p.PadreParametroId,
            p.Estado
        FROM Parametro p        
        INNER JOIN Clase c ON p.ClaseId = c.ClaseId
        WHERE
        c.Descripcion = @NombreClase AND p.DenominacionId = @DenominacionId
        ORDER BY p.Descripcion ASC;
    END TRY
    BEGIN CATCH
        -- Retorna conjunto vacío para no romper el mapeo de Dapper
        SELECT
            CAST(NULL AS INT) AS ParametroId,
            CAST(NULL AS INT) AS DenominacionId,
            CAST(NULL AS INT) AS ClaseId,
            CAST(NULL AS NVARCHAR(255)) AS Descripcion,
            CAST(NULL AS NVARCHAR(500)) AS Observacion,
            CAST(NULL AS INT) AS PadreParametroId,
            CAST(NULL AS BIT) AS Estado
        WHERE 1 = 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[UspGetPastores]    Script Date: 20/09/2026 7:38:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UspGetPastores]
	@DenominacionId INT
AS
SELECT 
	u.UsuarioId,
	re.Nombres, 
	re.Apellidos, 
	re.Direccion, 
	re.Telefono, 
	re.Correo 
FROM UsuarioRoles ur
	INNER JOIN Usuarios u
	ON ur.UsuarioId = u.UsuarioId
	INNER JOIN Roles r
	ON ur.RolId = r.RolId
	INNER JOIN Registro re
	ON u.RegistroId = re.RegistroId
WHERE r.RolId in (SELECT RolId FROM Roles WHERE Nombre = 'Pastor') AND re.DenominacionId = @DenominacionId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'NOTA: Este campo debe ser cargado a partir de otra tabla, la cual debe ser la de Miembros.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EstructuraOrganizacional', @level2type=N'COLUMN',@level2name=N'Responsable'
GO
USE [master]
GO
ALTER DATABASE [db_ac376e_emuna360db] SET  READ_WRITE 
GO
