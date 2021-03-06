USE [master]
GO
/****** Object:  Database [Kratoss]    Script Date: 7/21/2021 2:36:57 PM ******/
CREATE DATABASE [Kratoss]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kratoss', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Kratoss.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Kratoss_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Kratoss_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Kratoss] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kratoss].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kratoss] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kratoss] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kratoss] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kratoss] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kratoss] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kratoss] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kratoss] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kratoss] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kratoss] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kratoss] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kratoss] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kratoss] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kratoss] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kratoss] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kratoss] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kratoss] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kratoss] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kratoss] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kratoss] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kratoss] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kratoss] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kratoss] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kratoss] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kratoss] SET  MULTI_USER 
GO
ALTER DATABASE [Kratoss] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kratoss] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kratoss] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kratoss] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Kratoss] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Kratoss]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cart](
	[id] [int] NOT NULL,
	[code] [varchar](20) NOT NULL,
	[Amount] [tinyint] NULL,
	[Username] [nvarchar](50) NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Contact](
	[id] [int] NOT NULL,
	[ContactName] [nvarchar](50) NULL,
	[Email] [varbinary](100) NULL,
	[Phone] [varchar](20) NULL,
	[ContactContent] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Username] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nchar](10) NULL,
	[Address] [nvarchar](150) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Event]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[id] [int] NOT NULL,
	[EventName] [nvarchar](100) NULL,
	[EventImage] [nvarchar](150) NULL,
	[Detail] [nvarchar](max) NULL,
	[EventDate] [date] NULL,
	[Actice] [bit] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FirstMenu]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FirstMenu](
	[id_firstMenu] [int] NOT NULL,
	[Categorize] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_FirstMenu] PRIMARY KEY CLUSTERED 
