USE [BugTrack]
GO
SET IDENTITY_INSERT [dbo].[T_Project] ON 

INSERT [dbo].[T_Project] ([id], [name], [version], [startDate]) VALUES (3, N'TestReport', N'1.0', CAST(0x0000A1A400000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Project] OFF
SET IDENTITY_INSERT [dbo].[T_Bug] ON 

INSERT [dbo].[T_Bug] ([id], [title], [idProject], [Type], [Description], [CreateDate]) VALUES (2, N'burtest', 3, 1, N'un bug quelconque', CAST(0x0000A1A400000000 AS DateTime))
INSERT [dbo].[T_Bug] ([id], [title], [idProject], [Type], [Description], [CreateDate]) VALUES (3, N'test2', 3, 1, N'un second bug', CAST(0x0000A1A900000000 AS DateTime))
INSERT [dbo].[T_Bug] ([id], [title], [idProject], [Type], [Description], [CreateDate]) VALUES (4, N'test3', 3, 1, N'un troisieme', CAST(0x0000A1A900000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Bug] OFF
SET IDENTITY_INSERT [dbo].[T_User] ON 

INSERT [dbo].[T_User] ([id], [name], [firstname], [email], [phone], [password]) VALUES (2, N'titi', N'toto', N'toto@orange.fr', N'023565', N't@t@')
SET IDENTITY_INSERT [dbo].[T_User] OFF
SET IDENTITY_INSERT [dbo].[T_Comment] ON 

INSERT [dbo].[T_Comment] ([id], [idUser], [idBug], [details]) VALUES (2, 2, 2, N'com1')
INSERT [dbo].[T_Comment] ([id], [idUser], [idBug], [details]) VALUES (3, 2, 2, N'com2')
INSERT [dbo].[T_Comment] ([id], [idUser], [idBug], [details]) VALUES (5, 2, 2, N'com3')
SET IDENTITY_INSERT [dbo].[T_Comment] OFF
SET IDENTITY_INSERT [dbo].[T_Transaction] ON 

INSERT [dbo].[T_Transaction] ([id], [idBug], [idUser], [statut]) VALUES (2, 2, 2, 0)
INSERT [dbo].[T_Transaction] ([id], [idBug], [idUser], [statut]) VALUES (3, 2, 2, 1)
INSERT [dbo].[T_Transaction] ([id], [idBug], [idUser], [statut]) VALUES (5, 2, 2, 2)
SET IDENTITY_INSERT [dbo].[T_Transaction] OFF
