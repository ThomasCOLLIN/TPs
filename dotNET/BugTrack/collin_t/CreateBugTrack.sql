USE [master]
GO
/****** Object:  Database [BugTrack]    Script Date: 29/04/2013 17:40:37 ******/
CREATE DATABASE [BugTrack]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BugTrack', FILENAME = N'E:\SQL server 2012\MTI\MSSQL11.MTI\MSSQL\DATA\BugTrack.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BugTrack_log', FILENAME = N'E:\SQL server 2012\MTI\MSSQL11.MTI\MSSQL\DATA\BugTrack_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BugTrack] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BugTrack].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BugTrack] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BugTrack] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BugTrack] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BugTrack] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BugTrack] SET ARITHABORT OFF 
GO
ALTER DATABASE [BugTrack] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BugTrack] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BugTrack] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BugTrack] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BugTrack] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BugTrack] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BugTrack] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BugTrack] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BugTrack] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BugTrack] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BugTrack] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BugTrack] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BugTrack] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BugTrack] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BugTrack] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BugTrack] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BugTrack] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BugTrack] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BugTrack] SET RECOVERY FULL 
GO
ALTER DATABASE [BugTrack] SET  MULTI_USER 
GO
ALTER DATABASE [BugTrack] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BugTrack] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BugTrack] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BugTrack] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BugTrack', N'ON'
GO
USE [BugTrack]
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 29/04/2013 17:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser]
	-- Add the parameters for the stored procedure here
	 @name nvarchar(50),
   @firstname nvarchar(50),
   @email nvarchar(50),
   @phone nvarchar(10),
   @password nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
INSERT INTO [dbo].[T_User] 
           (
            [name] 
            
           ,[firstname] 
           ,[email] 
           ,[phone] 
           ,[password] )
     VALUES
		(@name ,
		 @firstname ,
		 @email ,
	     @phone ,
	     @password )

select id
 from [dbo].[T_User] 
 where id  = scope_identity()
END

GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 29/04/2013 17:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUser]
	-- Add the parameters for the stored procedure here
	 @id bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM [dbo].[T_User] 
       WHERE id  = @id ;
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 29/04/2013 17:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser]
	-- Add the parameters for the stored procedure here
	@id bigint,
	 @name nvarchar(50),
   @firstname nvarchar(50),
   @email nvarchar(50),
   @phone nvarchar(10),
   @password nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	
	UPDATE [dbo].[T_User] 
     
SET

name = @name ,
firstname =		 @firstname ,
email =		 @email ,
phone =	     @phone ,
password =	     @password


WHERE
	id  = @id
	
	end

GO
/****** Object:  Table [dbo].[T_Bug]    Script Date: 29/04/2013 17:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Bug](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[idProject] [bigint] NOT NULL,
	[Type] [int] NOT NULL,
	[Description] [text] NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Bug] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Comment]    Script Date: 29/04/2013 17:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Comment](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idUser] [bigint] NOT NULL,
	[idBug] [bigint] NOT NULL,
	[details] [text] NOT NULL,
 CONSTRAINT [PK_T_Comment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Project]    Script Date: 29/04/2013 17:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Project](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[version] [nvarchar](50) NOT NULL,
	[startDate] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Project] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_Transaction]    Script Date: 29/04/2013 17:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Transaction](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[idBug] [bigint] NOT NULL,
	[idUser] [bigint] NOT NULL,
	[statut] [int] NOT NULL,
 CONSTRAINT [PK_T_Transaction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[T_User]    Script Date: 29/04/2013 17:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_User](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[firstname] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](10) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_T_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[T_Bug]  WITH CHECK ADD  CONSTRAINT [FK_T_Bug_T_Project] FOREIGN KEY([idProject])
REFERENCES [dbo].[T_Project] ([id])
GO
ALTER TABLE [dbo].[T_Bug] CHECK CONSTRAINT [FK_T_Bug_T_Project]
GO
ALTER TABLE [dbo].[T_Comment]  WITH CHECK ADD  CONSTRAINT [FK_T_Comment_T_Bug] FOREIGN KEY([idBug])
REFERENCES [dbo].[T_Bug] ([id])
GO
ALTER TABLE [dbo].[T_Comment] CHECK CONSTRAINT [FK_T_Comment_T_Bug]
GO
ALTER TABLE [dbo].[T_Comment]  WITH CHECK ADD  CONSTRAINT [FK_T_Comment_T_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[T_User] ([id])
GO
ALTER TABLE [dbo].[T_Comment] CHECK CONSTRAINT [FK_T_Comment_T_User]
GO
ALTER TABLE [dbo].[T_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_T_Transaction_T_Bug] FOREIGN KEY([idBug])
REFERENCES [dbo].[T_Bug] ([id])
GO
ALTER TABLE [dbo].[T_Transaction] CHECK CONSTRAINT [FK_T_Transaction_T_Bug]
GO
ALTER TABLE [dbo].[T_Transaction]  WITH CHECK ADD  CONSTRAINT [FK_T_Transaction_T_User] FOREIGN KEY([idUser])
REFERENCES [dbo].[T_User] ([id])
GO
ALTER TABLE [dbo].[T_Transaction] CHECK CONSTRAINT [FK_T_Transaction_T_User]
GO
USE [master]
GO
ALTER DATABASE [BugTrack] SET  READ_WRITE 
GO
