CREATE OR ALTER PROCEDURE dbo.UspGetPastores
    @DenominacionId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        u.UsuarioId,
        r.Nombres,
        r.Apellidos,
        r.Direccion,
        r.Telefono,
        COALESCE(r.Correo, u.Correo) AS Correo
    FROM dbo.Usuarios u
    INNER JOIN dbo.Registro r
        ON r.RegistroId = u.RegistroId
       AND r.DenominacionId = u.DenominacionId
    LEFT JOIN dbo.UsuarioRoles ur
        ON ur.UsuarioId = u.UsuarioId
       AND ur.DenominacionId = u.DenominacionId
    LEFT JOIN dbo.Roles rolPrincipal
        ON rolPrincipal.RolId = u.RolId
       AND rolPrincipal.DenominacionId = u.DenominacionId
    LEFT JOIN dbo.Roles rolAdicional
        ON rolAdicional.RolId = ur.RolId
       AND rolAdicional.DenominacionId = u.DenominacionId
    WHERE u.DenominacionId = @DenominacionId
      AND u.Bloqueado = 0
      AND (
          rolPrincipal.Nombre = 'Pastor'
          OR rolPrincipal.Codigo = 'Pastor'
          OR rolPrincipal.Codigo = 'PASTOR'
          OR rolAdicional.Nombre = 'Pastor'
          OR rolAdicional.Codigo = 'Pastor'
          OR rolAdicional.Codigo = 'PASTOR'
      )
    ORDER BY r.Nombres, r.Apellidos;
END;
GO
