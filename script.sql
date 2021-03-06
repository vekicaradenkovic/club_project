USE [master]
GO
/****** Object:  Database [club_project]    Script Date: 7/1/2020 11:20:34 PM ******/
CREATE DATABASE [club_project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'club_project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\club_project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'club_project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\club_project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [club_project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [club_project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [club_project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [club_project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [club_project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [club_project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [club_project] SET ARITHABORT OFF 
GO
ALTER DATABASE [club_project] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [club_project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [club_project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [club_project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [club_project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [club_project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [club_project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [club_project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [club_project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [club_project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [club_project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [club_project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [club_project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [club_project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [club_project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [club_project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [club_project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [club_project] SET RECOVERY FULL 
GO
ALTER DATABASE [club_project] SET  MULTI_USER 
GO
ALTER DATABASE [club_project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [club_project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [club_project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [club_project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [club_project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [club_project] SET QUERY_STORE = OFF
GO
USE [club_project]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Countries]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CountryName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[PositionName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Positions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[FirstName] [nvarchar](70) NOT NULL,
	[LastName] [nvarchar](70) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Active] [bit] NOT NULL,
	[TeamId] [int] NOT NULL,
	[TeamRoleId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[PositionId] [int] NULL,
 CONSTRAINT [PK_TeamMembers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamRoles]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TeamRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[TeamName] [nvarchar](80) NOT NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCases]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NULL,
	[DateModified] [datetime2](7) NULL,
	[DeletedAt] [datetime2](7) NULL,
	[FirstName] [nvarchar](150) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 7/1/2020 11:20:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200629220203_Initial-Migration', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200629223041_Second-Migration', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630165344_new-migration', N'3.1.5')
SET IDENTITY_INSERT [dbo].[Countries] ON 

INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (1, CAST(N'2020-06-30T00:19:57.9363261' AS DateTime2), NULL, NULL, N'Srbija')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (2, CAST(N'2020-06-30T00:20:04.8464008' AS DateTime2), NULL, NULL, N'Montenegro')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (3, CAST(N'2020-06-30T00:20:17.9769466' AS DateTime2), NULL, NULL, N'Bosna & Hercegovina')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (4, CAST(N'2020-07-01T12:15:01.2659600' AS DateTime2), CAST(N'2020-07-01T12:16:01.9017868' AS DateTime2), NULL, N'Argentina')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (5, CAST(N'2020-07-01T14:11:59.3007545' AS DateTime2), NULL, NULL, N'Italy')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (6, CAST(N'2020-07-01T14:12:16.1185667' AS DateTime2), NULL, NULL, N'Spain')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (7, CAST(N'2020-07-01T14:12:27.1753325' AS DateTime2), NULL, NULL, N'England')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (8, CAST(N'2020-07-01T14:12:37.2877994' AS DateTime2), NULL, NULL, N'Maroco')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (9, CAST(N'2020-07-01T14:12:45.3372602' AS DateTime2), NULL, NULL, N'France')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (10, CAST(N'2020-07-01T14:13:00.8865684' AS DateTime2), NULL, NULL, N'Portugal')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (11, CAST(N'2020-07-01T14:13:09.8621524' AS DateTime2), NULL, NULL, N'Grece')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (12, CAST(N'2020-07-01T14:13:21.7309591' AS DateTime2), NULL, NULL, N'Turkey')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (13, CAST(N'2020-07-01T14:13:30.7182629' AS DateTime2), NULL, NULL, N'Scotland')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (14, CAST(N'2020-07-01T14:13:37.7676177' AS DateTime2), NULL, NULL, N'Wales')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (15, CAST(N'2020-07-01T14:13:44.2644343' AS DateTime2), NULL, NULL, N'Croaita')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (16, CAST(N'2020-07-01T14:13:52.4375266' AS DateTime2), NULL, NULL, N'Slovenia')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (18, CAST(N'2020-07-01T14:16:00.1980240' AS DateTime2), NULL, NULL, N'Hungary')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (19, CAST(N'2020-07-01T14:16:09.3918560' AS DateTime2), NULL, NULL, N'Bulgaria')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (20, CAST(N'2020-07-01T14:16:33.6097688' AS DateTime2), NULL, NULL, N'czech republic')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (21, CAST(N'2020-07-01T14:16:41.7372707' AS DateTime2), NULL, NULL, N'Poland')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (22, CAST(N'2020-07-01T14:16:50.5266440' AS DateTime2), NULL, NULL, N'Germany')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (23, CAST(N'2020-07-01T14:17:01.3069182' AS DateTime2), CAST(N'2020-07-01T14:20:31.5551812' AS DateTime2), NULL, N'Belgium')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (24, CAST(N'2020-07-01T14:17:12.2394344' AS DateTime2), NULL, NULL, N'Litaunia')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (25, CAST(N'2020-07-01T14:17:30.1789303' AS DateTime2), NULL, NULL, N'Uruguay')
INSERT [dbo].[Countries] ([Id], [DateCreated], [DateModified], [DeletedAt], [CountryName]) VALUES (26, CAST(N'2020-07-01T14:18:28.8386504' AS DateTime2), NULL, NULL, N'Colombia')
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (1, CAST(N'2020-06-30T00:20:51.1663328' AS DateTime2), NULL, NULL, N'Levo krilo')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (2, CAST(N'2020-06-30T00:20:58.6929212' AS DateTime2), NULL, NULL, N'Desni bek')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (3, CAST(N'2020-07-01T12:17:39.7671923' AS DateTime2), CAST(N'2020-07-01T12:18:28.4898817' AS DateTime2), NULL, N'Golman')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (5, CAST(N'2020-07-01T14:22:13.3291603' AS DateTime2), NULL, NULL, N'Levi stoper')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (7, CAST(N'2020-07-01T14:22:28.1788875' AS DateTime2), NULL, NULL, N'Desni stoper')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (8, CAST(N'2020-07-01T14:24:13.1477957' AS DateTime2), NULL, NULL, N'Libero')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (10, CAST(N'2020-07-01T14:24:42.6011922' AS DateTime2), NULL, NULL, N'Desni krilni bek')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (11, CAST(N'2020-07-01T14:24:48.9205532' AS DateTime2), NULL, NULL, N'Levi krilni bek')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (12, CAST(N'2020-07-01T14:27:10.6460730' AS DateTime2), NULL, NULL, N'Desno krilo')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (13, CAST(N'2020-07-01T14:28:22.5641257' AS DateTime2), NULL, NULL, N'Box-to-box vezni')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (14, CAST(N'2020-07-01T14:28:41.9171483' AS DateTime2), NULL, NULL, N'Mezzala')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (15, CAST(N'2020-07-01T14:29:14.1932419' AS DateTime2), NULL, NULL, N'Defanzivni vezni')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (16, CAST(N'2020-07-01T14:29:41.4336187' AS DateTime2), NULL, NULL, N'Plejmejker')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (17, CAST(N'2020-07-01T14:30:14.4867733' AS DateTime2), NULL, NULL, N'centralni vezni')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (18, CAST(N'2020-07-01T14:30:50.8887915' AS DateTime2), NULL, NULL, N'Ofanzivni vezni')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (19, CAST(N'2020-07-01T14:31:12.7541021' AS DateTime2), NULL, NULL, N'Lazna desetka')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (20, CAST(N'2020-07-01T14:33:39.4216621' AS DateTime2), NULL, NULL, N'Napadac')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (21, CAST(N'2020-07-01T14:33:48.7598476' AS DateTime2), NULL, NULL, N'Lazna devetka')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (22, CAST(N'2020-07-01T14:34:12.3721224' AS DateTime2), NULL, NULL, N'Desni krilni napadac')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (23, CAST(N'2020-07-01T14:34:22.8059540' AS DateTime2), NULL, NULL, N'Levi krilni napadac')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (24, CAST(N'2020-07-01T14:34:41.2209578' AS DateTime2), NULL, NULL, N'Poluspic')
SET IDENTITY_INSERT [dbo].[Positions] OFF
SET IDENTITY_INSERT [dbo].[TeamMembers] ON 

INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (1, CAST(N'2020-06-30T19:39:31.2866667' AS DateTime2), NULL, NULL, N'Dejan', N'Zukic', CAST(N'1985-03-03T00:00:00.0000000' AS DateTime2), 1, 1, 1, 1, NULL, 1)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (2, CAST(N'2020-07-01T15:38:29.1400895' AS DateTime2), NULL, NULL, N'Dejan ', N'Lovren', CAST(N'1985-12-03T00:00:00.0000000' AS DateTime2), 1, 14, 1, 15, N'7f1edc68-fac4-4c28-9c08-df4c88072343.jpeg', 5)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (3, CAST(N'2020-07-01T15:41:39.9617194' AS DateTime2), NULL, NULL, N'Cristiano', N'Ronaldo', CAST(N'1985-05-02T00:00:00.0000000' AS DateTime2), 1, 4, 1, 10, N'56774c45-9357-422a-8a15-bc19da56e728.jpg', 23)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (4, CAST(N'2020-07-01T15:43:03.5704011' AS DateTime2), NULL, NULL, N'Lionel', N'Messi', CAST(N'1987-05-02T00:00:00.0000000' AS DateTime2), 1, 9, 1, 15, N'fc003351-9226-4ff9-99da-1e1cd1dd3017.jpg', 22)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (5, CAST(N'2020-07-01T15:45:47.3386201' AS DateTime2), NULL, NULL, N'Sadio', N'Mane', CAST(N'1993-05-02T00:00:00.0000000' AS DateTime2), 1, 1, 1, 14, N'ebc725e0-7e3c-4c58-9c13-de7446e5c261.jpg', 20)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (6, CAST(N'2020-07-01T15:46:48.8948516' AS DateTime2), NULL, NULL, N'Mohamed', N'Salah', CAST(N'1992-05-02T00:00:00.0000000' AS DateTime2), 1, 11, 1, 10, N'dbf1d3b4-b8ab-443a-9848-5f8870fbe038.jpg', 21)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (7, CAST(N'2020-07-01T15:47:44.4440942' AS DateTime2), NULL, NULL, N'Paulo', N'Dybala', CAST(N'1993-01-03T00:00:00.0000000' AS DateTime2), 1, 4, 1, 9, N'37ff965b-b5a8-44f3-b867-af1656553717.jpg', 22)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (8, CAST(N'2020-07-01T15:48:38.1132025' AS DateTime2), NULL, NULL, N'Luis', N'Suarez', CAST(N'1987-03-06T00:00:00.0000000' AS DateTime2), 1, 8, 1, 13, N'81f1b424-8abe-44da-863a-2ccdac61961f.png', 20)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (9, CAST(N'2020-07-01T15:49:26.8776118' AS DateTime2), NULL, NULL, N'Francesko', N'Totti', CAST(N'1979-01-03T00:00:00.0000000' AS DateTime2), 1, 7, 1, 6, N'bb8368e8-c269-4f2a-80da-36d43b9409cd.jpg', 19)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (10, CAST(N'2020-07-01T15:50:06.8797515' AS DateTime2), NULL, NULL, N'Alessandro', N'Del Piero', CAST(N'1973-01-03T00:00:00.0000000' AS DateTime2), 1, 4, 1, 6, N'143a1da9-b40d-45dc-a940-e253e4d6d293.jpg', 19)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (11, CAST(N'2020-07-01T15:50:52.4906898' AS DateTime2), NULL, NULL, N'Merih', N'Demiral', CAST(N'1998-01-03T00:00:00.0000000' AS DateTime2), 1, 4, 1, 19, N'724650a1-aee0-4b4d-9bdb-fae2491276cb.jpg', 7)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (13, CAST(N'2020-07-01T15:54:02.3333200' AS DateTime2), NULL, NULL, N'Mattias', N'De light', CAST(N'1999-11-11T00:00:00.0000000' AS DateTime2), 1, 4, 1, 14, N'1e7a7329-6105-474c-9775-4132eff412f6.jpg', 5)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (14, CAST(N'2020-07-01T15:54:57.0447558' AS DateTime2), NULL, NULL, N'Douglas', N'Costa', CAST(N'1991-01-01T00:00:00.0000000' AS DateTime2), 1, 8, 1, 9, N'24ee66ba-5f57-4cc3-9d59-a40d9862dbe9.jpg', 22)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (15, CAST(N'2020-07-01T15:55:52.0211034' AS DateTime2), NULL, NULL, N'Juan', N'Cuadrado', CAST(N'1989-02-12T00:00:00.0000000' AS DateTime2), 1, 11, 1, 12, N'f0d325a7-a55b-4547-98b1-b0197152e845.jpg', 20)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (16, CAST(N'2020-07-01T15:56:50.2798730' AS DateTime2), NULL, NULL, N'Gianluidji', N'Buffon', CAST(N'1975-05-10T00:00:00.0000000' AS DateTime2), 1, 15, 1, 8, N'231c24b9-7069-49e2-86d3-e23c5ec21f27.png', 3)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (17, CAST(N'2020-07-01T15:57:43.4600904' AS DateTime2), NULL, NULL, N'Roberto', N'Firmino', CAST(N'1993-05-15T00:00:00.0000000' AS DateTime2), 1, 18, 1, 9, N'6ad23c45-f854-479a-adf9-8760d2617dda.jpg', 21)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (18, CAST(N'2020-07-01T15:58:46.7251673' AS DateTime2), NULL, NULL, N'Eden', N'Hazard', CAST(N'1993-05-15T00:00:00.0000000' AS DateTime2), 1, 20, 1, 6, N'3dcc04bc-8cbd-4f78-9614-fa0d39e7b988.jpg', 21)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (19, CAST(N'2020-07-01T15:59:30.3148395' AS DateTime2), NULL, NULL, N'Miralem', N'Pjanic', CAST(N'1990-02-20T00:00:00.0000000' AS DateTime2), 1, 4, 1, 3, N'a5ca3c4a-8413-4350-90f8-69e37d0ab806.jpg', 16)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (20, CAST(N'2020-07-01T16:00:26.8685043' AS DateTime2), NULL, NULL, N'Sergio', N'Ramos', CAST(N'1984-05-16T00:00:00.0000000' AS DateTime2), 1, 11, 1, 6, N'6b30d996-7594-4071-ae0a-e108c3e6e4bc.jpg', 5)
INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (22, CAST(N'2020-07-01T16:07:00.6539667' AS DateTime2), NULL, NULL, N'Paul', N'Pogba', CAST(N'1994-05-16T00:00:00.0000000' AS DateTime2), 1, 14, 1, 13, N'33d13b59-31fd-4fdf-a164-518ed52e5fa0.jpg', 12)
SET IDENTITY_INSERT [dbo].[TeamMembers] OFF
SET IDENTITY_INSERT [dbo].[TeamRoles] ON 

INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (1, CAST(N'2020-06-30T00:21:18.3124801' AS DateTime2), NULL, NULL, N'Igrac')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (2, CAST(N'2020-06-30T00:21:24.3992052' AS DateTime2), NULL, NULL, N'Direktor')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (3, CAST(N'2020-06-30T00:21:36.8170994' AS DateTime2), NULL, NULL, N'Kondicioni trener')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (4, CAST(N'2020-07-01T12:21:53.3401166' AS DateTime2), NULL, NULL, N'Finansijski direktor')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (5, CAST(N'2020-07-01T14:44:14.8678839' AS DateTime2), NULL, NULL, N'Trener')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (6, CAST(N'2020-07-01T14:44:37.0217056' AS DateTime2), NULL, NULL, N'Fizioterapeut')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (7, CAST(N'2020-07-01T14:45:36.2766940' AS DateTime2), NULL, NULL, N'Asistent menadzer')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (8, CAST(N'2020-07-01T14:45:54.0276989' AS DateTime2), NULL, NULL, N'Trener golmana')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (9, CAST(N'2020-07-01T14:46:17.1528231' AS DateTime2), NULL, NULL, N'Analizator protivnika')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (10, CAST(N'2020-07-01T14:46:32.0948181' AS DateTime2), NULL, NULL, N'Fitnes trener')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (11, CAST(N'2020-07-01T14:47:41.2102532' AS DateTime2), NULL, NULL, N'Nutricionista')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (12, CAST(N'2020-07-01T14:48:02.6903954' AS DateTime2), NULL, NULL, N'Masazer')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (13, CAST(N'2020-07-01T14:48:13.4760371' AS DateTime2), NULL, NULL, N'Skaut')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (14, CAST(N'2020-07-01T14:48:29.8060958' AS DateTime2), NULL, NULL, N'Dizajner za dresove')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (15, CAST(N'2020-07-01T14:48:48.9458316' AS DateTime2), NULL, NULL, N'Trener za omladince')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (16, CAST(N'2020-07-01T14:48:59.3104868' AS DateTime2), NULL, NULL, N'Trener za kadete')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (17, CAST(N'2020-07-01T14:49:05.5038721' AS DateTime2), NULL, NULL, N'Trener za pionire')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (18, CAST(N'2020-07-01T14:49:46.5368560' AS DateTime2), NULL, NULL, N'Sponzor')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (19, CAST(N'2020-07-01T14:49:56.6599687' AS DateTime2), NULL, NULL, N'Sportski direktor')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (20, CAST(N'2020-07-01T14:52:20.6159220' AS DateTime2), CAST(N'2020-07-01T14:53:56.8146608' AS DateTime2), CAST(N'2020-07-01T14:53:56.8143705' AS DateTime2), N'Vlasnika')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (21, CAST(N'2020-07-01T14:54:09.5043584' AS DateTime2), NULL, NULL, N'Vlasnik')
SET IDENTITY_INSERT [dbo].[TeamRoles] OFF
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (1, CAST(N'2020-06-30T00:22:25.5769755' AS DateTime2), NULL, NULL, N'Vojvodina', N'34dda8e9-129a-41d2-9259-bb7695f37cea.jpg', N'FK Vojvodina')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (2, CAST(N'2020-07-01T12:26:20.8763333' AS DateTime2), NULL, NULL, N'Crvena Zvezda', N'3d93b3fe-d5b0-402c-b6ad-b8bcb46446a0.png', N'delijesever')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (3, CAST(N'2020-07-01T14:58:57.4042535' AS DateTime2), NULL, NULL, N'Partizan', N'78d61521-76c3-4123-bfb6-4efe69d73cc8.png', N'Fudbalski klub Partizan')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (4, CAST(N'2020-07-01T14:59:56.4576479' AS DateTime2), NULL, NULL, N'Juventus', N'a14f8070-45e2-4681-b3ea-54dd545187e5.png', N'Fudbalski klub Juventus')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (5, CAST(N'2020-07-01T15:00:59.7508906' AS DateTime2), NULL, NULL, N'Inter', N'442faf91-320f-44bd-bdcc-d6427eb008a3.jpg', N'Fudbalski klub Inter')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (6, CAST(N'2020-07-01T15:01:58.4055758' AS DateTime2), NULL, NULL, N'Milan', N'3af19798-7be8-4104-b72f-4fb60ea340b8.jpg', N'Fudbalski klub Milan')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (7, CAST(N'2020-07-01T15:07:53.3240351' AS DateTime2), NULL, NULL, N'Roma', N'87cf4192-6d2c-4558-8447-879c4b4a1aa0.jpg', N'Fudbalski klub Roma')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (8, CAST(N'2020-07-01T15:08:26.6889579' AS DateTime2), NULL, NULL, N'Real Madrid', N'0612a047-a7c8-42a9-932a-4e33366118b6.jpg', N'Fudbalski klub Real Madrid')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (9, CAST(N'2020-07-01T15:08:47.9664574' AS DateTime2), NULL, NULL, N'Barcelona', N'299d0f6d-04b5-4b3a-8190-8e23cb0b2ee4.jpg', N'Fudbalski klub Barcelona')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (10, CAST(N'2020-07-01T15:09:13.3263548' AS DateTime2), NULL, NULL, N'Valencia', N'80681839-6656-459c-83b7-25210924ecdf.jpg', N'Fudbalski klub Valencia')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (11, CAST(N'2020-07-01T15:09:34.9652927' AS DateTime2), NULL, NULL, N'Liverpool', N'b2e9edc1-4655-47fc-882f-189e72cb071d.jpg', N'Fudbalski klub Liverpul')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (12, CAST(N'2020-07-01T15:10:12.8588912' AS DateTime2), NULL, NULL, N'Man Utd', N'5c706d79-e2b1-4a67-a108-02c31e8104d4.png', N'Fudbalski klub Mancester Utd')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (13, CAST(N'2020-07-01T15:10:35.1140433' AS DateTime2), NULL, NULL, N'Arsenal', N'29597aea-ba75-467a-883f-d8b22d45c26b.jpg', N'Fudbalski klub Arsenal')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (14, CAST(N'2020-07-01T15:10:56.5532010' AS DateTime2), NULL, NULL, N'Chelsea', N'adcc62ea-d03e-4c64-938a-2988514f9253.jpg', N'Fudbalski klub Chelsea')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (15, CAST(N'2020-07-01T15:16:09.1660319' AS DateTime2), NULL, NULL, N'Mancester City', N'46457167-88e9-40d5-9efb-672b4798632f.png', N'Fudbalski klub Mancester City')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (16, CAST(N'2020-07-01T15:16:40.6664590' AS DateTime2), NULL, NULL, N'Metalac', N'5ed359a6-0a29-44e7-9fc6-b5c03ef46d3a.jpeg', N'Fudbalski klub Metalac')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (17, CAST(N'2020-07-01T15:17:00.0428124' AS DateTime2), NULL, NULL, N'Everton', N'1dccc29b-0e56-4caa-be3b-8dec66038e15.jpg', N'Fudbalski klub Everton')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (18, CAST(N'2020-07-01T15:17:20.2925772' AS DateTime2), NULL, NULL, N'Fiorentina', N'356a9433-dd5b-428a-915e-c60f06f6f7d1.png', N'Fudbalski klub Fiorentina')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (19, CAST(N'2020-07-01T15:17:40.9961952' AS DateTime2), NULL, NULL, N'Cukaricki', N'6fb5ecda-e306-4b40-97a8-1493905cd214.png', N'Fudbalski klub Cukaricki')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (20, CAST(N'2020-07-01T15:18:07.0631249' AS DateTime2), NULL, NULL, N'Atletiko Madrid', N'3eb76a2c-4bf3-4dd8-b00b-93e8a3083995.png', N'Fudbalski klub Atletiko Madrid')
INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (21, CAST(N'2020-07-01T15:18:30.8454028' AS DateTime2), CAST(N'2020-07-01T15:20:55.3638057' AS DateTime2), CAST(N'2020-07-01T15:20:55.3636571' AS DateTime2), N'Figaro', N'333e6c00-7fda-4e2b-bc01-6a8eaee9534b.jpg', N'Fk Figaroo')
SET IDENTITY_INSERT [dbo].[Teams] OFF
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (2, CAST(N'2020-06-29T22:14:35.2880241' AS DateTime2), N'Get All Users', N'{"Username":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (3, CAST(N'2020-06-29T22:15:03.1251701' AS DateTime2), N'Register User', N'{"FirstName":"Veljko","LastName":"Radenkovic","Email":"test@api.rs","Username":"velja test","Password":"test123"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (4, CAST(N'2020-06-29T22:15:17.7019166' AS DateTime2), N'Get users activity', N'{"UserId":1,"StartDate":"0001-01-01T00:00:00","EndDate":"0001-01-01T00:00:00","Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (5, CAST(N'2020-06-29T22:15:31.4178502' AS DateTime2), N'Get users activity', N'{"UserId":1,"StartDate":"0001-01-01T00:00:00","EndDate":"0001-01-01T00:00:00","Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (6, CAST(N'2020-06-29T22:16:54.6141138' AS DateTime2), N'Add new country', N'{"CountryName":"Srbija"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (7, CAST(N'2020-06-29T22:18:31.4511890' AS DateTime2), N'Add new country', N'{"CountryName":"Srbija"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (8, CAST(N'2020-06-29T22:19:57.5742021' AS DateTime2), N'Add new country', N'{"CountryName":"Srbija"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (9, CAST(N'2020-06-29T22:20:04.8356325' AS DateTime2), N'Add new country', N'{"CountryName":"Montenegro"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (10, CAST(N'2020-06-29T22:20:17.9604299' AS DateTime2), N'Add new country', N'{"CountryName":"Bosna & Hercegovina"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (11, CAST(N'2020-06-29T22:20:36.8309721' AS DateTime2), N'Get Countries', N'{"Keywords":"bosna","PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (12, CAST(N'2020-06-29T22:20:51.1470605' AS DateTime2), N'Create new position', N'{"PositionName":"Levo krilo"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (13, CAST(N'2020-06-29T22:20:58.6843706' AS DateTime2), N'Create new position', N'{"PositionName":"Desni bek"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (14, CAST(N'2020-06-29T22:21:02.0379241' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (15, CAST(N'2020-06-29T22:21:18.2934246' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Igrac"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (16, CAST(N'2020-06-29T22:21:24.3818927' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Direktor"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (17, CAST(N'2020-06-29T22:21:36.8022961' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Kondicioni trener"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (18, CAST(N'2020-06-29T22:21:40.1353240' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (19, CAST(N'2020-06-29T22:22:25.5544916' AS DateTime2), N'Create new team', N'{"Name":"Vojvodina","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"download (1).jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"download (1).jpg\""],"Content-Type":["image/jpeg"]},"Length":9530,"Name":"Image","FileName":"download (1).jpg"},"Description":"FK Vojvodina"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (20, CAST(N'2020-06-29T22:22:31.2459457' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (21, CAST(N'2020-06-29T22:22:53.8369778' AS DateTime2), N'Get users activity', N'{"UserId":0,"StartDate":"0001-01-01T00:00:00","EndDate":"0001-01-01T00:00:00","Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (22, CAST(N'2020-06-29T22:24:04.3297508' AS DateTime2), N'Get users activity', N'{"UserId":1,"StartDate":null,"EndDate":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (23, CAST(N'2020-06-30T15:43:25.7872990' AS DateTime2), N'Get users activity', N'{"UserId":0,"StartDate":null,"EndDate":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (24, CAST(N'2020-06-30T15:43:40.7085134' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (25, CAST(N'2020-06-30T16:21:33.0943457' AS DateTime2), N'Delete user use cases', N'[2,3,4]', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (26, CAST(N'2020-06-30T16:22:13.9405185' AS DateTime2), N'Add use case to user', N'{"UserId":1,"UseCaseId":[32]}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (27, CAST(N'2020-06-30T16:30:08.2088439' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (28, CAST(N'2020-06-30T16:30:54.3610263' AS DateTime2), N'Add use case to user', N'{"UserId":1,"UseCaseId":[32]}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (29, CAST(N'2020-06-30T16:39:43.8447678' AS DateTime2), N'Add use case to user', N'{"UserId":1,"UseCaseId":[32]}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (30, CAST(N'2020-06-30T16:39:52.0485481' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (31, CAST(N'2020-06-30T16:40:15.9015688' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (32, CAST(N'2020-06-30T16:45:00.3712780' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (33, CAST(N'2020-06-30T16:45:59.2146330' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (34, CAST(N'2020-06-30T16:46:35.0098474' AS DateTime2), N'Get users activity', N'{"UserId":0,"StartDate":null,"EndDate":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (35, CAST(N'2020-06-30T16:46:45.3116236' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (36, CAST(N'2020-06-30T17:32:17.7707083' AS DateTime2), N'Get users activity', N'{"UserId":0,"StartDate":null,"EndDate":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (37, CAST(N'2020-06-30T17:32:39.5017550' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (38, CAST(N'2020-06-30T17:33:12.3246801' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (39, CAST(N'2020-06-30T17:33:33.3716997' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (40, CAST(N'2020-06-30T17:44:33.2884143' AS DateTime2), N'Get all team members', N'{"TeamName":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (41, CAST(N'2020-06-30T17:47:40.2441668' AS DateTime2), N'Add new team member', N'{"FirstName":"Mirko","LastName":"Topic","DateOfBirth":"2001-01-01T00:00:00","Active":true,"TeamId":1,"TeamRoleId":1,"CountryId":1,"PositionId":1,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"download.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"download.jpg\""],"Content-Type":["image/jpeg"]},"Length":8415,"Name":"Image","FileName":"download.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1036, CAST(N'2020-07-01T10:13:44.5143972' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1037, CAST(N'2020-07-01T10:15:01.1556785' AS DateTime2), N'Add new country', N'{"CountryName":"Brazil"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1038, CAST(N'2020-07-01T10:15:16.1405991' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1039, CAST(N'2020-07-01T10:16:01.8045458' AS DateTime2), N'Update selected country', N'{"CountryName":"Argentina"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1040, CAST(N'2020-07-01T10:16:14.9333865' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1041, CAST(N'2020-07-01T10:16:45.9484307' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1042, CAST(N'2020-07-01T10:17:14.7159262' AS DateTime2), N'Get Players Positions', N'{"Keywords":"lev","PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1043, CAST(N'2020-07-01T10:17:39.7128687' AS DateTime2), N'Create new position', N'{"PositionName":"Napadac"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1044, CAST(N'2020-07-01T10:17:56.2494960' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1045, CAST(N'2020-07-01T10:18:28.3939041' AS DateTime2), N'Update selected position', N'{"PositionName":"Golman"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1046, CAST(N'2020-07-01T10:18:37.3750865' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1047, CAST(N'2020-07-01T10:18:52.8072646' AS DateTime2), N'Get all team members', N'{"TeamName":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1048, CAST(N'2020-07-01T10:20:10.7881600' AS DateTime2), N'Update selected team member', N'{"FirstName":"Dejann","LastName":null,"DateOfBirth":"0001-01-01T00:00:00","Active":false,"TeamId":0,"TeamRoleId":0,"CountryId":0,"PositionId":0,"Image":null}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1049, CAST(N'2020-07-01T10:21:00.3785946' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1050, CAST(N'2020-07-01T10:21:53.2682435' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Finansijski direktor"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1051, CAST(N'2020-07-01T10:22:06.2246078' AS DateTime2), N'Get Team Roles', N'{"Keywords":"fin","PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1052, CAST(N'2020-07-01T10:22:26.9553127' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1053, CAST(N'2020-07-01T10:22:59.0020149' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1054, CAST(N'2020-07-01T10:26:20.8001976' AS DateTime2), N'Create new team', N'{"Name":"Crvena Zvezda","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"redstar.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"redstar.png\""],"Content-Type":["image/png"]},"Length":42497,"Name":"Image","FileName":"redstar.png"},"Description":"delijesever"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1055, CAST(N'2020-07-01T10:26:31.6600942' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1056, CAST(N'2020-07-01T10:27:03.7331167' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1057, CAST(N'2020-07-01T10:27:31.6236227' AS DateTime2), N'Get All Users', N'{"Username":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1058, CAST(N'2020-07-01T10:28:18.4743023' AS DateTime2), N'Get users activity', N'{"UserId":0,"StartDate":null,"EndDate":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1059, CAST(N'2020-07-01T12:10:35.4939253' AS DateTime2), N'Get users activity', N'{"UserId":0,"StartDate":null,"EndDate":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1060, CAST(N'2020-07-01T12:11:15.4751271' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1061, CAST(N'2020-07-01T12:11:59.1710525' AS DateTime2), N'Add new country', N'{"CountryName":"Italy"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1062, CAST(N'2020-07-01T12:12:16.0803171' AS DateTime2), N'Add new country', N'{"CountryName":"Spain"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1063, CAST(N'2020-07-01T12:12:27.1357105' AS DateTime2), N'Add new country', N'{"CountryName":"England"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1064, CAST(N'2020-07-01T12:12:37.2632103' AS DateTime2), N'Add new country', N'{"CountryName":"Maroco"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1065, CAST(N'2020-07-01T12:12:45.2117166' AS DateTime2), N'Add new country', N'{"CountryName":"France"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1066, CAST(N'2020-07-01T12:13:00.8593292' AS DateTime2), N'Add new country', N'{"CountryName":"Portugal"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1067, CAST(N'2020-07-01T12:13:09.8431681' AS DateTime2), N'Add new country', N'{"CountryName":"Grece"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1068, CAST(N'2020-07-01T12:13:21.6470797' AS DateTime2), N'Add new country', N'{"CountryName":"Turkey"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1069, CAST(N'2020-07-01T12:13:30.6215463' AS DateTime2), N'Add new country', N'{"CountryName":"Scotland"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1070, CAST(N'2020-07-01T12:13:37.7253633' AS DateTime2), N'Add new country', N'{"CountryName":"Wales"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1071, CAST(N'2020-07-01T12:13:44.2435374' AS DateTime2), N'Add new country', N'{"CountryName":"Croaita"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1072, CAST(N'2020-07-01T12:13:52.4186445' AS DateTime2), N'Add new country', N'{"CountryName":"Slovenia"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1073, CAST(N'2020-07-01T12:14:01.0688994' AS DateTime2), N'Add new country', N'{"CountryName":"Bosnia"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1074, CAST(N'2020-07-01T12:14:14.7325773' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1075, CAST(N'2020-07-01T12:14:54.3647981' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1076, CAST(N'2020-07-01T12:15:33.4060696' AS DateTime2), N'Delete selected country', N'17', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1077, CAST(N'2020-07-01T12:16:00.1610151' AS DateTime2), N'Add new country', N'{"CountryName":"Hungary"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1078, CAST(N'2020-07-01T12:16:09.3763354' AS DateTime2), N'Add new country', N'{"CountryName":"Bulgaria"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1079, CAST(N'2020-07-01T12:16:33.5262425' AS DateTime2), N'Add new country', N'{"CountryName":"czech republic"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1080, CAST(N'2020-07-01T12:16:41.7228207' AS DateTime2), N'Add new country', N'{"CountryName":"Poland"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1081, CAST(N'2020-07-01T12:16:50.5042711' AS DateTime2), N'Add new country', N'{"CountryName":"Germany"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1082, CAST(N'2020-07-01T12:17:01.2753868' AS DateTime2), N'Add new country', N'{"CountryName":"Austria"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1083, CAST(N'2020-07-01T12:17:12.1895563' AS DateTime2), N'Add new country', N'{"CountryName":"Litaunia"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1084, CAST(N'2020-07-01T12:17:30.1486771' AS DateTime2), N'Add new country', N'{"CountryName":"Uruguay"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1085, CAST(N'2020-07-01T12:17:44.8330788' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1086, CAST(N'2020-07-01T12:18:28.8121291' AS DateTime2), N'Add new country', N'{"CountryName":"Colombia"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1087, CAST(N'2020-07-01T12:18:43.5599575' AS DateTime2), N'Get selected country', N'5', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1088, CAST(N'2020-07-01T12:18:55.3509267' AS DateTime2), N'Get selected country', N'21', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1089, CAST(N'2020-07-01T12:19:04.3075963' AS DateTime2), N'Get selected country', N'22', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1090, CAST(N'2020-07-01T12:19:15.5737961' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1091, CAST(N'2020-07-01T12:19:36.0361168' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":3}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1092, CAST(N'2020-07-01T12:20:31.4708299' AS DateTime2), N'Update selected country', N'{"CountryName":"Belgium"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1093, CAST(N'2020-07-01T12:20:46.5108083' AS DateTime2), N'Get selected country', N'23', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1094, CAST(N'2020-07-01T12:21:23.8051220' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1095, CAST(N'2020-07-01T12:21:57.3016713' AS DateTime2), N'Create new position', N'{"PositionName":"Desni bek"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1096, CAST(N'2020-07-01T12:22:13.2447742' AS DateTime2), N'Create new position', N'{"PositionName":"Levi stoper"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1097, CAST(N'2020-07-01T12:22:16.1477017' AS DateTime2), N'Create new position', N'{"PositionName":"Levi stoper"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1098, CAST(N'2020-07-01T12:22:28.1572992' AS DateTime2), N'Create new position', N'{"PositionName":"Desni stoper"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1099, CAST(N'2020-07-01T12:24:12.9356323' AS DateTime2), N'Create new position', N'{"PositionName":"Libero"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1100, CAST(N'2020-07-01T12:24:18.1798507' AS DateTime2), N'Create new position', N'{"PositionName":"Libero"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1101, CAST(N'2020-07-01T12:24:42.5725962' AS DateTime2), N'Create new position', N'{"PositionName":"Desni krilni bek"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1102, CAST(N'2020-07-01T12:24:48.9079809' AS DateTime2), N'Create new position', N'{"PositionName":"Levi krilni bek"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1103, CAST(N'2020-07-01T12:24:57.7359040' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1104, CAST(N'2020-07-01T12:26:04.7363997' AS DateTime2), N'Delete selected position', N'9', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1105, CAST(N'2020-07-01T12:26:12.7351218' AS DateTime2), N'Delete selected position', N'6', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1106, CAST(N'2020-07-01T12:26:16.9208631' AS DateTime2), N'Delete selected position', N'4', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1107, CAST(N'2020-07-01T12:26:27.6548135' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1108, CAST(N'2020-07-01T12:27:10.6047430' AS DateTime2), N'Create new position', N'{"PositionName":"Desno krilo"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1109, CAST(N'2020-07-01T12:28:22.5317463' AS DateTime2), N'Create new position', N'{"PositionName":"Box-to-box vezni"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1110, CAST(N'2020-07-01T12:28:41.8974885' AS DateTime2), N'Create new position', N'{"PositionName":"Mezzala"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1111, CAST(N'2020-07-01T12:29:14.1591107' AS DateTime2), N'Create new position', N'{"PositionName":"Defanzivni vezni"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1112, CAST(N'2020-07-01T12:29:41.4072005' AS DateTime2), N'Create new position', N'{"PositionName":"Plejmejker"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1113, CAST(N'2020-07-01T12:30:14.4358450' AS DateTime2), N'Create new position', N'{"PositionName":"centralni vezni"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1114, CAST(N'2020-07-01T12:30:50.7928880' AS DateTime2), N'Create new position', N'{"PositionName":"Ofanzivni vezni"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1115, CAST(N'2020-07-01T12:31:12.7248923' AS DateTime2), N'Create new position', N'{"PositionName":"Lazna desetka"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1116, CAST(N'2020-07-01T12:31:32.1682802' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1117, CAST(N'2020-07-01T12:31:59.8449329' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1118, CAST(N'2020-07-01T12:33:39.3775433' AS DateTime2), N'Create new position', N'{"PositionName":"Napadac"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1119, CAST(N'2020-07-01T12:33:48.7485222' AS DateTime2), N'Create new position', N'{"PositionName":"Lazna devetka"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1120, CAST(N'2020-07-01T12:34:12.3449165' AS DateTime2), N'Create new position', N'{"PositionName":"Desni krilni napadac"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1121, CAST(N'2020-07-01T12:34:22.7858973' AS DateTime2), N'Create new position', N'{"PositionName":"Levi krilni napadac"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1122, CAST(N'2020-07-01T12:34:41.1988356' AS DateTime2), N'Create new position', N'{"PositionName":"Poluspic"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1123, CAST(N'2020-07-01T12:35:01.3998166' AS DateTime2), N'Create new position', N'{"PositionName":"osmica"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1124, CAST(N'2020-07-01T12:35:31.9506607' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1125, CAST(N'2020-07-01T12:35:58.5401448' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":3}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1126, CAST(N'2020-07-01T12:36:31.5187956' AS DateTime2), N'Update selected position', N'{"PositionName":"sivonja"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1127, CAST(N'2020-07-01T12:36:47.6584721' AS DateTime2), N'Get selected player position', N'25', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1128, CAST(N'2020-07-01T12:37:16.3687674' AS DateTime2), N'Delete selected position', N'25', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1129, CAST(N'2020-07-01T12:37:28.6455441' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":3}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1130, CAST(N'2020-07-01T12:38:30.8880193' AS DateTime2), N'Get all team members', N'{"TeamName":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1131, CAST(N'2020-07-01T12:41:00.8634540' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1132, CAST(N'2020-07-01T12:43:53.6607058' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1133, CAST(N'2020-07-01T12:44:14.8080657' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Trener"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1134, CAST(N'2020-07-01T12:44:36.9645952' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Fizioterapeut"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1135, CAST(N'2020-07-01T12:45:36.2494626' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Asistent menadzer"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1136, CAST(N'2020-07-01T12:45:54.0154174' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Trener golmana"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1137, CAST(N'2020-07-01T12:46:17.1108703' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Analizator protivnika"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1138, CAST(N'2020-07-01T12:46:32.0744432' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Fitnes trener"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1139, CAST(N'2020-07-01T12:46:49.3661032' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1140, CAST(N'2020-07-01T12:47:41.1708393' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Nutricionista"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1141, CAST(N'2020-07-01T12:48:02.6719821' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Masazer"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1142, CAST(N'2020-07-01T12:48:13.4643067' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Skaut"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1143, CAST(N'2020-07-01T12:48:29.7735198' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Dizajner za dresove"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1144, CAST(N'2020-07-01T12:48:48.9245870' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Trener za omladince"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1145, CAST(N'2020-07-01T12:48:59.2987749' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Trener za kadete"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1146, CAST(N'2020-07-01T12:49:05.4847016' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Trener za pionire"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1147, CAST(N'2020-07-01T12:49:46.4766556' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Sponzor"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1148, CAST(N'2020-07-01T12:49:56.6446602' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Sportski direktor"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1149, CAST(N'2020-07-01T12:50:42.0043883' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1150, CAST(N'2020-07-01T12:51:06.9724360' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1151, CAST(N'2020-07-01T12:52:20.5658425' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Vlasnik"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1152, CAST(N'2020-07-01T12:52:33.3625383' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1153, CAST(N'2020-07-01T12:53:28.7964718' AS DateTime2), N'Update Team Role', N'{"RoleName":"Vlasnika"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1154, CAST(N'2020-07-01T12:53:40.7544801' AS DateTime2), N'Get Selected Team Role', N'20', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1155, CAST(N'2020-07-01T12:53:56.7568181' AS DateTime2), N'Delete Team Role', N'20', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1156, CAST(N'2020-07-01T12:54:09.4843856' AS DateTime2), N'Create new Team Role', N'{"RoleName":"Vlasnik"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1157, CAST(N'2020-07-01T12:54:18.9208029' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1158, CAST(N'2020-07-01T12:55:02.9559857' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1159, CAST(N'2020-07-01T12:58:57.3406968' AS DateTime2), N'Create new team', N'{"Name":"Partizan","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"partizan.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"partizan.png\""],"Content-Type":["image/png"]},"Length":100158,"Name":"Image","FileName":"partizan.png"},"Description":"Fudbalski klub Partizan"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1160, CAST(N'2020-07-01T12:59:56.4009655' AS DateTime2), N'Create new team', N'{"Name":"Juventus","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"juve.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"juve.png\""],"Content-Type":["image/png"]},"Length":1345,"Name":"Image","FileName":"juve.png"},"Description":"Fudbalski klub Juventus"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1161, CAST(N'2020-07-01T13:00:59.7197381' AS DateTime2), N'Create new team', N'{"Name":"Inter","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"inter.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"inter.jpg\""],"Content-Type":["image/jpeg"]},"Length":36926,"Name":"Image","FileName":"inter.jpg"},"Description":"Fudbalski klub Inter"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1162, CAST(N'2020-07-01T13:01:58.3401572' AS DateTime2), N'Create new team', N'{"Name":"Milan","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"ac milan.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"ac milan.jpg\""],"Content-Type":["image/jpeg"]},"Length":9845,"Name":"Image","FileName":"ac milan.jpg"},"Description":"Fudbalski klub Milan"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1163, CAST(N'2020-07-01T13:06:56.0961835' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1164, CAST(N'2020-07-01T13:07:53.2845523' AS DateTime2), N'Create new team', N'{"Name":"Roma","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"Roma.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"Roma.jpg\""],"Content-Type":["image/jpeg"]},"Length":9656,"Name":"Image","FileName":"Roma.jpg"},"Description":"Fudbalski klub Roma"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1165, CAST(N'2020-07-01T13:08:26.6532953' AS DateTime2), N'Create new team', N'{"Name":"Real Madrid","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"real.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"real.jpg\""],"Content-Type":["image/jpeg"]},"Length":33386,"Name":"Image","FileName":"real.jpg"},"Description":"Fudbalski klub Real Madrid"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1166, CAST(N'2020-07-01T13:08:47.9450393' AS DateTime2), N'Create new team', N'{"Name":"Barcelona","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"barcelona.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"barcelona.jpg\""],"Content-Type":["image/jpeg"]},"Length":13670,"Name":"Image","FileName":"barcelona.jpg"},"Description":"Fudbalski klub Barcelona"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1167, CAST(N'2020-07-01T13:09:13.2549742' AS DateTime2), N'Create new team', N'{"Name":"Valencia","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"Valencia.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"Valencia.jpg\""],"Content-Type":["image/jpeg"]},"Length":11078,"Name":"Image","FileName":"Valencia.jpg"},"Description":"Fudbalski klub Valencia"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1168, CAST(N'2020-07-01T13:09:34.9134188' AS DateTime2), N'Create new team', N'{"Name":"Liverpool","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"liverp.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"liverp.jpg\""],"Content-Type":["image/jpeg"]},"Length":13914,"Name":"Image","FileName":"liverp.jpg"},"Description":"Fudbalski klub Liverpul"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1169, CAST(N'2020-07-01T13:10:12.8087830' AS DateTime2), N'Create new team', N'{"Name":"Man Utd","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"utd.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"utd.png\""],"Content-Type":["image/png"]},"Length":47818,"Name":"Image","FileName":"utd.png"},"Description":"Fudbalski klub Mancester Utd"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1170, CAST(N'2020-07-01T13:10:35.0733149' AS DateTime2), N'Create new team', N'{"Name":"Arsenal","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"arsenal.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"arsenal.jpg\""],"Content-Type":["image/jpeg"]},"Length":23626,"Name":"Image","FileName":"arsenal.jpg"},"Description":"Fudbalski klub Arsenal"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1171, CAST(N'2020-07-01T13:10:56.4595565' AS DateTime2), N'Create new team', N'{"Name":"Chelsea","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"chelsea.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"chelsea.jpg\""],"Content-Type":["image/jpeg"]},"Length":91664,"Name":"Image","FileName":"chelsea.jpg"},"Description":"Fudbalski klub Chelsea"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1172, CAST(N'2020-07-01T13:11:04.2308733' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1173, CAST(N'2020-07-01T13:16:09.1034579' AS DateTime2), N'Create new team', N'{"Name":"Mancester City","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"city.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"city.png\""],"Content-Type":["image/png"]},"Length":78077,"Name":"Image","FileName":"city.png"},"Description":"Fudbalski klub Mancester City"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1174, CAST(N'2020-07-01T13:16:40.6046489' AS DateTime2), N'Create new team', N'{"Name":"Metalac","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"metalac.jpeg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"metalac.jpeg\""],"Content-Type":["image/jpeg"]},"Length":136436,"Name":"Image","FileName":"metalac.jpeg"},"Description":"Fudbalski klub Metalac"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1175, CAST(N'2020-07-01T13:16:59.9699184' AS DateTime2), N'Create new team', N'{"Name":"Everton","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"everton.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"everton.jpg\""],"Content-Type":["image/jpeg"]},"Length":32721,"Name":"Image","FileName":"everton.jpg"},"Description":"Fudbalski klub Everton"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1176, CAST(N'2020-07-01T13:17:20.1654641' AS DateTime2), N'Create new team', N'{"Name":"Fiorentina","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"fiore.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"fiore.png\""],"Content-Type":["image/png"]},"Length":21822,"Name":"Image","FileName":"fiore.png"},"Description":"Fudbalski klub Fiorentina"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1177, CAST(N'2020-07-01T13:17:40.9759008' AS DateTime2), N'Create new team', N'{"Name":"Cukaricki","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"cukarica.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"cukarica.png\""],"Content-Type":["image/png"]},"Length":64775,"Name":"Image","FileName":"cukarica.png"},"Description":"Fudbalski klub Cukaricki"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1178, CAST(N'2020-07-01T13:18:07.0154931' AS DateTime2), N'Create new team', N'{"Name":"Atletiko Madrid","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"atletiko.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"atletiko.png\""],"Content-Type":["image/png"]},"Length":14471,"Name":"Image","FileName":"atletiko.png"},"Description":"Fudbalski klub Atletiko Madrid"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1179, CAST(N'2020-07-01T13:18:30.8092508' AS DateTime2), N'Create new team', N'{"Name":"Atalanta","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"atalana.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"atalana.jpg\""],"Content-Type":["image/jpeg"]},"Length":83085,"Name":"Image","FileName":"atalana.jpg"},"Description":"Fudbalski klub Atalanta"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1180, CAST(N'2020-07-01T13:18:43.2798525' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1181, CAST(N'2020-07-01T13:19:10.3834523' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":3}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1182, CAST(N'2020-07-01T13:19:42.3462918' AS DateTime2), N'Get selected team', N'21', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1183, CAST(N'2020-07-01T13:20:17.7700273' AS DateTime2), N'Update selected team', N'{"Name":"Figaro","Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"barcelona.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"barcelona.jpg\""],"Content-Type":["image/jpeg"]},"Length":13670,"Name":"Image","FileName":"barcelona.jpg"},"Description":"Fk Figaroo"}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1184, CAST(N'2020-07-01T13:20:28.5827178' AS DateTime2), N'Get selected team', N'21', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1185, CAST(N'2020-07-01T13:20:55.3294008' AS DateTime2), N'Delete team', N'21', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1186, CAST(N'2020-07-01T13:21:05.1651242' AS DateTime2), N'Get selected team', N'21', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1187, CAST(N'2020-07-01T13:21:36.5601642' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1188, CAST(N'2020-07-01T13:22:20.7544552' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1189, CAST(N'2020-07-01T13:22:50.5541143' AS DateTime2), N'Get All Users', N'{"Username":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1190, CAST(N'2020-07-01T13:35:17.6917760' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":3}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1191, CAST(N'2020-07-01T13:35:20.8727646' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1192, CAST(N'2020-07-01T13:36:35.4304935' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1193, CAST(N'2020-07-01T13:37:02.1765806' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1194, CAST(N'2020-07-01T13:37:18.9939260' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1195, CAST(N'2020-07-01T13:37:20.1092866' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1196, CAST(N'2020-07-01T13:37:51.9544426' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1197, CAST(N'2020-07-01T13:38:28.9268906' AS DateTime2), N'Add new team member', N'{"FirstName":"Dejan ","LastName":"Lovren","DateOfBirth":"1985-12-03T00:00:00","Active":true,"TeamId":14,"TeamRoleId":1,"CountryId":15,"PositionId":5,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"lovren.jpeg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"lovren.jpeg\""],"Content-Type":["image/jpeg"]},"Length":54822,"Name":"Image","FileName":"lovren.jpeg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1198, CAST(N'2020-07-01T13:40:14.9604926' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":3}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1199, CAST(N'2020-07-01T13:40:28.9163534' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1200, CAST(N'2020-07-01T13:41:07.1689364' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1201, CAST(N'2020-07-01T13:41:39.9034912' AS DateTime2), N'Add new team member', N'{"FirstName":"Cristiano","LastName":"Ronaldo","DateOfBirth":"1985-05-02T00:00:00","Active":true,"TeamId":4,"TeamRoleId":1,"CountryId":10,"PositionId":23,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"Cristiano-Ronaldo-862131.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"Cristiano-Ronaldo-862131.jpg\""],"Content-Type":["image/jpeg"]},"Length":30199,"Name":"Image","FileName":"Cristiano-Ronaldo-862131.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1202, CAST(N'2020-07-01T13:43:03.4952910' AS DateTime2), N'Add new team member', N'{"FirstName":"Lionel","LastName":"Messi","DateOfBirth":"1987-05-02T00:00:00","Active":true,"TeamId":9,"TeamRoleId":1,"CountryId":15,"PositionId":22,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"messi.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"messi.jpg\""],"Content-Type":["image/jpeg"]},"Length":53944,"Name":"Image","FileName":"messi.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1203, CAST(N'2020-07-01T13:43:54.8115379' AS DateTime2), N'Add new team member', N'{"FirstName":"Sadio","LastName":"Mane","DateOfBirth":"1993-05-02T00:00:00","Active":true,"TeamId":1,"TeamRoleId":1,"CountryId":17,"PositionId":20,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"mane.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"mane.jpg\""],"Content-Type":["image/jpeg"]},"Length":53597,"Name":"Image","FileName":"mane.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1204, CAST(N'2020-07-01T13:45:47.2789284' AS DateTime2), N'Add new team member', N'{"FirstName":"Sadio","LastName":"Mane","DateOfBirth":"1993-05-02T00:00:00","Active":true,"TeamId":1,"TeamRoleId":1,"CountryId":14,"PositionId":20,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"mane.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"mane.jpg\""],"Content-Type":["image/jpeg"]},"Length":53597,"Name":"Image","FileName":"mane.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1205, CAST(N'2020-07-01T13:46:47.9065818' AS DateTime2), N'Add new team member', N'{"FirstName":"Mohamed","LastName":"Salah","DateOfBirth":"1992-05-02T00:00:00","Active":true,"TeamId":11,"TeamRoleId":1,"CountryId":10,"PositionId":21,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"salah.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"salah.jpg\""],"Content-Type":["image/jpeg"]},"Length":69938,"Name":"Image","FileName":"salah.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1206, CAST(N'2020-07-01T13:47:44.2511666' AS DateTime2), N'Add new team member', N'{"FirstName":"Paulo","LastName":"Dybala","DateOfBirth":"1993-01-03T00:00:00","Active":true,"TeamId":4,"TeamRoleId":1,"CountryId":9,"PositionId":22,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"dybala.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"dybala.jpg\""],"Content-Type":["image/jpeg"]},"Length":48981,"Name":"Image","FileName":"dybala.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1207, CAST(N'2020-07-01T13:48:38.0084576' AS DateTime2), N'Add new team member', N'{"FirstName":"Luis","LastName":"Suarez","DateOfBirth":"1987-03-06T00:00:00","Active":true,"TeamId":8,"TeamRoleId":1,"CountryId":13,"PositionId":20,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"suarez.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"suarez.png\""],"Content-Type":["image/png"]},"Length":164299,"Name":"Image","FileName":"suarez.png"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1208, CAST(N'2020-07-01T13:49:26.8123405' AS DateTime2), N'Add new team member', N'{"FirstName":"Francesko","LastName":"Totti","DateOfBirth":"1979-01-03T00:00:00","Active":true,"TeamId":7,"TeamRoleId":1,"CountryId":6,"PositionId":19,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"totti.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"totti.jpg\""],"Content-Type":["image/jpeg"]},"Length":52905,"Name":"Image","FileName":"totti.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1209, CAST(N'2020-07-01T13:50:06.8036390' AS DateTime2), N'Add new team member', N'{"FirstName":"Alessandro","LastName":"Del Piero","DateOfBirth":"1973-01-03T00:00:00","Active":true,"TeamId":4,"TeamRoleId":1,"CountryId":6,"PositionId":19,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"del piero.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"del piero.jpg\""],"Content-Type":["image/jpeg"]},"Length":32563,"Name":"Image","FileName":"del piero.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1210, CAST(N'2020-07-01T13:50:52.2925973' AS DateTime2), N'Add new team member', N'{"FirstName":"Merih","LastName":"Demiral","DateOfBirth":"1998-01-03T00:00:00","Active":true,"TeamId":4,"TeamRoleId":1,"CountryId":19,"PositionId":7,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"demiral.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"demiral.jpg\""],"Content-Type":["image/jpeg"]},"Length":49368,"Name":"Image","FileName":"demiral.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1211, CAST(N'2020-07-01T13:51:42.7344266' AS DateTime2), N'Add new team member', N'{"FirstName":"Mattias","LastName":"De light","DateOfBirth":"1999-11-11T00:00:00","Active":true,"TeamId":4,"TeamRoleId":1,"CountryId":14,"PositionId":6,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"de light.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"de light.jpg\""],"Content-Type":["image/jpeg"]},"Length":29645,"Name":"Image","FileName":"de light.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1212, CAST(N'2020-07-01T13:52:36.6889965' AS DateTime2), N'Get all team members', N'{"TeamName":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1213, CAST(N'2020-07-01T13:53:15.8600730' AS DateTime2), N'Get all team members', N'{"TeamName":null,"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1214, CAST(N'2020-07-01T13:54:02.2326316' AS DateTime2), N'Add new team member', N'{"FirstName":"Mattias","LastName":"De light","DateOfBirth":"1999-11-11T00:00:00","Active":true,"TeamId":4,"TeamRoleId":1,"CountryId":14,"PositionId":5,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"de light.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"de light.jpg\""],"Content-Type":["image/jpeg"]},"Length":29645,"Name":"Image","FileName":"de light.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1215, CAST(N'2020-07-01T13:54:56.9463147' AS DateTime2), N'Add new team member', N'{"FirstName":"Douglas","LastName":"Costa","DateOfBirth":"1991-01-01T00:00:00","Active":true,"TeamId":8,"TeamRoleId":1,"CountryId":9,"PositionId":22,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"douglas.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"douglas.jpg\""],"Content-Type":["image/jpeg"]},"Length":45929,"Name":"Image","FileName":"douglas.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1216, CAST(N'2020-07-01T13:55:51.7837352' AS DateTime2), N'Add new team member', N'{"FirstName":"Juan","LastName":"Cuadrado","DateOfBirth":"1989-02-12T00:00:00","Active":true,"TeamId":11,"TeamRoleId":1,"CountryId":12,"PositionId":20,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"cudaraddo.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"cudaraddo.jpg\""],"Content-Type":["image/jpeg"]},"Length":6489,"Name":"Image","FileName":"cudaraddo.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1217, CAST(N'2020-07-01T13:56:50.1847553' AS DateTime2), N'Add new team member', N'{"FirstName":"Gianluidji","LastName":"Buffon","DateOfBirth":"1975-05-10T00:00:00","Active":true,"TeamId":15,"TeamRoleId":1,"CountryId":8,"PositionId":3,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"buffon.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"buffon.png\""],"Content-Type":["image/png"]},"Length":118400,"Name":"Image","FileName":"buffon.png"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1218, CAST(N'2020-07-01T13:57:43.3913370' AS DateTime2), N'Add new team member', N'{"FirstName":"Roberto","LastName":"Firmino","DateOfBirth":"1993-05-15T00:00:00","Active":true,"TeamId":18,"TeamRoleId":1,"CountryId":9,"PositionId":21,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"firmino.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"firmino.jpg\""],"Content-Type":["image/jpeg"]},"Length":11059,"Name":"Image","FileName":"firmino.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1219, CAST(N'2020-07-01T13:58:46.6157494' AS DateTime2), N'Add new team member', N'{"FirstName":"Eden","LastName":"Hazard","DateOfBirth":"1993-05-15T00:00:00","Active":true,"TeamId":20,"TeamRoleId":1,"CountryId":6,"PositionId":21,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"hazard.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"hazard.jpg\""],"Content-Type":["image/jpeg"]},"Length":10852,"Name":"Image","FileName":"hazard.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1220, CAST(N'2020-07-01T13:59:30.2605272' AS DateTime2), N'Add new team member', N'{"FirstName":"Miralem","LastName":"Pjanic","DateOfBirth":"1990-02-20T00:00:00","Active":true,"TeamId":4,"TeamRoleId":1,"CountryId":3,"PositionId":16,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"pjanica.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"pjanica.jpg\""],"Content-Type":["image/jpeg"]},"Length":19220,"Name":"Image","FileName":"pjanica.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1221, CAST(N'2020-07-01T14:00:26.8003919' AS DateTime2), N'Add new team member', N'{"FirstName":"Sergio","LastName":"Ramos","DateOfBirth":"1984-05-16T00:00:00","Active":true,"TeamId":11,"TeamRoleId":1,"CountryId":6,"PositionId":5,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"ramos.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"ramos.jpg\""],"Content-Type":["image/jpeg"]},"Length":57695,"Name":"Image","FileName":"ramos.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1222, CAST(N'2020-07-01T14:00:41.2876318' AS DateTime2), N'Get all team members', N'{"TeamName":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1223, CAST(N'2020-07-01T14:01:36.8529562' AS DateTime2), N'Get all team members', N'{"TeamName":null,"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1224, CAST(N'2020-07-01T14:03:38.1255877' AS DateTime2), N'Add new team member', N'{"FirstName":"Paul","LastName":"Pogba","DateOfBirth":"1994-05-16T00:00:00","Active":true,"TeamId":14,"TeamRoleId":1,"CountryId":13,"PositionId":12,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"pogba.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"pogba.jpg\""],"Content-Type":["image/jpeg"]},"Length":23525,"Name":"Image","FileName":"pogba.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1225, CAST(N'2020-07-01T14:03:59.4988850' AS DateTime2), N'Get all team members', N'{"TeamName":null,"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1226, CAST(N'2020-07-01T14:04:37.9848516' AS DateTime2), N'Get selected team member', N'21', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1227, CAST(N'2020-07-01T14:05:46.6144946' AS DateTime2), N'Update selected team member', N'{"FirstName":"Paull","LastName":"Pogbaa","DateOfBirth":"1985-03-03T00:00:00","Active":true,"TeamId":3,"TeamRoleId":1,"CountryId":6,"PositionId":15,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"chelsea.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"chelsea.jpg\""],"Content-Type":["image/jpeg"]},"Length":91664,"Name":"Image","FileName":"chelsea.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1228, CAST(N'2020-07-01T14:05:57.6510208' AS DateTime2), N'Get selected team member', N'21', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1229, CAST(N'2020-07-01T14:06:27.8758916' AS DateTime2), N'Delete selected team member', N'21', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1230, CAST(N'2020-07-01T14:06:38.3598543' AS DateTime2), N'Get selected team member', N'21', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1231, CAST(N'2020-07-01T14:07:00.5272944' AS DateTime2), N'Add new team member', N'{"FirstName":"Paul","LastName":"Pogba","DateOfBirth":"1994-05-16T00:00:00","Active":true,"TeamId":14,"TeamRoleId":1,"CountryId":13,"PositionId":12,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"pogba.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"pogba.jpg\""],"Content-Type":["image/jpeg"]},"Length":23525,"Name":"Image","FileName":"pogba.jpg"}}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1232, CAST(N'2020-07-01T14:07:41.8281077' AS DateTime2), N'Get Countries', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1233, CAST(N'2020-07-01T14:07:57.7576259' AS DateTime2), N'Get Players Positions', N'{"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1234, CAST(N'2020-07-01T14:08:20.5112191' AS DateTime2), N'Get all team members', N'{"TeamName":null,"Keywords":null,"PerPage":10,"Page":2}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1235, CAST(N'2020-07-01T14:08:34.2127154' AS DateTime2), N'Get Team Roles', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1236, CAST(N'2020-07-01T14:08:48.5160151' AS DateTime2), N'Get Teams', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1237, CAST(N'2020-07-01T14:09:21.6850375' AS DateTime2), N'Get use cases', N'{"Keywords":null,"PerPage":10,"Page":1}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [UserId]) VALUES (1238, CAST(N'2020-07-01T14:09:43.2810695' AS DateTime2), N'Get users activity', N'{"UserId":0,"StartDate":null,"EndDate":null,"Keywords":null,"PerPage":10,"Page":1}', 1)
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
SET IDENTITY_INSERT [dbo].[UseCases] ON 

INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (1, CAST(N'2020-06-30T18:23:23.1100000' AS DateTime2), NULL, NULL, N'Get All Users')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (2, CAST(N'2020-06-30T18:23:50.6500000' AS DateTime2), NULL, NULL, N'Get Selected User')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (3, CAST(N'2020-06-30T18:24:02.3400000' AS DateTime2), NULL, NULL, N'Register User')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (4, CAST(N'2020-06-30T18:24:10.2833333' AS DateTime2), NULL, NULL, N'Detele User')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (5, CAST(N'2020-06-30T18:24:26.7433333' AS DateTime2), NULL, NULL, N'Update User')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (6, CAST(N'2020-06-30T18:24:39.8800000' AS DateTime2), NULL, NULL, N'Get Team Roles')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (7, CAST(N'2020-06-30T18:24:59.2400000' AS DateTime2), NULL, NULL, N'Get Selected Team Role')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (8, CAST(N'2020-06-30T18:25:08.0233333' AS DateTime2), NULL, NULL, N'Create new Team Role')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (9, CAST(N'2020-06-30T18:25:23.1600000' AS DateTime2), NULL, NULL, N'Update Team Role')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (10, CAST(N'2020-06-30T18:25:43.0066667' AS DateTime2), NULL, NULL, N'Delete Team Role')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (11, CAST(N'2020-06-30T18:25:49.6066667' AS DateTime2), NULL, NULL, N'Get Teams')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (12, CAST(N'2020-06-30T18:26:00.0433333' AS DateTime2), NULL, NULL, N'Get selected team')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (13, CAST(N'2020-06-30T18:26:07.7833333' AS DateTime2), NULL, NULL, N'Create new team')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (14, CAST(N'2020-06-30T18:26:19.0533333' AS DateTime2), NULL, NULL, N'Update selected team')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (15, CAST(N'2020-06-30T18:26:29.3766667' AS DateTime2), NULL, NULL, N'Delete team')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (16, CAST(N'2020-06-30T18:26:37.1700000' AS DateTime2), NULL, NULL, N'Get Players Positions')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (17, CAST(N'2020-06-30T18:26:45.7700000' AS DateTime2), NULL, NULL, N'Get selected player position')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (18, CAST(N'2020-06-30T18:26:52.7633333' AS DateTime2), NULL, NULL, N'Create new position')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (19, CAST(N'2020-06-30T18:26:59.8633333' AS DateTime2), NULL, NULL, N'Update selected position')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (20, CAST(N'2020-06-30T18:27:17.0333333' AS DateTime2), NULL, NULL, N'Delete selected position')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (21, CAST(N'2020-06-30T18:27:24.2666667' AS DateTime2), NULL, NULL, N'Get all team members')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (22, CAST(N'2020-06-30T18:27:30.6066667' AS DateTime2), NULL, NULL, N'Get selected team member')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (23, CAST(N'2020-06-30T18:27:39.7700000' AS DateTime2), NULL, NULL, N'Add new team member')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (24, CAST(N'2020-06-30T18:27:48.3200000' AS DateTime2), NULL, NULL, N'Update selected team member')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (25, CAST(N'2020-06-30T18:28:00.6700000' AS DateTime2), NULL, NULL, N'Delete selected team member')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (26, CAST(N'2020-06-30T18:28:05.8133333' AS DateTime2), NULL, NULL, N'Get Countries')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (27, CAST(N'2020-06-30T18:28:14.2033333' AS DateTime2), NULL, NULL, N'Get selected country')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (28, CAST(N'2020-06-30T18:28:21.0966667' AS DateTime2), NULL, NULL, N'Add new country')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (29, CAST(N'2020-06-30T18:28:29.1366667' AS DateTime2), NULL, NULL, N'Update selected country')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (30, CAST(N'2020-06-30T18:28:46.6533333' AS DateTime2), NULL, NULL, N'Delete selected country')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (31, CAST(N'2020-06-30T18:28:54.0966667' AS DateTime2), NULL, NULL, N'Get users activity')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (32, CAST(N'2020-06-30T18:29:06.6033333' AS DateTime2), NULL, NULL, N'Get use cases')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (33, CAST(N'2020-06-30T18:29:12.7633333' AS DateTime2), NULL, NULL, N'Add use case to user')
INSERT [dbo].[UseCases] ([Id], [DateCreated], [DateModified], [DeletedAt], [Name]) VALUES (34, CAST(N'2020-06-30T18:29:16.9300000' AS DateTime2), NULL, NULL, N'Delete user use cases')
SET IDENTITY_INSERT [dbo].[UseCases] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [Username], [Password], [Email], [IsActive]) VALUES (1, CAST(N'2020-06-30T00:12:22.1633333' AS DateTime2), NULL, NULL, N'Veljko', N'Radenkovic', N'velja', N'velja123', N'velja@ict.edu.rs', 1)
INSERT [dbo].[Users] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [Username], [Password], [Email], [IsActive]) VALUES (2, CAST(N'2020-06-30T00:15:03.1654289' AS DateTime2), CAST(N'2020-06-30T00:15:04.9657758' AS DateTime2), NULL, N'Veljko', N'Radenkovic', N'velja test', N'test123', N'test@api.rs', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1, 1, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2, 1, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (3, 1, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (4, 1, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (5, 1, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (6, 1, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (7, 1, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (8, 1, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (9, 1, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (10, 1, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (11, 1, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (12, 1, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (13, 1, 13)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (14, 1, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (15, 1, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (16, 1, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (17, 1, 17)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (18, 1, 18)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (19, 1, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (20, 1, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (21, 1, 21)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (22, 1, 22)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (23, 1, 23)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (24, 1, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (25, 1, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (26, 1, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (27, 1, 27)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (28, 1, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (29, 1, 29)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (30, 1, 30)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (31, 1, 31)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (32, 1, 33)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (33, 1, 32)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
/****** Object:  Index [IX_TeamMembers_CountryId]    Script Date: 7/1/2020 11:20:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeamMembers_CountryId] ON [dbo].[TeamMembers]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeamMembers_PositionId]    Script Date: 7/1/2020 11:20:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeamMembers_PositionId] ON [dbo].[TeamMembers]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeamMembers_TeamId]    Script Date: 7/1/2020 11:20:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeamMembers_TeamId] ON [dbo].[TeamMembers]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeamMembers_TeamRoleId]    Script Date: 7/1/2020 11:20:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeamMembers_TeamRoleId] ON [dbo].[TeamMembers]
(
	[TeamRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UseCaseLogs_UserId]    Script Date: 7/1/2020 11:20:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_UseCaseLogs_UserId] ON [dbo].[UseCaseLogs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 7/1/2020 11:20:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UseCaseId]    Script Date: 7/1/2020 11:20:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UseCaseId] ON [dbo].[UserUseCases]
(
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 7/1/2020 11:20:35 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Countries] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Positions] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[TeamMembers] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[TeamRoles] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Teams] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[UseCases] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_Countries_CountryId] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Countries] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_Countries_CountryId]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_Positions_PositionId] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Positions] ([Id])
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_Positions_PositionId]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_TeamRoles_TeamRoleId] FOREIGN KEY([TeamRoleId])
REFERENCES [dbo].[TeamRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_TeamRoles_TeamRoleId]
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD  CONSTRAINT [FK_TeamMembers_Teams_TeamId] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TeamMembers] CHECK CONSTRAINT [FK_TeamMembers_Teams_TeamId]
GO
ALTER TABLE [dbo].[UseCaseLogs]  WITH CHECK ADD  CONSTRAINT [FK_UseCaseLogs_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UseCaseLogs] CHECK CONSTRAINT [FK_UseCaseLogs_Users_UserId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_UseCases_UseCaseId] FOREIGN KEY([UseCaseId])
REFERENCES [dbo].[UseCases] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_UseCases_UseCaseId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [club_project] SET  READ_WRITE 
GO
