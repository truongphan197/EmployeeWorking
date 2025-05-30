USE [master]
GO
/****** Object:  Database [EmployeeWorking]    Script Date: 4/29/2025 10:33:53 AM ******/
CREATE DATABASE [EmployeeWorking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EmployeeWorking_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EmployeeWorking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EmployeeWorking_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EmployeeWorking.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EmployeeWorking] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EmployeeWorking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EmployeeWorking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EmployeeWorking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EmployeeWorking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EmployeeWorking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EmployeeWorking] SET ARITHABORT OFF 
GO
ALTER DATABASE [EmployeeWorking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EmployeeWorking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EmployeeWorking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EmployeeWorking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EmployeeWorking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EmployeeWorking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EmployeeWorking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EmployeeWorking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EmployeeWorking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EmployeeWorking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EmployeeWorking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EmployeeWorking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EmployeeWorking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EmployeeWorking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EmployeeWorking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EmployeeWorking] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EmployeeWorking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EmployeeWorking] SET RECOVERY FULL 
GO
ALTER DATABASE [EmployeeWorking] SET  MULTI_USER 
GO
ALTER DATABASE [EmployeeWorking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EmployeeWorking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EmployeeWorking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EmployeeWorking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EmployeeWorking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EmployeeWorking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EmployeeWorking', N'ON'
GO
ALTER DATABASE [EmployeeWorking] SET QUERY_STORE = ON
GO
ALTER DATABASE [EmployeeWorking] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EmployeeWorking]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/29/2025 10:33:53 AM ******/
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
/****** Object:  Table [dbo].[Attendances]    Script Date: 4/29/2025 10:33:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendances](
	[Id] [uniqueidentifier] NOT NULL,
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[OutletId] [uniqueidentifier] NOT NULL,
	[AttendanceDate] [date] NOT NULL,
	[AttendanceType] [varchar](3) NOT NULL,
	[AttendanceTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Attendances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/29/2025 10:33:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeId] [uniqueidentifier] NOT NULL,
	[EmployeeCode] [varchar](10) NOT NULL,
	[EmployeeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Outlets]    Script Date: 4/29/2025 10:33:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outlets](
	[OutletId] [uniqueidentifier] NOT NULL,
	[OutletCode] [varchar](10) NOT NULL,
	[OutletName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Outlets] PRIMARY KEY CLUSTERED 
(
	[OutletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250426041000_ConnectDB', N'9.0.4')
GO
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'45129569-5522-f011-943a-f7dcd67b27ed', N'a455dfd4-5222-f011-943a-f7dcd67b27ed', N'54c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-01' AS Date), N'IN', CAST(N'11:17:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'8d4697be-5522-f011-943a-f7dcd67b27ed', N'a455dfd4-5222-f011-943a-f7dcd67b27ed', N'54c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-01' AS Date), N'OUT', CAST(N'17:17:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'ff6184eb-5522-f011-943a-f7dcd67b27ed', N'a455dfd4-5222-f011-943a-f7dcd67b27ed', N'54c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-02' AS Date), N'IN', CAST(N'08:17:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'006284eb-5522-f011-943a-f7dcd67b27ed', N'a455dfd4-5222-f011-943a-f7dcd67b27ed', N'54c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-02' AS Date), N'OUT', CAST(N'18:17:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'f7da0afb-5522-f011-943a-f7dcd67b27ed', N'a455dfd4-5222-f011-943a-f7dcd67b27ed', N'54c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-03' AS Date), N'IN', CAST(N'08:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'f8da0afb-5522-f011-943a-f7dcd67b27ed', N'a455dfd4-5222-f011-943a-f7dcd67b27ed', N'54c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-03' AS Date), N'OUT', CAST(N'18:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'2c900c08-5622-f011-943a-f7dcd67b27ed', N'a455dfd4-5222-f011-943a-f7dcd67b27ed', N'54c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-04' AS Date), N'IN', CAST(N'09:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'2d900c08-5622-f011-943a-f7dcd67b27ed', N'a455dfd4-5222-f011-943a-f7dcd67b27ed', N'54c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-04' AS Date), N'OUT', CAST(N'17:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'bf048f68-5622-f011-943a-f7dcd67b27ed', N'eb545bdb-5222-f011-943a-f7dcd67b27ed', N'55c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-01' AS Date), N'IN', CAST(N'09:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'c0048f68-5622-f011-943a-f7dcd67b27ed', N'eb545bdb-5222-f011-943a-f7dcd67b27ed', N'55c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-01' AS Date), N'OUT', CAST(N'17:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'f5b4de6f-5622-f011-943a-f7dcd67b27ed', N'eb545bdb-5222-f011-943a-f7dcd67b27ed', N'55c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-02' AS Date), N'IN', CAST(N'09:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'f6b4de6f-5622-f011-943a-f7dcd67b27ed', N'eb545bdb-5222-f011-943a-f7dcd67b27ed', N'55c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-02' AS Date), N'OUT', CAST(N'17:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'90104b7a-5622-f011-943a-f7dcd67b27ed', N'eb545bdb-5222-f011-943a-f7dcd67b27ed', N'55c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-03' AS Date), N'IN', CAST(N'09:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'91104b7a-5622-f011-943a-f7dcd67b27ed', N'eb545bdb-5222-f011-943a-f7dcd67b27ed', N'55c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-03' AS Date), N'OUT', CAST(N'14:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'df1ac382-5622-f011-943a-f7dcd67b27ed', N'eb545bdb-5222-f011-943a-f7dcd67b27ed', N'55c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-04' AS Date), N'IN', CAST(N'08:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'e01ac382-5622-f011-943a-f7dcd67b27ed', N'eb545bdb-5222-f011-943a-f7dcd67b27ed', N'55c60320-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-04' AS Date), N'OUT', CAST(N'14:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'34f89896-5622-f011-943a-f7dcd67b27ed', N'ec545bdb-5222-f011-943a-f7dcd67b27ed', N'f6b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-04' AS Date), N'IN', CAST(N'10:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'35f89896-5622-f011-943a-f7dcd67b27ed', N'ec545bdb-5222-f011-943a-f7dcd67b27ed', N'f6b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-04' AS Date), N'OUT', CAST(N'14:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'2f767b9d-5622-f011-943a-f7dcd67b27ed', N'ec545bdb-5222-f011-943a-f7dcd67b27ed', N'f6b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-03' AS Date), N'IN', CAST(N'10:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'30767b9d-5622-f011-943a-f7dcd67b27ed', N'ec545bdb-5222-f011-943a-f7dcd67b27ed', N'f6b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-03' AS Date), N'OUT', CAST(N'18:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'551770a6-5622-f011-943a-f7dcd67b27ed', N'ec545bdb-5222-f011-943a-f7dcd67b27ed', N'f6b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-02' AS Date), N'IN', CAST(N'09:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'561770a6-5622-f011-943a-f7dcd67b27ed', N'ec545bdb-5222-f011-943a-f7dcd67b27ed', N'f6b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-02' AS Date), N'OUT', CAST(N'18:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'389998ad-5622-f011-943a-f7dcd67b27ed', N'ec545bdb-5222-f011-943a-f7dcd67b27ed', N'f6b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-01' AS Date), N'IN', CAST(N'09:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'399998ad-5622-f011-943a-f7dcd67b27ed', N'ec545bdb-5222-f011-943a-f7dcd67b27ed', N'f6b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-01' AS Date), N'OUT', CAST(N'15:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'2c2fadc5-5622-f011-943a-f7dcd67b27ed', N'08f2cbe1-5222-f011-943a-f7dcd67b27ed', N'f7b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-01' AS Date), N'IN', CAST(N'09:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'2d2fadc5-5622-f011-943a-f7dcd67b27ed', N'08f2cbe1-5222-f011-943a-f7dcd67b27ed', N'f7b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-01' AS Date), N'OUT', CAST(N'16:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'd0261fcd-5622-f011-943a-f7dcd67b27ed', N'08f2cbe1-5222-f011-943a-f7dcd67b27ed', N'f7b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-02' AS Date), N'IN', CAST(N'11:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'd1261fcd-5622-f011-943a-f7dcd67b27ed', N'08f2cbe1-5222-f011-943a-f7dcd67b27ed', N'f7b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-02' AS Date), N'OUT', CAST(N'16:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'3f320fd7-5622-f011-943a-f7dcd67b27ed', N'08f2cbe1-5222-f011-943a-f7dcd67b27ed', N'f7b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-03' AS Date), N'IN', CAST(N'11:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'40320fd7-5622-f011-943a-f7dcd67b27ed', N'08f2cbe1-5222-f011-943a-f7dcd67b27ed', N'f7b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-03' AS Date), N'OUT', CAST(N'18:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'39a558df-5622-f011-943a-f7dcd67b27ed', N'08f2cbe1-5222-f011-943a-f7dcd67b27ed', N'f7b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-04' AS Date), N'IN', CAST(N'08:00:49.7400000' AS Time))
INSERT [dbo].[Attendances] ([Id], [EmployeeId], [OutletId], [AttendanceDate], [AttendanceType], [AttendanceTime]) VALUES (N'3aa558df-5622-f011-943a-f7dcd67b27ed', N'08f2cbe1-5222-f011-943a-f7dcd67b27ed', N'f7b2743b-5322-f011-943a-f7dcd67b27ed', CAST(N'2025-04-04' AS Date), N'OUT', CAST(N'18:00:49.7400000' AS Time))
GO
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeCode], [EmployeeName]) VALUES (N'a455dfd4-5222-f011-943a-f7dcd67b27ed', N'NV001', N'Nhân viên 1')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeCode], [EmployeeName]) VALUES (N'eb545bdb-5222-f011-943a-f7dcd67b27ed', N'NV002', N'Nhân viên 2')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeCode], [EmployeeName]) VALUES (N'ec545bdb-5222-f011-943a-f7dcd67b27ed', N'NV003', N'Nhân viên 3')
INSERT [dbo].[Employees] ([EmployeeId], [EmployeeCode], [EmployeeName]) VALUES (N'08f2cbe1-5222-f011-943a-f7dcd67b27ed', N'NV004', N'Nhân viên 4')
GO
INSERT [dbo].[Outlets] ([OutletId], [OutletCode], [OutletName]) VALUES (N'54c60320-5322-f011-943a-f7dcd67b27ed', N'OL001', N'Cửa hàng 1')
INSERT [dbo].[Outlets] ([OutletId], [OutletCode], [OutletName]) VALUES (N'55c60320-5322-f011-943a-f7dcd67b27ed', N'OL002', N'Cửa hàng 2')
INSERT [dbo].[Outlets] ([OutletId], [OutletCode], [OutletName]) VALUES (N'f6b2743b-5322-f011-943a-f7dcd67b27ed', N'OL003', N'Cửa hàng 3')
INSERT [dbo].[Outlets] ([OutletId], [OutletCode], [OutletName]) VALUES (N'f7b2743b-5322-f011-943a-f7dcd67b27ed', N'OL004', N'Cửa hàng 4')
GO
/****** Object:  Index [IX_Attendances_EmployeeId]    Script Date: 4/29/2025 10:33:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_Attendances_EmployeeId] ON [dbo].[Attendances]
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Attendances_OutletId]    Script Date: 4/29/2025 10:33:53 AM ******/
CREATE NONCLUSTERED INDEX [IX_Attendances_OutletId] ON [dbo].[Attendances]
(
	[OutletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attendances] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Employees] ADD  DEFAULT (newsequentialid()) FOR [EmployeeId]
