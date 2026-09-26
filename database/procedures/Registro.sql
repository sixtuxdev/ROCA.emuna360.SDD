SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_PADDING ON;
SET ANSI_WARNINGS ON;
SET ARITHABORT ON;
SET CONCAT_NULL_YIELDS_NULL ON;
SET NUMERIC_ROUNDABORT OFF;
SET XACT_ABORT ON;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    IF OBJECT_ID(N'dbo.Registro', N'U') IS NULL
        THROW 50000, 'No existe la tabla dbo.Registro.', 1;

    IF COL_LENGTH(N'dbo.Registro', N'Aprobado') IS NULL
    BEGIN
        -- Los registros existentes ya formaban parte del sistema y se consideran aprobados.
        -- El valor predeterminado se cambia a 0 antes de confirmar la migracion.
        ALTER TABLE dbo.Registro
            ADD Aprobado BIT NOT NULL
                CONSTRAINT DF_Registro_Aprobado DEFAULT ((1)) WITH VALUES;
    END
    ELSE IF EXISTS
    (
        SELECT 1
        FROM sys.columns
        WHERE object_id = OBJECT_ID(N'dbo.Registro')
          AND name = N'Aprobado'
          AND is_nullable = 1
    )
    BEGIN
        UPDATE dbo.Registro
        SET Aprobado = 1
        WHERE Aprobado IS NULL;

        ALTER TABLE dbo.Registro
            ALTER COLUMN Aprobado BIT NOT NULL;
    END;

    DECLARE @DefaultConstraintName SYSNAME;
    DECLARE @DefaultDefinition NVARCHAR(4000);

    SELECT
        @DefaultConstraintName = dc.name,
        @DefaultDefinition = dc.definition
    FROM sys.default_constraints dc
    INNER JOIN sys.columns c
        ON c.object_id = dc.parent_object_id
       AND c.column_id = dc.parent_column_id
    WHERE dc.parent_object_id = OBJECT_ID(N'dbo.Registro')
      AND c.name = N'Aprobado';

    IF @DefaultConstraintName IS NOT NULL
       AND REPLACE(REPLACE(REPLACE(@DefaultDefinition, N'(', N''), N')', N''), N' ', N'') <> N'0'
    BEGIN
        DECLARE @DropDefaultSql NVARCHAR(500);

        SET @DropDefaultSql =
            N'ALTER TABLE dbo.Registro DROP CONSTRAINT '
            + QUOTENAME(@DefaultConstraintName)
            + N';';

        EXEC sys.sp_executesql @DropDefaultSql;

        SET @DefaultConstraintName = NULL;
    END;

    IF @DefaultConstraintName IS NULL
    BEGIN
        ALTER TABLE dbo.Registro
            ADD CONSTRAINT DF_Registro_Aprobado
                DEFAULT ((0)) FOR Aprobado;
    END;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;

    THROW;
END CATCH;
GO

DECLARE @PendingIndexId INT;

SELECT @PendingIndexId = index_id
FROM sys.indexes
WHERE object_id = OBJECT_ID(N'dbo.Registro')
  AND name = N'IX_Registro_Pendientes_Denominacion';

IF @PendingIndexId IS NULL
BEGIN
    CREATE NONCLUSTERED INDEX IX_Registro_Pendientes_Denominacion
        ON dbo.Registro (DenominacionId, Aprobado)
        INCLUDE (ParametroIdTipoDocumento, Documento, Nombres, Apellidos, Telefono)
        WHERE Aprobado = 0;
