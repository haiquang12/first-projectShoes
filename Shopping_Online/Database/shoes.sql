USE [master]
GO
/****** Object:  Database [shoes]    Script Date: 21/11/2022 8:28:56 PM ******/
CREATE DATABASE [shoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'shoes', FILENAME = N'D:\shoes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'shoes_log', FILENAME = N'D:\shoes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [shoes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [shoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [shoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [shoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [shoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [shoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [shoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [shoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [shoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [shoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [shoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [shoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [shoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [shoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [shoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [shoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [shoes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [shoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [shoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [shoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [shoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [shoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [shoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [shoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [shoes] SET RECOVERY FULL 
GO
ALTER DATABASE [shoes] SET  MULTI_USER 
GO
ALTER DATABASE [shoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [shoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [shoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [shoes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [shoes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [shoes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'shoes', N'ON'
GO
ALTER DATABASE [shoes] SET QUERY_STORE = OFF
GO
USE [shoes]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 21/11/2022 8:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21/11/2022 8:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[cid] [int] NOT NULL,
	[cname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 21/11/2022 8:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[productName] [nvarchar](255) NULL,
	[productImage] [nvarchar](255) NULL,
	[productPrice] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 21/11/2022 8:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[account_id] [int] NULL,
	[totalPrice] [float] NULL,
	[note] [nvarchar](255) NULL,
	[created_date] [date] NULL,
	[shipping_id] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 21/11/2022 8:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipping]    Script Date: 21/11/2022 8:28:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipping](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[phone] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
 CONSTRAINT [PK_Shipping] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (1, N'user', N'123456', N'USER')
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (2, N'admin', N'12345', N'ADMIN')
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (3, N'hai', N'12112001', NULL)
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (4, N'quanghai', N'123456', N'USER')
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (5, N'quanghai1', N'123456', N'USER')
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (6, N'hai1', N'123456', N'USER')
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (7, N'quang', N'123456', N'USER')
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (8, N'quang1', N'123456', N'USER')
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (9, N'quang2', N'123456', N'USER')
INSERT [dbo].[Account] ([id], [username], [password], [role]) VALUES (1007, N'hai2', N'123456', N'USER')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([cid], [cname]) VALUES (1, N'GIÀY ADIDAS')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (2, N'GIÀY NIKE')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (3, N'GIÀY BITI''S')
INSERT [dbo].[Category] ([cid], [cname]) VALUES (4, N'GIÀY CONVERSE')
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (1, 1, N'Giày thể thao', N'https://canary.contestimg.wish.com/api/webimage/5f5ad3f3706bf3003d7acbd3-normal.jpg?cache_buster=10f7d3b88daf4019fa9d8be157793111', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (2, 1, N'Giày chạy bộ', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 120, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (3, 1, N'Giày du lịch', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 130, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (4, 2, N'Giày thể thao', N'https://canary.contestimg.wish.com/api/webimage/5f5ad3f3706bf3003d7acbd3-normal.jpg?cache_buster=10f7d3b88daf4019fa9d8be157793111', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (5, 2, N'Giày chạy bộ', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 120, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (6, 2, N'Giày du lịch', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 130, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (7, 3, N'Giày thể thao', N'https://canary.contestimg.wish.com/api/webimage/5f5ad3f3706bf3003d7acbd3-normal.jpg?cache_buster=10f7d3b88daf4019fa9d8be157793111', 100, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (8, 3, N'Giày chạy bộ', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 120, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (9, 3, N'Giày du lịch', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-normal.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 130, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (10, 4, N'Giày thể thao', N'https://canary.contestimg.wish.com/api/webimage/5f5ad3f3706bf3003d7acbd3-normal.jpg?cache_buster=10f7d3b88daf4019fa9d8be157793111', 100, 3)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (11, 5, N'Giày chạy bộ', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 120, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (12, 5, N'Giày du lịch', N'https://contents.mediadecathlon.com/p207647/2586dfd49665dd378518222c7093088e/p207647.jpg?f=650x650&format=auto', 130, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (13, 5, N'Giày adidas 2A', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-large.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 140, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (15, 6, N'Giày adidas 2A', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-large.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 140, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (16, 6, N'Giày du lịch', N'https://contents.mediadecathlon.com/p207647/2586dfd49665dd378518222c7093088e/p207647.jpg?f=650x650&format=auto', 130, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (17, 7, N'Giày walking', N'https://canary.contestimg.wish.com/api/webimage/5d5bd678d55c843e49fe3077-normal.jpg?cache_buster=ddfc80fb52c6bd85a67c68ceb94a91d7', 110, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (18, 7, N'Giày du lịch', N'https://contents.mediadecathlon.com/p207647/2586dfd49665dd378518222c7093088e/p207647.jpg?f=650x650&format=auto', 130, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (19, 7, N'Giày adidas 2A', N'https://canary.contestimg.wish.com/api/webimage/5da6e559dcf2d00d2fbc707c-large.jpg?cache_buster=d9139cea7e503395b907432f89e292d6', 140, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (20, 7, N'New Trend Men Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5df1f07d1fc34e0c50f78eb7-large.jpg?cache_buster=36188c130400df0faa4256aad8e90109', 150, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (21, 7, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6', 165, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (24, 10, N'Giày du lịch', N'https://contents.mediadecathlon.com/p207647/2586dfd49665dd378518222c7093088e/p207647.jpg?f=650x650&format=auto', 130, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (26, 11, N'Men Hiking Shoes Waterproof Non', N'https://canary.contestimg.wish.com/api/webimage/5dc3c309d8b69d0de8949a21-large.jpg?cache_buster=68ad269a9f7b07d0effa9e48c1dc5c0f', 180, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (27, 11, N'Biti''s Hunter Football', N'https://img.my-best.vn/press_component/images/08bf5a44cdaac1a447a346fd354809b3.png?ixlib=rails-4.2.0&q=70&lossless=0&w=690&fit=max&s=a611bebedf7512ec70c52509ec79b40a', 120, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (28, 11, N'New Trend Men Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5df1f07d1fc34e0c50f78eb7-large.jpg?cache_buster=36188c130400df0faa4256aad8e90109', 150, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (1011, 1005, N'New Men''s Running Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a05a08b26e56dcf17a643-normal.jpg?cache_buster=6d01b751858e14e68932bb234cdc44c1', 150, 2)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (1012, 1005, N'Men Hiking Shoes Waterproof Non', N'https://canary.contestimg.wish.com/api/webimage/5dc3c309d8b69d0de8949a21-large.jpg?cache_buster=68ad269a9f7b07d0effa9e48c1dc5c0f', 180, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (1013, 1006, N'New Men''s Running Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a05a08b26e56dcf17a643-normal.jpg?cache_buster=6d01b751858e14e68932bb234cdc44c1', 150, 1)
INSERT [dbo].[OrderDetail] ([id], [order_id], [productName], [productImage], [productPrice], [quantity]) VALUES (1014, 1006, N'Men Hiking Shoes Waterproof Non', N'https://canary.contestimg.wish.com/api/webimage/5dc3c309d8b69d0de8949a21-large.jpg?cache_buster=68ad269a9f7b07d0effa9e48c1dc5c0f', 180, 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (1, 1, 350, N'hang de vo', CAST(N'2022-03-14' AS Date), 1)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (2, 1, 350, N'hang de hong', CAST(N'2022-03-14' AS Date), 2)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (3, 1, 350, N'hang de vo', CAST(N'2022-03-14' AS Date), 3)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (4, 1, 300, N'shop giao lúc 5h chi?u cho em
', CAST(N'2022-03-14' AS Date), 4)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (5, 1, 950, N'hang de dep', CAST(N'2022-03-15' AS Date), 5)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (6, 1, 270, N'hang de hong', CAST(N'2022-03-16' AS Date), 6)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (7, 1, 1075, N'hang de rach', CAST(N'2022-03-16' AS Date), 7)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (8, 5, 420, N'hang de rach
', CAST(N'2022-03-16' AS Date), 8)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (9, 6, 620, N'hang de rach', CAST(N'2022-03-17' AS Date), 9)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (10, 8, 770, N'hang de rach', CAST(N'2022-03-17' AS Date), 10)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (11, 9, 720, N'hang de rach', CAST(N'2022-03-17' AS Date), 11)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (1005, 1007, 480, N'', CAST(N'2022-11-16' AS Date), 1005)
INSERT [dbo].[Orders] ([id], [account_id], [totalPrice], [note], [created_date], [shipping_id]) VALUES (1006, 6, 330, N'', CAST(N'2022-11-18' AS Date), 1006)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (19, N'Giày Converse Classic', N'https://saigonsneaker.com/wp-content/uploads/2019/12/cac-loai-giay-converse.jpg.webp', 100.0000, N'Cái tên đứng đầu trong danh sách này chắc chắn là giày Converse Classic cao cổ, đây là đôi giày được yêu thích qua nhiều thời đại của hãng, với thiết kế đơn giản mang đến sự trẻ trung, năng động cho người mang và phù hợp với mọi lứa tuổi nên đôi giày này rất được yêu thích.

Điểm nổi bật của loại giày này là phần vải được làm từ chất liệu canvas mềm mại, phần đế được làm từ cao su với các viền có màu đặc trưng giúp làm tăng vẻ nổi bật của đôi giày.', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (20, N'Converse 1970s', N'https://saigonsneaker.com/wp-content/uploads/2019/12/giay-converse-nam-dep.jpg.webp', 100.0000, N'Là phiên bản cải tiến của Converse classic, Converse 1970s mang vẻ đẹp đơn giản, tinh tế của thời đại cũ và nét cứng cáp, cá tính của thời hiện đại. Tất cả đã tạo nên cú đột phá mạnh mẽ đủ để hâm nóng cho cái tên đã tồn tại hơn 100 năm qua – Converse.

Những bạn yêu thích phong cách vintage chắc chắn không thể bỏ qua đôi giày này, bởi phần đế của nó có màu ngà và được phủ một lớp sơn bóng trông rất thu hút. Đặc biệt, đế giày Converse 1970s có màu đen góp phần tạo nên vẻ đẹp cổ điển mang phong cách thời trang vintage những năm 70s của thế kỷ trước.', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (8, N'New Men''s Running Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a05a08b26e56dcf17a643-normal.jpg?cache_buster=6d01b751858e14e68932bb234cdc44c1', 150.0000, N'New Men''s Running Shoes Comfortable Sports Shoes Men Athletic Outdoor Cushioning Sneakers for Walking&Jogging (EUR Size 39-48)', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (9, N'Men Hiking Shoes Waterproof Non', N'https://canary.contestimg.wish.com/api/webimage/5dc3c309d8b69d0de8949a21-large.jpg?cache_buster=68ad269a9f7b07d0effa9e48c1dc5c0f', 180.0000, N'Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-47 3 Colors
', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (21, N' Converse Jack Purcell', N'https://saigonsneaker.com/wp-content/uploads/2019/12/mau-giay-converse-moi-nhat.jpg.webp', 100.0000, N'Converse Jack Purcell được thiết kế dựa trên form giày Converse Classic kinh điển dành riêng cho những người chơi môn cầu lông và đặc biệt cái tên này xuất phát từ một danh thủ vô địch bộ môn cầu lông lúc bấy giờ.

Có thể dễ dàng nhận thấy sự khác biệt trong thiết kế của Jack Purcell với lưỡi gà hình cánh chim, phần thân được sử dụng chất liệu vải cao cấp và đắp thêm một lớp cao su ở mũi giày để tăng khả năng sử dụng. Đặc biệt, ở mũi giày của Converse Jack Purcell có hình vòng cung bo tròn trông rất giống hình mặt cười – một điểm nhấn đầy thú vị cho những tín đồ yêu thích giày Converse.', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (22, N'Converse One Star', N'https://saigonsneaker.com/wp-content/uploads/2019/12/converse-moi-nhat.jpg.webp', 100.0000, N'Đôi giày tiếp theo trong sách các dòng giày Converse nổi bật nhất mọi thời đại chính là Converse One Star. Giày được thiết kế những năm 70s bởi Jim Labadini và chủ yếu là dành cho nam giới với thiết kế mạnh mẽ, khỏe khoắn. Tuy nhiên thì những năm gần đây, Converse đã cho ra mắt các cách phối màu độc lạ, trẻ trung phù hợp với các bạn nữ hơn.', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (23, N'Converse Chuck Taylor All Star', N'https://saigonsneaker.com/wp-content/uploads/2019/12/giay-converse-den-trang.jpg.webp', 100.0000, N'Cho đến nay Chuck Taylor All Star đã trở thành biểu tượng bất diệt trong làng giày thể thao, khi nhắc đến Chuck Taylor (tên vận động viên bóng rổ nổi tiếng người Mỹ) mọi người sẽ nghĩ ngay đến Converse.', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (24, N'Converse Chuck Taylor II', N'https://saigonsneaker.com/wp-content/uploads/2019/12/cac-mau-giay-converse-moi.jpg.webp', 100.0000, N'Ra đời muộn hơn đàn anh, tuy nhiên Chuck Taylor II đã tạo nên một cú hit vào cuối năm 2015 và được gọi là siêu phẩm của Converse. Chuck Taylor II mang vẻ đẹp khỏe khoắn, năng động với xu hướng hiện đại, cách tân bởi những gam màu ấn tượng, độc đáo cùng những đường may tinh tế đã giúp dòng giày này chiếm trọn tình cảm của các Sneakerheads trên toàn thế giới.', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (25, N'Converse Rubber', N'https://saigonsneaker.com/wp-content/uploads/2019/12/giay-converse-rubber.jpg.webp', 120.0000, N'Đúng với tên gọi của mình giày Converse Rubber được thiết kế vô cùng độc đáo với chất liệu cao su, do đó bạn có thể diện đôi giày này vào bất cứ thời tiết hay màu nào trong năm. Đặc biệt, Converse Rubber sẽ phát huy công dụng tuyệt đối vào những ngày mưa, bạn sẽ không lo giày bị ướt hay bị bẩn với chất liệu cao su chống thấm tốt.', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (30, N'Biti''s Hunter Football', N'https://img.my-best.vn/press_component/images/08bf5a44cdaac1a447a346fd354809b3.png?ixlib=rails-4.2.0&q=70&lossless=0&w=690&fit=max&s=a611bebedf7512ec70c52509ec79b40a', 120.0000, N'Biti''s Hunter Football là phân khúc giày bóng đá, được thiết kế cho nhu cầu luyện tập tại các sân cỏ nhân tạo. Dáng giày, khe rãnh sâu và độ ôm chân được nghiên cứu và thiết kế theo những đặc trưng bàn chân người Việt, mang lại sự thoải mái tối đa.


Các mẫu giày bóng đá sở hữu nhiều phiên bản màu nổi bật, dễ dàng lựa chọn theo sở thích.

Mức giá thành phải chăng, không kén chọn người mua. Do đặc trưng của bộ môn bóng đá, hầu hết các sản phẩm giày này chỉ được sản xuất dành riêng cho các bạn nam.', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (33, N'Giày Nike Air Max 2016', N'https://prices.vn/photos/8/blog/review-giay-nike-nam3.jpg', 110.0000, N'Là phiên bản cái tiến từ mẫu Air Max 2015, kiểu giày này gây ấn tượng hơn bởi tính ứng dụng cao của mình.', 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (10, N'Winter Men''s Snow Boots Plus Velvet', N'https://canary.contestimg.wish.com/api/webimage/5da3d0b594a0f07fdec6c5ac-large.jpg?cache_buster=a2471ea62eba44e7c0b0f4d2b4c64681', 180.0000, N'Winter Men''s Snow Boots Plus Velvet Cotton Shoes Men''s Shoes Martin Cotton Boots Warm Shoes
', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (11, N'New Trend Men Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5df1f07d1fc34e0c50f78eb7-large.jpg?cache_buster=36188c130400df0faa4256aad8e90109', 150.0000, N'New Trend Men Hiking Shoes Waterproof Non-slip Sport Shoes Casual Running Camping Shoes Outdoor Sneakers for Men Size 39-48
', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (34, N'Giày Nike Air Max 2015', N'https://prices.vn/photos/8/blog/review-giay-nike-nam5.jpg', 110.0000, N'Ra mắt năm 2015, mẫu giày Nike nam này đã tạo nên một cơ sốt trong giới yêu thời trang. Với thiết kế để Air lộ toàn bộ ra ngoài cũng 2 màu xanh – cam ombre tương phản, mẫu giày này đã trở thành một item vạn người mê, tạo điểm nhấn thu hút cho set đồ.', 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (35, N'Giày Nike Air Max 97', N'https://prices.vn/photos/8/blog/review-giay-nike-nam7.jpg', 110.0000, N'Tuy vậy, mẫu giày Nike nam thuộc dòng Air Max nổi tiếng nhất đó là mẫu giày cùng tên được sản xuất năm 1997. Hãng đã tốn một thời gian không nhỏ, tròn 10 năm để có thể có bộ đệm khí gọn gàng, hoàn hảo nhất.

Và mẫu Air Max 97 cũng trở thành một cơn sốt vào thời bấy giờ, trở thành một món đồ phải có trong tủ đồ của nhiều bạn trẻ trên toàn thế giới. Nhiều ngôi sao nổi tiếng cũng rất đam mê sự trẻ trung, năng động và độc đáo của mẫu giày Nike Air Max 97, lăng xê nó ở khắp mọi nơi, từ streetstyle đến thảm đỏ.', 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (36, N'Zoom Pegasus', N'https://prices.vn/photos/8/blog/review-giay-nike-nam9.jpg', 110.0000, N'Lấy cảm hứng từ những chú ngựa thần trong văn hóa Hy Lạp, Nike Zoom Pegasus được ra đời với mong muốn đưa đến cho mọi người sản phẩm giày chạy tốt nhất với giá cả phải chăng. Đây cũng là một trong những mẫu giày Nike nam chạy bộ có tuổi đời cao nhất thế giới, khoảng gần 30 năm.', 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (37, N'Nike Zoom Pegasus 32 31', N'https://prices.vn/photos/8/blog/review-giay-nike-nam11.jpg', 110.0000, N'Cũng giống như đôi Nike Zoom Pegasus 33, hai mẫu giày Nike nam này cũng đem đến sự thoải mái tuyệt đối cho người sử dụng. Ngoài ra với phối màu phong phú, bạn cũng có thể sử dụng các dòng giày Nike Zoom trong nhiều mục đích khác nhau.', 2)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (12, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5f3fb6d1b2a7ef003f6bd8a4-large.jpg?cache_buster=c9295f971ce194c1e68f6144f11314c6', 165.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoor Sport Shoes Fashion Sneakers
', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (13, N'NEW Spring White Shoes Men', N'https://canary.contestimg.wish.com/api/webimage/5d0235c9ae115f0be32755ef-large.jpg?cache_buster=fd2c105001ca1cbb03795818542906cc', 185.0000, N'NEW Spring White Shoes Men Shoes Men''s Casual Shoes Fashion Sneakers Street Cool Man Footwear
', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (26, N'Converse Dainty', N'https://saigonsneaker.com/wp-content/uploads/2019/12/nhung-doi-giay-converse-dep-nhat.jpg.webp', 120.0000, N'Được thiết kế dành riêng cho các cô nàng với thiết kế nhẹ nhàng, thanh lịch, tuy nhiên Dainty vẫn mang vẻ cá tính, độc đáo vốn có của Converse. Phiên bản này sở hữu hình dạng giống các loại giày Converse nữ cổ thấp.

Dainty mang đến cảm giác mỏng manh, nữ tính hơn với thiết kế ôm gọn đôi chân mang lại cảm giác thoải mái cho bạn. Ngoài hai bản phối màu kinh điển là Converse trắng, đen thì Dainty còn các bản phối màu độc đáo khác giúp bạn có thêm nhiều sự lựa chọn cho bản thân.', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (7, N'Giày adidas 2D', N'data:image/jpeg;base64,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', 170.0000, N'Giày thể thao Adidas Advantage Clean sử dụng chất liệu cao cấp, thoáng khí cả mặt trong và mặt ngoài giúp bạn luôn dễ chịu và thoải mái dù mang trong thời gian dài. Giày Adidas VS Advantage có bộ đế êm ái giúp người đi tận hưởng cảm giác thoải mái cho cả ngày dài vận động. Thời trang vốn là sự quay vòng, và thiết kế đơn giản, cổ điển đại diện cho xu hướng thời trang hoài cổ đang quay trở lại và được giới trẻ đón nhận nồng nhiệt hơn bao giờ hết. Không giống như những loại giày thể thao thông thường, mẫu giày adidas Advantage có kiểu dáng "thon thả" hơn, khiến cho đôi chân không bị trở nên lạc lõng so với đôi giày thể thao vốn bị "mang tiếng" là thô kệch, không đẹp mắt. Thêm nữa, đế của loại giày này được thiết kế theo kiểu đế xuồng 3cm vừa tạo tính đàn hồi cho từng bước đi mà cũng "tiện tay" giúp cho người đi "ăn gian" chiều cao khá đáng kể. Và tất nhiên, điểm cộng tuyệt vời nhất chính là sự phối hợp tuyệt vời từ kiểu dáng đến màu sắc của các nhà thiết kế tài hoa đã làm cho đôi giày phù hợp với mọi giới tính, mọi lứa tuổi, mix được với rất nhiều phong cách khác nhau', 1)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (14, N'Winter Outdoor Waterproof', N'https://canary.contestimg.wish.com/api/webimage/5d70b17d55d5981ab5789f86-large.jpg?cache_buster=19f34456a6b274b940c839db21c2ab51', 200.0000, N'Winter Outdoor Waterproof Non-slip Plus Velvet Warm Snow Boots Cotton Boots Men''s Shoes
', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (15, N'Men''s Fashion Casual Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a06d9e6a1c62df8877125-large.jpg?cache_buster=d17e757a3f8465edc71812b95b4b1a57', 100.0000, N'Men''s Fashion Casual Shoes Sports Running Shoes Men''s Shoes
', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (16, N'Mens Skid Resistant Hiking Shoes', N'https://canary.contestimg.wish.com/api/webimage/5c4a02d1344e882b1a41bca4-large.jpg?cache_buster=bc4ce4d229ed4e42dbba614acb622899', 120.0000, N'Mens Skid Resistant Hiking Shoes Waterproof Mountain Boots Climbing Shoes Outdoors
', 4)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (17, N'Men''s Modern Classic Lace Up Lined', N'https://canary.contestimg.wish.com/api/webimage/5c9543744578cb33ad0f56cd-large.jpg?cache_buster=ed84658c453c742ad13b9d565566ed06', 100.0000, N'Men''s Modern Classic Lace Up Lined Perforated Dress Oxfords Shoes Flexible and Comfort oxfords
', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (18, N'Men''s Outdoors Waterproof Boots Sports Shoes', N'https://canary.contestimg.wish.com/api/webimage/5e0db090b6383fa7bb0416ab-large.jpg?cache_buster=92297459781628185d780669109c00d6', 120.0000, N'Men''s Outdoors Waterproof Boots Sports Shoes Snow Boots Hiking Boots Men''s Winter Warm Boots(No Velvet/Plus Velvet)
', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (27, N'Biti''s Hunter Core', N'https://img.my-best.vn/press_component/images/5cd105f38ae76f250715f8869d318785.jpg?ixlib=rails-4.2.0&q=70&lossless=0&w=690&fit=max&s=5d8d4c1d086207f0260542ce372530f3', 120.0000, N'Biti’s Hunter Core được định vị là dòng giày chủ lực của hãng với số lượng sản phẩm đa dạng cùng mức giá thành phải chăng hơn so với Biti’s Hunter X. Phong cách thiết kế trẻ trung, hướng đến đối tượng các bạn trẻ năng động.', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (28, N'Biti''s Hunter Running', N'https://img.my-best.vn/press_component/images/de1adfa46ed335ae5718033765ed6565.jpg?ixlib=rails-4.2.0&q=70&lossless=0&w=690&fit=max&s=a6b0d72655788927e2432815d3a92f95', 120.0000, N'Đối với những ai yêu thích bộ môn chạy bộ, Biti''s Hunter Running chính là dòng sản phẩm dành riêng cho bạn. Dòng giày chạy bộ đã được Biti’s nghiên cứu và phát triển dựa trên kích thước bàn chân và dạng lòng bàn chân đặc trưng của người Việt, mang lại sự vừa vặn và thoải mái tối đa.


Những mẫu giày chạy từ Bitis được trang bị nhiều công nghệ thế hệ mới, có khả năng hấp thụ sốc, độ nâng đỡ cao, hỗ trợ giữ tư thế chạy bộ chuẩn xác và duy trì sự thoáng khí cho chân. Với mức giá thành hấp dẫn cùng chất lượng không hề kém cạnh mẫu giày chạy từ thương hiệu ngoại nào, Biti''s Hunter Running đã trở thành sự lựa chọn yêu thích của nhiều người.', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (29, N'Biti''s Hunter Jogging', N'https://img.my-best.vn/press_component/images/83d020aa0bcdf40a42d94310458538ef.png?ixlib=rails-4.2.0&q=70&lossless=0&w=690&fit=max&s=7abe6711a0b3fcd2b4a7c01061fe1e61', 120.0000, N'Biti''s Hunter Jogging là dòng sản phẩm mới từ thương hiệu, hướng đến nhu cầu đi bộ và luyện tập thể thao nhẹ nhàng mỗi ngày. Kiểu thiết kế chú trọng đến cảm giác êm ái, không gây hầm nóng cho chân đồng thời đảm bảo sự nhẹ nhàng cần thiết khi di chuyển.


Vời vẻ ngoài thời trang, nhiều tông màu nhã nhặn dễ phối đồ cùng mức giá khá phải chăng, đây sẽ là lựa chọn cho những ai có thói quen đi bộ hàng ngày. Tuy nhiên, hầu hết các mẫu giày đi bộ hiện nay chỉ được sản xuất dành riêng cho nữ.', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (31, N'Biti’s Hunter Street', N'https://img.my-best.vn/press_component/images/8eb274940b6e5e9a0638d29979f6b962.jpeg?ixlib=rails-4.2.0&q=70&lossless=0&w=690&fit=max&s=709865d70eb4e1ffde12caef96a0d725', 120.0000, N'Ngoài những mẫu giày chuyên dụng cho việc luyện tập thể thao, nếu bạn đang tìm kiếm những mẫu giày có thể tạo điểm nhấn phong cách cho trang phục, Biti’s Hunter Street chính là lựa chọn phù hợp. Hầu hết các sản phẩm thuộc phân khúc này đều được thiết kế dạng cổ thấp, tạo phong cách trẻ trung, tiện lợi khi dạo phố, đi học hay đi làm.', 3)
INSERT [dbo].[product] ([id], [name], [image], [price], [description], [cateID]) VALUES (32, N'Air Max nam', N'https://prices.vn/photos/8/blog/review-giay-nike-nam1.jpg', 120.0000, N'Đây là mẫu giày Nike nam được săn đón rất nhiều trong thời gian gần đây bởi độ tiện lợi, thoải mái của nó. Mặc dù là một món đồ chuyên sử dụng để tập thể thao nhưng mẫu giày Nike Air Max 2017 vẫn có những nét riêng rất thời trang, sành điệu.', 2)
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[Shipping] ON 

INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1, N'Hai', N'01649759100', N'Hanoi@gmail.com')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (2, N'Quang', N'01548796451', N'Hanoi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (3, N'lan', N'013464545', N'hanoi')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (4, N'Văn Hải', N'0123456789', N'Thái Bình')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (5, N'hai bo', N'0123456789', N'thai binh')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (6, N'son', N'0123456789', N'dan phuong')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (7, N'quanghai', N'0123456789', N'dong la')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (8, N'hai', N'0123456789', N'thai binh')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (9, N'hai', N'0123456789', N'hai duong')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (10, N'nguyen van quang', N'0123456789', N'thai binh')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (11, N'quang2', N'0123456', N'thai binh')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1005, N'Bùi Văn Hải', N'0837821222', N'đền Nghè ,cổng làng Đông La')
INSERT [dbo].[Shipping] ([id], [name], [phone], [address]) VALUES (1006, N'Bùi Văn Hải', N'0837821222', N'đền Nghè ,cổng làng Đông La')
SET IDENTITY_INSERT [dbo].[Shipping] OFF
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_created_date]  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__order__30F848ED] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__OrderDeta__order__30F848ED]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__account___2F10007B] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__account___2F10007B]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK__Orders__shipping__300424B4] FOREIGN KEY([shipping_id])
REFERENCES [dbo].[Shipping] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK__Orders__shipping__300424B4]
GO
USE [master]
GO
ALTER DATABASE [shoes] SET  READ_WRITE 
GO