GO
ALTER TABLE [dbo].[Outlets] ADD  DEFAULT (newsequentialid()) FOR [OutletId]
GO
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_Employees_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([EmployeeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_Employees_EmployeeId]
GO
ALTER TABLE [dbo].[Attendances]  WITH CHECK ADD  CONSTRAINT [FK_Attendances_Outlets_OutletId] FOREIGN KEY([OutletId])
REFERENCES [dbo].[Outlets] ([OutletId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attendances] CHECK CONSTRAINT [FK_Attendances_Outlets_OutletId]
GO
/****** Object:  StoredProcedure [dbo].[sp_SummaryWorking]    Script Date: 4/29/2025 10:33:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_SummaryWorking]
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    CREATE TABLE SummaryWorking (
        EmployeeCode VARCHAR(10),
        EmployeeName NVARCHAR(50),
        OutletCode VARCHAR(10),
        OutletName NVARCHAR(50),
        WorkingDate DATE,
        WorkingHours DECIMAL(5,1)
    );

    INSERT INTO SummaryWorking
    SELECT 
        e.EmployeeCode,
        e.EmployeeName,
        o.OutletCode,
        o.OutletName,
        employee_in.AttendanceDate AS WorkingDate,
        DATEDIFF(MINUTE, employee_in.AttendanceTime, employee_out.AttendanceTime)/60 AS WorkingHours
    FROM 
        Attendances employee_in
        JOIN Attendances employee_out ON 
            employee_in.EmployeeId = employee_out.EmployeeId AND
            employee_in.OutletId = employee_out.OutletId AND
            CAST(employee_in.AttendanceDate AS DATE) = CAST(employee_out.AttendanceDate AS DATE) AND
            employee_in.AttendanceType = 'IN' AND
            employee_out.AttendanceType = 'OUT' AND
            employee_in.AttendanceTime < employee_out.AttendanceTime
        JOIN Employees e ON employee_in.EmployeeId = e.EmployeeId
        JOIN Outlets o ON employee_in.OutletId = o.OutletId
    WHERE
        employee_in.AttendanceDate BETWEEN @StartDate AND @EndDate;

    DECLARE @Columns NVARCHAR(200) = '';
    DECLARE @SQL NVARCHAR(MAX);

    SELECT @Columns = @Columns + QUOTENAME(LEFT(CONVERT(VARCHAR, WorkingDate, 106), LEN(CONVERT(VARCHAR, WorkingDate, 106))-5)) + ',' 
    FROM (SELECT DISTINCT WorkingDate FROM SummaryWorking WHERE WorkingDate BETWEEN @StartDate AND @EndDate) AS Dates
    ORDER BY WorkingDate;

    SET @Columns = LEFT(@Columns, LEN(@Columns) - 1);

    SET @SQL = N'
    SELECT 
        EmployeeCode,
        EmployeeName,
        OutletCode,
        OutletName,
        ' + @Columns + '
    FROM 
        (SELECT 
            EmployeeCode,
            EmployeeName,
            OutletCode,
            OutletName,
			LEFT(CONVERT(VARCHAR, WorkingDate, 106), LEN(CONVERT(VARCHAR, WorkingDate, 106))-5) AS WorkingDateStr,
            WorkingHours
        FROM SummaryWorking) AS TEmpTable
    PIVOT (
        SUM(WorkingHours)
        FOR WorkingDateStr IN (' + @Columns + ')
    ) AS PivotTable
    ORDER BY EmployeeCode;';
	print @SQL;
    EXEC sp_executesql @SQL;
    DROP TABLE SummaryWorking;
END;
GO
USE [master]
GO
ALTER DATABASE [EmployeeWorking] SET  READ_WRITE 
GO