END
ELSE IF INDEXPROPERTY(
            OBJECT_ID(N'dbo.Registro'),
            N'IX_Registro_Pendientes_Denominacion',
            N'IsDisabled') = 1
    OR INDEXPROPERTY(
            OBJECT_ID(N'dbo.Registro'),
            N'IX_Registro_Pendientes_Denominacion',
            N'IsUnique') <> 0
    OR ISNULL(INDEX_COL(N'dbo.Registro', @PendingIndexId, 1), N'') <> N'DenominacionId'
    OR ISNULL(INDEX_COL(N'dbo.Registro', @PendingIndexId, 2), N'') <> N'Aprobado'
    OR INDEX_COL(N'dbo.Registro', @PendingIndexId, 3) IS NOT NULL
    OR NOT EXISTS
    (
        SELECT 1
        FROM sys.indexes
        WHERE object_id = OBJECT_ID(N'dbo.Registro')
          AND name = N'IX_Registro_Pendientes_Denominacion'
          AND UPPER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
              ISNULL(filter_definition, N''), N'[', N''), N']', N''), N'(', N''), N')', N''), N' ', N''))
              = N'APROBADO=0'
    )
BEGIN
    THROW 50002, 'El índice IX_Registro_Pendientes_Denominacion existe con una definición incompatible.', 1;
END;
GO

DECLARE @UniqueDocumentoIndexId INT;

SELECT @UniqueDocumentoIndexId = index_id
FROM sys.indexes
WHERE object_id = OBJECT_ID(N'dbo.Registro')
  AND name = N'UX_Registro_Denominacion_Documento';

IF @UniqueDocumentoIndexId IS NULL
BEGIN
    IF EXISTS
    (
        SELECT 1
        FROM dbo.Registro
        WHERE DenominacionId IS NOT NULL
        GROUP BY DenominacionId, Documento
        HAVING COUNT_BIG(*) > 1
    )
        THROW 50001, 'Existen documentos duplicados por denominación. Corríjalos antes de crear el índice único.', 1;

    CREATE UNIQUE NONCLUSTERED INDEX UX_Registro_Denominacion_Documento
        ON dbo.Registro (DenominacionId, Documento)
        WHERE DenominacionId IS NOT NULL;
END
ELSE IF INDEXPROPERTY(
            OBJECT_ID(N'dbo.Registro'),
            N'UX_Registro_Denominacion_Documento',
            N'IsUnique') <> 1
    OR INDEXPROPERTY(
            OBJECT_ID(N'dbo.Registro'),
            N'UX_Registro_Denominacion_Documento',
            N'IsDisabled') = 1
    OR ISNULL(INDEX_COL(N'dbo.Registro', @UniqueDocumentoIndexId, 1), N'') <> N'DenominacionId'
    OR ISNULL(INDEX_COL(N'dbo.Registro', @UniqueDocumentoIndexId, 2), N'') <> N'Documento'
    OR INDEX_COL(N'dbo.Registro', @UniqueDocumentoIndexId, 3) IS NOT NULL
    OR NOT EXISTS
    (
        SELECT 1
        FROM sys.indexes
        WHERE object_id = OBJECT_ID(N'dbo.Registro')
          AND name = N'UX_Registro_Denominacion_Documento'
          AND UPPER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(
              ISNULL(filter_definition, N''), N'[', N''), N']', N''), N'(', N''), N')', N''), N' ', N''))
              = N'DENOMINACIONIDISNOTNULL'
    )
BEGIN
    THROW 50003, 'El índice UX_Registro_Denominacion_Documento existe con una definición incompatible.', 1;
END;
GO

CREATE OR ALTER PROCEDURE dbo.sp_auth_obtener_roles_usuario
    @DenominacionId INT,
    @UsuarioId INT
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH UsuarioActual AS
    (
        SELECT UsuarioId, RolId
        FROM dbo.Usuarios
        WHERE UsuarioId = @UsuarioId
          AND DenominacionId = @DenominacionId
          AND Bloqueado = 0
    ),
    RolesAsignados AS
    (
        SELECT RolId
        FROM UsuarioActual

        UNION

        SELECT ur.RolId
        FROM dbo.UsuarioRoles ur
        INNER JOIN UsuarioActual u
            ON u.UsuarioId = ur.UsuarioId
        WHERE ur.DenominacionId = @DenominacionId
          AND ur.RolId IS NOT NULL
    )
    SELECT
        r.RolId,
        r.Nombre,
        r.Codigo
    FROM RolesAsignados ra
    INNER JOIN dbo.Roles r
        ON r.RolId = ra.RolId
       AND r.DenominacionId = @DenominacionId
    WHERE r.Activo = 1
    ORDER BY r.RolId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Registro_Insertar
    @DenominacionId INT,
    @IglesiaId INT,
    @Nombres NVARCHAR(250),
    @Apellidos NVARCHAR(250),
    @ParametroIdTipoDocumento INT,
    @Documento NVARCHAR(50),
    @PaisId INT,
    @DepartamentoId INT,
    @CiudadId INT,
    @CorregimientoId INT,
    @Direccion NVARCHAR(550),
    @Correo NVARCHAR(500) = NULL,
    @Telefono NVARCHAR(20) = NULL,
    @ParametroIdSexo INT,
    @Interno BIT,
    @ParametroIdInteres INT,
    @OutRegistroId INT OUTPUT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    SET @OutRegistroId = NULL;

    BEGIN TRY
        IF ISNULL(@DenominacionId, 0) <= 0
        BEGIN
            SET @Resultado = N'Error';
            SET @Mensaje = N'La denominación es obligatoria.';
            RETURN;
        END;

        IF EXISTS
        (
            SELECT 1
            FROM dbo.Registro
            WHERE Documento = @Documento
              AND DenominacionId = @DenominacionId
        )
        BEGIN
            SET @OutRegistroId = NULL;
            SET @Resultado = N'Duplicado';
            SET @Mensaje = N'Ya existe un registro con el mismo documento para esta denominación.';
            RETURN;
        END;

        INSERT INTO dbo.Registro
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
            ParametroIdInteres,
            Aprobado
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
            @ParametroIdInteres,
            0
        );

        SET @OutRegistroId = CONVERT(INT, SCOPE_IDENTITY());
        SET @Resultado = N'Ok';
        SET @Mensaje = N'Registro creado correctamente.';
    END TRY
    BEGIN CATCH
        SET @OutRegistroId = NULL;

        IF ERROR_NUMBER() IN (2601, 2627)
        BEGIN
            SET @Resultado = N'Duplicado';
            SET @Mensaje = N'Ya existe un registro con el mismo documento para esta denominación.';
        END
        ELSE
        BEGIN
            SET @Resultado = N'Error';
            SET @Mensaje = ERROR_MESSAGE();
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Registro_Actualizar
    @RegistroId INT,
    @DenominacionId INT,
    @IglesiaId INT,
    @Nombres NVARCHAR(250),
    @Apellidos NVARCHAR(250),
    @ParametroIdTipoDocumento INT,
    @Documento NVARCHAR(50),
    @PaisId INT,
    @DepartamentoId INT,
    @CiudadId INT,
    @CorregimientoId INT,
    @Direccion NVARCHAR(550),
    @Correo NVARCHAR(500) = NULL,
    @Telefono NVARCHAR(20) = NULL,
    @ParametroIdSexo INT,
    @Interno BIT,
    @ParametroIdInteres INT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        IF ISNULL(@DenominacionId, 0) <= 0
        BEGIN
            SET @Resultado = N'Error';
            SET @Mensaje = N'La denominación es obligatoria.';
            RETURN;
        END;

        IF NOT EXISTS
        (
            SELECT 1
            FROM dbo.Registro
            WHERE RegistroId = @RegistroId
              AND DenominacionId = @DenominacionId
        )
        BEGIN
            SET @Resultado = N'NoExiste';
            SET @Mensaje = N'El registro no existe o no pertenece a la denominación actual.';
            RETURN;
        END;

        IF EXISTS
        (
            SELECT 1
            FROM dbo.Registro
            WHERE Documento = @Documento
              AND DenominacionId = @DenominacionId
              AND RegistroId <> @RegistroId
        )
        BEGIN
            SET @Resultado = N'Duplicado';
            SET @Mensaje = N'Ya existe otro registro con el mismo documento para esta denominación.';
            RETURN;
        END;

        UPDATE dbo.Registro
        SET IglesiaId = @IglesiaId,
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
            Interno = @Interno,
            ParametroIdInteres = @ParametroIdInteres
        WHERE RegistroId = @RegistroId
          AND DenominacionId = @DenominacionId;

        IF @@ROWCOUNT = 0
        BEGIN
            SET @Resultado = N'NoExiste';
            SET @Mensaje = N'El registro no existe o no pertenece a la denominación actual.';
            RETURN;
        END;

        SET @Resultado = N'Ok';
        SET @Mensaje = N'Registro actualizado correctamente.';
    END TRY
    BEGIN CATCH
        IF ERROR_NUMBER() IN (2601, 2627)
        BEGIN
            SET @Resultado = N'Duplicado';
            SET @Mensaje = N'Ya existe otro registro con el mismo documento para esta denominación.';
        END
        ELSE
        BEGIN
            SET @Resultado = N'Error';
            SET @Mensaje = ERROR_MESSAGE();
        END;
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Registro_Eliminar
    @RegistroId INT,
    @DenominacionId INT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        DELETE FROM dbo.Registro
        WHERE RegistroId = @RegistroId
          AND DenominacionId = @DenominacionId;

        IF @@ROWCOUNT = 0
        BEGIN
            SET @Resultado = N'NoExiste';
            SET @Mensaje = N'El registro no existe o no pertenece a la denominación actual.';
            RETURN;
        END;

        SET @Resultado = N'Ok';
        SET @Mensaje = N'Registro eliminado correctamente.';
    END TRY
    BEGIN CATCH
        SET @Resultado = N'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Registro_Listar
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
        ParametroIdInteres,
        Aprobado
    FROM dbo.Registro
    WHERE DenominacionId = @DenominacionId
    ORDER BY Nombres, Apellidos;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Registro_ListarPorIglesia
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
        ParametroIdInteres,
        Aprobado
    FROM dbo.Registro
    WHERE DenominacionId = @DenominacionId
      AND IglesiaId = @IglesiaId
    ORDER BY RegistroId ASC;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Registro_Obtener
    @RegistroId INT,
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
        ParametroIdInteres,
        Aprobado
    FROM dbo.Registro
    WHERE RegistroId = @RegistroId
      AND DenominacionId = @DenominacionId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Registro_ListarPendientes
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        r.RegistroId,
        COALESCE(td.Descripcion, N'') AS TipoDocumento,
        r.Documento,
        r.Nombres,
        r.Apellidos,
        r.Telefono
    FROM dbo.Registro r
    LEFT JOIN dbo.Parametro td
        ON td.ParametroId = r.ParametroIdTipoDocumento
       AND td.DenominacionId = r.DenominacionId
    WHERE r.DenominacionId = @DenominacionId
      AND r.Aprobado = 0
    ORDER BY r.RegistroId DESC;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_Registro_Aprobar
    @RegistroId INT,
    @DenominacionId INT,
    @Resultado NVARCHAR(20) OUTPUT,
    @Mensaje NVARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE dbo.Registro
        SET Aprobado = 1
        WHERE RegistroId = @RegistroId
          AND DenominacionId = @DenominacionId
          AND Aprobado = 0;

        IF @@ROWCOUNT = 1
        BEGIN
            SET @Resultado = N'Ok';
            SET @Mensaje = N'Registro aprobado correctamente.';
            RETURN;
        END;

        IF EXISTS
        (
            SELECT 1
            FROM dbo.Registro
            WHERE RegistroId = @RegistroId
              AND DenominacionId = @DenominacionId
              AND Aprobado = 1
        )
        BEGIN
            SET @Resultado = N'Ok';
            SET @Mensaje = N'El registro ya se encontraba aprobado.';
            RETURN;
        END;

        SET @Resultado = N'NoExiste';
        SET @Mensaje = N'El registro no existe o no pertenece a la denominación actual.';
    END TRY
    BEGIN CATCH
        SET @Resultado = N'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH;
END;
GO
