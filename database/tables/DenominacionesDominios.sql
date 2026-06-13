IF OBJECT_ID('dbo.DenominacionesDominios', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.DenominacionesDominios
    (
        DenominacionDominioId INT IDENTITY(1,1) NOT NULL
            CONSTRAINT PK_DenominacionesDominios PRIMARY KEY,
        DenominacionId INT NOT NULL,
        Dominio NVARCHAR(250) NOT NULL,
        Subdominio NVARCHAR(150) NULL,
        Estado BIT NOT NULL
            CONSTRAINT DF_DenominacionesDominios_Estado DEFAULT (1),
        FechaCreacion DATETIME NOT NULL
            CONSTRAINT DF_DenominacionesDominios_FechaCreacion DEFAULT (GETDATE()),
        CONSTRAINT FK_DenominacionesDominios_Denominaciones
            FOREIGN KEY (DenominacionId) REFERENCES dbo.Denominaciones(DenominacionId)
    );
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.indexes
    WHERE name = 'UX_DenominacionesDominios_Dominio_Subdominio_Activo'
      AND object_id = OBJECT_ID('dbo.DenominacionesDominios')
)
BEGIN
    CREATE UNIQUE INDEX UX_DenominacionesDominios_Dominio_Subdominio_Activo
        ON dbo.DenominacionesDominios(Dominio, Subdominio)
        WHERE Estado = 1;
END;
GO
