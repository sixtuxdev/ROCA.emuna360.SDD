CREATE OR ALTER PROCEDURE dbo.usp_Denominaciones_ObtenerPorDominio
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
    WHERE dd.Estado = 1
      AND
      (
          LOWER(
              CASE
                  WHEN RIGHT(LTRIM(RTRIM(dd.Dominio)), 1) = '.'
                      THEN LEFT(LTRIM(RTRIM(dd.Dominio)), LEN(LTRIM(RTRIM(dd.Dominio))) - 1)
                  ELSE LTRIM(RTRIM(dd.Dominio))
              END
          ) = @DominioNormalizado
          OR LOWER(
              CONCAT(
                  NULLIF(LTRIM(RTRIM(dd.Subdominio)), ''),
                  CASE WHEN NULLIF(LTRIM(RTRIM(dd.Subdominio)), '') IS NULL THEN '' ELSE '.' END,
                  CASE
                      WHEN RIGHT(LTRIM(RTRIM(dd.Dominio)), 1) = '.'
                          THEN LEFT(LTRIM(RTRIM(dd.Dominio)), LEN(LTRIM(RTRIM(dd.Dominio))) - 1)
                      ELSE LTRIM(RTRIM(dd.Dominio))
                  END
              )
          ) = @DominioNormalizado
      )
    ORDER BY dd.DenominacionDominioId;
END;
GO
