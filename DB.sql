USE [master]
GO
/****** Object:  Database [Camera_Store]    Script Date: 5/20/2020 2:10:12 PM ******/
CREATE DATABASE [Camera_Store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Camera_Store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Camera_Store.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Camera_Store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Camera_Store_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Camera_Store] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Camera_Store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Camera_Store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Camera_Store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Camera_Store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Camera_Store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Camera_Store] SET ARITHABORT OFF 
GO
ALTER DATABASE [Camera_Store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Camera_Store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Camera_Store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Camera_Store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Camera_Store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Camera_Store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Camera_Store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Camera_Store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Camera_Store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Camera_Store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Camera_Store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Camera_Store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Camera_Store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Camera_Store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Camera_Store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Camera_Store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Camera_Store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Camera_Store] SET RECOVERY FULL 
GO
ALTER DATABASE [Camera_Store] SET  MULTI_USER 
GO
ALTER DATABASE [Camera_Store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Camera_Store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Camera_Store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Camera_Store] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Camera_Store] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Camera_Store', N'ON'
GO
ALTER DATABASE [Camera_Store] SET QUERY_STORE = OFF
GO
USE [Camera_Store]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentsID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banners]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banners](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[BannerPath] [nvarchar](500) NULL,
	[BannerAlt] [nvarchar](500) NULL,
	[Url] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Banners] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportBills]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportBills](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[EmployeeID] [int] NULL,
	[ExportedDate] [datetime] NULL,
 CONSTRAINT [PK_ExportBills] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[ParentsID] [int] NULL,
	[ItemName] [nvarchar](50) NULL,
	[Url] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsletterCategories]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsletterCategories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [nvarchar](50) NULL,
	[Url] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_NewsletterCategories] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Newsletters]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Newsletters](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[CateID] [int] NULL,
	[ImagePath] [nvarchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[Subtitle] [nvarchar](4000) NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[Viewed] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Newsletters] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[OrderName] [nvarchar](50) NULL,
	[OrderEmail] [nvarchar](50) NULL,
	[OrderPhone] [nvarchar](50) NULL,
	[OrderAddress] [nvarchar](50) NULL,
	[OrderProvince] [nvarchar](50) NULL,
	[OrderDistinct] [nvarchar](50) NULL,
	[ShipName] [nvarchar](50) NULL,
	[ShipEmail] [nvarchar](50) NULL,
	[ShipPhone] [nvarchar](50) NULL,
	[ShipAddress] [nvarchar](500) NULL,
	[ShipProvince] [nvarchar](50) NULL,
	[ShipDisctrict] [nvarchar](50) NULL,
	[ShipNote] [nvarchar](500) NULL,
	[OrderDate] [datetime] NULL,
	[TotalAmount] [float] NULL,
	[ShipDate] [datetime] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdersDetail]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersDetail](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[OrderID] [int] NULL,
	[UnitPrice] [float] NULL,
	[Quantity] [int] NULL,
	[Discount] [float] NULL,
	[Amount] [float] NULL,
 CONSTRAINT [PK_OrdersDetail] PRIMARY KEY CLUSTERED 
(
	[Serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Others]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Others](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentsID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Others] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateParentsID] [int] NULL,
	[CateName] [nvarchar](50) NULL,
	[Icon] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Serial] [int] IDENTITY(1,1) NOT NULL,
	[CateID] [int] NULL,
	[SupplierID] [int] NULL,
	[ProductID] [nvarchar](500) NULL,
	[ProductName] [nvarchar](500) NULL,
	[ImagePath] [nvarchar](500) NULL,
	[Information] [nvarchar](max) NULL,
	[Introduction] [nvarchar](max) NULL,
	[Parameters] [nvarchar](max) NULL,
	[UnitInStock] [int] NULL,
	[UnitOnOrder] [int] NULL,
	[UnitPrice] [float] NULL,
	[Viewed] [int] NULL,
	[Bought] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Serial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PromotionProducts]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PromotionProducts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[Discount] [float] NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
 CONSTRAINT [PK_PromotionProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slideshows]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slideshows](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImagePath] [nvarchar](500) NULL,
	[ThumbnailPath] [nvarchar](500) NULL,
	[Link] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Slideshows] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NULL,
	[Description] [nvarchar](4000) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supports]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[SkypeNumber] [nvarchar](50) NULL,
	[SkypeUrl] [nvarchar](50) NULL,
	[AvatarPath] [nvarchar](500) NULL,
 CONSTRAINT [PK_Supports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/20/2020 2:10:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[FullName] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (1, NULL, N'An Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (2, NULL, N'Bà Rịa-Vũng Tàu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (3, NULL, N'Bạc Liêu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (4, NULL, N'Bắc Kạn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (5, NULL, N'Bắc Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (6, NULL, N'Bắc Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (7, NULL, N'Bến Tre', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (8, NULL, N'Bình Dương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (9, NULL, N'Bình Định', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (10, NULL, N'Bình Phước', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (11, NULL, N'Bình Thuận', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (12, NULL, N'Cà Mau', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (13, NULL, N'Cao Bằng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (14, NULL, N'Cần Thơ (TP)', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (15, NULL, N'Đà Nẵng (TP)', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (16, NULL, N'Đắk Lắk', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (17, NULL, N'Đắk Nông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (18, NULL, N'Điện Biên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (19, NULL, N'Đồng Nai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (20, NULL, N'Đồng Tháp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (21, NULL, N'Gia Lai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (22, NULL, N'Hà Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (23, NULL, N'Hà Nam', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (24, NULL, N'Hà Nội (TP)', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (26, NULL, N'Hà Tĩnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (27, NULL, N'Hải Dương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (28, NULL, N'Hải Phòng (TP)', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (29, NULL, N'Hòa Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (30, NULL, N'Hồ Chí Minh (TP)', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (31, NULL, N'Hậu Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (32, NULL, N'Hưng Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (33, NULL, N'Khánh Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (34, NULL, N'Kiên Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (35, NULL, N'Kon Tum', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (36, NULL, N'Lai Châu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (37, NULL, N'Lào Cai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (38, NULL, N'Lạng Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (39, NULL, N'Lâm Đồng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (40, NULL, N'Long An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (41, NULL, N'Nam Định', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (42, NULL, N'Nghệ An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (43, NULL, N'Ninh Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (44, NULL, N'Ninh Thuận', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (45, NULL, N'Phú Thọ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (46, NULL, N'Phú Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (47, NULL, N'Quảng Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (48, NULL, N'Quảng Nam', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (49, NULL, N'Quảng Ngãi', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (50, NULL, N'Quảng Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (51, NULL, N'Quảng Trị', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (52, NULL, N'Sóc Trăng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (53, NULL, N'Sơn La', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (54, NULL, N'Tây Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (55, NULL, N'Thái Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (56, NULL, N'Thái Nguyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (57, NULL, N'Thanh Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (58, NULL, N'Thừa Thiên - Huế', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (59, NULL, N'Tiền Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (60, NULL, N'Trà Vinh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (61, NULL, N'Tuyên Quang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (62, NULL, N'Vĩnh Long', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (63, NULL, N'Vĩnh Phúc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (64, NULL, N'Yên Bái', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (65, 1, N'An Phú', NULL, 0)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (66, 1, N'Châu Đốc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (67, 1, N'Châu Phú', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (68, 1, N'Châu Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (69, 1, N'Chợ Mới', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (70, 1, N'Long Xuyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (71, 1, N'Phú Tân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (72, 1, N'Tân Châu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (73, 1, N'Thoại Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (74, 1, N'Tịnh Biên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (75, 1, N'Tri Tôn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (76, 2, N'Côn Đảo', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (77, 2, N'Đất Đỏ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (78, 2, N'Tân Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (79, 2, N'Vũng Tàu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (80, 2, N'Xuyên Mộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (81, 2, N'Bà Rịa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (82, 2, N'Châu Đức', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (83, 2, N'Long Điền', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (84, 8, N'Bàu Bàng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (85, 8, N'Bắc Tân Uyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (86, 8, N'Bến Cát Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (87, 8, N'Dầu Tiếng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (88, 8, N'Dĩ An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (89, 8, N'Phú Giáo', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (90, 8, N'Tân Uyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (91, 8, N'TX. Thủ Dầu Một', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (92, 8, N'Thuận An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (93, 10, N'Bình Long', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (94, 10, N'Bù Đăng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (95, 10, N'Bù Đốp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (96, 10, N'Bù Gia Mập', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (97, 10, N'Chơn Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (98, 10, N'Đồng Phú', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (99, 10, N'Đồng Xoài', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (100, 10, N'Hớn Quản', NULL, 1)
GO
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (101, 10, N'Lộc Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (102, 10, N'Phú Riềng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (103, 10, N'Phước Long', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (104, 3, N'Đông Hải', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (105, 3, N'Giá Rai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (106, 3, N'Hòa Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (107, 3, N'Hồng Dân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (108, 3, N'Phước Long', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (109, 3, N'Vĩnh Lợi', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (110, 3, N'TP. Bạc Liêu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (111, 4, N'Ba Bể', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (112, 4, N'Bạch Thông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (113, 4, N'Chợ Đồn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (114, 4, N'Chợ Mới', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (115, 4, N'Na Rì', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (116, 4, N'Ngân Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (117, 4, N'Pác Nặm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (118, 4, N'TX. Bắc Kạn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (119, 5, N'Hiệp Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (120, 5, N'Lạng Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (121, 5, N'Lục Nam', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (122, 5, N'Lục Ngạn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (123, 5, N'Sơn Động', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (124, 5, N'Tân Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (125, 5, N'Việt Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (126, 5, N'Yên Dũng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (127, 5, N'Yên Thế', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (128, 5, N'TP. Bắc Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (129, 6, N'Gia Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (130, 6, N'Lương Tài', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (131, 6, N'Quế Võ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (132, 6, N'Thuận Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (133, 6, N'Tiên Du', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (134, 6, N'Yên Phong', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (135, 6, N'TP. Bắc Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (136, 6, N'TX. Từ Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (137, 7, N'Ba Tri', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (138, 7, N'Bình Đại', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (139, 7, N'Châu Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (140, 7, N'Chợ Lách', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (141, 7, N'Giồng Trôm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (142, 7, N'Mỏ Cày Bắc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (143, 7, N'Mỏ Cày Nam', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (144, 7, N'Thanh Phúc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (145, 7, N'TP. Bến Tre', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (146, 9, N'An Lão', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (147, 9, N'An Nhơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (148, 9, N'Hoài Ân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (149, 9, N'Hoài Nhơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (150, 9, N'Phù Mỹ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (151, 9, N'Phù Cát', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (152, 9, N'Tây Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (153, 9, N'Tuy Phước', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (154, 9, N'Vân Canh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (155, 9, N'Vĩnh Thạnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (156, 9, N'TP. Quy Nhơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (157, 11, N'Đức Linh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (158, 11, N'Bắc Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (159, 11, N'Hàm Tân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (160, 11, N'Hàm Thuận Bắc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (161, 11, N'Hàm Thuận Nam', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (162, 11, N'Phú Quí', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (163, 11, N'Tánh Linh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (164, 11, N'Tuy Phong', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (165, 11, N'TP. Phan Thiết', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (166, 11, N'TX. La Gi', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (167, 12, N'Cái Nước', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (168, 12, N'Đầm Dơi', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (169, 12, N'Năm Căn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (170, 12, N'Ngọc Hiển', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (171, 12, N'Phú Tân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (172, 12, N'Thới Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (173, 12, N'Trần Văn Thời', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (174, 12, N'U Minh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (175, 12, N'TP. Cà Mau', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (176, 13, N'Bảo Lạc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (177, 13, N'Bảo Lâm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (178, 13, N'Hạ Lang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (179, 13, N'Hà Quảng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (180, 13, N'Hòa An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (181, 13, N'Nguyên Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (182, 13, N'Phục Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (183, 13, N'Quảng Uyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (184, 13, N'Thạch An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (185, 13, N'Thông Nông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (186, 13, N'Trà Lĩnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (187, 13, N'Trùng Khánh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (188, 13, N'TX. Cao Bằng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (189, 14, N'Trung tâm thành phố', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (190, 14, N'Cờ Đỏ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (191, 14, N'Phong Điền', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (192, 14, N'Thới Lai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (193, 14, N'Vĩnh Thạnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (194, 14, N'Bình Thủy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (195, 14, N'Cái Răng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (196, 14, N'Ninh Kiều', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (197, 14, N'Ô Môn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (198, 14, N'Thốt Nốt', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (199, 15, N'Trung tâm thành phố', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (200, 15, N'Hòa Vang', NULL, 1)
GO
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (201, 15, N'Hoàng Sa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (202, 15, N'Cẩm Lệ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (203, 15, N'Hải Châu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (204, 15, N'Liên Chiểu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (205, 15, N'Ngũ Hành Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (206, 15, N'Sơn Trà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (207, 15, N'Thanh Khê', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (208, 46, N'H. Đông Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (209, 46, N'H. Đồng Xuân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (210, 46, N'H. Phú Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (211, 46, N'H. Sơn Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (212, 46, N'H. Sông Hinh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (213, 46, N'H. Tây Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (214, 46, N'H. Tuy An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (215, 46, N'TP. Tuy Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (216, 46, N'TX. Sông Cầu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (217, 47, N'H. Bố Trạch', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (218, 47, N'H. Lệ Thủy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (219, 47, N'H. Minh Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (220, 47, N'H. Quảng Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (221, 47, N'H. Quảng Trạch', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (222, 47, N'H. Tuyên Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (223, 47, N'TP. Đồng Hới', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (224, 48, N'H. Bắc Trà My', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (225, 48, N'H. Đại lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (226, 48, N'H. Điện Bàn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (227, 48, N'H. Đông Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (228, 48, N'H. Duy Xuyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (229, 48, N'H. Hiệp Đức', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (230, 48, N'H. Nam Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (231, 48, N'H. Nam Trà My', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (232, 48, N'H. Nông Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (233, 48, N'H. Núi Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (234, 48, N'H. Phú Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (235, 48, N'H. Phước Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (236, 48, N'H. Quế Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (237, 48, N'H. Tây Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (238, 48, N'H. Thăng Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (239, 48, N'H. Tiên Phước', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (240, 48, N'TP. Hội An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (241, 48, N'TP. Tam Kỳ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (242, 49, N'H. Ba Tơ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (243, 49, N'H. Bình Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (244, 49, N'H. Đức Phổ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (245, 49, N'H. Lý Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (246, 49, N'H. Minh Long', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (247, 49, N'H. Mộ Đức', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (248, 49, N'H. Nghĩa Hành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (249, 49, N'H. Sơn Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (250, 49, N'H. Sơn Tây', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (251, 49, N'H. Sơn Tịnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (252, 49, N'H. Tây Trà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (253, 49, N'H. Trà Bồng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (254, 49, N'H. Tư Nghĩa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (255, 49, N'TP. Quảng Nghãi', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (256, 50, N'H. Ba Chẽ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (257, 50, N'H. Bình Liêu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (258, 50, N'H. Cô Tô', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (259, 50, N'H. Đầm Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (260, 50, N'H. Đông Triều', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (261, 50, N'H. Hải Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (262, 50, N'H. Hoành Bồ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (263, 50, N'H. Tiên Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (264, 50, N'H. Vân Đồn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (265, 50, N'H. Yên Hưng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (266, 50, N'TP. Hạ Long', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (267, 50, N'TP. Móng Cái', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (268, 50, N'TX. Cẩm Phả', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (269, 50, N'TX. Uông Bí', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (270, 40, N'Bến Lức', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (271, 40, N'Cần Đước', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (272, 40, N'Cần Giuộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (273, 40, N'Châu Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (274, 40, N'Đức Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (275, 40, N'Đức Huệ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (276, 40, N'Mộc Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (277, 40, N'Tân Hưng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (278, 40, N'Tân Thạnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (279, 40, N'Thạnh Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (280, 40, N'Thủ Thừa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (281, 40, N'Vĩnh Hưng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (282, 40, N'TP.Tân An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (283, 41, N'Giao Thủy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (284, 41, N'Hải Hậu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (285, 41, N'Mỹ Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (286, 41, N'Nam Trực', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (287, 41, N'Nghĩa Hưng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (288, 41, N'Trực Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (289, 41, N'Vụ Bản', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (290, 41, N'Xuân Trưởng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (291, 41, N'Ý Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (292, 41, N'TP.Nam Định', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (293, 42, N'Anh Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (294, 42, N'Con Cuông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (295, 42, N'Diễn Châu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (296, 42, N'Đô Lương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (297, 42, N'Kỳ Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (298, 42, N'Nam Đàn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (299, 42, N'Nghi Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (300, 42, N'Nghĩa Đàn', NULL, 1)
GO
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (301, 42, N'Quế Phong', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (302, 42, N'Quỳ Châu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (303, 42, N'Quỳ Hợp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (304, 42, N'Quỳnh Lưu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (305, 42, N'Tân Kỳ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (306, 42, N'Thanh Chương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (307, 42, N'Yên Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (308, 42, N'TP.Vinh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (309, 42, N'TX.Cửa Lò', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (310, 42, N'TX.Thái Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (311, 43, N'Gia Viễn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (312, 43, N'Hoa Lư', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (313, 43, N'Kim Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (314, 43, N'Nho Quan', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (315, 43, N'Yên Khánh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (316, 43, N'Yên Mô', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (317, 43, N'TP.Nình Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (318, 43, N'TX.Tam Hiệp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (319, 44, N'Bác Ái', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (320, 44, N'Ninh Hải', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (321, 44, N'Ninh Phước', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (322, 44, N'Ninh Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (323, 44, N'Thuận Bắc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (324, 44, N'Thuận Nam', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (325, 44, N'TP.Phan Rang- Tháp Chàm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (326, 45, N'Cẩm Khê', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (327, 45, N'Đoan Hùng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (328, 45, N'Hạ Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (329, 45, N'Lâm Thao', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (330, 45, N'Phù Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (331, 45, N'Tam Nông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (332, 45, N'Tân Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (333, 45, N'Thanh Ba', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (334, 45, N'Thanh Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (335, 45, N'Thanh Thủy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (336, 45, N'Yên Lập', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (337, 45, N'TP.Việt Trì', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (338, 45, N'TX.Phú Thọ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (339, 63, N'TP. Vĩnh Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (340, 63, N'Tam Dương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (341, 63, N'Lập Thạch', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (342, 63, N'Vĩnh Tường', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (343, 63, N'Yên Lạc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (344, 63, N'Bình Xuyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (345, 63, N'Mê Linh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (346, 63, N'TX. Phúc Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (347, 63, N'Tam Đảo', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (464, 61, N'Chiêm Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (465, 61, N'Hàm Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (466, 61, N'Na Hang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (467, 61, N'Sơn Dương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (468, 61, N'Yên Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (469, 61, N'TP. Tuyên Quang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (470, 62, N'Bình Minh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (471, 62, N'Bình Tân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (472, 62, N'Long Hồ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (473, 62, N'Mang Thít', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (474, 62, N'Tam Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (475, 62, N'Trà Ôn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (476, 62, N'Vũng Liêm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (477, 62, N'TP. Vĩnh Long', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (478, 21, N'TP. Pleiku', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (479, 21, N'TX. An Khê', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (480, 21, N'Ayun Pa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (481, 21, N'Chư Păh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (482, 21, N'Chư Prông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (483, 21, N'Chư Sê', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (484, 21, N'Đắk Đoa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (485, 22, N'Bắc Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (486, 22, N'Đồng Văn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (487, 22, N'Hoàng Su Phì', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (488, 22, N'Mèo Vạc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (489, 22, N'Quản Bạ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (490, 22, N'Vị Xuyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (491, 22, N'Xín Mần', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (492, 22, N'Yên Minh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (493, 23, N'TX. Phủ Lý', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (494, 23, N'Duy Tiên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (495, 23, N'Kim Bảng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (496, 23, N'Lý Nhân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (497, 23, N'Thanh Liêm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (498, 23, N'Bình Lục', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (499, 24, N'Ba Đình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (500, 24, N'Bắc Từ Liêm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (501, 24, N'Cầu Giấy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (502, 24, N'Đống Đa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (503, 24, N'Hà Đông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (504, 24, N'Hai Bà Trưng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (505, 24, N'Hoàn Kiếm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (506, 24, N'Hoàng Mã', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (507, 24, N'Long Biên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (508, 24, N'Nam Từ Liêm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (509, 24, N'Tây Hồ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (510, 24, N'Thanh Xuân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (511, 24, N'Sơn Tây', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (512, 24, N'Ba Vì', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (513, 24, N'Chương Mĩ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (514, 24, N'Đan Phượng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (515, 24, N'Đông Anh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (516, 24, N'Gia Lâm', NULL, 1)
GO
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (517, 24, N'Hoài Đức', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (518, 24, N'Mê Linh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (519, 24, N'Mỹ Đức', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (520, 24, N'Phú Xuyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (521, 24, N'Phú Thọ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (522, 24, N'Quốc Oai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (523, 24, N'Sóc Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (524, 24, N'Thạch Thất', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (525, 24, N'Thanh Oai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (526, 24, N'Thanh Trì', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (527, 24, N'Thường Tín', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (528, 24, N'Từ Liêm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (529, 24, N'Ứng Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (530, 36, N'Mường Tè', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (531, 36, N'Phong Thổ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (532, 36, N'Sin Hồ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (533, 36, N'Tam Ðường', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (534, 36, N'Tân Uyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (535, 36, N'Than Uyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (536, 36, N'TX.Lai Châu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (537, 37, N'Bạc Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (538, 37, N'Bảo Thượng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (539, 37, N'Bao Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (540, 37, N'Bát Xát', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (541, 37, N'Mường Khương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (542, 37, N'Sa Pa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (543, 37, N'Si Ma Cai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (544, 37, N'Van Bàn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (545, 37, N'TP.Lào Cai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (546, 38, N'Bảc Son', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (547, 38, N'Bình Gia', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (548, 38, N'Cao Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (549, 38, N'Chi Lang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (550, 38, N'Ðình Lập', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (551, 38, N'Hữu Lung', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (552, 38, N'Lộc Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (553, 38, N'Tràng Định', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (554, 38, N'Van Lãng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (555, 38, N'Van Quan', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (556, 38, N'TP.Lạng Son', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (557, 39, N'Bảo Lâm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (558, 39, N'Cát Tiên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (559, 39, N'Ðô Huoai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (560, 39, N'Ðam Rông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (561, 39, N'Di Linh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (562, 39, N'Ðon Duong', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (563, 39, N'Ðộc Trng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (564, 39, N'Lạc Duong', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (565, 39, N'Lâm Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (566, 39, N'TP.Bảo Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (567, 39, N'TP.Ðà Lạt', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (568, 16, N'Buôn Đôn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (569, 16, N'Cư Kuin', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (570, 16, N'Cư Mgar', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (571, 16, N'Ea Kar', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (572, 16, N'Ea Súp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (573, 16, N'EaHLeo', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (574, 16, N'Krông Ana', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (575, 16, N'Krông Búk', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (576, 16, N'Krông Năng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (577, 16, N'Krông Pắc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (578, 16, N'Lắk', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (579, 16, N'MDrắk', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (580, 16, N'TP.Buôn Ma Thuật', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (581, 16, N'TX.Buôn Hồ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (582, 17, N'Cư Jút', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (583, 17, N'Đắk GLong', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (584, 17, N'Đắk Mil', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (585, 17, N'Đắk RLấp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (586, 17, N'Đắk Song', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (587, 17, N'Krông Nô', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (588, 17, N'Tuy Đức', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (589, 17, N'TX.Gia Nghĩa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (590, 18, N'Điện Biên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (591, 18, N'Điện Biên Đông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (592, 18, N'Mường Chà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (593, 18, N'Mương Nhé', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (594, 18, N'Mường Ảng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (595, 18, N'Tủa Chùa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (596, 18, N'Tuần Giáo', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (597, 18, N'TP.Điện Biên Phủ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (598, 18, N'TX.Mường Lay', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (599, 19, N'Cẩm Mỹ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (600, 19, N'Định Quán', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (601, 19, N'Long Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (602, 19, N'Nhơn Trạch', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (603, 19, N'Tân Phú', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (604, 19, N'Thống Nhất', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (605, 19, N'Vĩnh Cửu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (606, 19, N'Xuân Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (607, 19, N'TP.Biên Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (608, 19, N'TX.Long Khánh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (609, 20, N'Cao Lãnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (610, 20, N'Châu Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (611, 20, N'Hồng Ngự', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (612, 20, N'Lai Vung', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (613, 20, N'Lấp Vò', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (614, 20, N'Tâm Nông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (615, 20, N'Tân Hồng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (616, 20, N'Thanh Bình', NULL, 1)
GO
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (617, 20, N'Tháp Mười', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (618, 20, N'TP.Cao Lãnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (619, 20, N'TX.Hồng Ngự', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (620, 20, N'TX.Sa Đéc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (621, 56, N'Đại Tử', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (622, 56, N'Định Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (623, 56, N'Đồng Hỷ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (624, 56, N'Phổ Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (625, 56, N'Phú Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (626, 56, N'Phú Lương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (627, 56, N'Võ Nhai', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (628, 56, N'TP.Thái Nguyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (629, 56, N'TX.Sông Công', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (630, 57, N'Bá Thước', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (631, 57, N'Cẩm Thúy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (632, 57, N'Đông Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (633, 57, N'Hà Trung', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (634, 57, N'Hậu Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (635, 57, N'Hoằng Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (636, 57, N'Lang Chánh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (637, 57, N'Mường Lát', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (638, 57, N'Nga Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (639, 57, N'Ngọc Lặc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (640, 57, N'Như Thanh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (641, 57, N'Như Xuân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (642, 57, N'Nông Cống', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (643, 57, N'Quan Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (644, 57, N'Quan Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (645, 57, N'Quảng Xương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (646, 57, N'Thạch Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (647, 57, N'Thiệu Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (648, 57, N'Thường Xuân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (649, 57, N'Thọ Xuân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (650, 57, N'Tĩnh Gia', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (651, 57, N'Triệu Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (652, 57, N'Vĩnh Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (653, 57, N'Yên Định', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (654, 57, N'TP.Thanh Hóa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (655, 57, N'TX.Bỉm Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (656, 57, N'TX.Sầm Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (657, 58, N'A Lưới', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (658, 58, N'Hường Trà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (659, 58, N'Nam Dông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (660, 58, N'Phong Điền', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (661, 58, N'Phú Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (662, 58, N'Phú Vang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (663, 58, N'Quang Điền', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (664, 58, N'TP.Huế', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (665, 58, N'TX.Hương Thủy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (666, 59, N'Cái Bè', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (667, 59, N'Cai Lây', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (668, 59, N'Châu Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (669, 59, N'Chợ Gạo', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (670, 59, N'Gò Công Đông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (671, 59, N'Gò Công Tây', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (672, 59, N'Tân Phú Đông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (673, 59, N'Tân Phước', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (674, 59, N'TP.Mỹ Tho', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (675, 59, N'TX.Gò Công', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (676, 60, N'Càng Long', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (677, 60, N'Cầu Kè', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (678, 60, N'Cầu Ngang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (679, 60, N'Châu Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (680, 60, N'Duyên Hải', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (681, 60, N'Tiểu Cần', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (682, 60, N'Trà Cú', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (683, 60, N'TP.Trà Vinh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (684, 26, N'Cẩm Xuyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (685, 26, N'Can Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (686, 26, N'Đức Thọ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (687, 26, N'Hương Khê', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (688, 26, N'Hương Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (689, 26, N'Kỳ Anh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (690, 26, N'Lộc Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (691, 26, N'Nghi Xuân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (692, 26, N'Thạch Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (693, 26, N'Vũ Quang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (694, 26, N'TP. Hà Tĩnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (695, 26, N'TX. Hồng Lĩnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (696, 27, N'Bình Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (697, 27, N'Cẩm Giàng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (698, 27, N'Gia Lộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (699, 27, N'Kim Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (700, 27, N'Kinh Môn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (701, 27, N'Nam Sách', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (702, 27, N'Ninh Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (703, 27, N'Thanh Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (704, 27, N'Thanh Miện', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (705, 27, N'Tứ Kỳ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (706, 27, N'TP. Hải Dương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (707, 27, N'TX. Chí Linh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (708, 28, N'Trung tâm thành phố', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (709, 28, N'An Dương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (710, 28, N'An Lão', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (711, 28, N'Bạch Long Vĩ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (712, 28, N'Cát Hải', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (713, 28, N'Kiến Thụy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (714, 28, N'Thủy Nguyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (715, 28, N'Tiên Lãng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (716, 28, N'Vĩnh Bảo', NULL, 1)
GO
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (717, 28, N'Đồ Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (718, 28, N'Dương Kính', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (719, 28, N'Hải An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (720, 28, N'Hồng Bàng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (721, 28, N'Kiến An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (722, 28, N'Lê Chân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (723, 28, N'Ngô Quyền', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (724, 28, N'Hải An', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (725, 29, N'Cao Phong', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (726, 29, N'Đà Bắc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (727, 29, N'Kỳ Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (728, 29, N'Lạc Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (729, 29, N'Lạc Thủy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (730, 29, N'Lương Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (731, 29, N'Mai Châu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (732, 29, N'Tân Lạc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (733, 29, N'Yên Thủy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (734, 29, N'Hòa Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (735, 30, N'Trung tâm thành phố', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (736, 30, N'Bình Chánh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (737, 30, N'Cần Giờ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (738, 30, N'Củ Chi', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (739, 30, N'Hóc Môn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (740, 30, N'Nhà Bè', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (741, 30, N'Quận 1', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (742, 30, N'Quận 2', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (743, 30, N'Quận 3', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (744, 30, N'Quận 4', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (745, 30, N'Quận 5', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (746, 30, N'Quận 6', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (747, 30, N'Quận 7', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (748, 30, N'Quận 8', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (749, 30, N'Quận 9', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (750, 30, N'Quận 10', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (751, 30, N'Quận 11', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (752, 30, N'Quận 12', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (753, 30, N'Bình Tân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (754, 30, N'Bình Thạnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (755, 30, N'Gò Vấp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (756, 30, N'Phú Nhuận', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (757, 30, N'Tân Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (758, 30, N'Tân Phú', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (759, 30, N'Thủ Đức', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (760, 31, N'Châu Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (761, 31, N'Châu Thành A', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (762, 31, N'Long Mỹ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (763, 31, N'Phụng Hiệp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (764, 31, N'Vị Thủy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (765, 31, N'TP. Vị Thanh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (766, 31, N'TX. Ngã Bảy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (767, 32, N'Ân Thi', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (768, 32, N'Khoái Châu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (769, 32, N'Kim Động', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (770, 32, N'Mỹ Hào', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (771, 32, N'Phù Cừ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (772, 32, N'Tiên Lữ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (773, 32, N'Văn Giang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (774, 32, N'Văn Lâm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (775, 32, N'Yên Mỹ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (776, 32, N'TP. Hưng Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (777, 33, N'Cam Lâm', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (778, 33, N'Diên Khánh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (779, 33, N'Khánh Sơn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (780, 33, N'Khánh Vĩnh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (781, 33, N'Ninh Hòa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (782, 33, N'Trường Sa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (783, 33, N'Vạn Ninh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (784, 33, N'TP. Nha Trang', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (785, 33, N'TX. Cam Ranh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (786, 34, N'An Biên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (787, 34, N'An Minh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (788, 34, N'Châu Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (789, 34, N'Giang Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (790, 34, N'Giồng Riềng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (791, 34, N'Gò Quao', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (792, 34, N'Hòn Đất', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (793, 34, N'Kiên Hải', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (794, 34, N'Kiên Lương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (795, 34, N'Phú Quốc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (796, 34, N'Tân Hiệp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (797, 34, N'U Minh Thượng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (798, 34, N'Vĩnh Thuận', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (799, 34, N'TP. Rạch Giá', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (800, 34, N'TX. Hà Tiên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (801, 51, N'TP. Long Xuyên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (802, 51, N'TP. Châu Đốc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (803, 51, N'An Phú', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (804, 51, N'TX. Tân Châu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (805, 51, N'Phú Tân', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (806, 51, N'Tịnh Biên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (807, 52, N'TP. Vũng Tàu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (808, 52, N'TP. Bà Rịa', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (809, 52, N'Xuyên Mộc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (810, 52, N'Long Điền', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (811, 53, N'TP. Mỹ Tho', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (812, 53, N'TP. Châu Đốc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (813, 53, N'Thị xã Gò Công', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (814, 53, N'Cái Bè', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (815, 53, N'Cai Lậy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (816, 53, N'Châu Thành', NULL, 1)
GO
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (817, 53, N'Chợ Gạo', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (818, 53, N'Gò Công Tây', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (819, 53, N'Gò Công Đông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (820, 53, N'Tân Phước', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (821, 53, N'Tân Phú Đông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (822, 53, N'Thị xã Cai Lậy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (823, 54, N'TP. Rạch Giá', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (824, 54, N'Thị xã Hà Tiên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (825, 54, N'Kiên Lương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (826, 54, N'Hòn Đất', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (827, 54, N'Tân Hiệp', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (828, 54, N'Châu Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (829, 54, N'Giồng Riềng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (830, 54, N'Gò Quao', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (831, 54, N'An Biên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (832, 54, N'An Minh', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (833, 54, N'Vĩnh Thuận', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (834, 54, N'Phú Quốc', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (835, 54, N'U Minh Thượng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (836, 54, N'Giang Thành', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (837, 35, N'Đắk Glei', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (838, 35, N'Đắk Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (839, 35, N'Đắk Tô', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (840, 35, N'Kon Plông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (841, 35, N'Kon Rẫy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (842, 35, N'Ngọc Hồi', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (843, 35, N'Sa Thầy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (844, 35, N'Tu Mơ Rông', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (845, 35, N'TP. Kon Tum', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (846, 55, N'Đông Hưng', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (847, 55, N'Hưng Hà', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (848, 55, N'Kiến Xương', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (849, 55, N'Quỳnh Phụ', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (850, 55, N'Thái Thụy', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (851, 55, N'Tiền Hải', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (852, 55, N'Vũ Thư', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (853, 55, N'TP. Thái Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (854, 64, N'Lục Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (855, 64, N'Mù Cang Chải', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (856, 64, N'Trạm Tấu', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (857, 64, N'Trấn Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (858, 64, N'Văn Chấn', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (859, 64, N'Văn Yên', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (860, 64, N'Yên Bình', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (861, 64, N'TP. Yên Bái', NULL, 1)
INSERT [dbo].[Addresses] ([ID], [ParentsID], [Name], [Description], [Status]) VALUES (862, 64, N'TX. Nghĩa Lộ', NULL, 1)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
SET IDENTITY_INSERT [dbo].[Banners] ON 

INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (1, 1, N'/img/8382baner quang cao.jpg', N'Banner 1', N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (2, 1, N'/img/7628dau ghi hinh copy.jpg', N'Banner 2', N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (3, 1, N'/img/2536lap daêt copy.jpg', N'Banner 3', N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (4, 1, N'/img/4225SMART IP.jpg', N'Banner 4', N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (5, 1, N'/img/74763558Purple(1200x90).jpg', N'Banner 5', N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (6, 1, N'/img/74763558Purple(1200x90).jpg', N'Banner 6', N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (8, 2, N'/upload/images/banner/Banner-Bao-Trom-T4-2016.jpg', NULL, N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (9, 2, N'/upload/images/banner/Banner-Chuong-Cua-T4-2016.jpg', NULL, N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (10, 2, N'/upload/images/banner/Banner-may-cham-cong-vuhoangtelecom-1.jpg', NULL, N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (11, 2, N'/upload/images/banner/Banner-Smarthome-1.png', NULL, N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (12, 2, N'/upload/images/banner/Banner-thiet-bi-mang-1.jpg', NULL, N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (13, 2, N'/upload/images/banner/Banner-Tong-dai-T4-2016.jpg', NULL, N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (14, 2, N'/upload/images/banner/Banner-Xuan-TBDTM.gif', NULL, N'#', 1)
INSERT [dbo].[Banners] ([ID], [Type], [BannerPath], [BannerAlt], [Url], [Status]) VALUES (15, 2, N'/upload/images/banner/ban-thiet-bi-vien-thong-gia-re-1.jpg', NULL, N'#', 1)
SET IDENTITY_INSERT [dbo].[Banners] OFF
SET IDENTITY_INSERT [dbo].[NewsletterCategories] ON 

INSERT [dbo].[NewsletterCategories] ([CateID], [CateName], [Url], [Status]) VALUES (1, N'Công trình dự án', NULL, 1)
INSERT [dbo].[NewsletterCategories] ([CateID], [CateName], [Url], [Status]) VALUES (2, N'Giải pháp an ninh', NULL, 1)
INSERT [dbo].[NewsletterCategories] ([CateID], [CateName], [Url], [Status]) VALUES (3, N'Tin khuyến mại', NULL, 1)
INSERT [dbo].[NewsletterCategories] ([CateID], [CateName], [Url], [Status]) VALUES (4, N'Xu hướng công nghệ', NULL, 1)
INSERT [dbo].[NewsletterCategories] ([CateID], [CateName], [Url], [Status]) VALUES (5, N'Tư vấn kỹ thuật', NULL, 1)
INSERT [dbo].[NewsletterCategories] ([CateID], [CateName], [Url], [Status]) VALUES (6, N'Tin tức & Sự kiện', NULL, 1)
SET IDENTITY_INSERT [dbo].[NewsletterCategories] OFF
SET IDENTITY_INSERT [dbo].[Newsletters] ON 

INSERT [dbo].[Newsletters] ([NewsID], [CateID], [ImagePath], [Title], [Subtitle], [Content], [CreatedDate], [Viewed], [Status]) VALUES (1, 3, N'http://fptshop.com.vn/Uploads/Originals/2016/5/30/636002281227791078_HTC-One-ME-18.jpg', N'Trên tay HTC One ME: Sự kết hợp hoàn hảo, tinh tế', N'Trên tay HTC One ME - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế', N'<p style="text-align: justify;"><strong>Trên tay <a href="http://fptshop.com.vn/dien-thoai/htc-one-me-dual-sim" target="_blank">HTC One ME</a> - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế.</strong></p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-18.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="line-height: 1.6;">Chiếc HTC One ME mà <a href="http://fptshop.com.vn" target="_blank" title="FPT Shop" type="FPT Shop">FPT Shop</a> đang có là phiên bản màu xám nam tính. Nhìn tổng thể thì ngoại hình của máy trông khá đẹp và sang trọng. Lớp vỏ làm bằng policarbonate có độ bền cao, được phủ một lớp sơn bóng tương phản tạo nên phong cách sang trọng và cuốn hút. Máy sở hữu ngôn ngữ thiết kế hai tone màu (dual-tone) tương tự như trên One M9+ và One E9+.</span></p>

                            <p style="text-align: justify;">Mặt trước trang bị màn hình 5.2 inch với độ phân giải đạt chuẩn Quad HD điều khá hiếm thấy trên các sản phẩm tầm trung. Do là sản phẩm của năm ngoái nên <a href="http://fptshop.com.vn/dien-thoai/htc" target="_blank" title="HTC" type="HTC">HTC</a> vẫn đưa các phím cảm ứng vào trong màn hình khiến cho diện tích hiển thị có phần cảm giác bé hơn. Dải loa BoomSound với công nghệ Dolby thêm một cảm biến vân tay ở giữa dải loa dưới không khác One M9+.</p>

                            <p style="text-align: justify;">Mặt lưng One ME được vát cong đều về hai phía cạnh tạo nét mềm mại, tinh tế và không bị thô cứng. Những đường nét bo tròn ở mặt lưng sẽ mang đến cảm giác cầm giữ dễ dàng và thoải mái, thuận tiện cho việc thao tác.&nbsp;</p>

                            <p style="text-align: justify;">Về thông số kĩ thuật ngoài màn hình 5.2 inch siêu nét, <a href="http://fptshop.com.vn/tin-tuc/danh-gia-tu-van/cpu-la-gi-37083" target="_blank">chip xử lý</a> Helio X10 thì HTC One ME còn gây ấn tượng với camera sau có khả năng quay video 4K và một đèn flash LED kép, độ phân giải đạt 20 MP, mặt trước được bố trí camera 4 MP UltraPixel. Các thông số khác của máy bao gồm bộ nhớ RAM 3 GB, bộ nhớ trong 32 GB, hỗ trợ thẻ nhớ microSD và pin dung lượng 2840 mAh.</p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-01.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Từ phải sang lần lượt là camera trước 4MP, cảm biến và dải loa Boomsound “hoành tráng” xuất hiện cả bên trên và bên dưới máy. </em></p>

                            <p style="text-align: center;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-03.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Ở bên ngoài màn hình chỉ có duy nhất phím Home có tích hợp cảm biến vân tay. Hoặc chúng ta cũng có thể sử dụng phím home ảo bên trong màn hình cùng với 2 phím điều hướng còn lại: Back và Recent.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-08.jpg" title="Trên tay HTC One ME"><br>
                                <em>Điểm nổi bật của mặt lưng là camera khủng 20MP, bên trái là đèn flash Led kép 2 tone màu, bên phải là mic quay video. Phía dưới chính là logo HTC.</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-11.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh trái 2 khe cắm sim nano, có hỗ trợ kết nối 4G LTE.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-12.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh phải khe cắm thẻ nhớ microSD hỗ trợ lên tới 2TB, tha hồ lưu trữ dữ liệu lun nè, kế tiếp là cụm phím tăng giảm âm lượng và phím nguồn.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-05.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh trên trang bị cổng hồng ngoại IR Led để sử dụng kết hợp với ứng dụng Peel smart Remote.&nbsp;</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-07.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh dưới cổng microUSB và jack tai nghe 3.5mm.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="font-size:10px;"><span style="color:#FF0000;">Các thông số trong bài viết có thể được thay đổi tùy theo nhà sản xuất. Để biết được thông tin nhanh chóng và chính xác nhất các bạn có thể gọi trực tiếp vào tổng đài tư vấn miễn phí của FPT Shop 18006601.</span></span></p>

                            <p style="text-align: right;">
                                <br>
                                <strong>Hồng Sơn</strong>
                            </p>', CAST(N'2016-05-31T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Newsletters] ([NewsID], [CateID], [ImagePath], [Title], [Subtitle], [Content], [CreatedDate], [Viewed], [Status]) VALUES (2, 3, N'http://fptshop.com.vn/Uploads/Originals/2016/5/30/636002281227791078_HTC-One-ME-18.jpg', N'Trên tay HTC One ME: Sự kết hợp hoàn hảo, tinh tế', N'Trên tay HTC One ME - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế', N'<p style="text-align: justify;"><strong>Trên tay <a href="http://fptshop.com.vn/dien-thoai/htc-one-me-dual-sim" target="_blank">HTC One ME</a> - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế.</strong></p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-18.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="line-height: 1.6;">Chiếc HTC One ME mà <a href="http://fptshop.com.vn" target="_blank" title="FPT Shop" type="FPT Shop">FPT Shop</a> đang có là phiên bản màu xám nam tính. Nhìn tổng thể thì ngoại hình của máy trông khá đẹp và sang trọng. Lớp vỏ làm bằng policarbonate có độ bền cao, được phủ một lớp sơn bóng tương phản tạo nên phong cách sang trọng và cuốn hút. Máy sở hữu ngôn ngữ thiết kế hai tone màu (dual-tone) tương tự như trên One M9+ và One E9+.</span></p>

                            <p style="text-align: justify;">Mặt trước trang bị màn hình 5.2 inch với độ phân giải đạt chuẩn Quad HD điều khá hiếm thấy trên các sản phẩm tầm trung. Do là sản phẩm của năm ngoái nên <a href="http://fptshop.com.vn/dien-thoai/htc" target="_blank" title="HTC" type="HTC">HTC</a> vẫn đưa các phím cảm ứng vào trong màn hình khiến cho diện tích hiển thị có phần cảm giác bé hơn. Dải loa BoomSound với công nghệ Dolby thêm một cảm biến vân tay ở giữa dải loa dưới không khác One M9+.</p>

                            <p style="text-align: justify;">Mặt lưng One ME được vát cong đều về hai phía cạnh tạo nét mềm mại, tinh tế và không bị thô cứng. Những đường nét bo tròn ở mặt lưng sẽ mang đến cảm giác cầm giữ dễ dàng và thoải mái, thuận tiện cho việc thao tác.&nbsp;</p>

                            <p style="text-align: justify;">Về thông số kĩ thuật ngoài màn hình 5.2 inch siêu nét, <a href="http://fptshop.com.vn/tin-tuc/danh-gia-tu-van/cpu-la-gi-37083" target="_blank">chip xử lý</a> Helio X10 thì HTC One ME còn gây ấn tượng với camera sau có khả năng quay video 4K và một đèn flash LED kép, độ phân giải đạt 20 MP, mặt trước được bố trí camera 4 MP UltraPixel. Các thông số khác của máy bao gồm bộ nhớ RAM 3 GB, bộ nhớ trong 32 GB, hỗ trợ thẻ nhớ microSD và pin dung lượng 2840 mAh.</p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-01.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Từ phải sang lần lượt là camera trước 4MP, cảm biến và dải loa Boomsound “hoành tráng” xuất hiện cả bên trên và bên dưới máy. </em></p>

                            <p style="text-align: center;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-03.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Ở bên ngoài màn hình chỉ có duy nhất phím Home có tích hợp cảm biến vân tay. Hoặc chúng ta cũng có thể sử dụng phím home ảo bên trong màn hình cùng với 2 phím điều hướng còn lại: Back và Recent.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-08.jpg" title="Trên tay HTC One ME"><br>
                                <em>Điểm nổi bật của mặt lưng là camera khủng 20MP, bên trái là đèn flash Led kép 2 tone màu, bên phải là mic quay video. Phía dưới chính là logo HTC.</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-11.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh trái 2 khe cắm sim nano, có hỗ trợ kết nối 4G LTE.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-12.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh phải khe cắm thẻ nhớ microSD hỗ trợ lên tới 2TB, tha hồ lưu trữ dữ liệu lun nè, kế tiếp là cụm phím tăng giảm âm lượng và phím nguồn.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-05.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh trên trang bị cổng hồng ngoại IR Led để sử dụng kết hợp với ứng dụng Peel smart Remote.&nbsp;</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-07.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh dưới cổng microUSB và jack tai nghe 3.5mm.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="font-size:10px;"><span style="color:#FF0000;">Các thông số trong bài viết có thể được thay đổi tùy theo nhà sản xuất. Để biết được thông tin nhanh chóng và chính xác nhất các bạn có thể gọi trực tiếp vào tổng đài tư vấn miễn phí của FPT Shop 18006601.</span></span></p>

                            <p style="text-align: right;">
                                <br>
                                <strong>Hồng Sơn</strong>
                            </p>', CAST(N'2016-05-31T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Newsletters] ([NewsID], [CateID], [ImagePath], [Title], [Subtitle], [Content], [CreatedDate], [Viewed], [Status]) VALUES (3, 3, N'http://fptshop.com.vn/Uploads/Originals/2016/5/30/636002281227791078_HTC-One-ME-18.jpg', N'Trên tay HTC One ME: Sự kết hợp hoàn hảo, tinh tế', N'Trên tay HTC One ME - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế', N'<p style="text-align: justify;"><strong>Trên tay <a href="http://fptshop.com.vn/dien-thoai/htc-one-me-dual-sim" target="_blank">HTC One ME</a> - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế.</strong></p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-18.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="line-height: 1.6;">Chiếc HTC One ME mà <a href="http://fptshop.com.vn" target="_blank" title="FPT Shop" type="FPT Shop">FPT Shop</a> đang có là phiên bản màu xám nam tính. Nhìn tổng thể thì ngoại hình của máy trông khá đẹp và sang trọng. Lớp vỏ làm bằng policarbonate có độ bền cao, được phủ một lớp sơn bóng tương phản tạo nên phong cách sang trọng và cuốn hút. Máy sở hữu ngôn ngữ thiết kế hai tone màu (dual-tone) tương tự như trên One M9+ và One E9+.</span></p>

                            <p style="text-align: justify;">Mặt trước trang bị màn hình 5.2 inch với độ phân giải đạt chuẩn Quad HD điều khá hiếm thấy trên các sản phẩm tầm trung. Do là sản phẩm của năm ngoái nên <a href="http://fptshop.com.vn/dien-thoai/htc" target="_blank" title="HTC" type="HTC">HTC</a> vẫn đưa các phím cảm ứng vào trong màn hình khiến cho diện tích hiển thị có phần cảm giác bé hơn. Dải loa BoomSound với công nghệ Dolby thêm một cảm biến vân tay ở giữa dải loa dưới không khác One M9+.</p>

                            <p style="text-align: justify;">Mặt lưng One ME được vát cong đều về hai phía cạnh tạo nét mềm mại, tinh tế và không bị thô cứng. Những đường nét bo tròn ở mặt lưng sẽ mang đến cảm giác cầm giữ dễ dàng và thoải mái, thuận tiện cho việc thao tác.&nbsp;</p>

                            <p style="text-align: justify;">Về thông số kĩ thuật ngoài màn hình 5.2 inch siêu nét, <a href="http://fptshop.com.vn/tin-tuc/danh-gia-tu-van/cpu-la-gi-37083" target="_blank">chip xử lý</a> Helio X10 thì HTC One ME còn gây ấn tượng với camera sau có khả năng quay video 4K và một đèn flash LED kép, độ phân giải đạt 20 MP, mặt trước được bố trí camera 4 MP UltraPixel. Các thông số khác của máy bao gồm bộ nhớ RAM 3 GB, bộ nhớ trong 32 GB, hỗ trợ thẻ nhớ microSD và pin dung lượng 2840 mAh.</p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-01.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Từ phải sang lần lượt là camera trước 4MP, cảm biến và dải loa Boomsound “hoành tráng” xuất hiện cả bên trên và bên dưới máy. </em></p>

                            <p style="text-align: center;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-03.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Ở bên ngoài màn hình chỉ có duy nhất phím Home có tích hợp cảm biến vân tay. Hoặc chúng ta cũng có thể sử dụng phím home ảo bên trong màn hình cùng với 2 phím điều hướng còn lại: Back và Recent.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-08.jpg" title="Trên tay HTC One ME"><br>
                                <em>Điểm nổi bật của mặt lưng là camera khủng 20MP, bên trái là đèn flash Led kép 2 tone màu, bên phải là mic quay video. Phía dưới chính là logo HTC.</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-11.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh trái 2 khe cắm sim nano, có hỗ trợ kết nối 4G LTE.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-12.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh phải khe cắm thẻ nhớ microSD hỗ trợ lên tới 2TB, tha hồ lưu trữ dữ liệu lun nè, kế tiếp là cụm phím tăng giảm âm lượng và phím nguồn.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-05.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh trên trang bị cổng hồng ngoại IR Led để sử dụng kết hợp với ứng dụng Peel smart Remote.&nbsp;</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-07.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh dưới cổng microUSB và jack tai nghe 3.5mm.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="font-size:10px;"><span style="color:#FF0000;">Các thông số trong bài viết có thể được thay đổi tùy theo nhà sản xuất. Để biết được thông tin nhanh chóng và chính xác nhất các bạn có thể gọi trực tiếp vào tổng đài tư vấn miễn phí của FPT Shop 18006601.</span></span></p>

                            <p style="text-align: right;">
                                <br>
                                <strong>Hồng Sơn</strong>
                            </p>', CAST(N'2016-05-31T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Newsletters] ([NewsID], [CateID], [ImagePath], [Title], [Subtitle], [Content], [CreatedDate], [Viewed], [Status]) VALUES (4, 3, N'http://fptshop.com.vn/Uploads/Originals/2016/5/30/636002281227791078_HTC-One-ME-18.jpg', N'Trên tay HTC One ME: Sự kết hợp hoàn hảo, tinh tế', N'Trên tay HTC One ME - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế', N'<p style="text-align: justify;"><strong>Trên tay <a href="http://fptshop.com.vn/dien-thoai/htc-one-me-dual-sim" target="_blank">HTC One ME</a> - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế.</strong></p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-18.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="line-height: 1.6;">Chiếc HTC One ME mà <a href="http://fptshop.com.vn" target="_blank" title="FPT Shop" type="FPT Shop">FPT Shop</a> đang có là phiên bản màu xám nam tính. Nhìn tổng thể thì ngoại hình của máy trông khá đẹp và sang trọng. Lớp vỏ làm bằng policarbonate có độ bền cao, được phủ một lớp sơn bóng tương phản tạo nên phong cách sang trọng và cuốn hút. Máy sở hữu ngôn ngữ thiết kế hai tone màu (dual-tone) tương tự như trên One M9+ và One E9+.</span></p>

                            <p style="text-align: justify;">Mặt trước trang bị màn hình 5.2 inch với độ phân giải đạt chuẩn Quad HD điều khá hiếm thấy trên các sản phẩm tầm trung. Do là sản phẩm của năm ngoái nên <a href="http://fptshop.com.vn/dien-thoai/htc" target="_blank" title="HTC" type="HTC">HTC</a> vẫn đưa các phím cảm ứng vào trong màn hình khiến cho diện tích hiển thị có phần cảm giác bé hơn. Dải loa BoomSound với công nghệ Dolby thêm một cảm biến vân tay ở giữa dải loa dưới không khác One M9+.</p>

                            <p style="text-align: justify;">Mặt lưng One ME được vát cong đều về hai phía cạnh tạo nét mềm mại, tinh tế và không bị thô cứng. Những đường nét bo tròn ở mặt lưng sẽ mang đến cảm giác cầm giữ dễ dàng và thoải mái, thuận tiện cho việc thao tác.&nbsp;</p>

                            <p style="text-align: justify;">Về thông số kĩ thuật ngoài màn hình 5.2 inch siêu nét, <a href="http://fptshop.com.vn/tin-tuc/danh-gia-tu-van/cpu-la-gi-37083" target="_blank">chip xử lý</a> Helio X10 thì HTC One ME còn gây ấn tượng với camera sau có khả năng quay video 4K và một đèn flash LED kép, độ phân giải đạt 20 MP, mặt trước được bố trí camera 4 MP UltraPixel. Các thông số khác của máy bao gồm bộ nhớ RAM 3 GB, bộ nhớ trong 32 GB, hỗ trợ thẻ nhớ microSD và pin dung lượng 2840 mAh.</p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-01.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Từ phải sang lần lượt là camera trước 4MP, cảm biến và dải loa Boomsound “hoành tráng” xuất hiện cả bên trên và bên dưới máy. </em></p>

                            <p style="text-align: center;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-03.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Ở bên ngoài màn hình chỉ có duy nhất phím Home có tích hợp cảm biến vân tay. Hoặc chúng ta cũng có thể sử dụng phím home ảo bên trong màn hình cùng với 2 phím điều hướng còn lại: Back và Recent.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-08.jpg" title="Trên tay HTC One ME"><br>
                                <em>Điểm nổi bật của mặt lưng là camera khủng 20MP, bên trái là đèn flash Led kép 2 tone màu, bên phải là mic quay video. Phía dưới chính là logo HTC.</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-11.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh trái 2 khe cắm sim nano, có hỗ trợ kết nối 4G LTE.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-12.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh phải khe cắm thẻ nhớ microSD hỗ trợ lên tới 2TB, tha hồ lưu trữ dữ liệu lun nè, kế tiếp là cụm phím tăng giảm âm lượng và phím nguồn.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-05.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh trên trang bị cổng hồng ngoại IR Led để sử dụng kết hợp với ứng dụng Peel smart Remote.&nbsp;</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-07.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh dưới cổng microUSB và jack tai nghe 3.5mm.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="font-size:10px;"><span style="color:#FF0000;">Các thông số trong bài viết có thể được thay đổi tùy theo nhà sản xuất. Để biết được thông tin nhanh chóng và chính xác nhất các bạn có thể gọi trực tiếp vào tổng đài tư vấn miễn phí của FPT Shop 18006601.</span></span></p>

                            <p style="text-align: right;">
                                <br>
                                <strong>Hồng Sơn</strong>
                            </p>', CAST(N'2016-05-31T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Newsletters] ([NewsID], [CateID], [ImagePath], [Title], [Subtitle], [Content], [CreatedDate], [Viewed], [Status]) VALUES (5, 3, N'http://fptshop.com.vn/Uploads/Originals/2016/5/30/636002281227791078_HTC-One-ME-18.jpg', N'Trên tay HTC One ME: Sự kết hợp hoàn hảo, tinh tế', N'Trên tay HTC One ME - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế', N'<p style="text-align: justify;"><strong>Trên tay <a href="http://fptshop.com.vn/dien-thoai/htc-one-me-dual-sim" target="_blank">HTC One ME</a> - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế.</strong></p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-18.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="line-height: 1.6;">Chiếc HTC One ME mà <a href="http://fptshop.com.vn" target="_blank" title="FPT Shop" type="FPT Shop">FPT Shop</a> đang có là phiên bản màu xám nam tính. Nhìn tổng thể thì ngoại hình của máy trông khá đẹp và sang trọng. Lớp vỏ làm bằng policarbonate có độ bền cao, được phủ một lớp sơn bóng tương phản tạo nên phong cách sang trọng và cuốn hút. Máy sở hữu ngôn ngữ thiết kế hai tone màu (dual-tone) tương tự như trên One M9+ và One E9+.</span></p>

                            <p style="text-align: justify;">Mặt trước trang bị màn hình 5.2 inch với độ phân giải đạt chuẩn Quad HD điều khá hiếm thấy trên các sản phẩm tầm trung. Do là sản phẩm của năm ngoái nên <a href="http://fptshop.com.vn/dien-thoai/htc" target="_blank" title="HTC" type="HTC">HTC</a> vẫn đưa các phím cảm ứng vào trong màn hình khiến cho diện tích hiển thị có phần cảm giác bé hơn. Dải loa BoomSound với công nghệ Dolby thêm một cảm biến vân tay ở giữa dải loa dưới không khác One M9+.</p>

                            <p style="text-align: justify;">Mặt lưng One ME được vát cong đều về hai phía cạnh tạo nét mềm mại, tinh tế và không bị thô cứng. Những đường nét bo tròn ở mặt lưng sẽ mang đến cảm giác cầm giữ dễ dàng và thoải mái, thuận tiện cho việc thao tác.&nbsp;</p>

                            <p style="text-align: justify;">Về thông số kĩ thuật ngoài màn hình 5.2 inch siêu nét, <a href="http://fptshop.com.vn/tin-tuc/danh-gia-tu-van/cpu-la-gi-37083" target="_blank">chip xử lý</a> Helio X10 thì HTC One ME còn gây ấn tượng với camera sau có khả năng quay video 4K và một đèn flash LED kép, độ phân giải đạt 20 MP, mặt trước được bố trí camera 4 MP UltraPixel. Các thông số khác của máy bao gồm bộ nhớ RAM 3 GB, bộ nhớ trong 32 GB, hỗ trợ thẻ nhớ microSD và pin dung lượng 2840 mAh.</p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-01.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Từ phải sang lần lượt là camera trước 4MP, cảm biến và dải loa Boomsound “hoành tráng” xuất hiện cả bên trên và bên dưới máy. </em></p>

                            <p style="text-align: center;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-03.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Ở bên ngoài màn hình chỉ có duy nhất phím Home có tích hợp cảm biến vân tay. Hoặc chúng ta cũng có thể sử dụng phím home ảo bên trong màn hình cùng với 2 phím điều hướng còn lại: Back và Recent.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-08.jpg" title="Trên tay HTC One ME"><br>
                                <em>Điểm nổi bật của mặt lưng là camera khủng 20MP, bên trái là đèn flash Led kép 2 tone màu, bên phải là mic quay video. Phía dưới chính là logo HTC.</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-11.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh trái 2 khe cắm sim nano, có hỗ trợ kết nối 4G LTE.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-12.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh phải khe cắm thẻ nhớ microSD hỗ trợ lên tới 2TB, tha hồ lưu trữ dữ liệu lun nè, kế tiếp là cụm phím tăng giảm âm lượng và phím nguồn.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-05.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh trên trang bị cổng hồng ngoại IR Led để sử dụng kết hợp với ứng dụng Peel smart Remote.&nbsp;</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-07.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh dưới cổng microUSB và jack tai nghe 3.5mm.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="font-size:10px;"><span style="color:#FF0000;">Các thông số trong bài viết có thể được thay đổi tùy theo nhà sản xuất. Để biết được thông tin nhanh chóng và chính xác nhất các bạn có thể gọi trực tiếp vào tổng đài tư vấn miễn phí của FPT Shop 18006601.</span></span></p>

                            <p style="text-align: right;">
                                <br>
                                <strong>Hồng Sơn</strong>
                            </p>', CAST(N'2016-05-31T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Newsletters] ([NewsID], [CateID], [ImagePath], [Title], [Subtitle], [Content], [CreatedDate], [Viewed], [Status]) VALUES (6, 3, N'http://fptshop.com.vn/Uploads/Originals/2016/5/30/636002281227791078_HTC-One-ME-18.jpg', N'Trên tay HTC One ME: Sự kết hợp hoàn hảo, tinh tế', N'Trên tay HTC One ME - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế', N'<p style="text-align: justify;"><strong>Trên tay <a href="http://fptshop.com.vn/dien-thoai/htc-one-me-dual-sim" target="_blank">HTC One ME</a> - smartphone chạy chip Helio X10 đầu tiên trên thế giới với thiết kế đẹp mắt và tinh tế.</strong></p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-18.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="line-height: 1.6;">Chiếc HTC One ME mà <a href="http://fptshop.com.vn" target="_blank" title="FPT Shop" type="FPT Shop">FPT Shop</a> đang có là phiên bản màu xám nam tính. Nhìn tổng thể thì ngoại hình của máy trông khá đẹp và sang trọng. Lớp vỏ làm bằng policarbonate có độ bền cao, được phủ một lớp sơn bóng tương phản tạo nên phong cách sang trọng và cuốn hút. Máy sở hữu ngôn ngữ thiết kế hai tone màu (dual-tone) tương tự như trên One M9+ và One E9+.</span></p>

                            <p style="text-align: justify;">Mặt trước trang bị màn hình 5.2 inch với độ phân giải đạt chuẩn Quad HD điều khá hiếm thấy trên các sản phẩm tầm trung. Do là sản phẩm của năm ngoái nên <a href="http://fptshop.com.vn/dien-thoai/htc" target="_blank" title="HTC" type="HTC">HTC</a> vẫn đưa các phím cảm ứng vào trong màn hình khiến cho diện tích hiển thị có phần cảm giác bé hơn. Dải loa BoomSound với công nghệ Dolby thêm một cảm biến vân tay ở giữa dải loa dưới không khác One M9+.</p>

                            <p style="text-align: justify;">Mặt lưng One ME được vát cong đều về hai phía cạnh tạo nét mềm mại, tinh tế và không bị thô cứng. Những đường nét bo tròn ở mặt lưng sẽ mang đến cảm giác cầm giữ dễ dàng và thoải mái, thuận tiện cho việc thao tác.&nbsp;</p>

                            <p style="text-align: justify;">Về thông số kĩ thuật ngoài màn hình 5.2 inch siêu nét, <a href="http://fptshop.com.vn/tin-tuc/danh-gia-tu-van/cpu-la-gi-37083" target="_blank">chip xử lý</a> Helio X10 thì HTC One ME còn gây ấn tượng với camera sau có khả năng quay video 4K và một đèn flash LED kép, độ phân giải đạt 20 MP, mặt trước được bố trí camera 4 MP UltraPixel. Các thông số khác của máy bao gồm bộ nhớ RAM 3 GB, bộ nhớ trong 32 GB, hỗ trợ thẻ nhớ microSD và pin dung lượng 2840 mAh.</p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-01.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Từ phải sang lần lượt là camera trước 4MP, cảm biến và dải loa Boomsound “hoành tráng” xuất hiện cả bên trên và bên dưới máy. </em></p>

                            <p style="text-align: center;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-03.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Ở bên ngoài màn hình chỉ có duy nhất phím Home có tích hợp cảm biến vân tay. Hoặc chúng ta cũng có thể sử dụng phím home ảo bên trong màn hình cùng với 2 phím điều hướng còn lại: Back và Recent.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-08.jpg" title="Trên tay HTC One ME"><br>
                                <em>Điểm nổi bật của mặt lưng là camera khủng 20MP, bên trái là đèn flash Led kép 2 tone màu, bên phải là mic quay video. Phía dưới chính là logo HTC.</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-11.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh trái 2 khe cắm sim nano, có hỗ trợ kết nối 4G LTE.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;">
                                <img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-12.jpg" title="Trên tay HTC One ME"><br>
                                <em>Cạnh phải khe cắm thẻ nhớ microSD hỗ trợ lên tới 2TB, tha hồ lưu trữ dữ liệu lun nè, kế tiếp là cụm phím tăng giảm âm lượng và phím nguồn.&nbsp;</em>
                            </p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-05.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh trên trang bị cổng hồng ngoại IR Led để sử dụng kết hợp với ứng dụng Peel smart Remote.&nbsp;</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: center;"><img alt="Trên tay HTC One ME" id="Trên tay HTC One ME" longdesc="Trên tay HTC One ME" src="http://fptshop.com.vn/Uploads/images/2015/Tin-Tuc/BinhNN/HTC-One-ME-07.jpg" title="Trên tay HTC One ME"></p>

                            <p style="text-align: center;"><em>Cạnh dưới cổng microUSB và jack tai nghe 3.5mm.</em></p>

                            <p style="text-align: justify;">&nbsp;</p>

                            <p style="text-align: justify;"><span style="font-size:10px;"><span style="color:#FF0000;">Các thông số trong bài viết có thể được thay đổi tùy theo nhà sản xuất. Để biết được thông tin nhanh chóng và chính xác nhất các bạn có thể gọi trực tiếp vào tổng đài tư vấn miễn phí của FPT Shop 18006601.</span></span></p>

                            <p style="text-align: right;">
                                <br>
                                <strong>Hồng Sơn</strong>
                            </p>', CAST(N'2016-05-31T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[Newsletters] ([NewsID], [CateID], [ImagePath], [Title], [Subtitle], [Content], [CreatedDate], [Viewed], [Status]) VALUES (8, 1, N'/upload/images/news/1-41.jpg', N'Cảng biển quốc tế Lạch Huyện', N'Khởi công xây dựng Cảng cửa ngõ quốc tế Hưng Yên', N'<p>Hơn 25.000 tỉ đồng x&acirc;y cảng biển lớn nhất VN<br />
Cảng Lạch Huyện c&oacute; khả năng tiếp nhận t&agrave;u trọng tải 100.000 tấn (tương đương 8.000 TEU) với tổng vốn đầu tư 25.100 tỉ đồng đ&atilde; được Thủ tướng Nguyễn Tấn Dũng ph&aacute;t lệnh khởi c&ocirc;ng s&aacute;ng 15/4.<br />
S&aacute;ng 14/4, tại huyện C&aacute;t Hải - TP Hải Ph&ograve;ng, Thủ tướng Nguyễn Tấn Dũng ch&iacute;nh thức ph&aacute;t lệnh khởi c&ocirc;ng dự &aacute;n đầu tư x&acirc;y dựng c&ocirc;ng tr&igrave;nh cảng cửa ng&otilde; quốc tế Hải Ph&ograve;ng (cảng Lạch Huyện).<br />
<br />
<img alt="[​IMG]" src="http://img2.news.zing.vn/2013/04/14/1-41.jpg" /><br />
Thủ tướng Nguyễn Tấn Dũng (giữa) v&agrave; c&aacute;c vị l&atilde;nh đạo ph&aacute;t lệnh khởi c&ocirc;ng cảng cửa ng&otilde; quốc tế Hải Ph&ograve;ng.<br />
Theo dự b&aacute;o, lượng h&agrave;ng h&oacute;a th&ocirc;ng qua nh&oacute;m cảng ph&iacute;a Bắc đến năm 2020 l&agrave; 146 - 176 triệu tấn/năm. Trong khi đ&oacute;, tổng năng lực của c&aacute;c cảng hiện hữu kể cả sau khi n&acirc;ng cấp, mở rộng cũng chỉ đạt 86 - 90 triệu tấn v&agrave;o năm 2015 v&agrave; kh&ocirc;ng thể ph&aacute;t triển th&ecirc;m để đ&aacute;p ứng nhu cầu th&ocirc;ng qua h&agrave;ng h&oacute;a khu vực.<br />
<br />
Nằm trong danh mục c&aacute;c dự &aacute;n kết cấu hạ tầng giao th&ocirc;ng quan trọng, thiết yếu đến năm 2020, cảng cửa ng&otilde; quốc tế Hải Ph&ograve;ng được đầu tư cơ sở hạ tầng v&agrave; c&ocirc;ng nghệ bốc xếp đồng bộ v&agrave; hiện đại, đủ khả năng tiếp nhận t&agrave;u trọng tải đến 100.000 tấn (tương đương với t&agrave;u tải trọng 8.000 TEU) hoạt động tr&ecirc;n tuyến vận tải biển xa.<br />
<br />
Khi đưa v&agrave;o khai th&aacute;c sử dụng, dự kiến cảng cửa ng&otilde; quốc tế Hải Ph&ograve;ng sẽ g&oacute;p phần đưa h&agrave;ng h&oacute;a xuất, nhập khẩu của khu vực miền Bắc c&oacute; thể đi thẳng tới thị trường Ch&acirc;u &Acirc;u, Ch&acirc;u Mỹ (kh&ocirc;ng phải trung chuyển qua c&aacute;c cảng tại khu vực như Singapore, Hồng K&ocirc;ng), giảm chi ph&iacute; vận tải, tăng năng lực cạnh tranh đối với h&agrave;ng h&oacute;a xuất nhập khẩu của Việt Nam; g&oacute;p phần thu h&uacute;t lượng h&agrave;ng qu&aacute; cảnh khu vực Đ&ocirc;ng Bắc L&agrave;o qua tuyến h&agrave;nh lang Đ&ocirc;ng - T&acirc;y v&agrave; khu vực Nam Trung Quốc qua c&aacute;c tuyến thuộc chương tr&igrave;nh hai h&agrave;nh lang, một v&agrave;nh đai.<br />
<br />
G&oacute;i thầu khởi c&ocirc;ng h&ocirc;m nay thuộc hợp phần A, hợp phần khởi động của dự &aacute;n cảng cửa ng&otilde; quốc tế Hải Ph&ograve;ng do Cục H&agrave;ng hải Việt Nam l&agrave;m chủ đầu tư, sẽ tập trung x&acirc;y dựng cơ sở hạ tầng chung như: luồng t&agrave;u, vũng quay t&agrave;u, đ&ecirc; chắn s&oacute;ng, đ&ecirc; chắn c&aacute;t<br />
<br />
Việc đầu tư cơ sở hạ tầng cảng (luồng t&agrave;u, đ&ecirc; chắn s&oacute;ng) ho&agrave;n chỉnh đến c&aacute;c bến khởi động khu bến Lạch Huyện ph&iacute;a trong bờ sẽ kh&ocirc;ng chỉ đ&aacute;p ứng nhu cầu khai th&aacute;c 2 bến tại Lạch Huyện giai đoạn khởi động m&agrave; c&ograve;n phục vụ ph&aacute;t triển hệ thống cảng ho&agrave;n chỉnh về l&acirc;u d&agrave;i, bao gồm c&aacute;c bến kế tiếp tại Lạch Huyện cũng như c&aacute;c bến cảng Đ&igrave;nh Vũ, Bạch Đằng, S&ocirc;ng Cấm, S&ocirc;ng Chanh ph&iacute;a thượng lưu.<br />
<br />
Dự kiến, dự &aacute;n đầu tư x&acirc;y dựng cảng cửa ng&otilde; quốc tế Hải Ph&ograve;ng giai đoạn khởi động sẽ ho&agrave;n th&agrave;nh v&agrave;o cuối năm 2016.</p>
', CAST(N'2016-06-07T08:29:12.140' AS DateTime), 0, 0)
SET IDENTITY_INSERT [dbo].[Newsletters] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderName], [OrderEmail], [OrderPhone], [OrderAddress], [OrderProvince], [OrderDistinct], [ShipName], [ShipEmail], [ShipPhone], [ShipAddress], [ShipProvince], [ShipDisctrict], [ShipNote], [OrderDate], [TotalAmount], [ShipDate], [Status]) VALUES (1, 1, N'Nguyễn Hoàng Phúc', N'nguyenhoanphuc289@gmail.com', N'01647755831', N'Gia Lộc - Hải Dương', N'Option 1', N'Option 1', N'Nguyễn Hoàng Phúc', N'nguyenhoanphuc289@gmail.com', N'01647755831', N'Gia Lộc - Hải Dương', N'Hải Dương', N'Gia Lộc', NULL, CAST(N'2016-05-20T17:14:24.583' AS DateTime), 12000000, CAST(N'2016-06-05T13:16:35.193' AS DateTime), 2)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderName], [OrderEmail], [OrderPhone], [OrderAddress], [OrderProvince], [OrderDistinct], [ShipName], [ShipEmail], [ShipPhone], [ShipAddress], [ShipProvince], [ShipDisctrict], [ShipNote], [OrderDate], [TotalAmount], [ShipDate], [Status]) VALUES (2, 1, N'Phúc', N'phuc@gmail.com', N'012345678', N'Gia Lộc - Hải Dương', N'15', N'199', N'Trần Đỗ Thu Hà', N'thapi@gmail.com', N'01647496771', N'Thuận Thành - Bắc Ninh', N'Bắc Ninh', N'Thuận Thành', NULL, CAST(N'2016-05-21T13:16:59.517' AS DateTime), 12000000, CAST(N'2016-06-05T13:16:33.910' AS DateTime), 2)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderName], [OrderEmail], [OrderPhone], [OrderAddress], [OrderProvince], [OrderDistinct], [ShipName], [ShipEmail], [ShipPhone], [ShipAddress], [ShipProvince], [ShipDisctrict], [ShipNote], [OrderDate], [TotalAmount], [ShipDate], [Status]) VALUES (15, 1, N'Nga', N'choiran672@gmail.com', N'09384935', N'Hsdujhfsd', N'Đà Nẵng (TP)', N'Trung tâm thành phố', N'Nga', N'choiran672@gmail.com', N'09384935', N'Hsdujhfsd', N'Đà Nẵng (TP)', N'Trung tâm thành phố', NULL, CAST(N'2016-06-07T11:04:21.243' AS DateTime), 30000000, CAST(N'2016-06-07T11:27:11.883' AS DateTime), 2)
INSERT [dbo].[Orders] ([OrderID], [EmployeeID], [OrderName], [OrderEmail], [OrderPhone], [OrderAddress], [OrderProvince], [OrderDistinct], [ShipName], [ShipEmail], [ShipPhone], [ShipAddress], [ShipProvince], [ShipDisctrict], [ShipNote], [OrderDate], [TotalAmount], [ShipDate], [Status]) VALUES (17, 1, N'Nguyễn Hoàng Phúc', N'nguyenhoangphuc289@gmail.com', N'01647755831', N'Đội 11 - Cao Dương - Gia Khánh', N'Hải Dương', N'Gia Lộc', N'Nguyễn Hoàng Phúc', N'nguyenhoangphuc289@gmail.com', N'01647755831', N'Đội 11 - Cao Dương - Gia Khánh', N'Hải Dương', N'Gia Lộc', NULL, CAST(N'2016-06-07T21:08:46.177' AS DateTime), 15000000, CAST(N'2016-06-07T21:10:17.337' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrdersDetail] ON 

INSERT [dbo].[OrdersDetail] ([Serial], [ProductID], [OrderID], [UnitPrice], [Quantity], [Discount], [Amount]) VALUES (1, 3, 1, 3000000, 1, 0, 3000000)
INSERT [dbo].[OrdersDetail] ([Serial], [ProductID], [OrderID], [UnitPrice], [Quantity], [Discount], [Amount]) VALUES (2, 3, 2, 3000000, 1, 0, 3000000)
INSERT [dbo].[OrdersDetail] ([Serial], [ProductID], [OrderID], [UnitPrice], [Quantity], [Discount], [Amount]) VALUES (20, 1026, 17, 15000000, 1, 0, 15000000)
SET IDENTITY_INSERT [dbo].[OrdersDetail] OFF
SET IDENTITY_INSERT [dbo].[Others] ON 

INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (1, 0, N'Giới thiệu', N'<h1>Gi&aacute;m đốc:</h1>

<h1>Ph&oacute; gi&aacute;m đốc:</h1>

<p>C&ocirc;ng ty&nbsp;</p>

<p>Khởi đầu từ ...</p>

<p>Địa chỉ: ...</p>
')
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (2, 0, N'Chính sách', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (3, 2, N'Chính sách giao hàng', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (4, 2, N'Chính sách đổi sản phẩm', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (5, 2, N'Chính sách bảo hành', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (6, 2, N'Chính sách trả góp', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (7, 2, N'Giới thiệu đổi trả', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (8, 0, N'Dịch vụ & Hỗ trợ', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (9, 8, N'Hệ thống cửa hàng', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (10, 8, N'Hướng dẫn mua hàng', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (11, 8, N'Hướng dẫn thanh toán', NULL)
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (12, 8, N'Câu hỏi thường gặp', N'<p><strong>c&acirc;u hỏi thường gặp :))</strong></p>
')
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (18, 8, N'Dịch vụ ở miền núi', N'<p>Ch&iacute;nh s&aacute;ch giao h&agrave;ng ở miền n&uacute;i</p>

<p><strong>Ch&iacute;nh s&aacute;ch giao h&agrave;ng ở miền n&uacute;i</strong></p>

<p style="text-align:center"><strong><img alt="" src="/upload/images/files/12894303_480330005483416_213616983_o.jpg" style="height:300px; width:500px" /></strong></p>

<p style="text-align:center"><strong><em><u>Ch&iacute;nh s&aacute;ch giao h&agrave;ng ở miền n&uacute;i</u></em></strong></p>

<p style="text-align:center">&nbsp;</p>
')
INSERT [dbo].[Others] ([ID], [ParentsID], [Name], [Content]) VALUES (1018, 0, N'Liên hệ', N'<p><strong>C&Ocirc;NG TY CỔ PHẦN THƯƠNG MẠI V&Agrave; DỊCH VỤ HƯNG PH&Aacute;T</strong></p>

<p>SỐ 30 - Đ. HỒNG QUANG - P. QUANG TRUNG - TP. HẢI DƯƠNG</p>

<p>Tel: 03203 832 888 - 03203 830 559 Fax: 03203 843 559</p>

<p>Hotline: VANTECH: 0909. 754.999 &nbsp; HIKVISION: 0913.255.790</p>

<p>Email 1: haiduong@vantech.pro</p>

<p>Email 2: info@camerahaiduong.com</p>
')
SET IDENTITY_INSERT [dbo].[Others] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1, NULL, N'Camera quan sát', N'fa fa-eye', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (2, NULL, N'Đầu ghi hình camera', N'fa fa-list-ul', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (3, NULL, N'Camera trọn bộ', N'fa fa-star', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (4, NULL, N'Camera thông minh', N'fa fa-video-camera', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (5, NULL, N'Phụ Kiện Camera', N'fa fa-volume-up', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (6, NULL, N'Smart home', N'fa fa-home', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (7, NULL, N'Bộ đàm & Chống trộm', N'fa fa-unlock', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (8, NULL, N'Dự án & Giải pháp', N'fa fa-wifi', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (9, NULL, N'Máy chấm công', N'fa fa-crosshairs', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (10, NULL, N'Khuyến mại', N'fa fa-microphone', 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (11, 1, N'Camera theo hãng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (12, 1, N'Camera theo loại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (13, 1, N'Theo Tầm xa hồng ngoại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (14, 1, N'Theo ống kính', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (15, 1, N'Theo PTZ', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (16, 1, N'Theo Kiểu dáng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (17, 11, N'Camera Vantech', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (18, 11, N'Camera Hikvision', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (19, 11, N'Camera Dahua', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (20, 11, N'Camera Sony', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (21, 12, N'Camera ngụy trang', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (22, 12, N'Camera hành trình', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (23, 12, N'Powerline camera IP', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (24, 12, N'Camera IP không dây', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (25, 12, N'Turbo HD 3.0', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (26, 12, N'Camera AHD', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (27, 12, N'Camera Analog', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (28, 12, N'Camera Speed Dome', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (29, 12, N'Camera IP', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (30, 12, N'Camera Starlight', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (31, 12, N'Camera HDTVI', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (32, 12, N'Camera HDCVI', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (33, 13, N'10m', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (34, 13, N'20m', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (35, 13, N'30m', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (36, 13, N'40m', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (37, 13, N'60m', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (38, 13, N'80m', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (39, 13, N'100m', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (40, 13, N'120m', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (41, 14, N'Loại 2.8 ~ 12 mm', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (42, 14, N'Chưa kèm ống kính', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (43, 14, N'Loại 3.6mm', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (44, 14, N'Loại 12mm', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (45, 14, N'Loại 4mm', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (46, 14, N'Loại 6mm', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (47, 14, N'Loại 8mm', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (48, 15, N'Chuyên dụng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (49, 15, N'Hỗ trợ', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (50, 16, N'Camera thân', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (51, 16, N'Camera dome', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (52, 16, N'Camera PTZ', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (53, 16, N'Camera bí mật', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (54, 1, N'Theo Chống ngược sáng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (55, 1, N'Theo Tiêu chuẩn IP', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (56, 54, N'Không', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (57, 54, N'Có', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (58, 55, N'Chuẩn IP66', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (59, 55, N'Chuẩn IK10', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (60, 2, N'Đầu ghi theo hãng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (61, 2, N'Đầu ghi theo loại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (62, 2, N'Theo Số kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (63, 2, N'Theo Số lượng ổ cứng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (64, 60, N'Đầu ghi Vantech', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (65, 60, N'Đầu ghi Dahua', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (66, 60, N'Đầu ghi HIKvision', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (67, 60, N'Đầu ghi Sony', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (68, 61, N'Turbo HD 3.0', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (69, 61, N'Đầu ghi hình AHD', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (70, 61, N'Đầu ghi hình HDTVI', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (71, 61, N'Đầu ghi Analog', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (72, 61, N'Đầu ghi hình HDCVI', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (73, 61, N'Đầu ghi hình Analog', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (74, 61, N'Đầu ghi hình IP', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (75, 61, N'Đầu ghi AHD', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (76, 61, N'Ổ cứng lưu hình (HDD)', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (77, 62, N'Đầu ghi hình 4 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (78, 62, N'Đầu ghi hình 8 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (79, 62, N'Đầu ghi hình 12 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (80, 62, N'Đầu ghi hình 16 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (81, 62, N'Đầu ghi hình 24 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (82, 62, N'Đầu ghi hình 32 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (83, 62, N'Đầu ghi hình 64 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (84, 62, N'Đầu ghi hình 128 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (85, 63, N'Hỗ trợ 1 ổ cứng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (86, 63, N'Hỗ trợ 2 ổ cứng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (87, 63, N'Hỗ trợ 3 ổ cứng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (88, 63, N'Hỗ trợ 4 ổ cứng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (89, 63, N'Hỗ trợ 6 ổ cứng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (90, 63, N'Hỗ trợ 8 ổ cứng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (91, 3, N'Trọn bộ theo hãng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (92, 3, N'Trọn bộ theo loại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (93, 3, N'Theo Độ phân giải', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (94, 3, N'Theo Công Nghệ', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (95, 3, N'Theo dòng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (96, 91, N'Trọn bộ camera Hikvision', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (97, 91, N'Trọn bộ camera Vantech', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (98, 91, N'Trọn bộ camera Dahua', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (99, 92, N'Hệ thống 1 camera', NULL, 1)
GO
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (100, 92, N'Hệ thống 2 camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (101, 92, N'Hệ thống 3 camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (102, 92, N'Hệ thống 4 camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (103, 92, N'Hệ thống 5 camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (104, 92, N'Hệ thống 6 camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (105, 92, N'Hệ thống 7 camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (106, 92, N'Hệ thống 8 camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (107, 93, N'Độ phân giải HD720P', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (108, 93, N'Độ phân giải HD960P', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (109, 93, N'Full HD 1080P', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (110, 93, N'HD4K', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (111, 94, N'AHD', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (112, 94, N'HD-CVI', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (113, 94, N'HD-TVI', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (114, 94, N'IP', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (115, 94, N'HD 3.0 TVI', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (116, 95, N'Phổ thông', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (117, 95, N'Trung cấp', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (118, 95, N'Cao cấp', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (119, 4, N'Theo hãng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (120, 4, N'Theo loại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (121, 119, N'Vantech', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (122, 119, N'Hikvision', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (123, 120, N'Camera Poweiline IP', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (124, 120, N'Camera soi tiền', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (125, 120, N'Camera Wifi', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (126, 4, N'Theo Độ phân giải', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (127, 126, N'HD 720P 1.0 Megapixel', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (128, 126, N'HD 960P 1.3 Megapixel', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (129, 126, N'HD 1080P 2.0 Megapixel', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (130, 5, N'Phụ kiện theo hãng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (131, 130, N'Phụ kiện Vantech', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (132, 130, N'Phụ kiện HIKVISION', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (133, 130, N'WD PURPLE', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (134, 5, N'Phụ kiện theo loại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (135, 134, N'Phụ kiện cáp quang', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (136, 134, N'Nguồn Camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (137, 134, N'Chân đế Camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (138, 134, N'Ổ cứng lưu hình (HDD)', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1140, 134, N'Video Balun', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1141, 134, N'Bàn điều khiền camera (PTZ)', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1142, 134, N'Ống kính Camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1143, 134, N'Vỏ bảo vệ Camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1144, 134, N'Dây tín hiệu Camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1145, 134, N'Lưu điện hệ thống camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1146, 5, N'Theo Chủng loại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1147, 1146, N'Bàn điều khiển IP', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1148, 1146, N'Bàn điều khiển HD Analog', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1149, 5, N'Theo Ổ cứng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1150, 1149, N'HDD chuyên dụng WD Purple', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1151, 6, N'Theo hãng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1152, 1151, N'Vantech', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1153, 6, N'Theo loại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1154, 1153, N'Đầu ghi hình', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1155, 1153, N'Camera', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1156, 1153, N'Phụ kiện', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1157, 6, N'Theo Số kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1158, 1157, N'4 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1159, 1157, N'8 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1160, 1157, N'16 kênh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1161, 6, N'Theo Phụ kiện', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1162, 1161, N'Hồng ngoại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1163, 1161, N'Cảm biến từ', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1164, 1161, N'Còi hú đèn chớp', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1165, 1161, N'Cảm biến chuyển động', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1166, 1161, N'Ổ cắm thông minh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1167, 1161, N'Khuếch đại tín hiệu', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1168, 7, N'Bộ đàm theo hãng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1169, 1168, N'Motorola', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1170, 1168, N'Kenwood', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1171, 1168, N'Aolin', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1172, 1168, N'China', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1173, 1168, N'Việt Nam', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1174, 1168, N'Karian', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1175, 7, N'Bộ đàm theo loại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1176, 1175, N'Bộ đàm', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1177, 1175, N'Báo động', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1178, 1175, N'Khóa chống trộm', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1179, 8, N'Theo giải pháp', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1180, 1179, N'Văn Phòng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1181, 1179, N'Shop - Salon', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1182, 1179, N'Bệnh viện', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1183, 1179, N'Trường học', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1184, 1179, N'Nhà hàng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1185, 1179, N'Tiệm Vàng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1186, 1179, N'Kho cảng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1187, 8, N'Theo Tỉnh thành', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1188, 1187, N'Hải Phòng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1189, 1187, N'Quảng Ninh', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1190, 1187, N'Lai Châu', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1191, 1187, N'Thái Bình', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1192, 1187, N'Hải Dương', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1193, 1187, N'Hà Nội', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1194, 1187, N'Vĩnh Phúc', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1195, 1187, N'Cao Bằng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1196, 1187, N'Hưng Yên', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1197, 9, N'Theo loại ứng dụng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1198, 1197, N'Máy chấm công vân tay', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1199, 1197, N'Máy chấm công thẻ từ cảm ứng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1200, 1197, N'Máy chấm công vân tay + thẻ từ', NULL, 1)
GO
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1201, 1197, N'Máy chấm công thẻ giấy', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1202, 9, N'Theo loại quản lý', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1203, 1202, N'500 dấu vân tay', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1204, 1202, N'1000 - 1500 dấu vân tay', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1205, 1202, N'3000 - 4000 dấu vân tay', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1206, 1202, N'8.000 - 10.000 dấu vân tay', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1207, 9, N'Thiết bị kiểm soát cửa', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1208, 1207, N'Khóa cửa điện tử', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1209, 1207, N'Phụ kiện kiểm soát cửa', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1210, 10, N'Khuyến mại theo hãng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1211, 1210, N'Khuyến mại Hưng Phát', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1212, 1210, N'Khuyến mại Vantech', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1213, 1210, N'Khuyến mại Dahua', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1214, 1210, N'Khuyến mại Hikvision', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1215, 1210, N'Khuyến mại Sony', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1216, 10, N'Khuyến mại theo loại', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1217, 1216, N'Khuyến mại Vantech', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1218, 1216, N'Khách sạn', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1219, 1216, N'Khuyến mại Hikvision', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1220, 1216, N'Kho cảng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1221, 1216, N'Tiệm vàng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1222, 1216, N'Khuyến mại Dahua', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1223, 1216, N'Văn phòng', NULL, 1)
INSERT [dbo].[ProductCategories] ([CateID], [CateParentsID], [CateName], [Icon], [Status]) VALUES (1224, 1216, N'Khuyến mại Hưng Phát', NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (2, 16, 1, N'VP-225HDI', N'1.0 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-224hdi,225hdi,226hdi.jpg', N'<p>- 1.0 Megapixel Image Sensor</p>

<p>- Excellent performance, stable quality</p>

<p>- Video output: HD-TVI/ AHD/ HD-CVI/ Analog</p>

<p>- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)</p>

<p>- High speed transmission with distances up to 300-500m</p>

<p>- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR - IR 6 pcs ARRAY LED. IR distances up to 40-50m</p>

<p>- Press Up/Down/Left/Right on the OSD Menu to select camera&#39;s working mode as AHD/TVI/CVI/Analog DVRs</p>
', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 2, 0, 12000000, 33, 8, CAST(N'2016-05-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (3, 19, 1, N'VP-463TVI', N'4 CHANNEL 1080P FOUR IN ONE', N'/upload/images/vantech/463 tvi.png', N'- Four in One Digital Recorder: HDTVI(1080P) + AHD(720P) + ANALOG (960H) + IP(1080P)
- Up to 4 cameras with 1080P real-time preview
- Connect with TVI, AHD, IP and Analog camera
- H.264 dual-stream video compression
- VGA/ HDMI/ BNC video output with Full HD resolution
- Multi streaming help reducing the network bandwidth
- Support cloud technology for remote viewing and control via P2P
- Support Push Video
- Support 1 SATA HDD, up to 2TB
- Support Web, Smart Phone, Laptop & PC
- Intelligent search and playback
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 3000000, 108, 0, CAST(N'2016-05-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (4, 25, 1, N'VP-451CVI', N'DIGITAL VIDEO RECORDER VP-451CVI 4 CHANNEL 1080P HD-CVI', N'/upload/images/vantech/vp-450cvi.png', N'- Support HDCVI / IP video input
- Up to 4/8/16 cameras with 1080p real-time preview
- H.264 dual-stream video compression
- All channel 720P realtime or 1080P non-realtime recording
- HDMI / VGA simultaneous video output
- All channel synchronous real-time playback, GRID interface & smart search
- Support 1 SATA HDD up to 3TB, 2 USB 2.0
- Multiple network monitoring: Web viewer, CMS (PSS/Smart PSS) & Smart phone (DMSS)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 5000000, 5, 0, CAST(N'2016-05-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1002, 16, 1, N'VP-410SH', N'SMART SURVEIILANCE 4CH', N'/upload/images/vantech/X10SH1_2015_12_17_14_48_38.png', N'- Four in One Digital Recorder: AHD(1080P) + HDTVI(1080P) + IP(1080P) + Analog(960H)
- Connect with AHD, TVI, IP and Analog camera
- H.264 video compression
- HDMI and VGA output at up to 1920×1080P resolution
- Support Cloud
- Push Video
- Support 1 SATA port, HDD capacity up to 3TB
- Support wireless to connect with alarm device
- Remote monitoring via mobile devices (mobile phone, tablet, NB…)
- Multiple OS (Windows, Mac OS), Smartphone (Android & iOS)
- Thoughtful Software Function for Multi Alternative for DDNS Setup, NTP Clock with Daylight Savings Time Setup, Recording Preservation (Auto Delete) , Privacy Mask…
- The most powerful CMS (Customer Management System)
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 0, 0, CAST(N'2016-05-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1003, 16, 1, N'VP-810SH', N'SMART SURVEIILANCE 8CH', N'/upload/images/vantech/X10SH1_2015_12_17_14_48_38.png', N'- Four in One Digital Recorder: AHD(1080P) + HDTVI(1080P) + IP(1080P) + Analog(960H)
- Connect with AHD, TVI, IP and Analog camera
- H.264 video compression
- HDMI and VGA output at up to 1920×1080P resolution
- Support Cloud, Push Video
- Support 1 SATA port, HDD capacity up to 3TB
- Support wireless to connect with alarm device
- Remote monitoring via mobile devices (mobile phone, tablet, NB…)
- Multiple OS (Windows, Mac OS), Smartphone (Android & iOS)
- Thoughtful Software Function for Multi Alternative for DDNS Setup, NTP Clock with Daylight Savings Time Setup, Recording Preservation (Auto Delete) , Privacy Mask…
- The most powerful CMS (Customer Management System)
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 15000000, 6, 0, CAST(N'2016-05-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1004, 16, 1, N'VP-1610SH', N'SMART SURVEIILANCE 16CH', N'/upload/images/vantech/X10SH1_2015_12_17_14_48_38.png', N'- Four in One Digital Recorder: AHD(1080P) + HDTVI(1080P) + IP(1080P) + Analog(960H)
- Connect with AHD, TVI, IP and Analog camera
- H.264 video compression
- HDMI and VGA output at up to 1920×1080P resolution
- Support Cloud, Push Video
- Support 1 SATA port, HDD capacity up to 3TB
- Support wireless to connect with alarm device
- Remote monitoring via mobile devices (mobile phone, tablet, NB…)
- Multiple OS (Windows, Mac OS), Smartphone (Android & iOS)
- Thoughtful Software Function for Multi Alternative for DDNS Setup, NTP Clock with Daylight Savings Time Setup, Recording Preservation (Auto Delete) , Privacy Mask…
- The most powerful CMS (Customer Management System)
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 18000000, 0, 0, CAST(N'2016-05-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1005, 16, 1, N'VP-10 DOOR', N'WIRELESS DOOR / WINDOW SENSOR', N'/upload/images/vantech/Door Sensor.png', N'- Detects as your door/window is opened or closed
- Magnetic separation trigger function
- Hidden tamper prevention Trigger
- Low battery detection
- External Switch
- Max. Distance to connect with DVR up to 30m
- LED Status Indicator
- Operating temp: -150C~600C
- Working Voltage: 3V', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 1, 0, CAST(N'2016-05-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1006, 16, 1, N'VP-10 PLUG', N'WIRELESS SMART POWER PLUG', N'/upload/images/vantech/Power Plug.png', N'- Plug-In Module
- Wireless control & AC power output
- Suitable for most of Appliance
- Max Load output: 600W, 50/60Hz
- Input: 220VAC
- Motor load: 1/2 HP
- Resistive load: 15A', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 3, 0, CAST(N'2016-05-11T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1007, 16, 1, N'VP-10 REPEATER', N'WIRELESS REPEATER', N'/upload/images/vantech/tu xa.jpg', N'- Repeater Functionality
- Support Explore Frame
- Power Level Control
- Auto/Manual Inclusion
- LED Status Indicator
- Operating Range: Up to 200 meters line of sight
- Operating Temp: -15oC~ 60oC
- Working Voltage: 5V/DC ~ 12V/DC', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 8000000, 0, 0, CAST(N'2016-05-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1008, 16, 1, N'VP-10 SIREN', N'WIRELESS SIREN', N'/upload/images/vantech/Wireless Siren.png', N'- Loud audible alarm>105dB@1 meter
- LED strobe lighting
- Low battery detection
- Siren for Battery Back-Up
- 100ft line of sight
- LED Status Indicator
- Operating temp: -150C~600C
- Working Voltage: 6V', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 8000000, 1, 0, CAST(N'2016-05-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1009, 16, 1, N'VP-10PIR', N'WIRELESS PIR MOTION SENSOR', N'/upload/images/vantech/Motion Sensor.png', N'- 2~10 meter Motion Range
- 120 Degree Horizontal Angle Coverage
- Temperature Function
- Low battery detection
- Panasonic CR123A Battery
- Max. Distance to connect with DVR up to 30m
- LED Status Indicator
- Operating temp: -150C~400C
- Working Voltage: 3V', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 6000000, 0, 0, CAST(N'2016-05-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1010, 16, 1, N'VP-8410SH', N'SMART SURVEILLANCE 8CH', N'/upload/images/vantech/vp-8410sh.png', N'- Four in One Digital Recorder: AHD(1080P) + HDTVI(1080P) + IP(1080P) + Analog(960H)
- Connect with AHD, TVI, IP and Analog camera
- H.264 video compression
- HDMI and VGA output at up to 1920×1080P resolution
- Support Cloud, Push Video
-  Support 4 SATA ports, HDD capacity up to 12TB
- Support cloud technology for remote viewing and control via P2P
- Support Push Video
- Support 3 SATA HDDs, up to 6TB; 1 eSATA port, up to 16TB
- Support wireless to connect with alarm device
- Remote monitoring via mobile devices (mobile phone, tablet, NB…)
- Multiple OS (Windows, Mac OS), Smartphone (Android & iOS)                                                                                                                                                                                                     - Thoughtful Software Function for Multi Alternative for DDNS Setup, NTP Clock with Daylight Savings Time Setup, Recording Preservation (Auto Delete) , Privacy Mask…                                               - The most powerful CMS (Customer Management System)                                                                                                                                                                                                           - User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 7000000, 3, 0, CAST(N'2016-05-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1011, 16, 1, N'VP-16410SH', N'SMART SURVEILLANCE 16CH', N'/upload/images/vantech/vp-8410sh.png', N'- Four in One Digital Recorder: AHD(1080P) + HDTVI(1080P) + IP(1080P) + Analog(960H)
- Connect with AHD, TVI, IP and Analog camera
- H.264 video compression
- HDMI and VGA output at up to 1920×1080P resolution
- Support Cloud, Push Video
-  Support 4 SATA ports, HDD capacity up to 12TB
- Support cloud technology for remote viewing and control via P2P
- Support Push Video
- Support 3 SATA HDDs, up to 6TB; 1 eSATA port, up to 16TB
- Support wireless to connect with alarm device
- Remote monitoring via mobile devices (mobile phone, tablet, NB…)
- Multiple OS (Windows, Mac OS), Smartphone (Android & iOS)                                                                                                                                                                                                     - Thoughtful Software Function for Multi Alternative for DDNS Setup, NTP Clock with Daylight Savings Time Setup, Recording Preservation (Auto Delete) , Privacy Mask…                                               - The most powerful CMS (Customer Management System)                                                                                                                                                                                                           - User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 8000000, 0, 0, CAST(N'2016-05-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1012, 17, 1, N'VPP-01A', N'POWERLINE NETWORK CCTV KIT', N'/upload/images/vantech/vpp-01a.jpg', N'KIT includes 1 NVR and 4 IP cameras
HomePlug IP Camera
- 1/3” 1.0 Megapixel
- Resolution max 25/30fps@720P(1080x720)
- Day/Night(ICR), AWB, AGC, BLC, 3D-WDR
- 3.6mm board lens (6mm, 8mm, 12mm optional)
- IR 36 pcs LED Ø5. IR Distance: 15-20m
- IP66 / Bracket included
HomePlug NVR
- Up to 4 cameras with 1080P real-time preview
- All channel 720P recording
- HDMI/VGA simultaneous video output
- Support 1 SATA HDD up to 3TB, 2 USB 2.0
- Support Cloud
- Support Web, Smart phone, Laptop & PC', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 0, 0, CAST(N'2016-05-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1013, 17, 1, N'VPP-01B', N'POWERLINE NETWORK CCTV KIT', N'/upload/images/vantech/vpp-01a.jpg', N'KIT includes 1 NVR and 4 IP cameras
HomePlug IP Camera
- 1/3” 2.0 Megapixel
- Resolution max 25/30fps@1080P(1920x1080)
- Day/Night(ICR), AWB, AGC, BLC, 3D-WDR
- 3.6mm board lens (6mm, 8mm, 12mm optional)
- IR 36 pcs LED Ø5. IR Distance: 15-20m
- IP66 / Bracket included
HomePlug NVR
- Up to 4 cameras with 1080P real-time preview
- All channel 1080P recording
- HDMI/VGA simultaneous video output
- Support 1 SATA HDD up to 3TB, 2 USB 2.0
- Support Cloud
- Support Web, Smart phone, Laptop & PC', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 11000000, 0, 0, CAST(N'2016-05-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1014, 17, 1, N'VPP-01C', N'POWERLINE NETWORK CCTV KIT', N'/upload/images/vantech/vpp-01a.jpg', N'KIT includes 1 NVR monitor and 4 IP cameras
HomePlug IP Camera
- 1/3” 2.0 Megapixel
- Resolution max 25/30fps@1080P(1920x1080)
- Day/Night(ICR), AWB, AGC, BLC, 3D-WDR
- 3.6mm board lens (6mm, 8mm, 12mm optional)
- IR 36 pcs LED Ø5. IR Distance: 15-20m
- IP66 / Bracket included
HomePlug NVR
- Up to 4 cameras with 1080P real-time preview
- All channel 1080P recording
- HDMI/VGA simultaneous video output
- Support 1 SATA HDD up to 3TB, 2 USB 2.0
- Support Cloud
- Support Web, Smart phone, Laptop & PC', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 14000000, 1, 0, CAST(N'2016-05-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1015, 17, 1, N'VPP-02A', N'POWERLINE NETWORK CCTV KIT', N'/upload/images/vantech/vpp-02a.jpg', N'KIT includes 1 NVR and 8 IP cameras
HomePlug IP Camera
- 1/3” 1.0 Megapixel
- Resolution max 25/30fps@720P(1080x720)
- Day/Night(ICR), AWB, AGC, BLC, 3D-WDR
- 3.6mm board lens (6mm, 8mm, 12mm optional)
- IR 36 pcs LED Ø5. IR Distance: 15-20m
- IP66 / Bracket included
HomePlug NVR
- Up to 8 cameras with 1080P real-time preview
- All channel 720P recording
- HDMI/VGA simultaneous video output
- Support 2 SATA HDD up to 6TB, 2 USB 2.0
- Support Cloud
- Support Web, Smart phone, Laptop & PC', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 16000000, 5, 0, CAST(N'2016-05-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1016, 17, 1, N'VPP-02B', N'POWERLINE NETWORK CCTV KIT', N'/upload/images/vantech/vpp-02a.jpg', N'KIT includes 1 NVR and 8 IP cameras
HomePlug IP Camera
- 1/3” 2.0 Megapixel
- Resolution max 25/30fps@1080P(1920x1080)
- Day/Night(ICR), AWB, AGC, BLC, 3D-WDR
- 3.6mm board lens (6mm, 8mm, 12mm optional)
- IR 36 pcs LED Ø5. IR Distance: 15-20m
- IP66 / Bracket included
HomePlug NVR
- Up to 8 cameras with 1080P real-time preview
- All channel 1080P recording
- HDMI/VGA simultaneous video output
- Support 2 SATA HDD up to 6TB, 2 USB 2.0
- Support Cloud
- Support Web, Smart phone, Laptop & PC', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 17000000, 7, 0, CAST(N'2016-05-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1017, 18, 1, N'VP-227HDI', N'2.0 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-265hdi,266hdi,267hdi.png', N'- 2.0 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 6 pcs ARRAY LED. IR distances up to 40-50m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 5000000, 3, 0, CAST(N'2016-05-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1018, 18, 1, N'VP-226HDI', N'1.3 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-265hdi,266hdi,267hdi.png', N'- 1.3 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 6 pcs ARRAY LED. IR distances up to 40-50m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 7000000, 0, 0, CAST(N'2016-05-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1019, 18, 1, N'VP-265HDI', N'1.0 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-265hdi,266hdi,267hdi.png', N'- 1.0 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 6 pcs ARRAY LED. IR distances up to 40-50m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 8000000, 0, 0, CAST(N'2016-05-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1020, 18, 1, N'VP-266HDI', N'1.0 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-265hdi,266hdi,267hdi.png', N'- 1.0 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 6 pcs ARRAY LED. IR distances up to 40-50m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 9000000, 0, 0, CAST(N'2016-05-13T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1021, 18, 1, N'VP-267HDI', N'1.3 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-265hdi,266hdi,267hdi.png', N'- 1.3 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 6 pcs ARRAY LED. IR distances up to 40-50m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 0, 0, CAST(N'2016-05-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1022, 18, 1, N'VP-281HDI', N'1.0 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-281hdi,291hdi.png', N'- 1.0 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 3 pcs ARRAY LED. IR distances up to 20-30m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 11000000, 0, 0, CAST(N'2016-05-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1023, 18, 1, N'VP-291HDI', N'1.0 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-281hdi,291hdi.png', N'- 1.0 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 4 pcs ARRAY LED. IR distances up to 30-40m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 3, 0, CAST(N'2016-05-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1024, 18, 1, N'VP-3224HDI', N'1.0 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vt-3224hdi,3234hdi_2015_09_26_11_08_39.png', N'- 1.0 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 6 pcs ARRAY LED. IR distances up to 30-40m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 15, 0, CAST(N'2016-05-14T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1025, 18, 1, N'VP-183HDI', N'1.0 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-183hdi_2015_09_26_11_10_20.png', N'- 1.0 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 12 pcs ARRAY LED. IR distances up to 40-50m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 14000000, 0, 0, CAST(N'2016-05-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1026, 18, 1, N'VP-401HDI', N'1.0 Megapixel 4-in-1 HDI', N'/upload/images/vantech/vp-401hdi,402hdi_2015_09_26_11_12_30.png', N'- 1.0 Megapixel Image Sensor
- Excellent performance, stable quality
- Video output: HD-TVI/ AHD/ HD-CVI/ Analog
- Resolution: Max 50fps@720p (HD-TVI), 25fps@720p (AHD, HD-CVI), 25fps@960H (Analog)
- High speed transmission with distances up to 300-500m
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- IR 6 pcs ARRAY LED. IR distances up to 30-40m
- Press Up/Down/Left/Right on the OSD Menu to select camera''s working mode as AHD/TVI/CVI/Analog DVRs', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 15000000, 145, 10, CAST(N'2016-05-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1027, 19, 1, N'VP-863TVI', N'8 CHANNEL 1080P FOUR IN ONE', N'/upload/images/vantech/463 tvi.png', N'- Four in One Digital Recorder: HDTVI(1080P) + AHD(720P) + ANALOG (960H) + IP(1080P)
- Up to 8 cameras with 1080P real-time preview
- Connect with TVI, AHD, IP and Analog camera.
- H.264 dual-stream video compression
- VGA/ HDMI/ BNC video output with Full HD resolution
- Multi streaming help reducing the network bandwidth
- Support cloud technology for remote viewing and control via P2P
- Support Push Video
- Support 1 SATA HDD, up to 2TB
- Support Web, Smart Phone, Laptop & PC
- Intelligent search and playback
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 0, 0, CAST(N'2016-05-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1028, 19, 1, N'VPH-1663TVI', N'16 CHANNEL 1080P FOUR IN ONE', N'/upload/images/vantech/vph-8631_2015_08_12_10_58_58.png', N'- Four in One Digital Recorder: HDTVI (1080P) + AHD(1080P) + ANALOG (960H) + IP(1080P)
- Up to 16 cameras with 1080P real-time preview
- Connect with TVI, AHD, IP and Analog camera.
- H.264 dual-stream video compression
- VGA/ HDMI/ BNC video output with Full HD resolution
- Multi streaming help reducing the network bandwidth
- Support cloud technology for remote viewing and control via P2P
- Support Push Video
- Support 2 SATA HDDs, up to 4TB
- Support Web, Smart Phone, Laptop & PC
- Intelligent search and playback
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 2, 0, CAST(N'2016-05-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1029, 19, 1, N'VP-464TVI', N'4 CHANNEL 1080P', N'/upload/images/vantech/vp-464,864,1664tvi.png', N'- Tribrid Digital Recorder: 4CH HDTVI (1080P); 3CH HDTVI (1080P) + 1CH IP (1080P); 4CH AHD ( 1080p); 4CH ANALOG (960H)
- Support HDTVI / AHDH/ Analog / IP video input.
- H.264 dual-stream encoding
- VGA/ HDMI/ BNC simultaneous video output
- Support Audio input/output: 1/1 port
- Support Domain Name free (P2P key optional)
- Support Push Video
- Support 1 SATA HDD, HDD capacity up to 3TB
- Support Web, Smart Phone, Laptop & PC
- Intelligent search and playback
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 11000000, 0, 0, CAST(N'2016-05-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1030, 20, 1, N'VP-306TVI', N'1.3 Megapixel HD-TVI', N'/upload/images/vantech/spd 306 307.jpg', N'- HD-TVI 1.3 Megapixel, 36X Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
Features:
- 8 pcs ARRAY LED. Max IR distance: 50-80m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip,
non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 presets, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minutes
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically
according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 3, 0, CAST(N'2016-05-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1031, 20, 1, N'VP-303TVI', N'1.3 Megapixel HD-TVI', N'/upload/images/vantech/vp-302ahdm-21.png', N'- HD-TVI 1.3 Megapixel, 36X Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
- Protection Grade: Ip66
Features:
- 9 pcs High Power LED Ø20. Max IR distance: 100m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip,
non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 presets, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minutes
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 9000000, 0, 0, CAST(N'2016-05-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1032, 20, 1, N'VP-301TVI', N'1.3 Megapixel HD-TVI', N'/upload/images/vantech/vp-301tvi.png', N'- HD-TVI 1.3 Megapixel, 10X Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
Features:
- 6 pcs ARRAY LED. Max IR distance: 80m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip, non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 presets, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minutes
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 0, 0, CAST(N'2016-05-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1033, 20, 1, N'VP-308TVI', N'1.3 Megapixel HD-TVI Explosion Proof', N'/upload/images/vantech/308 3089 explosion proof.jpg', N'- HD-TVI 1.3 Megapixel, 36X Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
- Explosion Proof ATEX, ik10 Vandal Proof and Extreme Temp Protection Ip68
Features:
- 7 pcs ARRAY LED Þ20. Max IR distance: 150m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip, non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 presets, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minutes
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically
according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 11000000, 3, 0, CAST(N'2016-05-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1034, 21, 1, N'VP-273TVI', N'2.0 Megapixel HD-TVI', N'/upload/images/vantech/VP-271TVI.png', N'- 2.0 Megapixel Image Sensor
- Adopt HD TVI Technology
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, AGC, BLC, HSBLC, Motion Detect, Privacy Masking, 2D&3D-DNR
- D-WDR, Smart D-Zoom, Defog.
- Varifocal lens 2.8 ~12mm
- IR 6 pcs ARRAY LED. IR distance up to 30-40m
- OSD / IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 1, 0, CAST(N'2016-05-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1035, 21, 1, N'VP-263TVI', N'2.0 Megapixel HD-TVI', N'/upload/images/vantech/182,1839.png', N'- 2.0 Megapixel Image Sensor
- Adopt HD TVI Technology
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, AGC, BLC, HSBLC, Motion Detect, Privacy Masking, 2D&3D-DNR
- D-WDR, Smart D-Zoom, Defog.
- Varifocal Lens 2.8~12mm
- IR 4 pcs ARRAY LED. IR distances up to 30-40m
- OSD / IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 0, 0, CAST(N'2016-05-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1036, 21, 1, N'VP-143TVI', N'2.0 Megapixel HD-TVI', N'/upload/images/vantech/vp-141ahd,142ahd,143ahd.png', N'- 2.0 Megapixel Image Sensor
- Adopt HD TVI Technology
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, AGC, BLC, HSBLC, Motion Detect, Privacy Masking, 2D&3D-DNR
- D-WDR, Smart D-Zoom, Defog.
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 6 pcs ARRAY LED. IR distances up to 50-60m
- OSD / IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 15000000, 0, 0, CAST(N'2016-05-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1037, 21, 1, N'VP-123TVI', N'2.0 Megapixel HD-TVI', N'/upload/images/vantech/vp-121ahd,122ahd,123ahd.png', N'- 2.0 Megapixel Image Sensor
- Adopt HD TVI Technology
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, AGC, BLC, HSBLC, Motion Detect, Privacy Masking, 2D&3D-DNR
- D-WDR, Smart D-Zoom, Defog.
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 3 pcs ARRAY LED. IR distances up to 20-30m
- OSD / IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 11000000, 0, 0, CAST(N'2016-05-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1038, 21, 1, N'VP-151TVI', N'1.0 Megapixel HD-TVI', N'/upload/images/vantech/vp-151tvi.png', N'- 1.0 Megapixel Image Sensor
- Adopt HD TVI Technology
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 6 pcs ARRAY LED. IR distances up to 20-30m
- IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 0, 0, CAST(N'2016-05-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1039, 21, 1, N'VP-161TVI', N'1.0 Megapixel HD-TVI', N'/upload/images/vantech/162,163.png', N'- 1.0 Megapixel Image Sensor
- Adopt HD TVI Technology
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 2 pcs ARRAY LED. IR distances up to 30-40m
- IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 0, 0, CAST(N'2016-05-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1040, 21, 1, N'VP-155TVI', N'1.0 Megapixel HD-TVI', N'/upload/images/vantech/vp-155tvi,156tvi5.png', N'- 1.0 Megapixel Image Sensor
- Adopt HD TVI Technology
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, AGC, BLC, 3D-DNR
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 3 pcs ARRAY LED. IR distances up to 30-40m
- IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 0, 0, CAST(N'2016-05-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1041, 22, 1, N'VP-1660AHDM', N'16 CHANNEL 720P (1280x720) AHD', N'/upload/images/vantech/vp-860ahdm-new9.png', N'- 16 Channel “Tri-brid” DVR can compatible with: 16CH AHD-M, 16CH Analog(960H) or 8CH IP(720p) Cameras
- H.264 dual-stream video compression
- VGA/ HDMI video output with Full HD resolution
- Multi streaming help reducing the network bandwidth
- Support cloud technology for remote viewing and control via P2P
- Support 1 SATA port, HDD capacity up to 3TB
- Support Web, Smart Phone, Laptop & PC
- Intelligent search and playback
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 9000000, 0, 0, CAST(N'2016-05-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1042, 22, 1, N'VPS-1663AHD', N'16 CHANNEL 720P (1280x720) AHD', N'/upload/images/vantech/463 tvi32_2015_08_12_11_22_44.png', N'- Hybrid Digital Recorder 2 in 1: 16CH 720P(AHD-M) for AHD camera / 16CH 960H for Analog camera
- Image compression H.264
- VGA/ HDMI/ BNC video output with Full HD resolution
- Multi streaming help reducing the network bandwidth
- Support cloud technology for remote viewing and control via P2P
- Support Push Video
- Support 1 SATA ports, HDD capacity up to 3TB
- Support Web, Smart Phone, Laptop & PC
- Intelligent search and playback
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 9000000, 0, 0, CAST(N'2016-05-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1043, 22, 1, N'VP-1661AHD', N'16 CHANNEL 720P (1280x720) AHD', N'/upload/images/vantech/vp-861ahd,1661ahd_2015_08_12_11_29_05.png', N'- AHD Digital Recorder: 16CH 720P (AHD-M)
- Image compression H.264
- VGA/ HDMI video output with Full HD resolution
- Multi streaming help reducing the network bandwidth
- Support cloud technology for remote viewing and control via P2P
- Support 2 SATA ports, HDD capacity up to 4TB
- Support Web, Smart Phone, Laptop & PC
- ntelligent search and playback
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 1, 0, CAST(N'2016-05-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1044, 22, 1, N'VP-16260AHDM', N'16 CHANNEL 720P (1280x720) AHD-M', N'/upload/images/vantech/vp-8160ahdm,8260ahdm,16260ahdm-29.png', N'- Tribrid Digital Recorder 3 in 1: AHD: 16CH 720P (AHD-M); DVR: 16CH 960H;NVR: 4CH 1080P or 1CH 1080P + 8CH 720P (connection mode option) Image compression H.264
- VGA/ HDMI video output with Full HD resolution
- Multi streaming help reducing the network bandwidth
- Support cloud technology for remote viewing and control via P2P
- Support 2 SATA ports, HDD capacity up to 6TB
- Support Web, Smart Phone, Laptop & PC
- Intelligent search and playback
- User friendly interface, easy setup and use', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 0, 0, CAST(N'2016-05-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1045, 22, 1, N'VP-860AHDL', N'8 CHANNEL AHD-L', N'/upload/images/vantech/vp-860ahd.png', N'- Tribrid Digital Recorder 3 in 1: AHD: 8CH AHD-L; DVR: 8CH D1; NVR: 8CH 1080P (connection mode option)
- Image compression H.264
- VGA/BNC/HDMI video output with Full HD resolution
- Multi streaming help reducing the network bandwidth
- Support cloud technology for remote viewing and control via P2P
- Support 1 SATA port, HDD capacity up to 3TB
- Support Web, Smart Phone, Laptop & PC
- Intelligent search and playback
- User friendly interface, easy setup and used', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 15000000, 0, 0, CAST(N'2016-05-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1046, 22, 1, N'VP-16461AHD', N'16 CHANNEL 720P (1280x720) AHD', N'/upload/images/vantech/16800d153_2015_09_24_14_40_22.png', N'- AHD Digital Recorder: 16CH 720P (AHD-M)
- Image compression H.264
- VGA/ HDMI video output with Full HD resolution
- Support cloud technology for remote viewing and control via P2P
- Support 4 SATA ports, HDD capacity up to 12TB', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 0, 0, CAST(N'2016-05-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1047, 23, 1, N'VP-307AHDM', N'2.0 Megapixel AHD-M', N'/upload/images/vantech/spd 306 307_2015_08_14_09_11_18.jpg', N'- AHD 2.0 Megapixels, 36 Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
- Protection Grade: Ip66
Features:
- 8 pcs ARRAY LED. Max IR distance: 80m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip,
non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 preset, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minus
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically
according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 11000000, 0, 0, CAST(N'2016-05-18T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1048, 23, 1, N'VP-312AHDH', N'2.0 Megapixel AHD-H', N'/upload/images/vantech/vp-302ahdm-22.png', N'- AHD 2.0 Megapixels, 36X Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
- Protection Grade: Ip66
Features:
- 9 pcs High Power LED Ø20. Max IR distance: 100m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip,
non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 preset, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minus
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically
according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 0, 0, CAST(N'2016-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1049, 23, 1, N'VP-311AHDH', N'2.0 Megapixel AHD-H', N'/upload/images/vantech/vp-301ahdm29.png', N'- AHD 2.0 Megapixels, 10X Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
- Protection Grade: Ip66
Features:
- 6 pcs ARRAY LED. Max IR distance: 80m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip,
non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 preset, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minus
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically
according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 0, 0, CAST(N'2016-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1050, 23, 1, N'VP-309AHD', N'2.0 Megapixel AHD Explosion Proof', N'/upload/images/vantech/308 3089 explosion proof_2015_08_14_09_56_16.jpg', N'- AHD 2.0 Megapixels, 36X Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
- Explosion Proof ATEX & Extreme Temp Protection Ip68
Features:
- 7 pcs ARRAY LED Þ20. Max IR distance: 150m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip,
non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 preset, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minus
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically
according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 0, 0, CAST(N'2016-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1051, 24, 1, N'VP-293AHDH', N'AHD-H', N'/upload/images/vantech/vp-311,312tvi1.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking,D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 4 pcs ARRAY LED. IR distance up to 30-40m
- OSD / IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 0, 0, CAST(N'2016-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1052, 24, 1, N'VP-184AHDH', N'AHD-H', N'/upload/images/vantech/vp-182ahdm5.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking,D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 6 pcs ARRAY LED. IR distance up to 50-60m
- IP66 / Bracket included
- OSD', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 0, 0, CAST(N'2016-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1053, 24, 1, N'VP-254AHDH', N'AHD-H', N'/upload/images/vantech/252,253.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking,D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 36 pcs HPL. IR distance up to 40-60m
- OSD / IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 9000000, 0, 0, CAST(N'2016-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1054, 24, 1, N'VP-244AHDH', N'AHD-H', N'/upload/images/vantech/242,243.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking,D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 8 pcs ARRAY LED. IR distance up to 60-80m
- OSD / IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 8000000, 0, 0, CAST(N'2016-05-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1055, 24, 1, N'VP-234AHDH', N'AHD-H', N'/upload/images/vantech/232,233.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking, D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 4 pcs ARRAY LED. IR distance up to 60-80m
- Operating temperature: -10oC ~ 50oC
- Surge Protection
- OSD / IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 0, 0, CAST(N'2016-05-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1056, 24, 1, N'VP-144AHDH', N'AHD-H', N'/upload/images/vantech/vp-141ahd,142ahd,143ahd_2015_08_13_16_07_21.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking,D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 6 pcs ARRAY LED. IR distance up to 50-60m
- OSD / IP66 / Bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 0, 0, CAST(N'2016-05-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1057, 24, 1, N'VP-224AHDH', N'AHD-H', N'/upload/images/vantech/vp-222ahdnew.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking,D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 4 pcs ARRAY LED. IR distance up to 30-40m
- OSD', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 0, 0, CAST(N'2016-05-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1058, 24, 1, N'VP-118AHDH', N'AHD-H', N'/upload/images/vantech/vp-281,282tvi7.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking,D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 2 pcs ARRAY LED. IR distances up to 30-40m
- OSD', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 0, 0, CAST(N'2016-05-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1059, 24, 1, N'VP-227AHDH', N'AHD-H', N'/upload/images/vantech/vp-115tvi,116tvi-249.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking,D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 3 pcs ARRAY LED. IR distance up to 30-40m
- OSD', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 11000000, 0, 0, CAST(N'2016-05-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1060, 24, 1, N'VP-114AHDH', N'AHD-H', N'/upload/images/vantech/11394.png', N'- 2.0 Megapixel
- High speed transmission with distances up to 300-500m
- HD resolution with ultra sharp image
- Day/Night (ICR), AWB, BLC, 3D-DNR, MD, Privacy Masking,D-WDR, Defog
- Optional board lens 3.6mm (6mm, 8mm, 12mm)
- IR 3 pcs ARRAY LED. IR distance up to 20-30m
- OSD', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 13000000, 0, 0, CAST(N'2016-05-20T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1061, 16, 1, N'VP-130AHD', N'1.3 Megapixel AHD', N'/upload/images/vantech/vp-130ahd,200ahdzoom lens 36x.png', N'<p>- 1.3 Megapixel - 36X optical zoom - High speed transmission with distances up to 300-500m - HD resolution with ultra sharp image - Day/Night (ICR), AWB, BLC, Auto Iris, Auto Focus - Support RS-485 port to control zoom fucntion - OSD</p>
', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 10, 0, 12000000, 1, 0, CAST(N'2016-05-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1062, 16, 1, N'VP-455CVI', N'4 CHANNEL 720P HD-CVI', N'/upload/images/vantech/vp-455,855,1655cvi.png', N'<p>- Support HDCVI/Analog/IP video input - Up to 4 cameras with 1080P real-time preview - H.264 dual-stream video compression - Full channel 720P recording - HDMI/VGA simultaneous video output - All channel synchronous playback, GRID interface &amp; smart search - ONVIF Version 2.4 conformance - Support 1 SATA HDD up to 4TB, 2 USB2.0 - Multiple network monitoring: Web viewer, CMS (DSS/Smart PSS) &amp; Smart Phone(DMSS) - Support Cloud</p>
', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 7000000, 1, 0, CAST(N'2016-05-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1063, 25, 1, N'VP-1652CVI', N'16 CHANNEL 720P HD-CVI', N'/upload/images/vantech/vp-1652cvi.png', N'- Up to 16 cameras with 1080p real-time preview
- H.264 dual-stream video compression
- Full channel 720P real-time recording
- HDMI / VGA simultaneous video output
- All channel synchronous realtime playback, GRID interface & smart search
- Support 4 SATA HDDs up to 12TB, 2 USB2.0
- Multiple network monitoring: Web viewer, PSS & DMSS
- Support P2P', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 9000000, 0, 0, CAST(N'2016-05-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1064, 26, 1, N'VP-305CVI', N'HD-CVI', N'/upload/images/vantech/vp-305cvi8.png', N'- 20x optical zoom, 16x digital zoom
- 320x total zoom
- Max. 25/30fps@1080P(19201080) & 20/30/50/60fps@720P resolution
- DWDR, Day/Night(ICR), Ultra DNR, Auto iris, Auto focus
- Max 400o/s pan speed, 360o endless pan rotation
- Control over coaxial cable.
- High speed, long distance real-time transmission
- HD and SD switchable
- Up to 300 presets, 5 auto scan, 8 tour, 5 pattern
- Built-in 2/1 alarm in/out
- Support intelligent 3D positioning with DH-SD protocol
- IR Distance up to 100m
- OSD, IP66, bracket included', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 10000000, 0, 0, CAST(N'2016-05-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1065, 26, 1, N'VP-306CVI', N'1.3 Megapixel HD-CVI', N'/upload/images/vantech/spd 306 307_2015_08_13_16_37_18.jpg', N'- HD-CVI 1.3 Megapixels, 36X Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
- Protection Grade: Ip66
Features:
- 8 pcs ARRAY LED. Max IR distance: 80m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip, non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 preset, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minus
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically
according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 11000000, 0, 0, CAST(N'2016-05-21T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Products] ([Serial], [CateID], [SupplierID], [ProductID], [ProductName], [ImagePath], [Information], [Introduction], [Parameters], [UnitInStock], [UnitOnOrder], [UnitPrice], [Viewed], [Bought], [CreatedDate], [Status]) VALUES (1066, 26, 1, N'VP-301CVI', N'HD-CVI', N'/upload/images/vantech/vp-301ahdm23.png', N'- HD-CVI 1.0 Megapixels,10X Optical zoom
- Support Coaxial control, video transmission distance can reach 500M
- Support lightning protection, anti-surge, anti-surge function
- Support OSD English menu
- Protection Grade: Ip66
Features:
- 6 pcs ARRAY LED. Max IR distance: 80m
- 360°endless pan range and 0°- 90°tilt range, support auto-flip, non-surveillance blind area
- Pan control speed 0.6°~200°/s, tilt control speed 3.5°~35°/s
- Support 220 preset, 8 patrols, each patrol can contain up to 32 presets
- 4 patterns, can totally record up to 10 minus
- Support scan between two presets, support Zone limited
- Proportional zoom function, rotation speed can be adjusted automatically
according to zoom multiples)', N'<div>Camera HDTVI VANTECH VP-401SLT&nbsp;thiết kế dạng thân hồng ngoại, đem lại hình ảnh chất lượng cao khi&nbsp;kết hợp với đầu ghi hình HDTVI Vantech. Sản phẩm đang có giá ưu đãi tốt và bảo hành 24&nbsp;tháng trên toàn quốc tại Minh Hoàng Gia</div>

                                    <div>
                                        <img src="img/5515VP-401STL.jpg"></div>

                                    <div>
                                        <br>
                                        Camera hồng ngoại VANTECH VP-401SLT&nbsp;mới có độ phân giải HD, camera hoạt động tối ưu 24/7 bằng các thông số kỹ thuật đầy ấn tượng. Với dòng sản phẩm starlight, mục tiêu của chúng tôi là giúp bạn nhìn thấy rõ ràng ngay trong bóng tối. Quan sát ngày đêm tốt phù hợp lắp đặt trong nhà cho các công trình nhà ở, văn phòng, cửa hàng, phòng khám, spa, khách sạn,....
                                    </div>

                                    <div>
                                        Thông số kỹ thuật camera HDTVI VANTECH VP-401SLT<br>
                                        - Cảm biến ảnh 1.3 Megapixel Image Sensor<br>
                                        - Độ phân giải: 1.3 Megapixel<br>
                                        - Ống kính cố định 4mm (6, 8, 12mm tùy chọn)<br>
                                        - Độ nhạy sáng tối thiểu 0,001 Lux Starlight<br>
                                        - Đường truyền với tốc độ cao và khoảng cách truyền dài 500m<br>
                                        - Độ phân giải HD với độ nét cao<br>
                                        - Hỗ trợ các chức năng: Day/Night (ICR), AWB, AGC, BLC, 3D-DNR<br>
                                        - Nguồn cung cấp: 12V DC<br>
                                        - Đã bao gồm chân đế<br>
                                        <br>
                                        &nbsp;Liên hệ ngay với kinh doanh Minh Hoàng Gia&nbsp;&nbsp;để nhận được BÁO GIÁ CAMERA HDTVI tốt nhất thị trường.
                                    </div>', N'<table border="0" cellpadding="0" cellspacing="0">
                                        <tbody>
                                            <tr>
                                                <td>Mã sản phẩm</td>
                                                <td>VP-401SLT</td>
                                            </tr>
                                            <tr>
                                                <td>Hãng sản xuất</td>
                                                <td>VANTECH</td>
                                            </tr>
                                            <tr>
                                                <td>Chế độ bảo hành</td>
                                                <td>60 tháng</td>
                                            </tr>
                                            <tr>
                                                <td>Theo giá trị</td>
                                                <td>3 Triệu – 4 Triệu</td>
                                            </tr>
                                            <tr>
                                                <td>Cảm biến hình ảnh</td>
                                                <td>1.3 Megapixel Image Sensor</td>
                                            </tr>
                                            <tr>
                                                <td>Độ phân giải</td>
                                                <td>1.3 Megapixel</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo loại chip</td>
                                                <td>Chip CMOS</td>
                                            </tr>
                                            <tr>
                                                <td>Camera theo ống kính</td>
                                                <td>Loại 4mm</td>
                                            </tr>
                                            <tr>
                                                <td>Độ Zoom kỹ thuật số</td>
                                                <td>Không có</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ WDR</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Hỗ trợ khác</td>
                                                <td>Day/Night (ICR), AWB, AGC, BLC, 3D-DNR</td>
                                            </tr>
                                            <tr>
                                                <td>Tiêu chuẩn IP</td>
                                                <td>Không hỗ trợ</td>
                                            </tr>
                                            <tr>
                                                <td>Thiết kế phù hợp</td>
                                                <td>- Lắp đặt ngoài trời</td>
                                            </tr>
                                            <tr>
                                                <td>Tính năng Push Video</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Pan / Tilt / Zoom kỹ thuật số</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Tương thích ONVIF</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Cổng LAN</td>
                                                <td>Không</td>
                                            </tr>
                                            <tr>
                                                <td>Nguồn điện</td>
                                                <td>DC 12V</td>
                                            </tr>
                                        </tbody>
                                    </table>', 0, 0, 12000000, 3, 0, CAST(N'2016-05-21T00:00:00.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[PromotionProducts] ON 

INSERT [dbo].[PromotionProducts] ([ID], [ProductID], [Discount], [BeginDate], [EndDate]) VALUES (2, 2, 30, CAST(N'2016-06-04' AS Date), CAST(N'2016-06-20' AS Date))
INSERT [dbo].[PromotionProducts] ([ID], [ProductID], [Discount], [BeginDate], [EndDate]) VALUES (4, 4, 5, CAST(N'2016-06-07' AS Date), CAST(N'2016-06-15' AS Date))
INSERT [dbo].[PromotionProducts] ([ID], [ProductID], [Discount], [BeginDate], [EndDate]) VALUES (1007, 1061, 10, CAST(N'2016-06-07' AS Date), CAST(N'2016-06-12' AS Date))
SET IDENTITY_INSERT [dbo].[PromotionProducts] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description], [Status]) VALUES (1, N'Quản trị viên', N'Có toàn quyền trên hệ thống website', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description], [Status]) VALUES (2, N'Nhân viên', N'Có quyền thêm, sửa, xóa sản phẩm và bài viết', 1)
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description], [Status]) VALUES (3, N'Người dùng đã xác thực', N'Tài khoản đã đăng nhập vào hệ thống', 1)
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Slideshows] ON 

INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (1, N'/upload/images/slideshow/01.jpg', N'/upload/images/slideshow/thumb-01.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (2, N'/upload/images/slideshow/02.jpg', N'/upload/images/slideshow/thumb-02.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (3, N'/upload/images/slideshow/03.jpg', N'/upload/images/slideshow/thumb-03.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (4, N'/upload/images/slideshow/04.jpg', N'/upload/images/slideshow/thumb-04.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (5, N'/upload/images/slideshow/05.jpg', N'/upload/images/slideshow/thumb-05.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (6, N'/upload/images/slideshow/06.jpg', N'/upload/images/slideshow/thumb-06.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (7, N'/upload/images/slideshow/07.jpg', N'/upload/images/slideshow/thumb-07.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (8, N'/upload/images/slideshow/08.jpg', N'/upload/images/slideshow/thumb-08.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (9, N'/upload/images/slideshow/09.jpg', N'/upload/images/slideshow/thumb-09.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (10, N'/upload/images/slideshow/10.jpg', N'/upload/images/slideshow/thumb-10.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (11, N'/upload/images/slideshow/11.jpg', N'/upload/images/slideshow/thumb-11.jpg', N'#', 1)
INSERT [dbo].[Slideshows] ([ID], [ImagePath], [ThumbnailPath], [Link], [Status]) VALUES (12, N'/upload/images/slideshow/12.jpg', N'/upload/images/slideshow/thumb-12.jpg', N'#', 1)
SET IDENTITY_INSERT [dbo].[Slideshows] OFF
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Description], [Status]) VALUES (1, N'Vantech', NULL, 1)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Description], [Status]) VALUES (2, N'HikVision', NULL, 1)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Description], [Status]) VALUES (3, N'Sony', NULL, 1)
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [Description], [Status]) VALUES (4, N'WD Purpler', NULL, 1)
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
SET IDENTITY_INSERT [dbo].[Supports] ON 

INSERT [dbo].[Supports] ([ID], [Type], [Name], [SkypeNumber], [SkypeUrl], [AvatarPath]) VALUES (1, N'Hỗ trợ trực tuyến', N'Mr. Luận', NULL, N'skype:Luan.camerahaiduong?call', N'/upload/images/photo.jpg')
INSERT [dbo].[Supports] ([ID], [Type], [Name], [SkypeNumber], [SkypeUrl], [AvatarPath]) VALUES (2, N'Hỗ trợ trực tuyến', N'Mrs. Linh', NULL, N'skype:Ninh.camerahaiduong?call', N'/upload/images/photo.jpg')
INSERT [dbo].[Supports] ([ID], [Type], [Name], [SkypeNumber], [SkypeUrl], [AvatarPath]) VALUES (3, N'Hỗ trợ trực tuyến', N'Mrs. Giang', NULL, N'skype:phamgiang.camerahaiduong?call', N'/upload/images/photo.jpg')
INSERT [dbo].[Supports] ([ID], [Type], [Name], [SkypeNumber], [SkypeUrl], [AvatarPath]) VALUES (4, N'Hỗ trợ trực tuyến', N'Mr. Dũng', NULL, N'skype: dungxoan_8991?call', N'/upload/images/photo.jpg')
INSERT [dbo].[Supports] ([ID], [Type], [Name], [SkypeNumber], [SkypeUrl], [AvatarPath]) VALUES (5, N'Hỗ trợ kỹ thuật', N'Mr. Luận', NULL, N'skype:Luan.camerahaiduong?call', N'/upload/images/photo.jpg')
SET IDENTITY_INSERT [dbo].[Supports] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [RoleID], [FullName], [Username], [Password], [Address], [Phone], [CreatedDate], [Status]) VALUES (1, 1, N'DO VIET ANH ', N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'HCM', N'0963408267', CAST(N'2016-05-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FullName], [Username], [Password], [Address], [Phone], [CreatedDate], [Status]) VALUES (2, 1, N'EricJohnson', N'admin12', N'e10adc3949ba59abbe56e057f20f883e', N'1212123', N'1212123', CAST(N'2016-05-24T12:20:16.787' AS DateTime), 1)
INSERT [dbo].[Users] ([UserID], [RoleID], [FullName], [Username], [Password], [Address], [Phone], [CreatedDate], [Status]) VALUES (1002, 2, N'Đỗ Thị Nga', N'ngadt', NULL, N'hd', N'12345', CAST(N'2016-06-04T16:28:54.653' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [RoleID], [FullName], [Username], [Password], [Address], [Phone], [CreatedDate], [Status]) VALUES (2002, 2, N'Phúc', N'phucnh', N'202cb962ac59075b964b07152d234b70', N'123', N'12345', CAST(N'2016-06-05T12:52:04.150' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [RoleID], [FullName], [Username], [Password], [Address], [Phone], [CreatedDate], [Status]) VALUES (2003, 1, N'Nguyễn Văn B', N'abca', NULL, N'abca', N'01647755831', CAST(N'2016-06-07T21:18:42.647' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [RoleID], [FullName], [Username], [Password], [Address], [Phone], [CreatedDate], [Status]) VALUES (2004, 2, N'Nguyễn Thị D', N'abc', N'202cb962ac59075b964b07152d234b70', N'Hải Dương', N'123123123123', CAST(N'2016-06-07T21:23:45.423' AS DateTime), 0)
INSERT [dbo].[Users] ([UserID], [RoleID], [FullName], [Username], [Password], [Address], [Phone], [CreatedDate], [Status]) VALUES (2005, 2, N'Đỗ Thị Nga', N'nga123', N'202cb962ac59075b964b07152d234b70', N'Hải Dương', N'123123123123', CAST(N'2016-06-07T21:28:03.307' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Addresses] ADD  CONSTRAINT [DF_Addresses_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ExportBills]  WITH CHECK ADD  CONSTRAINT [FK_ExportBills_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[ExportBills] CHECK CONSTRAINT [FK_ExportBills_Orders]
GO
ALTER TABLE [dbo].[ExportBills]  WITH CHECK ADD  CONSTRAINT [FK_ExportBills_Users] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ExportBills] CHECK CONSTRAINT [FK_ExportBills_Users]
GO
ALTER TABLE [dbo].[Newsletters]  WITH CHECK ADD  CONSTRAINT [FK_Newsletters_NewsletterCategories] FOREIGN KEY([CateID])
REFERENCES [dbo].[NewsletterCategories] ([CateID])
GO
ALTER TABLE [dbo].[Newsletters] CHECK CONSTRAINT [FK_Newsletters_NewsletterCategories]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Orders]
GO
ALTER TABLE [dbo].[OrdersDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrdersDetail_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Serial])
GO
ALTER TABLE [dbo].[OrdersDetail] CHECK CONSTRAINT [FK_OrdersDetail_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([CateID])
REFERENCES [dbo].[ProductCategories] ([CateID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Suppliers]
GO
ALTER TABLE [dbo].[PromotionProducts]  WITH CHECK ADD  CONSTRAINT [FK_PromotionProducts_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([Serial])
GO
ALTER TABLE [dbo].[PromotionProducts] CHECK CONSTRAINT [FK_PromotionProducts_Products]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [Camera_Store] SET  READ_WRITE 
GO
