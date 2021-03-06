USE [master]
GO
/****** Object:  Database [ipAtrix]    Script Date: 07.04.2014 10:56:35 ******/
CREATE DATABASE [ipAtrix]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ipAtrix', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ipAtrix.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ipAtrix_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ipAtrix_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ipAtrix] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ipAtrix].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ipAtrix] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ipAtrix] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ipAtrix] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ipAtrix] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ipAtrix] SET ARITHABORT OFF 
GO
ALTER DATABASE [ipAtrix] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ipAtrix] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ipAtrix] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ipAtrix] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ipAtrix] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ipAtrix] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ipAtrix] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ipAtrix] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ipAtrix] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ipAtrix] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ipAtrix] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ipAtrix] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ipAtrix] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ipAtrix] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ipAtrix] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ipAtrix] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ipAtrix] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ipAtrix] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ipAtrix] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ipAtrix] SET  MULTI_USER 
GO
ALTER DATABASE [ipAtrix] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ipAtrix] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ipAtrix] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ipAtrix] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ipAtrix]
GO
/****** Object:  Table [dbo].[Kontakt]    Script Date: 07.04.2014 10:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontakt](
	[kont_id] [int] IDENTITY(1,1) NOT NULL,
	[kont_vorname] [nvarchar](max) NULL,
	[kont_nachname] [nvarchar](max) NULL,
	[kont_bereich] [nvarchar](max) NULL,
	[kont_telefon] [numeric](18, 0) NULL,
	[kont_email] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kundennetzwerk]    Script Date: 07.04.2014 10:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kundennetzwerk](
	[kund_id] [int] IDENTITY(1,1) NOT NULL,
	[kund_spider_id] [int] NOT NULL,
	[kund_interneBez] [nvarchar](max) NOT NULL,
	[kund_schema] [nvarchar](max) NULL,
	[kund_element_id] [int] NOT NULL,
	[kund_inbetrieb] [date] NULL,
	[kund_ausserbetr] [date] NULL,
	[kund_garantie_id] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 07.04.2014 10:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[login_id] [int] IDENTITY(1,1) NOT NULL,
	[login_username] [nvarchar](max) NULL,
	[login_password] [nvarchar](max) NULL,
	[login_link] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Netzwerkelemente]    Script Date: 07.04.2014 10:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Netzwerkelemente](
	[netz_id] [int] IDENTITY(1,1) NOT NULL,
	[netz_element] [nvarchar](max) NULL,
	[netz_beschreibung] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ortschaft]    Script Date: 07.04.2014 10:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ortschaft](
	[ort_id] [int] IDENTITY(1,1) NOT NULL,
	[ort_name] [nchar](10) NULL,
	[ort_plz] [int] NULL,
	[ort_land] [nchar](10) NULL,
	[ort_kanton] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provider]    Script Date: 07.04.2014 10:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[pr_id] [int] IDENTITY(1,1) NOT NULL,
	[pr_firmenname] [nvarchar](max) NOT NULL,
	[pr_postfach] [nvarchar](50) NULL,
	[pr_kundennummer] [nvarchar](max) NULL,
	[pr_kontakt_id] [int] NULL,
	[pr_ort_id] [int] NULL,
	[pr_logindaten_id] [int] NULL,
	[pr_user_id] [int] NULL,
	[pr_telefon] [numeric](18, 0) NOT NULL,
	[pr_email] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 07.04.2014 10:56:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_vorname] [nvarchar](max) NULL,
	[user_nachname] [nvarchar](max) NULL,
	[user_pc] [nvarchar](max) NULL,
	[user_ip] [nvarchar](max) NULL,
	[user_benutzername] [nvarchar](max) NULL,
	[user_passwort] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [ipAtrix] SET  READ_WRITE 
GO
