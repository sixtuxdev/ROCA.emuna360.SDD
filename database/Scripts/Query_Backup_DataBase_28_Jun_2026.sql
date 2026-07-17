USE [db_ac376e_emuna360db]
GO
SET IDENTITY_INSERT [dbo].[Denominaciones] ON 
GO
INSERT [dbo].[Denominaciones] ([DenominacionId], [Nombre], [Slug], [Activa], [IglesiaPrincipalId], [FechaCreacion]) VALUES (1, N'Iglesia de Dios Guiada por el Espiritu Santo (IDGES)', N'IDGES', 1, 1, CAST(N'2026-05-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Denominaciones] ([DenominacionId], [Nombre], [Slug], [Activa], [IglesiaPrincipalId], [FechaCreacion]) VALUES (2, N'Iglesia Cristiana Centro Bíblico SHELEMUT', N'CBS', 1, 57, CAST(N'2026-06-12T18:34:08.657' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Denominaciones] OFF
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
SET IDENTITY_INSERT [dbo].[Clase] OFF
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
SET IDENTITY_INSERT [dbo].[Parametro] OFF
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
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (4, 1, 1, N'calyjuan@gmail.com', N'$2a$11$sQYa3hG68c34gfxK2UgDOursQSho624D77h/uc.fk8inBSdLMKyzq', 1, 0, CAST(N'2026-05-11T01:33:04.0000000' AS DateTime2), CAST(N'2026-06-27T10:09:56.0000000' AS DateTime2), N'A2D89F2B-FAD4-4FE7-BE88-D57CB073B433', 2)
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
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (66, 2, 65, N'fe.integridad@gmail.com', N'$2a$11$fuJHqWd5Z6YeuAFF1EAjCOw4Kn2XL691fIxkp7BJargzzduMspX8e', 1, 0, CAST(N'2026-06-13T19:02:07.0000000' AS DateTime2), CAST(N'2026-06-27T10:17:25.0000000' AS DateTime2), N'BF010439-6C95-43C0-9815-9D0B0460E029', 11)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (67, 2, 66, N'aidamadrigalv@gmail.com', N'$2a$11$M9zQCQGHV4thCRbsynVM6.bqxmoq.Ke944bn7ooa0zHVpQZL0ExMO', 1, 0, CAST(N'2026-06-25T13:36:48.0000000' AS DateTime2), NULL, N'E2C566D6-B8F6-4228-95E5-AE4841F4AB72', 13)
GO
INSERT [dbo].[Usuarios] ([UsuarioId], [DenominacionId], [RegistroId], [Correo], [PasswordHash], [EmailVerificado], [Bloqueado], [FechaCreacion], [UltimoLogin], [SecurityStamp], [RolId]) VALUES (68, 2, 67, N'92257775', N'$2a$11$SvtfmpJWYLcbNJ2G2F/oDORmmB7H3Vk6bu01MMe7h24.ubKQGKC2a', 0, 0, CAST(N'2026-06-26T14:19:29.0000000' AS DateTime2), NULL, N'37E2B2FC-DDAE-4D6B-9FF7-4764F2EF6A2D', 13)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioRoles] ON 
GO
INSERT [dbo].[UsuarioRoles] ([UsuarioRolId], [UsuarioId], [DenominacionId], [IglesiaId], [RolId], [FechaCreacion]) VALUES (1, 4, 1, 1, 2, CAST(N'2026-05-11T20:40:15.0000000' AS DateTime2))
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
SET IDENTITY_INSERT [dbo].[UsuarioRoles] OFF
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
SET IDENTITY_INSERT [dbo].[UsuariosIglesias] OFF
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
INSERT [dbo].[Menu] ([MenuId], [DenominacionId], [Descripcion], [IdGrupo], [Tipo], [Estado], [Url], [Imagen], [Fecha], [Orden], [NuevaVentana]) VALUES (6, 1, N'Registro', 4, N'S', 1, N'/registro', N'Deck', CAST(N'2026-05-30T19:56:47.410' AS DateTime), 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
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
SET IDENTITY_INSERT [dbo].[TokensRefresh] OFF
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
SET IDENTITY_INSERT [dbo].[Menu_Usuario] OFF
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
SET IDENTITY_INSERT [dbo].[Menu_rol] OFF
GO
SET IDENTITY_INSERT [dbo].[DenominacionesDominios] ON 
GO
INSERT [dbo].[DenominacionesDominios] ([DenominacionDominioId], [DenominacionId], [Dominio], [Subdominio], [Estado], [FechaCreacion]) VALUES (1, 1, N'https://www.emuna360.net', N'idges.emuna360.net', 1, CAST(N'2026-06-13T13:54:50.563' AS DateTime))
GO
INSERT [dbo].[DenominacionesDominios] ([DenominacionDominioId], [DenominacionId], [Dominio], [Subdominio], [Estado], [FechaCreacion]) VALUES (2, 2, N'https://www.emuna360.net', N'cbs.emuna360.net', 1, CAST(N'2026-06-13T13:57:20.200' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[DenominacionesDominios] OFF
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
SET IDENTITY_INSERT [dbo].[Pais] ON 
GO
INSERT [dbo].[Pais] ([PaisId], [PaisNombre], [Descripcion], [Estado], [FechaCreacion]) VALUES (1, N'Colombia', NULL, 1, CAST(N'2026-05-06T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
