CREATE DATABASE Actividad37
GO

USE Actividad37
GO

/****** Object:  Table [dbo].[T_TURNOS]    Script Date: 02/05/2024 
14:05:32 ******/ 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
SET ANSI_PADDING ON 
GO 
CREATE TABLE [dbo].[T_TURNOS]( 
[id] [int] IDENTITY(1,1) NOT NULL, 
[fecha] [varchar](10) NULL, 
[hora] [varchar](5) NULL, 
[cliente] [varchar](100) NULL, 
CONSTRAINT [PK_T_TURNOS] PRIMARY KEY CLUSTERED  
( 
[id] ASC 
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, 
IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
ON [PRIMARY] 
) ON [PRIMARY] 
GO 
SET ANSI_PADDING OFF 
GO 
/****** Object:  Table [dbo].[T_SERVICIOS]    Script Date: 
02/05/2024 14:05:32 ******/ 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
SET ANSI_PADDING ON 
GO 
CREATE TABLE [dbo].[T_SERVICIOS]( 
[id] [int] NOT NULL, 
[nombre] [varchar](50) NOT NULL, 
[costo] [int] NOT NULL, 
[enPromocion] [varchar](1) NOT NULL, 
CONSTRAINT [PK_T_SERVICIOS] PRIMARY KEY CLUSTERED  
( 
[id] ASC 
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, 
IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
ON [PRIMARY] 
) ON [PRIMARY] 
GO 
SET ANSI_PADDING OFF 
GO 
INSERT [dbo].[T_SERVICIOS] ([id], [nombre], [costo], [enPromocion]) 
VALUES (1, N'Lavado de cabello', 500, N'N') 
INSERT [dbo].[T_SERVICIOS] ([id], [nombre], [costo], [enPromocion]) 
VALUES (2, N'Corte', 2000, N'S') 
INSERT [dbo].[T_SERVICIOS] ([id], [nombre], [costo], [enPromocion]) 
VALUES (3, N'Tintura', 3500, N'N') 
INSERT [dbo].[T_SERVICIOS] ([id], [nombre], [costo], [enPromocion]) 
VALUES (4, N'Alisado', 12000, N'N') 
INSERT [dbo].[T_SERVICIOS] ([id], [nombre], [costo], [enPromocion]) 
VALUES (5, N'Nutrición', 12500, N'S') 
INSERT [dbo].[T_SERVICIOS] ([id], [nombre], [costo], [enPromocion]) 
VALUES (6, N'Tratamiento de Keratina', 20000, N'N') 
/****** Object:  Table [dbo].[T_DETALLES_TURNO]    Script Date: 
02/05/2024 14:05:32 ******/ 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
SET ANSI_PADDING ON 
GO 
CREATE TABLE [dbo].[T_DETALLES_TURNO]( 
[id_turno] [int] NOT NULL, 
[id_servicio] [int] NOT NULL, 
[observaciones] [varchar](200) NULL, 
CONSTRAINT [PK_T_DETALLES_TURNO] PRIMARY KEY CLUSTERED  
( 
[id_turno] ASC, 
[id_servicio] ASC 
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, 
IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) 
ON [PRIMARY] 
) ON [PRIMARY] 
GO 
SET ANSI_PADDING OFF 
GO 
/****** Object:  StoredProcedure [dbo].[SP_INSERTAR_DETALLES]    
Script Date: 02/05/2024 14:05:30 ******/ 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE PROCEDURE [dbo].[SP_INSERTAR_DETALLES]  
@id_turno int, 
@id_servicio int,  
@observaciones varchar(200) 
AS 
BEGIN 
INSERT INTO T_DETALLES_TURNO(id_turno,id_servicio, observaciones) 
VALUES (@id_turno,@id_servicio, @observaciones); 
END 
GO 
/****** Object:  StoredProcedure [dbo].[SP_CONTAR_TURNOS]    Script 
Date: 02/05/2024 14:05:30 ******/ 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE PROCEDURE [dbo].[SP_CONTAR_TURNOS] 
@fecha VARCHAR(10), 
@hora VARCHAR(8), 
@ctd_turnos INT OUTPUT 
AS 
BEGIN 
SET NOCOUNT ON; 
SELECT @ctd_turnos = COUNT(*) 
FROM T_TURNOS 
WHERE fecha = @fecha AND hora = @hora; 
END; 
GO 
/****** Object:  StoredProcedure [dbo].[SP_CONSULTAR_SERVICIOS]    
Script Date: 02/05/2024 14:05:30 ******/ 
SET ANSI_NULLS ON 
GO 
SET QUOTED_IDENTIFIER ON 
GO 
CREATE PROCEDURE [dbo].[SP_CONSULTAR_SERVICIOS] 
AS 
BEGIN 
SELECT * from T_SERVICIOS ORDER BY 2; 
END 
GO