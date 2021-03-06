USE [master]
GO
/****** Object:  Database [CarDealership]    Script Date: 10/30/2017 6:54:55 PM ******/
CREATE DATABASE [CarDealership]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarDealership', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CarDealership.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CarDealership_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CarDealership_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CarDealership] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarDealership].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarDealership] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarDealership] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarDealership] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarDealership] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarDealership] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarDealership] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarDealership] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarDealership] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarDealership] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarDealership] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarDealership] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarDealership] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarDealership] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarDealership] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarDealership] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarDealership] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarDealership] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarDealership] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarDealership] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarDealership] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarDealership] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarDealership] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarDealership] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarDealership] SET  MULTI_USER 
GO
ALTER DATABASE [CarDealership] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarDealership] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarDealership] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarDealership] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CarDealership] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CarDealership]
GO
/****** Object:  Table [dbo].[Buyer]    Script Date: 10/30/2017 6:54:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buyer](
	[BuyerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_Buyer] PRIMARY KEY CLUSTERED 
(
	[BuyerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Car]    Script Date: 10/30/2017 6:54:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[VinNumber] [nvarchar](50) NOT NULL,
	[CarMake] [nvarchar](50) NOT NULL,
	[CarModel] [nvarchar](50) NOT NULL,
	[CarYear] [int] NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Car_Buyer]    Script Date: 10/30/2017 6:54:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car_Buyer](
	[Car_BuyersID] [int] IDENTITY(1,1) NOT NULL,
	[CarID] [int] NOT NULL,
	[BuyerID] [int] NOT NULL,
 CONSTRAINT [PK_Car_Buyer] PRIMARY KEY CLUSTERED 
(
	[Car_BuyersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Buyer] ON 

INSERT [dbo].[Buyer] ([BuyerID], [FirstName], [LastName], [PhoneNumber]) VALUES (1, N'Brad', N'Berger', N'216-555-5555')
INSERT [dbo].[Buyer] ([BuyerID], [FirstName], [LastName], [PhoneNumber]) VALUES (2, N'Stephanie', N'Berger', N'440-555-5555')
INSERT [dbo].[Buyer] ([BuyerID], [FirstName], [LastName], [PhoneNumber]) VALUES (3, N'Beth', N'Jacobs', N'440-666-6666')
SET IDENTITY_INSERT [dbo].[Buyer] OFF
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([CarID], [VinNumber], [CarMake], [CarModel], [CarYear]) VALUES (1, N'1234567890', N'Nissan', N'Altima', 2013)
INSERT [dbo].[Car] ([CarID], [VinNumber], [CarMake], [CarModel], [CarYear]) VALUES (2, N'9876543211', N'Nissan', N'Rogue', 2015)
INSERT [dbo].[Car] ([CarID], [VinNumber], [CarMake], [CarModel], [CarYear]) VALUES (3, N'2345678910', N'Toyota', N'Corola', 2016)
SET IDENTITY_INSERT [dbo].[Car] OFF
SET IDENTITY_INSERT [dbo].[Car_Buyer] ON 

INSERT [dbo].[Car_Buyer] ([Car_BuyersID], [CarID], [BuyerID]) VALUES (1, 1, 1)
INSERT [dbo].[Car_Buyer] ([Car_BuyersID], [CarID], [BuyerID]) VALUES (2, 2, 2)
INSERT [dbo].[Car_Buyer] ([Car_BuyersID], [CarID], [BuyerID]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[Car_Buyer] OFF
ALTER TABLE [dbo].[Car_Buyer]  WITH CHECK ADD  CONSTRAINT [FK_Car_Buyer_Buyer] FOREIGN KEY([BuyerID])
REFERENCES [dbo].[Buyer] ([BuyerID])
GO
ALTER TABLE [dbo].[Car_Buyer] CHECK CONSTRAINT [FK_Car_Buyer_Buyer]
GO
ALTER TABLE [dbo].[Car_Buyer]  WITH CHECK ADD  CONSTRAINT [FK_Car_Buyer_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[Car] ([CarID])
GO
ALTER TABLE [dbo].[Car_Buyer] CHECK CONSTRAINT [FK_Car_Buyer_Car]
GO
USE [master]
GO
ALTER DATABASE [CarDealership] SET  READ_WRITE 
GO