(
	[id_firstMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](100) NULL,
	[Note] [nvarchar](250) NULL,
	[TotalAmount] [float] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[order] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[code] [varchar](20) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductImage] [varchar](150) NULL,
	[Information] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[FirstPrice] [float] NULL,
	[SecondPrice] [float] NULL,
	[id_secondMenu] [int] NULL,
	[id_Pro] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SecondMenu]    Script Date: 7/21/2021 2:36:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondMenu](
	[id_secondMenu] [int] NOT NULL,
	[brand] [nvarchar](100) NULL,
	[id_firstMenu] [int] NULL,
 CONSTRAINT [PK_SecondMenu] PRIMARY KEY CLUSTERED 
(
	[id_secondMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Password], [Role]) VALUES (N'hoangngokdeptrai', N'123', 0)
INSERT [dbo].[Account] ([Username], [Password], [Role]) VALUES (N'keodang444', N'2432001', 0)
INSERT [dbo].[Account] ([Username], [Password], [Role]) VALUES (N'MinhS', N'123', 0)
INSERT [dbo].[Account] ([Username], [Password], [Role]) VALUES (N'qwe', N'qw', 0)
INSERT [dbo].[Account] ([Username], [Password], [Role]) VALUES (N'ratlalonbi', N'123', 1)
INSERT [dbo].[Account] ([Username], [Password], [Role]) VALUES (N'sa', N'123', 1)
INSERT [dbo].[Account] ([Username], [Password], [Role]) VALUES (N'sonnmhe150349', N'akikun2432001', 1)
INSERT [dbo].[Account] ([Username], [Password], [Role]) VALUES (N'tung123', N'123', 1)
INSERT [dbo].[Account] ([Username], [Password], [Role]) VALUES (N'tungpa', N'123456', 1)
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'keodang444', N'Kẹo Đắng', N'keodang444@gmail.com', N'0966240301', N'Tó')
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'sa', N'SA', N'sa@gmail.com', N'0966240301', N'Gầm Cầu')
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'sonnmhe150349', N'Nguyễn Minh Sơn', N'sonnmhe150349@fpt.edu.vn', N'0966240301', N'Hòa Lạc')
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'hoangngokdeptrai', N'Hoàng Ngô', N'hoangngo@gmail.com', N'0966240301', N'Ngõ 15')
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'MinhS', N'Minh Sơn', N'minhs@gmail.com', N'0966240301', N'Hà Nội')
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'MinhS', N'Minh Sơn', N'minhs@gmail.com', N'0966240301', N'Hà Nội')
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'qwe', N'qwe', N'qwe@gmail.com', N'qwe       ', N'we')
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'ratlalonbi', N'Tung', N'tung@gmail.com', N'0966240301', N'Gam cau')
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'tungpa', N'Tung', N'tung@gmail.com', N'0966240301', N'Ha Noi')
INSERT [dbo].[Customers] ([Username], [CustomerName], [Email], [Phone], [Address]) VALUES (N'tung123', N'Tung', N'tung@gmail.com', N'096240301 ', N'Ha Noi')
INSERT [dbo].[FirstMenu] ([id_firstMenu], [Categorize]) VALUES (1, N'LAPTOP')
INSERT [dbo].[FirstMenu] ([id_firstMenu], [Categorize]) VALUES (2, N'PC')
INSERT [dbo].[FirstMenu] ([id_firstMenu], [Categorize]) VALUES (3, N'Monitor')
INSERT [dbo].[FirstMenu] ([id_firstMenu], [Categorize]) VALUES (4, N'Headphone')
INSERT [dbo].[FirstMenu] ([id_firstMenu], [Categorize]) VALUES (5, N'Camera')
INSERT [dbo].[FirstMenu] ([id_firstMenu], [Categorize]) VALUES (6, N'Chair')
INSERT [dbo].[FirstMenu] ([id_firstMenu], [Categorize]) VALUES (7, N'Mouse')
INSERT [dbo].[FirstMenu] ([id_firstMenu], [Categorize]) VALUES (8, N'Keyboard')
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'CAAV033', N'Avtech 123123', N'./img/CAAV033.png', N'50MP Full-Frame Exmor RS BSI CMOS Sensor || 
Up to 30 fps Shooting, ISO 50-102400 || 
8K 30p and 4K 120p Video in 10-Bit || 
4.3K 16-Bit Raw Video Output, S-Cinetone', 23, 1299000, 10000, 17, 1)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'CAAV038', N'Avtech HDTVI AVT450AP', N'./img/CAAV038.png', N'50MP Full-Frame Exmor RS BSI CMOS Sensor || 
Up to 30 fps Shooting, ISO 50-102400 || 
8K 30p and 4K 120p Video in 10-Bit || 
4.3K 16-Bit Raw Video Output, S-Cinetone', 100, 3889000, NULL, 17, 2)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'CAHL020', N'Camera HiLook IPC-D121H 2.0M', N'./img/CAHL020.png', N'50MP Full-Frame Exmor RS BSI CMOS Sensor || 
Up to 30 fps Shooting, ISO 50-102400 || 
8K 30p and 4K 120p Video in 10-Bit || 
4.3K 16-Bit Raw Video Output, S-Cinetone', 100, 1900000, NULL, 19, 3)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'CAVT014', N'Camera Vantech VT-3224H ( Analog )', N'./img/CAVT014.png', N'50MP Full-Frame Exmor RS BSI CMOS Sensor || 
Up to 30 fps Shooting, ISO 50-102400 || 
8K 30p and 4K 120p Video in 10-Bit || 
4.3K 16-Bit Raw Video Output, S-Cinetone', 100, 1209000, 799000, 18, 4)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'CAVT100', N'Camera IP Vantech VT-6300A', N'./img/CAVT100.png', N'50MP Full-Frame Exmor RS BSI CMOS Sensor || 
Up to 30 fps Shooting, ISO 50-102400 || 
8K 30p and 4K 120p Video in 10-Bit || 
4.3K 16-Bit Raw Video Output, S-Cinetone', 100, 690000, NULL, 18, 5)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'GHEG318', N'AKRacing SpiderMan Series Z680S Black', N'./img/GHEG318.png', N'ERGONOMIC OFFICE CHAIR: Hbada Swivel Office chair is made of high durable PU leather with built-in headrest and external lumbar pillow. It has a high backrest which ensures proper alignment and support for your back and neck.', 100, 10999000, 9999000, 21, 6)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'GHEG601', N'E-Dra Citizen Black/Black (EGC200)', N'./img/GHEG601.png', N'ERGONOMIC OFFICE CHAIR: Hbada Swivel Office chair is made of high durable PU leather with built-in headrest and external lumbar pillow. It has a high backrest which ensures proper alignment and support for your back and neck.', 100, 2489000, 2189000, 22, 7)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'GHEG603', N'E-Dra Citizen Black/Red (EGC200)', N'./img/GHEG603.png', N'ERGONOMIC OFFICE CHAIR: Hbada Swivel Office chair is made of high durable PU leather with built-in headrest and external lumbar pillow. It has a high backrest which ensures proper alignment and support for your back and neck.', 100, 2479000, 2179000, 22, 8)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'GHEG636', N'AKRacing Core LX Plus Red (AK-LXPLUS-RD)', N'./img/GHEG636.png', N'ERGONOMIC OFFICE CHAIR: Hbada Swivel Office chair is made of high durable PU leather with built-in headrest and external lumbar pillow. It has a high backrest which ensures proper alignment and support for your back and neck.', 100, 7999000, 7459000, 21, 9)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'GHEG683', N'CoolerMaster Caliber R2 Red (CMI-GCR2-2019R)', N'./img/GHEG683.png', N'ERGONOMIC OFFICE CHAIR: Hbada Swivel Office chair is made of high durable PU leather with built-in headrest and external lumbar pillow. It has a high backrest which ensures proper alignment and support for your back and neck.', 100, 4599000, 3889000, 20, 10)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'GHEG722', N'Cooler Master Caliber R1S Rose White', N'./img/GHEG722.png', N'ERGONOMIC OFFICE CHAIR: Hbada Swivel Office chair is made of high durable PU leather with built-in headrest and external lumbar pillow. It has a high backrest which ensures proper alignment and support for your back and neck.', 100, 4899000, 3999000, 20, 11)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'KBCS040', N'Corsair K63 Cherry MX Red (USB/Red Led) (CH-9115020-NA)', N'./img/KBCS040.png', N'The Corsair K100 RGB is the pinnacle of Corsair keyboards, offering the cutting-edge performance, style, durability, and customization that gamers need to stand above the rest', 100, 2649000, 1989000, 26, 12)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'KBCS046', N'Corsair K68 RGB - Cherry MX Red (CH-9102010-NA)', N'./img/KBCS046.png', N'The Corsair K100 RGB is the pinnacle of Corsair keyboards, offering the cutting-edge performance, style, durability, and customization that gamers need to stand above the rest', 100, 3689000, 3099000, 26, 13)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'KBDA053', N'Dareu EK87 Multi-Led Black (USB/Multi Led/Red switch)', N'./img/KBDA053.png', N'The Corsair K100 RGB is the pinnacle of Corsair keyboards, offering the cutting-edge performance, style, durability, and customization that gamers need to stand above the rest', 100, 669000, 599000, 28, 14)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'KBDA054', N'Dareu EK1280s Pink White (USB/Pink LED/Red switch)', N'./img/KBDA054.png', N'The Corsair K100 RGB is the pinnacle of Corsair keyboards, offering the cutting-edge performance, style, durability, and customization that gamers need to stand above the rest', 100, 1019000, 849000, 28, 15)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'KBED019', N'E-Dra EK308 RGB', N'./img/KBED019.png', N'The Corsair K100 RGB is the pinnacle of Corsair keyboards, offering the cutting-edge performance, style, durability, and customization that gamers need to stand above the rest', 100, 999000, 899000, 27, 16)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'KBED031', N'E-Dra EK311 Outemu Brown Switch Led Rainbow', N'./img/KBED031.png', N'The Corsair K100 RGB is the pinnacle of Corsair keyboards, offering the cutting-edge performance, style, durability, and customization that gamers need to stand above the rest', 100, 739000, 689000, 27, 17)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTAC705', N'Laptop Acer Gaming Aspire 7 A715-41G-R150 (NH.Q8SSV.004)', N'./img/LTAC705.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 21489000, 19989000, 6, 18)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTAC734', N'Laptop Acer Swift 3 SF314-59-568P (NX.A0MSV.002)', N'./img/LTAC734.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 20989000, 19789000, 6, 19)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTAC738', N'Laptop Acer Gaming Nitro 5 AN515-56-79U2', N'./img/LTAC738.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 25499000, 24499000, 6, 20)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTAU174', N'Laptop Asus VivoBook S530FN-BQ128T', N'./img/LTAU174.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 17499000, 16499000, 4, 21)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTAU521', N'Laptop Asus VivoBook TP470EA-EC027T', N'./img/LTAU521.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 15099000, 14999000, 4, 22)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTAU526', N'Laptop Asus Gaming ROG Strix G713QM-K4183T', N'./img/LTAU526.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 42000000, 42899000, 4, 23)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTDL126', N'Laptop Dell Vostro 3590B (P75F010N90B)', N'./img/LTDL126.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 16989000, 15799000, 2, 24)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTDL130', N'Laptop Dell Inspiron 7501 X3MRY1', N'./img/LTDL130.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 29989000, 29689000, 2, 25)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTDL133', N'Laptop Dell Gaming G3 15 G3500B', N'./img/LTDL133.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 32989000, 31989000, 2, 26)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTLE612', N'Laptop Lenovo Gaming 3-15IMH05 (81Y4006SVN)', N'./img/LTLE612.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 20999000, 19999000, 5, 27)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTLE666', N'Laptop Lenovo IdeaPad Gaming L340-15IRH (81LK01J3VN)', N'./img/LTLE666.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 18499000, 17999000, 5, 28)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTLE687', N'Laptop Lenovo IdeaPad 5 14ALC05', N'./img/LTLE687.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 15999000, 15699000, 5, 29)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTMA077', N'Apple Macbook Pro 13 Touchbar (MXK72)', N'./img/LTMA077.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 40989000, 37689000, 7, 30)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTMA087', N'Apple Macbook Air 13 (MGNE3SA/A)', N'./img/LTMA087.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 33989000, 31589000, 7, 31)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTMA089', N'Apple Macbook Pro 13 Touchbar (MYDA2SA/A)', N'./img/LTMA089.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 34989000, 31989000, 7, 32)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTMS337', N'Laptop MSI Gaming GF75 Thin 10SCSR (208VN)', N'./img/LTMS337.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 27989000, 25489000, 1, 33)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTMS361', N'Laptop MSI Gaming Bravo 17 A4DDR (200VN)', N'./img/LTMS361.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 24989000, 24489000, 1, 34)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTMS364', N'Laptop MSI Modern 14 B11MO (010VN)', N'./img/LTMS364.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 21989000, 21689000, 1, 35)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTHP833', N'Laptop HP Gaming Pavilion 15-ec1054AX (1N1H6PA)', N'./img/LTHP833.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 19999000, 19499000, 3, 36)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTHP858', N'Laptop HP Pavilion x360 14-dw1016TU (2H3Q0PA)', N'./img/LTHP858.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 15499000, 15449000, 3, 37)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'LTHP922', N'Laptop HP 15s-fq2558TU (46M26PA)', N'./img/LTHP922.png', N'Dominate the Game: Great performance meets long battery life with the Intel Core i7-11800H Processor - up to 4.6GHz, 8 cores, 16 threads, 24MB Intel Smart Cache. RTX The latest NVIDIA GeForce RTX 3050 Ti (4GB dedicated GDDR6 VRAM) is powered by award-winning architecture with new Ray Tracing Cores, Tensor Cores, and streaming multiprocessors support DirectX 12 Ultimate for the ultimate gaming performance.', 100, 19099000, 18999000, 3, 38)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MELO140', N'Logitech G403 Hero', N'./img/MELO140.png', N'Hyper durable materials – Engineered with high-grade polymer for durability. 60 million click mechanical switches – To feel crisp from the first click to the last', 100, 989000, NULL, 23, 39)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MELO166', N'Logitech G502 Hero KDA', N'./img/MELO166.png', N'Hyper durable materials – Engineered with high-grade polymer for durability. 60 million click mechanical switches – To feel crisp from the first click to the last', 100, 1999000, 1799000, 23, 40)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MENE043', N'Newmen GX-1 Pro Led Gaming Optical USB', N'./img/MENE043.png', N'Hyper durable materials – Engineered with high-grade polymer for durability. 60 million click mechanical switches – To feel crisp from the first click to the last', 100, 789000, NULL, 24, 41)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MENE090', N'Newmen G10 Plus (USB)', N'./img/MENE090.png', N'Hyper durable materials – Engineered with high-grade polymer for durability. 60 million click mechanical switches – To feel crisp from the first click to the last', 100, 159000, NULL, 24, 42)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MESS088', N'SteelSeries Rival 300 CS:GO Hyperbeast Edition (62363)', N'./img/MESS088.png', N'Hyper durable materials – Engineered with high-grade polymer for durability. 60 million click mechanical switches – To feel crisp from the first click to the last', 100, 1409000, NULL, 25, 43)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MESS100', N'SteelSeries Rival 105 2019 Edition (62415)', N'./img/MESS100.png', N'Hyper durable materials – Engineered with high-grade polymer for durability. 60 million click mechanical switches – To feel crisp from the first click to the last', 100, 639000, NULL, 25, 44)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MOAS122', N'Asus VG258Q Gaming Monitor', N'./img/MOAS122.png', N'23.8" Full HD IPS widescreen with 1920 x 1080 resolution. Response time: 4ms, refresh rate: 60 hertz, pixel pitch: 0.2745 millimeter. 178 degree wide viewing angle, display colors: 16.7 million', 100, 7399000, 6489000, 11, 45)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MOAS204', N'Asus VG34VQL1B Gaming Monitor', N'./img/MOAS204.png', N'23.8" Full HD IPS widescreen with 1920 x 1080 resolution. Response time: 4ms, refresh rate: 60 hertz, pixel pitch: 0.2745 millimeter. 178 degree wide viewing angle, display colors: 16.7 million', 100, 16499000, 15899000, 11, 46)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MOMS008', N'MSI Optix G27C4 Gaming Monitor', N'./img/MOMS008.png', N'23.8" Full HD IPS widescreen with 1920 x 1080 resolution. Response time: 4ms, refresh rate: 60 hertz, pixel pitch: 0.2745 millimeter. 178 degree wide viewing angle, display colors: 16.7 million', 100, 6779000, 5499000, 12, 47)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MOMS010', N'MSI Optix AG32CV Gaming Monitor', N'./img/MOMS010.png', N'23.8" Full HD IPS widescreen with 1920 x 1080 resolution. Response time: 4ms, refresh rate: 60 hertz, pixel pitch: 0.2745 millimeter. 178 degree wide viewing angle, display colors: 16.7 million', 100, 7499000, 6999000, 12, 48)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MOSA191', N'Samsung LC32JG54QQEXXV Gaming Monitor', N'./img/MOSA191.png', N'23.8" Full HD IPS widescreen with 1920 x 1080 resolution. Response time: 4ms, refresh rate: 60 hertz, pixel pitch: 0.2745 millimeter. 178 degree wide viewing angle, display colors: 16.7 million', 100, 10599000, 8299000, 13, 49)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'MOSA206', N'Samsung Odyssey G7 LC27G75TQSEXXV', N'./img/MOSA206.png', N'23.8" Full HD IPS widescreen with 1920 x 1080 resolution. Response time: 4ms, refresh rate: 60 hertz, pixel pitch: 0.2745 millimeter. 178 degree wide viewing angle, display colors: 16.7 million', 100, 28649000, 12699000, 13, 50)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'PCGM246', N'PC GAMING ASUS ROG STRIX', N'./img/PCGM246.png', N'System: AMD Ryzen 5 3600 3.6GHz (4.2GHz Max Turbo) | 8GB DDR4 RAM | 240GB SSD | Genuine Windows 10 Home 64-bit. Graphics: NVIDIA GeForce GT 710 1GB Dedicated Gaming Video Card | Display Connectors: HDMI, DVI, VGA.', 100, 136999000, 134599000, 8, 51)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'PCGM285', N'PC GAMING GIGABYTE AORUS 004', N'./img/PCGM285.png', N'System: AMD Ryzen 5 3600 3.6GHz (4.2GHz Max Turbo) | 8GB DDR4 RAM | 240GB SSD | Genuine Windows 10 Home 64-bit. Graphics: NVIDIA GeForce GT 710 1GB Dedicated Gaming Video Card | Display Connectors: HDMI, DVI, VGA.', 100, 46999000, 44999000, 10, 52)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'PCMS001', N'PC MSI Trident X Plus', N'./img/PCMS001.png', N'System: AMD Ryzen 5 3600 3.6GHz (4.2GHz Max Turbo) | 8GB DDR4 RAM | 240GB SSD | Genuine Windows 10 Home 64-bit. Graphics: NVIDIA GeForce GT 710 1GB Dedicated Gaming Video Card | Display Connectors: HDMI, DVI, VGA.', 100, 64499000, 62499000, 9, 53)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'PCMS002', N'PC MSI Trident A', N'./img/PCMS002.png', N'System: AMD Ryzen 5 3600 3.6GHz (4.2GHz Max Turbo) | 8GB DDR4 RAM | 240GB SSD | Genuine Windows 10 Home 64-bit. Graphics: NVIDIA GeForce GT 710 1GB Dedicated Gaming Video Card | Display Connectors: HDMI, DVI, VGA.', 100, 46599000, 45299000, 9, 54)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'TNED004', N'E-Dra EH412 Black', N'./img/TNED004.png', N'Bass boost & surround sound listening modes. Maximum sound pressure level: 114 dB at 1kHz, 3 percentage THD. THD, total harmonic distortion: <0.5 percentage at 1 kHz, 100 dB SPL', 100, 599000, 449000, 15, 55)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'TNED008', N'E-Dra EH412 Pro 7.1 Led RGB USB', N'./img/TNED008.png', N'Bass boost & surround sound listening modes. Maximum sound pressure level: 114 dB at 1kHz, 3 percentage THD. THD, total harmonic distortion: <0.5 percentage at 1 kHz, 100 dB SPL', 100, 599000, 449000, 15, 56)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'TNLO039', N'Logitech G331 Gaming Headphone', N'./img/TNLO039.png', N'Bass boost & surround sound listening modes. Maximum sound pressure level: 114 dB at 1kHz, 3 percentage THD. THD, total harmonic distortion: <0.5 percentage at 1 kHz, 100 dB SPL', 100, 1499000, 1299000, 14, 57)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'TNLO046', N'Logitech G733 LIGHTSPEED Wireless 7.1 RGB', N'./img/TNLO046.png', N'Bass boost & surround sound listening modes. Maximum sound pressure level: 114 dB at 1kHz, 3 percentage THD. THD, total harmonic distortion: <0.5 percentage at 1 kHz, 100 dB SPL', 100, 4299000, 2999000, 14, 58)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'TNSS083', N'SteelSeries Arctis 1 61427', N'./img/TNSS083.png', N'Bass boost & surround sound listening modes. Maximum sound pressure level: 114 dB at 1kHz, 3 percentage THD. THD, total harmonic distortion: <0.5 percentage at 1 kHz, 100 dB SPL', 100, 1599000, 1299000, 16, 59)
INSERT [dbo].[Product] ([code], [ProductName], [ProductImage], [Information], [Quantity], [FirstPrice], [SecondPrice], [id_secondMenu], [id_Pro]) VALUES (N'TNSS086', N'Steelseries Arctis 7P White WL HS-00021 - 61467', N'./img/TNSS086.png', N'Bass boost & surround sound listening modes. Maximum sound pressure level: 114 dB at 1kHz, 3 percentage THD. THD, total harmonic distortion: <0.5 percentage at 1 kHz, 100 dB SPL', 100, 4499000, 4349000, 16, 60)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (1, N'MSI', 1)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (2, N'DELL', 1)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (3, N'HP', 1)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (4, N'ASUS', 1)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (5, N'LENOVO', 1)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (6, N'ACER', 1)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (7, N'APPLE', 1)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (8, N'ASUS', 2)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (9, N'MSI', 2)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (10, N'GIGABYTE', 2)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (11, N'ASUS', 3)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (12, N'MSI', 3)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (13, N'SAMSUNG', 3)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (14, N'LOGITECH', 4)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (15, N'E-DRA', 4)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (16, N'STEELSERIES', 4)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (17, N'AVTECH', 5)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (18, N'VANTECH', 5)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (19, N'HILOOK', 5)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (20, N'COOLERMASTER', 6)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (21, N'AKRACING', 6)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (22, N'E-DRA', 6)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (23, N'LOGITECH', 7)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (24, N'NEWMEN', 7)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (25, N'STEELSERIES', 7)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (26, N'CORSAIR', 8)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (27, N'E-DRA', 8)
INSERT [dbo].[SecondMenu] ([id_secondMenu], [brand], [id_firstMenu]) VALUES (28, N'DAREU', 8)
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Account] FOREIGN KEY([Username])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SecondMenu] FOREIGN KEY([id_secondMenu])
REFERENCES [dbo].[SecondMenu] ([id_secondMenu])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SecondMenu]
GO
ALTER TABLE [dbo].[SecondMenu]  WITH CHECK ADD  CONSTRAINT [FK_SecondMenu_FirstMenu] FOREIGN KEY([id_firstMenu])
REFERENCES [dbo].[FirstMenu] ([id_firstMenu])
GO
ALTER TABLE [dbo].[SecondMenu] CHECK CONSTRAINT [FK_SecondMenu_FirstMenu]
GO
USE [master]
GO
ALTER DATABASE [Kratoss] SET  READ_WRITE 
GO
