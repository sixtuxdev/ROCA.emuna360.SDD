IF COL_LENGTH('dbo.Iglesias', 'PastorResponsableRegistroId') IS NULL
BEGIN
    ALTER TABLE dbo.Iglesias
        ADD PastorResponsableRegistroId INT NULL;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Iglesias_Listar
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
        i.PaisId,
        i.DepartamentoId,
        i.CiudadId,
        i.CorregimientoId,
        i.Direccion,
        i.Telefono,
        i.Correo,
        i.Slogan,
        i.PastorResponsableRegistroId,
        LTRIM(RTRIM(CONCAT(r.Nombres, ' ', r.Apellidos))) AS PastorResponsable,
        i.Activa,
        i.FechaCreacion
    FROM dbo.Iglesias i
    LEFT JOIN dbo.Usuarios u
        ON u.UsuarioId = i.PastorResponsableRegistroId
       AND u.DenominacionId = i.DenominacionId
    LEFT JOIN dbo.Registro r
        ON r.RegistroId = u.RegistroId
       AND r.DenominacionId = u.DenominacionId
    WHERE i.DenominacionId = @DenominacionId
    ORDER BY i.Nombre;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Iglesias_Obtener
    @IglesiaId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (1)
        i.IglesiaId,
        i.DenominacionId,
        i.Nombre,
        i.Slug,
        i.PersoneriaJuridica,
        i.PaisId,
        i.DepartamentoId,
        i.CiudadId,
        i.CorregimientoId,
        i.Direccion,
        i.Telefono,
        i.Correo,
        i.Slogan,
        i.PastorResponsableRegistroId,
        LTRIM(RTRIM(CONCAT(r.Nombres, ' ', r.Apellidos))) AS PastorResponsable,
        i.Activa,
        i.FechaCreacion
    FROM dbo.Iglesias i
    LEFT JOIN dbo.Usuarios u
        ON u.UsuarioId = i.PastorResponsableRegistroId
       AND u.DenominacionId = i.DenominacionId
    LEFT JOIN dbo.Registro r
        ON r.RegistroId = u.RegistroId
       AND r.DenominacionId = u.DenominacionId
    WHERE i.IglesiaId = @IglesiaId
      AND i.DenominacionId = @DenominacionId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Iglesias_Insertar
    @DenominacionId INT,
    @Nombre NVARCHAR(250),
    @Slug NVARCHAR(250),
    @PersoneriaJuridica NVARCHAR(100) = NULL,
    @PaisId INT = NULL,
    @DepartamentoId INT = NULL,
    @CiudadId INT = NULL,
    @CorregimientoId INT = NULL,
    @Direccion NVARCHAR(500) = NULL,
    @Telefono NVARCHAR(50) = NULL,
    @Correo NVARCHAR(250) = NULL,
    @Slogan NVARCHAR(500) = NULL,
    @PastorResponsableRegistroId INT,
    @Activa BIT,
    @OutIglesiaId INT OUTPUT,
    @Resultado VARCHAR(20) OUTPUT,
    @Mensaje VARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF @PastorResponsableRegistroId IS NULL OR @PastorResponsableRegistroId <= 0
        BEGIN
            SET @OutIglesiaId = 0;
            SET @Resultado = 'Error';
            SET @Mensaje = 'El pastor responsable es obligatorio.';
            RETURN;
        END;

        INSERT INTO dbo.Iglesias
            (DenominacionId, Nombre, Slug, PersoneriaJuridica, PaisId, DepartamentoId, CiudadId,
             CorregimientoId, Direccion, Telefono, Correo, Slogan, PastorResponsableRegistroId,
             Activa, FechaCreacion)
        VALUES
            (@DenominacionId, @Nombre, @Slug, @PersoneriaJuridica, @PaisId, @DepartamentoId, @CiudadId,
             @CorregimientoId, @Direccion, @Telefono, @Correo, @Slogan, @PastorResponsableRegistroId,
             @Activa, SYSUTCDATETIME());

        SET @OutIglesiaId = CONVERT(INT, SCOPE_IDENTITY());
        SET @Resultado = 'Ok';
        SET @Mensaje = 'Iglesia creada correctamente.';
    END TRY
    BEGIN CATCH
        SET @OutIglesiaId = 0;
        SET @Resultado = 'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Iglesias_Actualizar
    @IglesiaId INT,
    @DenominacionId INT,
    @Nombre NVARCHAR(250),
    @Slug NVARCHAR(250),
    @PersoneriaJuridica NVARCHAR(100) = NULL,
    @PaisId INT = NULL,
    @DepartamentoId INT = NULL,
    @CiudadId INT = NULL,
    @CorregimientoId INT = NULL,
    @Direccion NVARCHAR(500) = NULL,
    @Telefono NVARCHAR(50) = NULL,
    @Correo NVARCHAR(250) = NULL,
    @Slogan NVARCHAR(500) = NULL,
    @PastorResponsableRegistroId INT,
    @Activa BIT,
    @Resultado VARCHAR(20) OUTPUT,
    @Mensaje VARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF @PastorResponsableRegistroId IS NULL OR @PastorResponsableRegistroId <= 0
        BEGIN
            SET @Resultado = 'Error';
            SET @Mensaje = 'El pastor responsable es obligatorio.';
            RETURN;
        END;

        UPDATE dbo.Iglesias
        SET Nombre = @Nombre,
            Slug = @Slug,
            PersoneriaJuridica = @PersoneriaJuridica,
            PaisId = @PaisId,
            DepartamentoId = @DepartamentoId,
            CiudadId = @CiudadId,
            CorregimientoId = @CorregimientoId,
            Direccion = @Direccion,
            Telefono = @Telefono,
            Correo = @Correo,
            Slogan = @Slogan,
            PastorResponsableRegistroId = @PastorResponsableRegistroId,
            Activa = @Activa
        WHERE IglesiaId = @IglesiaId
          AND DenominacionId = @DenominacionId;

        SET @Resultado = CASE WHEN @@ROWCOUNT > 0 THEN 'Ok' ELSE 'Error' END;
        SET @Mensaje = CASE WHEN @Resultado = 'Ok'
            THEN 'Iglesia actualizada correctamente.'
            ELSE 'No se encontro la iglesia.' END;
    END TRY
    BEGIN CATCH
        SET @Resultado = 'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO
