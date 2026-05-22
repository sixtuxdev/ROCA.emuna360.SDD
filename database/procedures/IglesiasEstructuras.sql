CREATE OR ALTER PROCEDURE dbo.usp_IglesiasEstructuras_Listar
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        IglesiaEstructurasId,
        IglesiaId,
        DenominacionId,
        EstructuraId,
        FechaAsignacion
    FROM dbo.IglesiasEstructuras
    WHERE DenominacionId = @DenominacionId
    ORDER BY IglesiaId, FechaAsignacion DESC;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_IglesiasEstructuras_ListarPorIglesia
    @IglesiaId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        IglesiaEstructurasId,
        IglesiaId,
        DenominacionId,
        EstructuraId,
        FechaAsignacion
    FROM dbo.IglesiasEstructuras
    WHERE IglesiaId = @IglesiaId
      AND DenominacionId = @DenominacionId
    ORDER BY FechaAsignacion DESC, IglesiaEstructurasId DESC;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_IglesiasEstructuras_Obtener
    @IglesiaEstructurasId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (1)
        IglesiaEstructurasId,
        IglesiaId,
        DenominacionId,
        EstructuraId,
        FechaAsignacion
    FROM dbo.IglesiasEstructuras
    WHERE IglesiaEstructurasId = @IglesiaEstructurasId
      AND DenominacionId = @DenominacionId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_IglesiasEstructuras_ObtenerPorIglesia
    @IglesiaId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT TOP (1)
        IglesiaEstructurasId,
        IglesiaId,
        DenominacionId,
        EstructuraId,
        FechaAsignacion
    FROM dbo.IglesiasEstructuras
    WHERE IglesiaId = @IglesiaId
      AND DenominacionId = @DenominacionId
    ORDER BY FechaAsignacion DESC, IglesiaEstructurasId DESC;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_IglesiasEstructuras_Insertar
    @DenominacionId INT,
    @IglesiaId INT,
    @EstructuraId INT,
    @FechaAsignacion DATETIME2,
    @OutIglesiaEstructurasId INT OUTPUT,
    @Resultado VARCHAR(20) OUTPUT,
    @Mensaje VARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        INSERT INTO dbo.IglesiasEstructuras
            (IglesiaId, DenominacionId, EstructuraId, FechaAsignacion)
        VALUES
            (@IglesiaId, @DenominacionId, @EstructuraId, @FechaAsignacion);

        SET @OutIglesiaEstructurasId = CONVERT(INT, SCOPE_IDENTITY());
        SET @Resultado = 'Ok';
        SET @Mensaje = 'Relacion iglesia-estructura creada correctamente.';
    END TRY
    BEGIN CATCH
        SET @OutIglesiaEstructurasId = 0;
        SET @Resultado = 'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_IglesiasEstructuras_Actualizar
    @IglesiaEstructurasId INT,
    @DenominacionId INT,
    @IglesiaId INT,
    @EstructuraId INT,
    @FechaAsignacion DATETIME2,
    @Resultado VARCHAR(20) OUTPUT,
    @Mensaje VARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        UPDATE dbo.IglesiasEstructuras
        SET IglesiaId = @IglesiaId,
            EstructuraId = @EstructuraId,
            FechaAsignacion = @FechaAsignacion
        WHERE IglesiaEstructurasId = @IglesiaEstructurasId
          AND DenominacionId = @DenominacionId;

        SET @Resultado = CASE WHEN @@ROWCOUNT > 0 THEN 'Ok' ELSE 'Error' END;
        SET @Mensaje = CASE WHEN @Resultado = 'Ok'
            THEN 'Relacion iglesia-estructura actualizada correctamente.'
            ELSE 'No se encontro la relacion iglesia-estructura.' END;
    END TRY
    BEGIN CATCH
        SET @Resultado = 'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_IglesiasEstructuras_GuardarPorIglesia
    @DenominacionId INT,
    @IglesiaId INT,
    @EstructuraId INT,
    @FechaAsignacion DATETIME2,
    @Resultado VARCHAR(20) OUTPUT,
    @Mensaje VARCHAR(4000) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    SET XACT_ABORT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @IglesiaEstructurasId INT;

        SELECT TOP (1)
            @IglesiaEstructurasId = IglesiaEstructurasId
        FROM dbo.IglesiasEstructuras WITH (UPDLOCK, HOLDLOCK)
        WHERE IglesiaId = @IglesiaId
          AND DenominacionId = @DenominacionId
        ORDER BY FechaAsignacion DESC, IglesiaEstructurasId DESC;

        IF @IglesiaEstructurasId IS NULL
        BEGIN
            INSERT INTO dbo.IglesiasEstructuras
                (IglesiaId, DenominacionId, EstructuraId, FechaAsignacion)
            VALUES
                (@IglesiaId, @DenominacionId, @EstructuraId, @FechaAsignacion);
        END
        ELSE
        BEGIN
            UPDATE dbo.IglesiasEstructuras
            SET EstructuraId = @EstructuraId,
                FechaAsignacion = @FechaAsignacion
            WHERE IglesiaEstructurasId = @IglesiaEstructurasId
              AND DenominacionId = @DenominacionId;

            DELETE FROM dbo.IglesiasEstructuras
            WHERE IglesiaId = @IglesiaId
              AND DenominacionId = @DenominacionId
              AND IglesiaEstructurasId <> @IglesiaEstructurasId;
        END

        COMMIT TRANSACTION;

        SET @Resultado = 'Ok';
        SET @Mensaje = 'Relacion iglesia-estructura guardada correctamente.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        SET @Resultado = 'Error';
        SET @Mensaje = ERROR_MESSAGE();
    END CATCH
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_IglesiasEstructuras_Eliminar
    @IglesiaEstructurasId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.IglesiasEstructuras
    WHERE IglesiaEstructurasId = @IglesiaEstructurasId
      AND DenominacionId = @DenominacionId;
END;
GO

CREATE OR ALTER PROCEDURE dbo.usp_IglesiasEstructuras_EliminarPorIglesia
    @IglesiaId INT,
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.IglesiasEstructuras
    WHERE IglesiaId = @IglesiaId
      AND DenominacionId = @DenominacionId;
END;
GO
