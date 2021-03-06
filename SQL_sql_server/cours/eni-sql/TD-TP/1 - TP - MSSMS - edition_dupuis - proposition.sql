USE [master]
GO
/****** Object:  Database [edition_dupuis_2]    Script Date: 17/09/2018 18:16:57 ******/
IF(db_id(N'edition_dupuis_2') IS NULL)
BEGIN
    CREATE DATABASE [edition_dupuis_2]
END;
GO
ALTER DATABASE [edition_dupuis_2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [edition_dupuis_2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
USE [edition_dupuis_2]
GO
/****** Object:  Schema [agences]    Script Date: 17/09/2018 18:16:57 ******/
CREATE SCHEMA [agences]
GO
/****** Object:  Table [dbo].[bureaux]    Script Date: 17/09/2018 18:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bureaux](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[ville] [varchar](50) NULL,
	[codepostal] [varchar](5) NULL,
	[gerant_id] [int] NULL,
 CONSTRAINT [PK_bureaux] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[gerants]    Script Date: 17/09/2018 18:16:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[gerants](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [varchar](50) NOT NULL,
	[prenom] [varchar](60) NOT NULL,
	[age] [int] NULL,
	[taille] [decimal](18, 2) NULL,
 CONSTRAINT [PK_gerants] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bureaux] ON 

INSERT [dbo].[bureaux] ([id], [nom], [ville], [codepostal], [gerant_id]) VALUES (1, N'Bureau 1', N'Paris', N'75000', 1)
INSERT [dbo].[bureaux] ([id], [nom], [ville], [codepostal], [gerant_id]) VALUES (2, N'Bureau 2', N'Vannes', N'56130', 1)
INSERT [dbo].[bureaux] ([id], [nom], [ville], [codepostal], [gerant_id]) VALUES (3, N'Bureau 3', NULL, N'44000', NULL)
INSERT [dbo].[bureaux] ([id], [nom], [ville], [codepostal], [gerant_id]) VALUES (4, N'Bureau 4', N'Niort', N'44000', NULL)
INSERT [dbo].[bureaux] ([id], [nom], [ville], [codepostal], [gerant_id]) VALUES (5, N'Bureau 44', N'Rennes', N'35000', NULL)
INSERT [dbo].[bureaux] ([id], [nom], [ville], [codepostal], [gerant_id]) VALUES (7, N'Bureau 444', N'Paris', N'75070', 4)
INSERT [dbo].[bureaux] ([id], [nom], [ville], [codepostal], [gerant_id]) VALUES (8, N'Bureau 6', N'Brest', N'29200', 4)
SET IDENTITY_INSERT [dbo].[bureaux] OFF
SET IDENTITY_INSERT [dbo].[gerants] ON 

INSERT [dbo].[gerants] ([id], [nom], [prenom], [age], [taille]) VALUES (1, N'Lagaffe', N'Gaston', 32, NULL)
INSERT [dbo].[gerants] ([id], [nom], [prenom], [age], [taille]) VALUES (2, N'Dupuis', N'Anne', NULL, NULL)
INSERT [dbo].[gerants] ([id], [nom], [prenom], [age], [taille]) VALUES (3, N'Fantasio', N'Doisy', 35, CAST(1.80 AS Decimal(18, 2)))
INSERT [dbo].[gerants] ([id], [nom], [prenom], [age], [taille]) VALUES (4, N'Lebrac', N'George', 23, CAST(1.32 AS Decimal(18, 2)))
INSERT [dbo].[gerants] ([id], [nom], [prenom], [age], [taille]) VALUES (6, N'inconnuName', N'inconnuLastName', 32, CAST(1.65 AS Decimal(18, 2)))
INSERT [dbo].[gerants] ([id], [nom], [prenom], [age], [taille]) VALUES (7, N'Spirou', N'Roger', 45, CAST(1.72 AS Decimal(18, 2)))
INSERT [dbo].[gerants] ([id], [nom], [prenom], [age], [taille]) VALUES (8, N'Prunelle', N'Amélie', 32, CAST(1.78 AS Decimal(18, 2)))
INSERT [dbo].[gerants] ([id], [nom], [prenom], [age], [taille]) VALUES (9, N'Prunelle2', N'Sophie', 31, CAST(1.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[gerants] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_bureaux]    Script Date: 17/09/2018 18:16:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_bureaux] ON [dbo].[bureaux]
(
	[nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_bureaux_1]    Script Date: 17/09/2018 18:16:57 ******/
CREATE NONCLUSTERED INDEX [IX_bureaux_1] ON [dbo].[bureaux]
(
	[ville] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_gerants]    Script Date: 17/09/2018 18:16:57 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_gerants] ON [dbo].[gerants]
(
	[nom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[bureaux] ADD  CONSTRAINT [DF_bureaux_codepostal]  DEFAULT ((44000)) FOR [codepostal]
GO
ALTER TABLE [dbo].[bureaux]  WITH CHECK ADD  CONSTRAINT [FK_bureaux_gerants] FOREIGN KEY([gerant_id])
REFERENCES [dbo].[gerants] ([id])
GO
ALTER TABLE [dbo].[bureaux] CHECK CONSTRAINT [FK_bureaux_gerants]
GO
USE [master]
GO
ALTER DATABASE [edition_dupuis_2] SET  READ_WRITE 
GO
