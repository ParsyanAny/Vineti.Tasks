USE [master]
GO
/****** Object:  Database [CoffeeShopDB]    Script Date: 3/14/2021 8:40:26 PM ******/
CREATE DATABASE [CoffeeShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CoffeeShopDB', FILENAME = N'D:\Programms\SqlExpres\MSSQL15.SQLEXPRESS\MSSQL\DATA\CoffeeShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CoffeeShopDB_log', FILENAME = N'D:\Programms\SqlExpres\MSSQL15.SQLEXPRESS\MSSQL\DATA\CoffeeShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CoffeeShopDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CoffeeShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CoffeeShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CoffeeShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CoffeeShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CoffeeShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CoffeeShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CoffeeShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [CoffeeShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CoffeeShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CoffeeShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CoffeeShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CoffeeShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CoffeeShopDB] SET QUERY_STORE = OFF
GO
USE [CoffeeShopDB]
GO
/****** Object:  Table [dbo].[coffee]    Script Date: 3/14/2021 8:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coffee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nchar](25) NOT NULL,
	[price] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_coffee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 3/14/2021 8:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[phone] [varchar](15) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_list]    Script Date: 3/14/2021 8:40:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_list](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[coffee_id] [int] NOT NULL,
	[is_takeaway] [tinyint] NOT NULL,
	[discount] [tinyint] NOT NULL,
	[created_at] [datetime] NULL,
 CONSTRAINT [PK_order_list] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order_list]  WITH CHECK ADD FOREIGN KEY([coffee_id])
REFERENCES [dbo].[coffee] ([id])
GO
ALTER TABLE [dbo].[order_list]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
USE [master]
GO
ALTER DATABASE [CoffeeShopDB] SET  READ_WRITE 
GO
