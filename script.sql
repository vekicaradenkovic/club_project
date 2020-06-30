USE [master]
GO
/****** Object:  Database [club_project]    Script Date: 6/30/2020 7:52:38 PM ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/30/2020 7:52:40 PM ******/
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
/****** Object:  Table [dbo].[Countries]    Script Date: 6/30/2020 7:52:40 PM ******/
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
/****** Object:  Table [dbo].[Positions]    Script Date: 6/30/2020 7:52:40 PM ******/
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
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 6/30/2020 7:52:40 PM ******/
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
/****** Object:  Table [dbo].[TeamRoles]    Script Date: 6/30/2020 7:52:40 PM ******/
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
/****** Object:  Table [dbo].[Teams]    Script Date: 6/30/2020 7:52:40 PM ******/
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
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 6/30/2020 7:52:40 PM ******/
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
/****** Object:  Table [dbo].[UseCases]    Script Date: 6/30/2020 7:52:40 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 6/30/2020 7:52:40 PM ******/
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
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 6/30/2020 7:52:40 PM ******/
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
SET IDENTITY_INSERT [dbo].[Countries] OFF
SET IDENTITY_INSERT [dbo].[Positions] ON 

INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (1, CAST(N'2020-06-30T00:20:51.1663328' AS DateTime2), NULL, NULL, N'Levo krilo')
INSERT [dbo].[Positions] ([Id], [DateCreated], [DateModified], [DeletedAt], [PositionName]) VALUES (2, CAST(N'2020-06-30T00:20:58.6929212' AS DateTime2), NULL, NULL, N'Desni bek')
SET IDENTITY_INSERT [dbo].[Positions] OFF
SET IDENTITY_INSERT [dbo].[TeamMembers] ON 

INSERT [dbo].[TeamMembers] ([Id], [DateCreated], [DateModified], [DeletedAt], [FirstName], [LastName], [DateOfBirth], [Active], [TeamId], [TeamRoleId], [CountryId], [PhotoPath], [PositionId]) VALUES (1, CAST(N'2020-06-30T19:39:31.2866667' AS DateTime2), NULL, NULL, N'Dejan', N'Zukic', CAST(N'1985-03-03T00:00:00.0000000' AS DateTime2), 1, 1, 1, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[TeamMembers] OFF
SET IDENTITY_INSERT [dbo].[TeamRoles] ON 

INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (1, CAST(N'2020-06-30T00:21:18.3124801' AS DateTime2), NULL, NULL, N'Igrac')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (2, CAST(N'2020-06-30T00:21:24.3992052' AS DateTime2), NULL, NULL, N'Direktor')
INSERT [dbo].[TeamRoles] ([Id], [DateCreated], [DateModified], [DeletedAt], [RoleName]) VALUES (3, CAST(N'2020-06-30T00:21:36.8170994' AS DateTime2), NULL, NULL, N'Kondicioni trener')
SET IDENTITY_INSERT [dbo].[TeamRoles] OFF
SET IDENTITY_INSERT [dbo].[Teams] ON 

INSERT [dbo].[Teams] ([Id], [DateCreated], [DateModified], [DeletedAt], [TeamName], [PhotoPath], [Description]) VALUES (1, CAST(N'2020-06-30T00:22:25.5769755' AS DateTime2), NULL, NULL, N'Vojvodina', N'34dda8e9-129a-41d2-9259-bb7695f37cea.jpg', N'FK Vojvodina')
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
/****** Object:  Index [IX_TeamMembers_CountryId]    Script Date: 6/30/2020 7:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeamMembers_CountryId] ON [dbo].[TeamMembers]
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeamMembers_PositionId]    Script Date: 6/30/2020 7:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeamMembers_PositionId] ON [dbo].[TeamMembers]
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeamMembers_TeamId]    Script Date: 6/30/2020 7:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeamMembers_TeamId] ON [dbo].[TeamMembers]
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TeamMembers_TeamRoleId]    Script Date: 6/30/2020 7:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_TeamMembers_TeamRoleId] ON [dbo].[TeamMembers]
(
	[TeamRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UseCaseLogs_UserId]    Script Date: 6/30/2020 7:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UseCaseLogs_UserId] ON [dbo].[UseCaseLogs]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 6/30/2020 7:52:42 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UseCaseId]    Script Date: 6/30/2020 7:52:42 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UseCaseId] ON [dbo].[UserUseCases]
(
	[UseCaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 6/30/2020 7:52:42 PM ******/
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
