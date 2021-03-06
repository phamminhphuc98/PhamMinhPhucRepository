USE [CàPhe]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADMIN](
	[MaAdmin] [int] NOT NULL,
	[HoTenAdmin] [nvarchar](50) NULL,
	[DiaChiAdmin] [nvarchar](50) NULL,
	[DienThoaiAdmin] [varchar](10) NULL,
	[TenDNAdmin] [varchar](15) NULL,
	[MatKhauAdmin] [varchar](15) NULL,
	[NgaySinhAdmin] [smalldatetime] NULL,
	[GioiTinhAdmin] [bit] NULL,
	[EmailAdmin] [varchar](50) NULL,
	[HinhAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTDONHANG]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTDONHANG](
	[SoDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[ThanhTien]  AS ([SoLuong]*[DonGia]),
 CONSTRAINT [PK_CTDONHANG] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CTPHIEUNHAP]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPHIEUNHAP](
	[MaPhieu] [int] NOT NULL,
	[MaNCC] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
	[ThanhTien] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CTPHIEUNHAP] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DANHGIASANPHAM]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DANHGIASANPHAM](
	[MaDG] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[HoTenKH] [nvarchar](50) NULL,
	[BinhLuan] [ntext] NULL,
	[ThoiGian] [date] NULL,
	[MaKH] [int] NULL,
	[DiemDG] [int] NULL,
	[TenDN] [varchar](50) NULL,
 CONSTRAINT [PK_DANHGIASANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DONDATHANG](
	[SoDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[NgayDH] [date] NULL,
	[Ngaygiaohang] [date] NULL,
	[TriGia] [decimal](18, 0) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[TenNguoiNhan] [nvarchar](50) NULL,
	[DiaChiNhan] [nvarchar](50) NULL,
	[DienThoaiNhan] [varchar](15) NULL,
	[MaHTTT] [int] NULL,
	[MaHTGH] [int] NULL,
	[EmailNhanHang] [nvarchar](50) NULL,
	[IDMaGiam] [int] NULL,
	[MaGiam] [varchar](50) NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HINHTHUCGIAOHANG]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HINHTHUCGIAOHANG](
	[MaHTGH] [int] NOT NULL,
	[TenHTGH] [nvarchar](50) NULL,
 CONSTRAINT [PK_HINHTHUCGIAOHANG] PRIMARY KEY CLUSTERED 
(
	[MaHTGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HINHTHUCTHANHTOAN]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HINHTHUCTHANHTOAN](
	[MaHTTT] [int] NOT NULL,
	[TenHTTT] [nvarchar](50) NULL,
 CONSTRAINT [PK_HINHTHUCTHANHTOAN] PRIMARY KEY CLUSTERED 
(
	[MaHTTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTenKH] [nvarchar](50) NULL,
	[DiaChiKH] [nvarchar](50) NULL,
	[DienThoaiKH] [varchar](11) NULL,
	[TenDN] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[LoaiDN] [nvarchar](50) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAISP]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAISP](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LOAISP] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MaGiamGia]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaGiamGia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Magiam] [varchar](50) NULL,
	[GiaTri] [int] NULL,
	[Ngayhethan] [date] NULL,
	[soluong] [int] NULL,
 CONSTRAINT [PK_MaGiamGia] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MENU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](100) NULL,
	[ParentID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[Link] [nvarchar](50) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](50) NOT NULL,
	[SDT] [int] NOT NULL,
	[Diachi] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PHIEUNHAP]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHIEUNHAP](
	[MaPhieu] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [smalldatetime] NOT NULL,
	[TongTien] [float] NOT NULL,
 CONSTRAINT [PK_PHIEUNHAP] PRIMARY KEY CLUSTERED 
(
	[MaPhieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[Donvitinh] [nvarchar](10) NOT NULL,
	[DonGia] [decimal](18, 0) NOT NULL,
	[MoTa] [ntext] NOT NULL,
	[HinhMinhHoa] [nvarchar](50) NOT NULL,
	[MaLoai] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayChinhSua] [datetime] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[YeuThich] [int] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TINTUC]    Script Date: 7/15/2020 1:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TINTUC](
	[MaTin] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [ntext] NULL,
 CONSTRAINT [PK_TINTUC] PRIMARY KEY CLUSTERED 
(
	[MaTin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[ADMIN] ([MaAdmin], [HoTenAdmin], [DiaChiAdmin], [DienThoaiAdmin], [TenDNAdmin], [MatKhauAdmin], [NgaySinhAdmin], [GioiTinhAdmin], [EmailAdmin], [HinhAnh]) VALUES (1, N'Pham Minh Phuc', N'421, Lê Chí Dân', N'0868396150', N'phucpm', N'asd', CAST(0x8C660000 AS SmallDateTime), 1, N'phamminhphuc990@gmail.com', N'Admin.jpg')
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (7, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (7, 28, 2, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (11, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (12, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (12, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (13, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (13, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (14, 14, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (14, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (15, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (15, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (16, 74, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (17, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (17, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (18, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (18, 69, 1, CAST(530000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (19, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (19, 43, 1, CAST(38000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (19, 82, 1, CAST(11000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (20, 43, 1, CAST(38000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (20, 76, 1, CAST(1700000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (21, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (21, 82, 1, CAST(11000000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (22, 74, 1, CAST(2500000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (22, 76, 1, CAST(1700000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (23, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (23, 28, 2, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (24, 76, 1, CAST(1700000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (25, 39, 1, CAST(500000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (26, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (27, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1027, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1027, 70, 1, CAST(750000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1028, 20, 2, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1029, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1030, 19, 9, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1031, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1032, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1033, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1034, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1035, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1036, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1037, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1038, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1039, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1040, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1041, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (1042, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2029, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2030, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2031, 73, 1, CAST(4500000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2032, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2033, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2034, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2035, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2036, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2037, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2038, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2039, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2040, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2041, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2042, 20, 20, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2043, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2043, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2044, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2045, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2046, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2047, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2048, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2049, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2050, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2051, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2052, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2052, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2053, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2053, 33, 2, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2054, 20, 22, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2055, 20, 3, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2056, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2057, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2058, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2059, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2060, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2061, 56, 1, CAST(165000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2061, 57, 1, CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2062, 14, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2062, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2063, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2063, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2064, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2064, 44, 1, CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2065, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2065, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2066, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2067, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2067, 43, 1, CAST(38000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2068, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2068, 43, 1, CAST(38000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2069, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2069, 43, 1, CAST(38000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2070, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2070, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2071, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2071, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2072, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2073, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2074, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2074, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2075, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2077, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2079, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2079, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2080, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2080, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2081, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2081, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2082, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2082, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2083, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2083, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2084, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2085, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2086, 43, 1, CAST(38000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2086, 44, 1, CAST(120000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2087, 20, 22, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2088, 33, 3, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2089, 20, 3, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2090, 20, 5, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2090, 28, 3, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2091, 20, 2, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2091, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2092, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2092, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2094, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2094, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2095, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2095, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2096, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2097, 28, 50, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2098, 29, 1, CAST(360000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2099, 33, 5, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2100, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2101, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2102, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2103, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2104, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2104, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2104, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2104, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2105, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2106, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2107, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2108, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2108, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2109, 19, 3, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2110, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2111, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2112, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2113, 69, 1, CAST(530000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2113, 70, 1, CAST(750000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2114, 69, 1, CAST(530000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2114, 70, 1, CAST(750000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2115, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2116, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2116, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2117, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2118, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2119, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2120, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2121, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2122, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2122, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2123, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2123, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2124, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2125, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2126, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2126, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2127, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2127, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2128, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2128, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2129, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2129, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2130, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2130, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2131, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2131, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2132, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2132, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2133, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2133, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2134, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2134, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2135, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2135, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2136, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2136, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2137, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2137, 37, 1, CAST(940000 AS Decimal(18, 0)))
GO
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2138, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2138, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2139, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2139, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2140, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2140, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2141, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2141, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2142, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2142, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2143, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2143, 37, 1, CAST(940000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2144, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2144, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2145, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2145, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2146, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2147, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2147, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2148, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2149, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2149, 31, 1, CAST(300000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2150, 20, 1, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2151, 19, 1, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2151, 20, 4, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2152, 14, 1, CAST(250000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2152, 20, 3, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2152, 28, 2, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2153, 20, 3, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2153, 28, 1, CAST(449000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2153, 33, 1, CAST(470000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2154, 20, 3, CAST(440000 AS Decimal(18, 0)))
INSERT [dbo].[CTDONHANG] ([SoDH], [MaSP], [SoLuong], [DonGia]) VALUES (2154, 33, 1, CAST(470000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DANHGIASANPHAM] ON 

INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (30, 20, N'Phúc', N'114', CAST(0x4C400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (31, 20, N'Phúc', N'115', CAST(0x4C400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (32, 29, N'Đánh giá', N'ok', CAST(0x4C400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (33, 29, N'Phúc', N'zz', CAST(0x4C400B00 AS Date), NULL, 2, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (34, 19, N'Ca Sĩ Ưng Hoàng Phúc', N'Ngon!', CAST(0x4C400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (35, 19, N'Ca Sĩ Khắc Việt', N'OKE!', CAST(0x4C400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (36, 20, N'', N'zz', CAST(0x58400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (37, 19, N'', N'zvzvzv', CAST(0x58400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (38, 20, N'', N'vzvzv', CAST(0x58400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (39, 19, N'phucpm', N'af', CAST(0x58400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (40, 20, N'', N'aa', CAST(0x58400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (41, 20, N'phucpm', N'ds', CAST(0x58400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (42, 20, N'', N'a', CAST(0x65400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (43, 20, N'', N'qfqf', CAST(0x65400B00 AS Date), NULL, 3, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (44, 20, N'', N'top', CAST(0x65400B00 AS Date), NULL, 3, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (45, 20, N'Phúc', N'ok', CAST(0x65400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (46, 31, N'Phúc', N'z', CAST(0x65400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (47, 19, N'', N'k', CAST(0x65400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (48, 20, N'Pham', N'k', CAST(0x65400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (49, 56, N'Pham', N'z', CAST(0x68400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (50, 28, N'', N'vav', CAST(0x68400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (51, 44, N'Pham', N'vz', CAST(0x68400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (52, 44, N'Pham', N'zzc', CAST(0x68400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (53, 43, N'Pham', N'slo', CAST(0x68400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (54, 76, N'', N'đẹp', CAST(0x75400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (55, 76, N'Phúc', N'a', CAST(0x75400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (56, 33, N'Phúc', N'', CAST(0x75400B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (57, 19, N'', N'âfafãz', CAST(0x7E400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (58, 19, N'', N'avavav', CAST(0x7E400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (59, 19, N'Pham', N'abcavavavav', CAST(0x7E400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (60, 19, N'', N'phuc1', CAST(0x7E400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (61, 19, N'', N'phuc1', CAST(0x7E400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (62, 19, N'', N'phuc2', CAST(0x7E400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (63, 19, N'', N'phuc1', CAST(0x7E400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (64, 19, N'', N'phuc1', CAST(0x7E400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (65, 19, N'', N'phuc2', CAST(0x7E400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (66, 19, N'', N'phuc2', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (67, 20, N'Pham', N'phuc1', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (68, 20, N'', N'phuc1', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (69, 20, N'Pham', N'phuc1', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (70, 19, N'', N'phuc1', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (71, 19, N'', N'phuc2', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (72, 19, N'Pham', N'caf phe', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (73, 19, N'Pham', N'caf', CAST(0x7F400B00 AS Date), NULL, 3, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (74, 19, N'', N'alo', CAST(0x7F400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (75, 19, N'', N'alo', CAST(0x7F400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (76, 31, N'Pham', N'phucne', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (77, 31, N'Pham', N'phucne', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (78, 31, N'Pham', N'phucne', CAST(0x7F400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (79, 19, N'', N'phuc', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (80, 31, N'', N'phuc1', CAST(0x80400B00 AS Date), NULL, 2, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (81, 31, N'', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (82, 31, N'', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (83, 31, N'phucpm', N'zz', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (84, 31, N'phucpm', N'zz', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (85, 31, N'', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (86, 31, N'', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (87, 31, N'', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (88, 31, N'', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (89, 31, N'phucpm', N'comment1', CAST(0x80400B00 AS Date), NULL, 2, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (90, 31, N'', N'comment2', CAST(0x80400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (91, 31, N'phucpm', N'comment3', CAST(0x80400B00 AS Date), NULL, 3, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (92, 31, N'', N'zzz', CAST(0x80400B00 AS Date), NULL, 3, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (93, 31, N'', N'aafafaf', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (94, 56, N'phucpm', N'ca', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (95, 43, N'phucpm', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (96, 43, N'phucpm', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (97, 43, N'phucpm', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (98, 43, N'phucpm', N'ok', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (99, 43, N'phucpm', N'zz', CAST(0x80400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (100, 43, N'phucpm', N'comment2', CAST(0x80400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (101, 43, N'phucpm', N'comment2', CAST(0x80400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (102, 43, N'phucpm', N'comment2', CAST(0x80400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (103, 43, N'phucpm', N'comment2', CAST(0x83400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (104, 43, N'phucpm', N'comment2', CAST(0x83400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (105, 43, N'phucpm', N'comment2', CAST(0x83400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (106, 43, N'phucpm', N'comment2', CAST(0x83400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (107, 43, N'phucpm', N'comment2', CAST(0x8E400B00 AS Date), NULL, 1, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (108, 69, N'Pham', N'à', CAST(0x94400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (109, 57, N'phucpm', N'z', CAST(0x94400B00 AS Date), NULL, 3, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (110, 20, N'', N'ngu', CAST(0xE8400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (111, 20, N'Phúc', N'hau ngu', CAST(0xE8400B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (112, 44, N'phucpm', N'aaxafafaf', CAST(0x35410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (113, 44, N'phucpm', N'aaxafafaf

zzxzczc', CAST(0x35410B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (114, 44, N'phucpm', N'aaxafafaf

zzxzczc', CAST(0x35410B00 AS Date), NULL, 3, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (115, 57, N'phucpm', N'11', CAST(0x35410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (116, 57, N'phucpm', N'1122', CAST(0x35410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (117, 57, N'Phúc', N'aac', CAST(0x35410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (118, 57, N'Phúc', N'aac', CAST(0x35410B00 AS Date), NULL, 3, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (119, 45, N'Phúc', N'vote', CAST(0x35410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (120, 45, N'Phúc', N'vote 1', CAST(0x35410B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (121, 61, N'Phúc', N'z', CAST(0x35410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (122, 61, N'Phúc', N'z1', CAST(0x35410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (123, 61, N'Phúc', N'1', CAST(0x35410B00 AS Date), NULL, 2, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (124, 61, N'Phúc', N'1 2', CAST(0x35410B00 AS Date), NULL, 2, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (125, 14, N'phucpm', N'Ngon!', CAST(0x35410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (126, 14, N'phucpm', N'Tốt!', CAST(0x35410B00 AS Date), NULL, 5, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (127, 14, N'haupm', N'Sản phẩm  tốt', CAST(0x35410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (128, 14, N'trungpv', N'Tạm được!', CAST(0x35410B00 AS Date), NULL, 3, NULL)
GO
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (129, 20, N'Phúc', N'Sản phẩm tốt', CAST(0x54410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (130, 20, N'Phúc', N'Ok!', CAST(0x54410B00 AS Date), NULL, 4, NULL)
INSERT [dbo].[DANHGIASANPHAM] ([MaDG], [MaSP], [HoTenKH], [BinhLuan], [ThoiGian], [MaKH], [DiemDG], [TenDN]) VALUES (131, 19, N'phucpm', N'Tot', CAST(0x54410B00 AS Date), NULL, 4, NULL)
SET IDENTITY_INSERT [dbo].[DANHGIASANPHAM] OFF
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (5, 1, CAST(0x4D400B00 AS Date), NULL, CAST(5720000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421 le chi dan', N'0868515151', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (7, 1, CAST(0x52400B00 AS Date), NULL, CAST(1338000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc2', N'421 le chi dan', N'0868515151', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (11, 1, CAST(0x58400B00 AS Date), NULL, CAST(350000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (12, 1, CAST(0x65400B00 AS Date), NULL, CAST(770000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (13, 18, CAST(0x65400B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (14, 18, CAST(0x65400B00 AS Date), NULL, CAST(700000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (15, 18, CAST(0x65400B00 AS Date), NULL, CAST(1410000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (16, 18, CAST(0x65400B00 AS Date), NULL, CAST(2500000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (17, 18, CAST(0x65400B00 AS Date), NULL, CAST(790000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (18, 18, CAST(0x65400B00 AS Date), NULL, CAST(1470000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (19, 18, CAST(0x65400B00 AS Date), NULL, CAST(11508000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (20, 18, CAST(0x65400B00 AS Date), NULL, CAST(1738000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (21, 18, CAST(0x65400B00 AS Date), NULL, CAST(11470000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (22, 18, CAST(0x65400B00 AS Date), NULL, CAST(4200000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (23, 19, CAST(0x65400B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đã giao', N'black', N'111, minh phuc', N'123456', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (24, 19, CAST(0x65400B00 AS Date), NULL, CAST(1700000 AS Decimal(18, 0)), N'Đang giao', N'black', N'111, minh phuc', N'123456', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (25, 19, CAST(0x65400B00 AS Date), NULL, CAST(500000 AS Decimal(18, 0)), N'Đang giao', N'black', N'111, minh phuc', N'123456', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (26, 1, CAST(0x65400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (27, 0, CAST(0x6D400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1027, 18, CAST(0x75400B00 AS Date), NULL, CAST(1690000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1028, 18, CAST(0x76400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1029, 1, CAST(0x81400B00 AS Date), NULL, CAST(350000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1030, 1, CAST(0x81400B00 AS Date), NULL, CAST(350000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1031, 1, CAST(0x81400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1032, 1, CAST(0x81400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1033, 1, CAST(0x81400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1034, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê Chí Dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1035, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê Chí Dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1036, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí Dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1037, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí Dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1038, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1039, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1040, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí Dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1041, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (1042, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2029, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2030, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2031, 1, CAST(0x82400B00 AS Date), NULL, CAST(4500000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2032, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2033, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2034, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2035, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2036, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2037, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2038, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2039, 1, CAST(0x82400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2040, 1, CAST(0x83400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2041, 1, CAST(0x83400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2042, 1, CAST(0x8E400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421,Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2043, 1028, CAST(0x94400B00 AS Date), NULL, CAST(910000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'444', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2044, 1029, CAST(0x94400B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2045, 1029, CAST(0x94400B00 AS Date), NULL, CAST(470000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2046, 1027, CAST(0x94400B00 AS Date), NULL, CAST(470000 AS Decimal(18, 0)), N'Đang giao', N'Phúc', N'114638347379195591797', N'', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2047, 1029, CAST(0x94400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2048, 1029, CAST(0x94400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2049, 1, CAST(0x94400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2050, 1, CAST(0x94400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2051, 1, CAST(0x94400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2052, 1028, CAST(0x94400B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421 le chi dan', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2053, 1, CAST(0x94400B00 AS Date), NULL, CAST(910000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2054, 1027, CAST(0xE8400B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'114638347379195591797', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2055, 1, CAST(0x13410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2056, 1, CAST(0x13410B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2057, 1, CAST(0x13410B00 AS Date), NULL, CAST(300000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2058, 1, CAST(0x13410B00 AS Date), NULL, CAST(300000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2059, 1, CAST(0x13410B00 AS Date), NULL, CAST(300000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2060, 1, CAST(0x13410B00 AS Date), NULL, CAST(300000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2061, 1, CAST(0x13410B00 AS Date), NULL, CAST(315000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2062, 1, CAST(0x13410B00 AS Date), NULL, CAST(799000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2063, 1029, CAST(0x13410B00 AS Date), NULL, CAST(790000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2064, 1029, CAST(0x13410B00 AS Date), NULL, CAST(590000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2065, 1, CAST(0x13410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2066, 1, CAST(0x13410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2067, 1029, CAST(0x13410B00 AS Date), NULL, CAST(338000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2068, 1029, CAST(0x13410B00 AS Date), NULL, CAST(338000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2069, 1029, CAST(0x13410B00 AS Date), NULL, CAST(338000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2070, 1029, CAST(0x13410B00 AS Date), NULL, CAST(910000 AS Decimal(18, 0)), N'Đang giao', N'hau', N'232 tan an', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2071, 1, CAST(0x13410B00 AS Date), NULL, CAST(770000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2072, 1, CAST(0x13410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2073, 1, CAST(0x13410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2074, 1, CAST(0x13410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2075, 1, CAST(0x13410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2076, 1, CAST(0x1A410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2077, 1, CAST(0x1A410B00 AS Date), NULL, CAST(790000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2078, 1, CAST(0x1A410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2079, 1, CAST(0x1A410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2080, 1, CAST(0x1A410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2081, 1, CAST(0x1A410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2082, 1, CAST(0x1A410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2083, 1, CAST(0x1A410B00 AS Date), NULL, CAST(790000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2084, 1, CAST(0x1A410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2085, 1, CAST(0x1A410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2086, 1, CAST(0x1A410B00 AS Date), NULL, CAST(158000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2087, 1, CAST(0x1E410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2088, 1, CAST(0x28410B00 AS Date), CAST(0x54410B00 AS Date), CAST(1410000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2089, 1, CAST(0x28410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2090, 1, CAST(0x2A410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2091, 1, CAST(0x2C410B00 AS Date), CAST(0x54410B00 AS Date), CAST(800100 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2092, 1030, CAST(0x32410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'Phú giáo', N'0868396150', NULL, NULL, N'1624801030114@student.tdmu.edu.vn', NULL, NULL)
GO
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2093, 1030, CAST(0x32410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'Phú giáo', N'0868396150', NULL, NULL, N'1624801030114@student.tdmu.edu.vn', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2094, 1, CAST(0x32410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2095, 1030, CAST(0x32410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Pham Van', N'Phú giáo 1', N'0868396150', NULL, NULL, N'1624801030114@student.tdmu.edu.vn', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2096, 1030, CAST(0x32410B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đang giao', N'Pham Van', N'Phú giáo', N'0868396150', NULL, NULL, N'1624801030114@student.tdmu.edu.vn', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2097, 1030, CAST(0x32410B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đang giao', N'Pham Van', N'Phú giáo', N'0868396150', NULL, NULL, N'1624801030114@student.tdmu.edu.vn', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2098, 1030, CAST(0x32410B00 AS Date), NULL, CAST(360000 AS Decimal(18, 0)), N'Đang giao', N'Pham Van', N'Phú giáo', N'0868396150', NULL, NULL, N'1624801030114@student.tdmu.edu.vn', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2099, 1030, CAST(0x32410B00 AS Date), NULL, CAST(470000 AS Decimal(18, 0)), N'Đang giao', N'Pham Van', N'Phú giáo', N'0868396150', NULL, NULL, N'1624801030114@student.tdmu.edu.vn', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2100, 1, CAST(0x32410B00 AS Date), NULL, CAST(940000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2101, 1, CAST(0x32410B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, Tân An, Bình Dương', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2102, 1030, CAST(0x32410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Pham Van', N'Phú giáo 1', N'0868396150', NULL, NULL, N'1624801030114@student.tdmu.edu.vn', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2103, 1031, CAST(0x32410B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421,Lê chí dân, Tân an, Bình Dương', N'0868396150', NULL, NULL, N'mylove169295@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2104, 1, CAST(0x32410B00 AS Date), NULL, CAST(2069100 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2105, 1, CAST(0x33410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'SHOPCAPHE2000')
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2106, 1, CAST(0x33410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2107, 1, CAST(0x33410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2108, 1, CAST(0x35410B00 AS Date), NULL, CAST(711200 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2109, 1032, CAST(0x40410B00 AS Date), NULL, CAST(840000 AS Decimal(18, 0)), N'Đang giao', N'Vũ Minh Béo', N'Phú giáo', N'0868396150', NULL, NULL, N'scscsczczxcxzcxzcxz', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2110, 1034, CAST(0x44410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2111, 1034, CAST(0x44410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2112, 1034, CAST(0x44410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2113, 1034, CAST(0x47410B00 AS Date), NULL, CAST(1024000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2114, 1034, CAST(0x47410B00 AS Date), NULL, CAST(1280000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2115, 1034, CAST(0x47410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2116, 1034, CAST(0x47410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2117, 1034, CAST(0x47410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2118, 1034, CAST(0x49410B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2119, 1034, CAST(0x49410B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2120, 1034, CAST(0x49410B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2121, 1034, CAST(0x49410B00 AS Date), NULL, CAST(449000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2122, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2123, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2124, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2125, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2126, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2127, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2128, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(919000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2129, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(910000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2130, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2131, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2132, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2133, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(790000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2134, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(790000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2135, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(790000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2136, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(1410000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2137, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(1380000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2138, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(1380000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2139, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(1380000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2140, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(1410000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2141, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(740000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2142, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2143, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(1410000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2144, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2145, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'mylove169295@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2146, 1034, CAST(0x4C410B00 AS Date), NULL, CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2147, 1034, CAST(0x50410B00 AS Date), NULL, CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2148, 1034, CAST(0x52410B00 AS Date), CAST(0x54410B00 AS Date), CAST(440000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.comm2', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2149, 1033, CAST(0x52410B00 AS Date), CAST(0x52410B00 AS Date), CAST(650000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'mylove169295@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2150, 1034, CAST(0x52410B00 AS Date), CAST(0x52410B00 AS Date), CAST(440000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.comm2', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2151, 1034, CAST(0x54410B00 AS Date), NULL, CAST(1899000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc1', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2152, 1033, CAST(0x54410B00 AS Date), CAST(0x54410B00 AS Date), CAST(1974400 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, N'mylove169295@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2153, 1034, CAST(0x54410B00 AS Date), CAST(0x54410B00 AS Date), CAST(1791200 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc1', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH], [EmailNhanHang], [IDMaGiam], [MaGiam]) VALUES (2154, 1034, CAST(0x54410B00 AS Date), CAST(0x54410B00 AS Date), CAST(1432000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc1', N'421, Lê chí dân, khu phố 7', N'0868396150', NULL, NULL, N'phamminhphuc990@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [LoaiDN]) VALUES (1026, N'Pham Van Trung', N'Phú giáo, Bình Dương', N'0868396150', N'trungvn', N'7815696ECBF1C96E6894B779456D330E', CAST(0xC1210B00 AS Date), N'Nam', N'trungvn112@gmail.com', N'Normal         ')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [LoaiDN]) VALUES (1028, N'Phạm Minh Phúc', N'Tân An, Bình Dương', N'0868396150', N'trungpv', N'7815696ECBF1C96E6894B779456D330E', CAST(0xC1210B00 AS Date), N'Nam', N'phuczz@gmail.com', N'Normal')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [LoaiDN]) VALUES (1032, N'Vũ Minh Béo', N'Phú giáo', N'0868396150', N'vumb', N'7815696ECBF1C96E6894B779456D330E', CAST(0xC1210B00 AS Date), N'Nam', N'beo@gmail.com', N'Normal')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [LoaiDN]) VALUES (1033, N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL, CAST(0xC1210B00 AS Date), N'Nam', N'mylove169295@gmail.com', NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [LoaiDN]) VALUES (1034, N'Phạm Minh Phúc1', N'421, Lê chí dân, khu phố 7', N'0868396150', N'phucpm', N'DA7349DAAC1F38EC8D0B14BCF319EB24', CAST(0xC1210B00 AS Date), N'Nam', N'phamminhphuc990@gmail.com', NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [LoaiDN]) VALUES (1035, N'Phạm Minh Hậu', N'421, Lê chí dân, khu phố 7', N'0868396150', N'haupm', N'7815696ECBF1C96E6894B779456D330E', CAST(0xC1210B00 AS Date), N'Nam', N'hauhau1@gmail.com', N'Normal')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email], [LoaiDN]) VALUES (1036, N'zz', N'421, Lê chí dân, khu phố 7', N'1234567', N'phuc1', N'7815696ECBF1C96E6894B779456D330E', CAST(0xC1210B00 AS Date), NULL, N'a@gmail.com', NULL)
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAISP] ON 

INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (1, N'Cà Phê Chồn')
INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (3, N'Cà Phê Dạng Bột')
INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (4, N'Máy Pha Cà Phê')
INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (5, N'Máy Xay Cà Phê')
INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (6, N'Cà Phê Hòa Tan')
SET IDENTITY_INSERT [dbo].[LOAISP] OFF
SET IDENTITY_INSERT [dbo].[MaGiamGia] ON 

INSERT [dbo].[MaGiamGia] ([ID], [Magiam], [GiaTri], [Ngayhethan], [soluong]) VALUES (1, N'SHOPCAPHE2000', 10, CAST(0x2C410B00 AS Date), 0)
INSERT [dbo].[MaGiamGia] ([ID], [Magiam], [GiaTri], [Ngayhethan], [soluong]) VALUES (2, N'PHAMMINHPHUC', 20, CAST(0x3B410B00 AS Date), 0)
INSERT [dbo].[MaGiamGia] ([ID], [Magiam], [GiaTri], [Ngayhethan], [soluong]) VALUES (3, N'SUM2705', 10, NULL, 1)
INSERT [dbo].[MaGiamGia] ([ID], [Magiam], [GiaTri], [Ngayhethan], [soluong]) VALUES (4, N'SUM27055', 10, NULL, 1)
INSERT [dbo].[MaGiamGia] ([ID], [Magiam], [GiaTri], [Ngayhethan], [soluong]) VALUES (5, N'SUM27051', 10, NULL, 1)
INSERT [dbo].[MaGiamGia] ([ID], [Magiam], [GiaTri], [Ngayhethan], [soluong]) VALUES (6, N'SUM27052', 10, NULL, 1)
INSERT [dbo].[MaGiamGia] ([ID], [Magiam], [GiaTri], [Ngayhethan], [soluong]) VALUES (7, N'SUM270551', 10, NULL, 1)
INSERT [dbo].[MaGiamGia] ([ID], [Magiam], [GiaTri], [Ngayhethan], [soluong]) VALUES (8, N'SUM2705111', 1, NULL, 2)
SET IDENTITY_INSERT [dbo].[MaGiamGia] OFF
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (1, N'Trang Chủ', 0, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B3699F AS DateTime), N'/Home/TrangChu')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (2, N'Giới Thiệu', 0, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B36E59 AS DateTime), N'/Home/GioiThieu')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (3, N'Sản Phẩm', 0, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B371EB AS DateTime), N'/Home/Index')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (4, N'Tin Tức-Bài Viết', 0, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B3752A AS DateTime), N'/Home/TinTuc')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (5, N'Liên Hệ', 0, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B377F5 AS DateTime), N'#')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (6, N'Cà Phê Chồn', 3, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B38B35 AS DateTime), N'/ViewSP/LoaiSP?MaLoai=1')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (7, N'Cà Phê Bột', 3, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B38EA2 AS DateTime), N'/ViewSP/LoaiSP?MaLoai=3')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (8, N'Cà Phê Hòa Tan', 3, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B39435 AS DateTime), N'/ViewSP/LoaiSP?MaLoai=6')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (9, N'Máy Xay Cà Phê', 3, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B39183 AS DateTime), N'/ViewSP/LoaiSP?MaLoai=5')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (10, N'Máy Pha Cà Phê', 3, CAST(0x0000ABE100000000 AS DateTime), CAST(0x0000ABD600B397D6 AS DateTime), N'/ViewSP/LoaiSP?MaLoai=4')
SET IDENTITY_INSERT [dbo].[MENU] OFF
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (14, N'Cà phê Chồn Mocha 250gram', N'Hộp', CAST(250000 AS Decimal(18, 0)), N'Cà phê Chồn Robusta được sản xuất từ trái cà phê Buôn Mê Thuột, vốn nổi tiếng với nước đặc sánh và vị đậm đà. Cà phê Robusta Chồn Buôn Mê Thuột vẫn có nước đặc sánh, khi uống lại êm mượt, đậm đà, lại có vị ngọt thanh bám rất lâu ở cuối cổ họng. Khác với cà phê Robusta thường, cà phê Robusta Chồn có vị chua trái cây, vốn là điểm đặc trưng của các loại cà phê Arabica đặc sản. Mùi hương của cà phê Robusta Chồn thơm nồng hơn hẳn cà phê thường, lại vương mùi chocolate rất nhẹ, ngọt ngào nhưng khó nắm bắt.

Sự phối trộn 90% Robusta đặc sản với 10% Robusta Chồn sẽ càng tạo thêm sự khác biệt với hương thơm chocolate ấm áp, vị đắng ít hơn cùng hậu vị ngọt vương lâu cuối lưỡi, mang lại vị mới lạ dành cho tín đồ yêu thích Cà phê.', N'caphechon1.jpg', 1, NULL, CAST(0x0000ABDD00F2BCAE AS DateTime), N'Trưng Bày', 99, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (19, N'Cà phê Chồn Mocha 51 gram', N'Hộp', CAST(350000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Cầu Đất, địa danh thuộc Đà Lạt, Lâm Đồng, có điều kiện lý tưởng để trồng cà phê Arabica truyền thống. Hạt cà phê Arabica Cầu Đất lại được biết tới bởi mùi thơm nồng và vị chua thanh khiết. Mùi thơm của Mocha Chồn vương nhẹ sô-cô-la tinh tế. Nước cà phê chỉ vừa đủ sánh, lại êm mượt. Phối trộn giữa 10 % cà phê Chồn và 90% cà phê Arabica tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Phối trộn giữa cà phê Chồn và cà phê đặc sản tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt mang lại cho bạn cảm giác thưởng thức chưa từng được biết đến.

', N'caphechon2.jpg', 1, NULL, CAST(0x0000AB0500000000 AS DateTime), N'Đang Bán', 98, 23)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (20, N'Cà phê Chồn Robusta 51 gram', N'Hộp', CAST(440000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Cầu Đất, địa danh thuộc Đà Lạt, Lâm Đồng, có điều kiện lý tưởng để trồng cà phê Arabica truyền thống. Hạt cà phê Arabica Cầu Đất lại được biết tới bởi mùi thơm nồng và vị chua thanh khiết. Mùi thơm của Mocha Chồn vương nhẹ sô-cô-la tinh tế. Nước cà phê chỉ vừa đủ sánh, lại êm mượt. Phối trộn giữa 10 % cà phê Chồn và 90% cà phê Arabica tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Phối trộn giữa cà phê Chồn và cà phê đặc sản tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt mang lại cho bạn cảm giác thưởng thức chưa từng được biết đến.

', N'caphechon3.jpg', 1, NULL, NULL, N'Đang Bán', 93, 92)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (28, N'Cà phê Chồn Moutain''s Legend Mocha 200G', N'Ký', CAST(449000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Cầu Đất, địa danh thuộc Đà Lạt, Lâm Đồng, có điều kiện lý tưởng để trồng cà phê Arabica truyền thống. Hạt cà phê Arabica Cầu Đất lại được biết tới bởi mùi thơm nồng và vị chua thanh khiết. Mùi thơm của Mocha Chồn vương nhẹ sô-cô-la tinh tế. Nước cà phê chỉ vừa đủ sánh, lại êm mượt. Phối trộn giữa 10 % cà phê Chồn và 90% cà phê Arabica tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Phối trộn giữa cà phê Chồn và cà phê đặc sản tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt mang lại cho bạn cảm giác thưởng thức chưa từng được biết đến.

', N'caphexaysan1.png', 3, NULL, NULL, N'Đang Bán', 97, 82)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (29, N'Cà phê Chồn Moutain''s Legend Robusta 200G', N'Ký', CAST(360000 AS Decimal(18, 0)), N'Cà phê Chồn Robusta được sản xuất từ trái cà phê Buôn Mê Thuột, vốn nổi tiếng với nước đặc sánh và vị đậm đà. Cà phê Robusta Chồn Buôn Mê Thuột vẫn có nước đặc sánh, khi uống lại êm mượt, đậm đà, lại có vị ngọt thanh bám rất lâu ở cuối cổ họng. Khác với cà phê Robusta thường, cà phê Robusta Chồn có vị chua trái cây, vốn là điểm đặc trưng của các loại cà phê Arabica đặc sản. Mùi hương của cà phê Robusta Chồn thơm nồng hơn hẳn cà phê thường, lại vương mùi chocolate rất nhẹ, ngọt ngào nhưng khó nắm bắt.

Sự phối trộn 90% Robusta đặc sản với 10% Robusta Chồn sẽ càng tạo thêm sự khác biệt với hương thơm chocolate ấm áp, vị đắng ít hơn cùng hậu vị ngọt vương lâu cuối lưỡi, mang lại vị mới lạ dành cho tín đồ yêu thích Cà phê.', N'caphexaysan2.png', 3, NULL, NULL, N'Đang Bán', 100, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (31, N'Cà phê chồn Mocha Moutain’s Legend 150 gram', N'Hộp', CAST(300000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Cầu Đất, địa danh thuộc Đà Lạt, Lâm Đồng, có điều kiện lý tưởng để trồng cà phê Arabica truyền thống. Hạt cà phê Arabica Cầu Đất lại được biết tới bởi mùi thơm nồng và vị chua thanh khiết. Mùi thơm của Mocha Chồn vương nhẹ sô-cô-la tinh tế. Nước cà phê chỉ vừa đủ sánh, lại êm mượt. Phối trộn giữa 10 % cà phê Chồn và 90% cà phê Arabica tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Lon nhựa P.E.T thực phẩm đảm bảo an toàn cho Cà phê trong quá trình vận chuyển, bảo quản, hình trụ thon dài tạo dáng vẻ tinh tế, sang trọng. Thiết kế gọn nhẹ giúp bạn dễ dàng mang theo hay làm quà tặng nhỏ.', N'caphechon4.jpg', 1, NULL, NULL, N'Đang Bán', 99, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (33, N'Cà phê Chồn Mocha Rare Wild - Hộp Sơn Mài 125gr', N'Hộp', CAST(470000 AS Decimal(18, 0)), N'Cầu Đất nằm trên một bình nguyên cao tới 1’500m, có điều kiện lý tưởng để trồng cà phê Mocha (là cách gọi khác của Arabica) đặc sản. Cà phê Chồn tự nhiên thường được thu lượm sau nhiều ngày nằm trong rẫy hay đất rừng, dễ bị đen hạt hoặc bị mốc. Vì thế, với nguồn đã ít lại cần chọn lọc kỹ càng khiến nó trở nên vô cùng hiếm hoi. So với cà phê Chồn nuôi thì cà phê Chồn Tự Nhiên có một mùi vị êm mượt và đậm đà hơn, rất khó mô tả, và cơ hội để khám phá sự độc đáo này sẽ mang lại cho bạn trải nghiệm vô giá.

Bên trong hộp gồm 1 túi cà phê 125 gram dạng bột hoặc hạt được bao bọc trong túi lụa may thủ công. Mỗi túi đều có van 1 chiều sau lưng cho thoát mùi hương nhưng không cho hơi ẩm thâm nhập. Kèm theo đó là một quyển sách nhỏ để bạn tìm hiểu thêm những câu chuyện thú vị về Cà phê Chồn.

Toàn bộ sản phẩm, phin, sách được xếp trong hộp sơn mài ba lớp bền chắc, sang trọng kết hợp giỏ lục bình đan tay đậm chất truyền thống dân gian Việt Nam.', N'caphechon5.jpg', 1, NULL, NULL, N'Đang Bán', 98, 27)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (37, N'Cà phê Chồn Mocha Rare Wild - Hộp Sơn Mài 250gr', N'Hộp', CAST(940000 AS Decimal(18, 0)), N'Cầu Đất nằm trên một bình nguyên cao tới 1’500m, có điều kiện lý tưởng để trồng cà phê Mocha (là cách gọi khác của Arabica) đặc sản. Cà phê Chồn tự nhiên thường được thu lượm sau nhiều ngày nằm trong rẫy hay đất rừng, dễ bị đen hạt hoặc bị mốc. Vì thế, với nguồn đã ít lại cần chọn lọc kỹ càng khiến nó trở nên vô cùng hiếm hoi. So với cà phê Chồn nuôi thì cà phê Chồn Tự Nhiên có một mùi vị êm mượt và đậm đà hơn, rất khó mô tả, và cơ hội để khám phá sự độc đáo này sẽ mang lại cho bạn trải nghiệm vô giá.

Bên trong hộp gồm 2 túi cà phê 125 gram dạng bột hoặc hạt được bao bọc trong túi lụa may thủ công. Mỗi túi đều có van 1 chiều sau lưng cho thoát mùi hương nhưng không cho hơi ẩm thâm nhập. Kèm theo đó là bộ phin inox cao cấp, mẫu phân chồn thô và một quyển sách nhỏ để bạn tìm hiểu thêm những câu chuyện thú vị về Cà phê Chồn.

Toàn bộ sản phẩm, phin, sách được xếp trong hộp sơn mài ba lớp bền chắc, sang trọng kết hợp giỏ lục bình đan tay đậm chất truyền thống dân gian Việt Nam.', N'caphechon6.jpg', 1, NULL, NULL, N'Đang Bán', 100, 10)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (38, N'Cà phê Chồn Robusta 125 gram', N'Hộp', CAST(250000 AS Decimal(18, 0)), N'Vùng đất Buôn Ma Thuột nổi tiếng với những quả cà phê Robusta chín mọng- nguyên liệu chính cho ra chất cà phê sánh đặc, vị đắng mạnh cùng mùi đậm rất đặc trưng.Sẽ càng đặc biệt hơn khi Robusta được đi qua dạ dày của Chồn hương, mang lại trải nghiệm mới mẻ chưa từng được biết đến: hương thơm chocolate quyến rũ, nồng nàn, hậu vị ngọt kéo dài cuối lưỡi.

Bên trong hộp gồm 2 túi cà phê 125 gram dạng bột hoặc hạt được bao bọc trong túi lụa may thủ công. Mỗi túi đều có van 1 chiều sau lưng cho thoát mùi hương nhưng không cho hơi ẩm thâm nhập. Kèm theo đó là bộ phin inox cao cấp, mẫu phân chồn thô và một quyển sách nhỏ để bạn tìm hiểu thêm những câu chuyện thú vị về Cà phê Chồn.

Toàn bộ sản phẩm, phin, sách được xếp trong hộp sơn mài ba lớp bền chắc, sang trọng kết hợp giỏ lục bình đan tay đậm chất truyền thống dân gian Việt Nam.', N'caphechon7.jpg', 1, NULL, NULL, N'Đang Bán', 100, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (39, N'Cà phê Chồn Robusta 250 gram', N'Hộp', CAST(500000 AS Decimal(18, 0)), N'Vùng đất Buôn Ma Thuột nổi tiếng với những quả cà phê Robusta chín mọng- nguyên liệu chính cho ra chất cà phê sánh đặc, vị đắng mạnh cùng mùi đậm rất đặc trưng.

Sẽ càng đặc biệt hơn khi Robusta được đi qua dạ dày của Chồn hương, mang lại trải nghiệm mới mẻ chưa từng được biết đến: hương thơm chocolate quyến rũ, nồng nàn, hậu vị ngọt kéo dài cuối lưỡi.

Mỗi hộp gồm 1 gói Cà phê Chồn 125gr được bao bọc cẩn thận trong túi lụa may thủ công, sau lưng có van 1 chiều giúp thoát mùi hương nhưng không cho hơi ẩm thâm nhập. Bạn có thể tìm hiểu thêm những câu chuyện thú vị về Cà phê Chồn trong cuốn sách nhỏ do chúng tôi tâm huyết viết nên. Hộp sơn mài 3 lớp sang trọng, bền chắc đảm bảo xứng đáng với niềm vui của người nhận và sự an tâm của người tặng.', N'caphechon8.jpg', 1, NULL, NULL, N'Đang Bán', 100, 9)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (43, N'Cà phê M''ja Hòa tan', N'Ký', CAST(380000 AS Decimal(18, 0)), N'Được chiết xuất từ những hạt cà phê nguyên chất, Cà phê hòa tan M''ja có hương thơm nồng nàn cùng vị đậm đà thanh khiết. Chắc chắn, mỗi tách cà phê sẽ khiến bạn vô cùng sảng khoái. Đem đến những cảm xúc và hương vị mới lạ dành riêng cho bạn.', N'caphehoatan1.jpg', 6, NULL, NULL, N'Đang Bán', 100, 11)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (44, N'Cà phê M''Ja Túi lọc 150 gram', N'Ký', CAST(120000 AS Decimal(18, 0)), N'Được chiết xuất từ những hạt cà phê nguyên chất, Cà phê hòa tan M''ja có hương thơm nồng nàn cùng vị đậm đà thanh khiết. Chắc chắn, mỗi tách cà phê sẽ khiến bạn vô cùng sảng khoái. Đem đến những cảm xúc và hương vị mới lạ dành riêng cho bạn.', N'caphehoatan2.jpg', 6, CAST(0x0000AAF600000000 AS DateTime), CAST(0x0000AAF600000000 AS DateTime), N'Đang Bán', 100, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (45, N'Cà phê chồn túi lọc Mocha Moutain’s Legend 75 gram', N'Túi', CAST(195000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Robusta được sản xuất từ những hạt cà phê Buôn Ma Thuột vốn nổi tiếng bởi nước pha đặc sánh và vị đậm đà. Cà phê Robusta Chồn vẫn giữ vị đậm đà, nhưng lại có vị ngọt thanh bám rất lâu ở cuối cổ họng. Mùi hương của cà phê Robusta Chồn thơm nồng hơn hẳn cà phê thường, lại vương mùi chocolate ngọt ngào. Phối trộn giữa 10% cà phê Chồn cà phê 90% Robusta tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Khi phối trộn 90% Robusta đặc sản với 10% Robusta Chồn sẽ càng tạo thêm sự khác biệt với hương thơm chocolate ấm áp, vị đắng ít hơn cùng hậu vị ngọt vương lâu cuối lưỡi, mang lại vị mới lạ dành cho tín đồ yêu thích Cà phê.

Sản phẩm gồm 5 túi lọc dành cho 5 ly Cà phê tiện dụng. Kèm theo là đường để bạn sử dụng bất kì nơi đâu.', N'caphehoatan3.jpg', 6, CAST(0x0000AAF600000000 AS DateTime), CAST(0x0000AB0D00000000 AS DateTime), N'Trưng Bày', 100, 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (56, N'Cà phê chồn túi lọc Robusta Moutain Legend 75 gram', N'Túi', CAST(165000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Robusta được sản xuất từ những hạt cà phê Buôn Ma Thuột vốn nổi tiếng bởi nước pha đặc sánh và vị đậm đà. Cà phê Robusta Chồn vẫn giữ vị đậm đà, nhưng lại có vị ngọt thanh bám rất lâu ở cuối cổ họng. Mùi hương của cà phê Robusta Chồn thơm nồng hơn hẳn cà phê thường, lại vương mùi chocolate ngọt ngào. Phối trộn giữa 10% cà phê Chồn cà phê 90% Robusta tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Khi phối trộn 90% Robusta đặc sản với 10% Robusta Chồn sẽ càng tạo thêm sự khác biệt với hương thơm chocolate ấm áp, vị đắng ít hơn cùng hậu vị ngọt vương lâu cuối lưỡi, mang lại vị mới lạ dành cho tín đồ yêu thích Cà phê.

Sản phẩm gồm 5 túi lọc dành cho 5 ly Cà phê tiện dụng. Kèm theo là đường để bạn sử dụng bất kì nơi đâu.', N'caphehoatan4.jpg', 6, CAST(0x0000AAF600000000 AS DateTime), CAST(0x0000AAF600000000 AS DateTime), N'Đang Bán', 100, 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (57, N'Cà phê M’Ja Mocha 200 gram', N'Ký', CAST(150000 AS Decimal(18, 0)), N'Với độ cao 1500m so với mặt nước biển cùng đất giàu Bazan, Cầu Đất ( Lâm Đồng) là huyện trồng Mocha ngon bậc nhất ở Việt Nam. Cũng bởi diện tích hạn chế mà sản lượng Mocha Cầu Đất hiện tại rất ít, dần trở nên quý hiếm.

Mocha Cầu Đất vang danh bởi vị đắng nhẹ kèm vị chua thanh khiết trái cây, mang lại cảm giác nhẹ nhàng, không đậm gắt. Đặc biệt sau mỗi lần nhấp từng ngụm, bạn sẽ cảm nhận rõ hậu vị ngọt vương lâu cuối lưỡi hoàn toàn khác biệt. Chất Cà phê sánh nâu màu hổ phách được rang chuẩn bởi bàn tay những người thợ dày dặn kinh nghiệm.

Cà phê đựng trong túi Kraff gợi lên vẻ mộc mạc, ấm áp của đặc sản truyền thống Việt. Van 1 chiều giúp bạn cảm nhận mùi thơm nhưng không cho hơi ẩm thâm nhập vào. Một món quà đẹp và trang nhã dành tặng những người yêu thích Cà phê.', N'caphexaysan3.jpg', 3, NULL, NULL, N'Đang Bán', 100, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (61, N'Cà phê M’Ja Bourbon 200 gram', N'Ký', CAST(200000 AS Decimal(18, 0)), N'Với độ cao trên 1500m và khí hậu mát lạnh trong lành, Đà Lạt là nơi lý tưởng để trồng giống cà phê Bourbon và cho ra những quả cà phê chất lượng hảo hạng nhất.

Hương cà phê thoang thoảng mùi chocolate nhẹ nhàng kèm vị chua nhẹ tựa trái cây làm nên sự say đắm của biết bao tín đồ cà phê.

Sản phẩm được đóng trong túi kiếng thực phẩm có van hơi 1 chiều, ngăn không cho không khí thấm ngược vào trong cà phê.

Túi giấy trang nhã, thân thiện với môi trường, giữ nguyên bản hương vị cà phê đặc sản đậm chất truyền thống Việt Nam.', N'caphexaysan4.jpg', 3, CAST(0x0000AAF600000000 AS DateTime), CAST(0x0000AAF600000000 AS DateTime), N'Đang Bán', 100, 2)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (66, N'Cà phê M’Ja Mocha 150 gram', N'Ký', CAST(250000 AS Decimal(18, 0)), N'Với độ cao trung bình 1500m so với mực nước biển, Cầu Đất là huyện kế cận thành phố Đà Lạt hội đủ điều kiện tự nhiên để trồng Mocha ngon. Mocha nơi đây là dòng Cà phê được thế giới yêu thích bởi vị đắng nhẹ, hương thơm nồng nàn và hậu vị ngọt.

Sản phẩm được sản xuất theo quy trình cà phê sạch từ khâu chăm sóc, thu hoạch và lựa chọn quả.  Màu rang chuẩn, nước cà phê sánh có màu hổ phách, hương thơm nồng, vị đắng dịu cùng vị chua thanh khiết trái cây và hậu vị ngọt.  

Thiết kế hộp từ giấy cứng Kraff in hoa văn tạo vẻ mộc mạc của đặc sản truyền thống, ngoài ra đảm bảo bền chắc trong suốt quá trình vận chuyển. Đính kèm theo là chiếc phin inox cao cấp để bạn sẵn sàng thưởng thức một tách Cà phê phin Việt đúng điệu. Một món quà tinh tế, chất lượng chắc chắn sẽ làm hài lòng cả người nhận lẫn người tặng.

', N'caphexaysan5.jpg', 3, NULL, NULL, N'Đang Bán', 1000, 11)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (67, N'Cà phê M’Ja Combo 500 gram', N'Ký', CAST(120000 AS Decimal(18, 0)), N'Với độ cao trung bình 1500m so với mực nước biển, Cầu Đất là huyện kế cận thành phố Đà Lạt hội đủ điều kiện tự nhiên để trồng Mocha ngon. Mocha nơi đây là dòng Cà phê được thế giới yêu thích bởi vị đắng nhẹ, hương thơm nồng nàn và hậu vị ngọt.

Sản phẩm được sản xuất theo quy trình cà phê sạch từ khâu chăm sóc, thu hoạch và lựa chọn quả.  Màu rang chuẩn, nước cà phê sánh có màu hổ phách, hương thơm nồng, vị đắng dịu cùng vị chua thanh khiết trái cây và hậu vị ngọt.  

Thiết kế hộp từ giấy cứng Kraff in hoa văn tạo vẻ mộc mạc của đặc sản truyền thống, ngoài ra đảm bảo bền chắc trong suốt quá trình vận chuyển. Đính kèm theo là chiếc phin inox cao cấp để bạn sẵn sàng thưởng thức một tách Cà phê phin Việt đúng điệu. Một món quà tinh tế, chất lượng chắc chắn sẽ làm hài lòng cả người nhận lẫn người tặng.

', N'caphexaysan6.jpg', 3, NULL, NULL, N'Đang Bán', 100, 11)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (69, N'Cà phê M’Ja Arabica 100 gram', N'Ký', CAST(530000 AS Decimal(18, 0)), N'Tây Nguyên có diện tích xấp xỉ 51’800 km2 với địa hình núi đá, rừng rậm và đất bazan màu mỡ, chiếm khoảng 16% tổng diện tích đất trồng trọt. Năm cao nguyên của Tây Nguyên có độ cao từ 500m ở phía Bắc dốc dần lên khoảng chừng 1’500m ở phía Nam. Với khí hậu nhiệt đới nhiều nắng, nhiều mưa và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Đắk Lắk và Lâm Đồng là 2 trung tâm. Cầu Đất, địa danh thuộc tỉnh Lâm Đồng, nằm trên một bình nguyên cao tới 1’500m, có điều kiện lý tưởng để trồng cà phê Arabica. Hạt cà phê Arabica vốn có vị chát nhẹ, ít đắng và hương thơm quyến rũ.

Vị đắng nhẹ kèm vị chua thanh khiết trái cây dễ chịu, đặc biệt hậu vị ngọt vương lâu sau khi nhấp từng ngụm.

Sản phẩm chỉ 100 gram , nhỏ gọn thuận tiện làm quà tặng xách tay hoặc dùng thử.

Bao bì giấy trang nhã, mộc mạc mang lại cảm giác ấm áp của đặc sản cà phê truyền thống Việt Nam.', N'caphexaysan7.jpg', 3, NULL, NULL, N'Đang Bán', 100, 9)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (70, N'Cà phê M’Ja Robusta 250 gram', N'Ký', CAST(750000 AS Decimal(18, 0)), N'Robusta từ vùng đất Buôn Ma Thuột nổi tiếng vì chất Cà phê ngon và vị đậm đà. Đặc biệt, quả Cà phê được chọn lựa từ quá trình quy hoạch nguyên liệu chọn quả tươi cho Chồn ăn nên là loại tốt.

Hạt Cà phê được rang sáng và đều màu. Nước Cà phê màu nâu cánh gián, vị đắng đậm, chua thanh trái cây kèm hậu vị ngọt lâu trên cuống lưỡi.

Cà phê được đựng trong túi PE trong suốt, van hơi một chiều giúp thoát khí nhưng không cho hơi ẩm xâm nhập vào. Zipper kéo tiện dụng tránh sản phẩm bị biến chất trong suốt quá trình sử dụng.

', N'caphexaysan8.jpg', 3, NULL, NULL, N'Đang Bán', 100, 3)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (71, N'Cà phê M’Ja Robusta 500 gram', N'Ký', CAST(150000 AS Decimal(18, 0)), N'Từ những quả cà phê đỏ mọng được hái thủ công và chế biến theo phương pháp ướt để đạt hiệu suất 100% quả chín, Robusta có vị đắng dễ chịu và đậm ngọt đặc trưng, hương thơm nồng nàn không pha trộn nguyên liệu.

Để có được nguồn nguyên liệu tốt, chúng tôi đã tâm huyết chọn lọc hạt từ những vườn Cà phê chất lượng tại Đắk Lắk. Từ khâu thu hái, tuyển lựa cho đến chế biến, tất cả đều tuân theo qui trình nghiêm ngặt được kiểm soát chặt chẽ nhằm mang đến Cà phê ngon nhất cho người thưởng thức.

Bao bì giấy Kraff thực phẩm trang nhã, thân thiện với môi trường nhưng vẫn đảm bảo chất lượng sản phẩm nhờ màng nhôm phía trong. Van 1 chiều giúp thoát khí nhưng không cho hơi ẩm thâm nhập vào. Gói 500gr dùng lâu và giúp tiết kiệm cho bạn.', N'caphexaysan9.jpg', 3, NULL, NULL, N'Đang Bán', 100, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (73, N'Máy pha cà phê Espresso', N'Máy', CAST(4500000 AS Decimal(18, 0)), N'Để có được một tách cà phê ngon và chất lượng thì ngoài việc pha cafe bằng phin, bằng tay, thì hiện nay việc sử dụng máy để pha cà phê không còn quá xa lạ nữa.

Dòng máy pha cà phê WMF espresso là sản phẩm được ra mắt vào năm 2015, có nguồn gốc xuất xứ từ Đức. Là dòng máy được lựa chọn phù hợp cho việc kinh doanh các quán cafe, nhà hàng, khách sạn 5*, thiết kế bắt mắt và tối ưu hoá được nguồn nhân lực nhờ năng suất máy lên tới 300 tách cafe một ngày.', N'mayphacaphe1.jpg', 4, NULL, NULL, N'Đang Bán', 20, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (74, N'Máy pha cafe Zojirushi EC-DAQ50', N'Máy', CAST(2500000 AS Decimal(18, 0)), N'Máy pha cafe Zojirushi EC-DAQ50 công suất 650W chính hãng Zojirushi được sản suất trên dây chuyền công nghệ hiện đại, tiên tiến, sẽ cho bạn có được ly cà phê thơm đúng chất, bên cạnh đó máy cũng được chú trọng vào thiết kế với chất liệu hoàn toàn cao cấp, chống trầy xước, cho độ bền cao, mang lại vẻ đẹp sáng bóng cho sản phẩm và sự tinh tế cho căn phòng của bạn.', N'mayphacaphe2.jpg', 4, NULL, NULL, N'Đang Bán', 20, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (76, N'Máy pha cà phê HAUSER CE-929 Espresso ', N'Máy', CAST(1700000 AS Decimal(18, 0)), N'Để có được một tách cà phê ngon và chất lượng thì ngoài việc pha cafe bằng phin, bằng tay, thì hiện nay việc sử dụng máy để pha cà phê không còn quá xa lạ nữa.

Dòng máy pha cà phê WMF espresso là sản phẩm được ra mắt vào năm 2015, có nguồn gốc xuất xứ từ Đức. Là dòng máy được lựa chọn phù hợp cho việc kinh doanh các quán cafe, nhà hàng, khách sạn 5*, thiết kế bắt mắt và tối ưu hoá được nguồn nhân lực nhờ năng suất máy lên tới 300 tách cafe một ngày', N'mayphacaphe3.jpg', 4, NULL, NULL, N'Đang Bán', 20, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (77, N'Máy Pha Cà Phê Espresso Delonghi ECP31.21', N'Máy', CAST(3600000 AS Decimal(18, 0)), N'Máy Pha Cà Phê Espresso Delonghi ECP31.21 được thiết kế nhỏ gọn, hiện đại, có nhiều ưu điểm vượt trội giúp cho bạn pha cà phê nhanh chóng và kết hợp với gam màu đen tinh tế, sẽ mang đến sự sang trọng và tiện nghi cho không gian bếp nhà bạn.', N'mayphacaphe4.jpg', 4, NULL, NULL, N'Đang Bán', 20, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (79, N'Máy xay cà phê Nuova Simonelli MDX', N'Máy', CAST(21000000 AS Decimal(18, 0)), N'Máy xay cà phê Nuova Simonelli MDX là dòng máy xay cà phê với công suất cực lớn được sản xuất bởi thương hiệu nổi tiếng Nuova Simonellia của Ý.', N'mayxaycaphe1.jpg', 5, NULL, NULL, N'Đang Bán', 10, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (80, N'Máy xay cà phê Philip Enea', N'Máy', CAST(17000000 AS Decimal(18, 0)), N'Máy xay cà phê Casadio Enea là một sự chọn lựa lý tưởng trong các dòng máy xay cà phê chuyên nghiệp. Từ thiết kế bên ngoài cho đến vật liệu cấu thành máy đều được nhà sản xuất chú trọng và gia công tỉ mỉ để đáp ứng mong muốn của các chủ quán về dòng máy xay cà phê bền đẹp.', N'mayxacaphe2.jpg', 5, NULL, NULL, N'Đang Bán', 10, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (82, N'Máy xay cà phê mini Eagle 6000N', N'Máy', CAST(10000000 AS Decimal(18, 0)), N'
Eagle – 600N là dòng máy xay cà phê hạt mini bằng điện. Đây là sản phẩm được sản xuất số lượng lớn để phục vụ cho thị trường Trung Quốc và xuất khẩu nhiều nước trên thế giới.', N'mayxaycaphe3.jpg', 5, NULL, CAST(0x0000AB3900000000 AS DateTime), N'Đang Bán', 10, 1)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong], [YeuThich]) VALUES (83, N'Máy xay cà phê Robust RMX-60', N'Máy', CAST(500000 AS Decimal(18, 0)), N'Ngay từ những ngày đầu xuất hiện tại thị trường Việt Nam, máy xay cà phê ROBUST RMX-60 đã nhanh chóng đánh bại hầu hết mọi đối thủ ngang tầm khi chứng minh được đẳng cấp trong tốc độ xay nhanh, sự vượt trội về cấu tạo đĩa xay, về hình dáng hiện đại, bắt mắt khác hẳn những chiếc máy xay cà phê khác tại Việt Nam hiện nay.', N'mayxaycaphe4.jpg', 5, NULL, NULL, N'Đang Bán', 10, 1)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
SET IDENTITY_INSERT [dbo].[TINTUC] ON 

INSERT [dbo].[TINTUC] ([MaTin], [NoiDung]) VALUES (1, N'Nghệ thuật rang cà phê Chồn
Rang cà phê Chồn có gì đặc biệt so với rang cà phê khác?

Rang là một nghệ thuật giống với điêu khắc, với hạt cà phê là chất liệu còn ngọn lửa là đục. Người rang phải hiểu hạt cà phê như nghệ sĩ hiểu thớ đá, mà cà phê Chồn không hề là ngoại lệ



Nghệ thuật rang Cà phê Chồn

Hạt cà phê phân Chồn có hàm lượng đường cao, nên màu rang tối sẽ làm phí phạm vị ngọt, còn rang quá sáng thì không có nước. Vì thế, loại cà phê này thường được rang từ màu sáng đến đậm trung bình

Hơn thế, cà phê Chồn không đồng nhất. Cà phê đầu vụ thường chát, cuối vụ thường hơi đắng hơn. Do đó, chúng tôi phải đánh mã số từ mẻ thu hoạch để rang riêng nhằm khắc phục nhược điểm của từng mẻ một.

Tuy nhiên, điều cốt yếu ở loại đặc sản này là tác động tiêu hóa bán phần chỉ làm biến đổi lớp vỏ ngoài của hạt cà phê. Vì thế, bí quyết rang nằm ở một chế độ nhiệt đặc biệt nhằm phát huy điểm hay của lớp vỏ ngoài, hạn chế điểm dở của lõi cà phê thường bên trong.

Đấy là những kiến thức thực hành được thu lượm qua cả năm trời liên tục thí nghiệm – tất cả chỉ nhằm đảm bảo rằng hạt cà phê Chồn phải trở thành thứ cà phê được trông đợi từ truyền thuyết.

')
INSERT [dbo].[TINTUC] ([MaTin], [NoiDung]) VALUES (2, N'NULLCà phê Trứng – nét văn hóa độc đáo chỉ có ở Việt Nam
Cà phê – một thức uống phổ biến bậc nhất trên thế giới. Với vị đắng đặc trưng nên thức uống này không thể chiều lòng hết tất thảy mọi người, đó chính là lý do, cà phê được xem là nguồn cảm hứng cho rất nhiều barista tìm tòi và sáng tạo ra những thức uống mới lạ.

Mỗi quốc gia đều có những món cà phê độc đáo, mang đậm nét văn hóa, ví như: Tây Ban Nha có cà phê Miel, Bồ Đào Nha có cà phê Cortado hay Ấn Độ có cà phê Filter,.. và Việt Nam cũng có cà phê Phin thật sự rất đặc biệt. Không những thế, dạo gần đây, khách du lịch còn bị ấn tượng bởi Cà phê Trứng (Egg Coffee Vietnamese) – được xem là món đặc sản cà phê ở Hà Nội, với mùi và vị cực kì hấp dẫn.  Có thể nói, khi đến Hà Nội, bạn chắc chắn phải thử ngay một tách cà phê Trứng đậm chất nơi đây, và chắc chắn rằng, nó sẽ là một trong những lý do khiến bạn quay lại vùng đất thơ mộng này.

Cà phê Trứng có từ lúc nào?
Không có tài liệu nào ghi lại cà phê Trứng có từ lúc nào, chỉ biết rằng, đến năm 1946, cả thế giới đã được biết về món nước đặc biệt này. Vào thời đó, có một thanh niên tên Nguyễn Văn Giảng, cậu ta làm việc ở khách sạn Metropole Hà Nội với vị trí pha chế cà phê. Tuy nhiên, ở thời đó, cà phê pha khá loãng và được pha chung với sữa. Có một lần do vì thiếu sữa nên cậu lấy trứng thay thế, ấy vậy mà thức uống đó được rất nhiều thực khách đánh giá cao và yêu mến. Sau một thời gian, cậu quyết định nghỉ việc ở khách sạn và tự mở quán cà phê cho riêng mình với cà phê Trứng làm món chủ đạo. Hiện giờ, quán cà phê của cậu vẫn còn ở Hà Nội và được kế thừa bởi con trai cậu Giảng.



Cà phê Giảng Hà Nội - hình sưu tầm

Được kế thừa công thức từ bố, đây là nơi bạn có thể thưởng thức một tách cà phê Trứng chính tông giữa lòng Hà Nội. Nơi đây đã trở thành một địa điểm phải có trong place list của các du khách khi đặt chân xuống vùng đất này.

Theo Vnexpress, ông Mark Lowerson – người điều hành Street Eats Hanoi cho biết “Đa số khách của tôi đều thích đồ uống này. Khi mô tả về nó, họ không thể tưởng tượng được trứng kết hợp với cà phê như thế nào. Và tôi chưa từng thấy ai lại không thích món này.”

Cà phê Trứng – cappuccino của Việt Nam
Nếu nước Ý có cappuccino làm say mê lòng người thì cà phê Trứng của Việt Nam cũng không kém cạnh.

Không chỉ khác ở cách pha chế mà cách thưởng thức cũng rất thật đặc biệt. Bạn phải nghiêng cốc sao cho bạn có thể thưởng thức cả trứng và cà phê. Người ta bảo nhau rằng, cà phê Trứng có đến “tam vị và nhị mùi”,  sự kết hợp hoàn hảo của cà phê, trứng và sữa đặc, làm cho người uống có những cảm xúc vị giác khác lạ hoàn toàn so với những ly cà phê khác trên thế giới, mang đậm nét đặc trưng của thủ đô Hà Nội cổ kính.

Mỗi quán đều có một cách pha chế riêng cho mình về tách cà phê Trứng, tuy nhiên, vẫn 3 nguyên liệu chủ chốt là cà phê, trứng và sữa đặc.

Cách pha cà phê Trứng bạn có thể thử tại nhà

Chuẩn bị:

Bột cà phê
Trứng gà ta
Sữa đặc
Nước sôi
Cách thực hiện

Bước 1: Pha cà phê

Với 17-20gr cà phê cho vào phin, lắc nhẹ để cà phê dàn phẳng và ấn chặt nắp xuống. Đổ 15ml nước sôi vào mặt phin, đợi khoảng 30 giây, thì lại cho tiếp nước sôi ngập ¾ phin, đậy nắp và đợi cà phê được chắt lọc ra.

Bước 2: Đánh trứng gà ta

Đập trứng gà ra, vợt lấy lòng đỏ trứng và bỏ lòng trắng. Cho vào lòng đỏ vào ly và dùng máy đánh để trứng bông lên, thời gian đánh khoảng 5-7 phút.

Bước 3: Hoàn thành

Cà phê sau khi đã chắt lọc xong, bạn cho cà phê vào ly có trứng đã đánh bông ra. Sau đó cho thêm xíu sữa đặc, và thưởng thức.

Ngoài công thức truyền thống này, bạn có thể thêm vào xíu mật ong hoặc bơ để tăng vị.



Cà phê trứng của Legend Revived

Thưởng thức cà phê Trứng ở đâu?
Nếu bạn đang ở Hà Nội thì đừng quên ghé ngay Giảng cà phê, hiện có 2 cơ sở:

1. Cà phê Giảng 109 Yên Phụ

2. Cà phê Giảng 39 Nguyễn Hữu Huân

Còn nếu ở Sài Gòn mà muốn thử 1 tách cà phê Trứng thì sao? Vậy thì hãy tham khảo một số địa điểm như sau:

1. The Note Coffee (183 Bùi Viện)

2. Coffee & Tea Corner Hà Nội (165 Bùi Viện)

3. Café Trung (1006 Trường Sa, Quận 3)

4. Legend Revived (49 Bis Hậu Giang, Quận Tân Bình)')
INSERT [dbo].[TINTUC] ([MaTin], [NoiDung]) VALUES (3, N'Cà phê Trứng – nét văn hóa độc đáo chỉ có ở Việt Nam
Cà phê – một thức uống phổ biến bậc nhất trên thế giới. Với vị đắng đặc trưng nên thức uống này không thể chiều lòng hết tất thảy mọi người, đó chính là lý do, cà phê được xem là nguồn cảm hứng cho rất nhiều barista tìm tòi và sáng tạo ra những thức uống mới lạ.

Mỗi quốc gia đều có những món cà phê độc đáo, mang đậm nét văn hóa, ví như: Tây Ban Nha có cà phê Miel, Bồ Đào Nha có cà phê Cortado hay Ấn Độ có cà phê Filter,.. và Việt Nam cũng có cà phê Phin thật sự rất đặc biệt. Không những thế, dạo gần đây, khách du lịch còn bị ấn tượng bởi Cà phê Trứng (Egg Coffee Vietnamese) – được xem là món đặc sản cà phê ở Hà Nội, với mùi và vị cực kì hấp dẫn.  Có thể nói, khi đến Hà Nội, bạn chắc chắn phải thử ngay một tách cà phê Trứng đậm chất nơi đây, và chắc chắn rằng, nó sẽ là một trong những lý do khiến bạn quay lại vùng đất thơ mộng này.

Cà phê Trứng có từ lúc nào?
Không có tài liệu nào ghi lại cà phê Trứng có từ lúc nào, chỉ biết rằng, đến năm 1946, cả thế giới đã được biết về món nước đặc biệt này. Vào thời đó, có một thanh niên tên Nguyễn Văn Giảng, cậu ta làm việc ở khách sạn Metropole Hà Nội với vị trí pha chế cà phê. Tuy nhiên, ở thời đó, cà phê pha khá loãng và được pha chung với sữa. Có một lần do vì thiếu sữa nên cậu lấy trứng thay thế, ấy vậy mà thức uống đó được rất nhiều thực khách đánh giá cao và yêu mến. Sau một thời gian, cậu quyết định nghỉ việc ở khách sạn và tự mở quán cà phê cho riêng mình với cà phê Trứng làm món chủ đạo. Hiện giờ, quán cà phê của cậu vẫn còn ở Hà Nội và được kế thừa bởi con trai cậu Giảng.



Cà phê Giảng Hà Nội - hình sưu tầm

Được kế thừa công thức từ bố, đây là nơi bạn có thể thưởng thức một tách cà phê Trứng chính tông giữa lòng Hà Nội. Nơi đây đã trở thành một địa điểm phải có trong place list của các du khách khi đặt chân xuống vùng đất này.

Theo Vnexpress, ông Mark Lowerson – người điều hành Street Eats Hanoi cho biết “Đa số khách của tôi đều thích đồ uống này. Khi mô tả về nó, họ không thể tưởng tượng được trứng kết hợp với cà phê như thế nào. Và tôi chưa từng thấy ai lại không thích món này.”

Cà phê Trứng – cappuccino của Việt Nam
Nếu nước Ý có cappuccino làm say mê lòng người thì cà phê Trứng của Việt Nam cũng không kém cạnh.

Không chỉ khác ở cách pha chế mà cách thưởng thức cũng rất thật đặc biệt. Bạn phải nghiêng cốc sao cho bạn có thể thưởng thức cả trứng và cà phê. Người ta bảo nhau rằng, cà phê Trứng có đến “tam vị và nhị mùi”,  sự kết hợp hoàn hảo của cà phê, trứng và sữa đặc, làm cho người uống có những cảm xúc vị giác khác lạ hoàn toàn so với những ly cà phê khác trên thế giới, mang đậm nét đặc trưng của thủ đô Hà Nội cổ kính.

Mỗi quán đều có một cách pha chế riêng cho mình về tách cà phê Trứng, tuy nhiên, vẫn 3 nguyên liệu chủ chốt là cà phê, trứng và sữa đặc.

Cách pha cà phê Trứng bạn có thể thử tại nhà

Chuẩn bị:

Bột cà phê
Trứng gà ta
Sữa đặc
Nước sôi
Cách thực hiện

Bước 1: Pha cà phê

Với 17-20gr cà phê cho vào phin, lắc nhẹ để cà phê dàn phẳng và ấn chặt nắp xuống. Đổ 15ml nước sôi vào mặt phin, đợi khoảng 30 giây, thì lại cho tiếp nước sôi ngập ¾ phin, đậy nắp và đợi cà phê được chắt lọc ra.

Bước 2: Đánh trứng gà ta

Đập trứng gà ra, vợt lấy lòng đỏ trứng và bỏ lòng trắng. Cho vào lòng đỏ vào ly và dùng máy đánh để trứng bông lên, thời gian đánh khoảng 5-7 phút.

Bước 3: Hoàn thành

Cà phê sau khi đã chắt lọc xong, bạn cho cà phê vào ly có trứng đã đánh bông ra. Sau đó cho thêm xíu sữa đặc, và thưởng thức.

Ngoài công thức truyền thống này, bạn có thể thêm vào xíu mật ong hoặc bơ để tăng vị.



Cà phê trứng của Legend Revived

Thưởng thức cà phê Trứng ở đâu?
Nếu bạn đang ở Hà Nội thì đừng quên ghé ngay Giảng cà phê, hiện có 2 cơ sở:

1. Cà phê Giảng 109 Yên Phụ

2. Cà phê Giảng 39 Nguyễn Hữu Huân

Còn nếu ở Sài Gòn mà muốn thử 1 tách cà phê Trứng thì sao? Vậy thì hãy tham khảo một số địa điểm như sau:

1. The Note Coffee (183 Bùi Viện)

2. Coffee & Tea Corner Hà Nội (165 Bùi Viện)

3. Café Trung (1006 Trường Sa, Quận 3)

4. Legend Revived (49 Bis Hậu Giang, Quận Tân Bình)')
INSERT [dbo].[TINTUC] ([MaTin], [NoiDung]) VALUES (4, N'Cà phê Trứng – nét văn hóa độc đáo chỉ có ở Việt Nam
Cà phê – một thức uống phổ biến bậc nhất trên thế giới. Với vị đắng đặc trưng nên thức uống này không thể chiều lòng hết tất thảy mọi người, đó chính là lý do, cà phê được xem là nguồn cảm hứng cho rất nhiều barista tìm tòi và sáng tạo ra những thức uống mới lạ.

Mỗi quốc gia đều có những món cà phê độc đáo, mang đậm nét văn hóa, ví như: Tây Ban Nha có cà phê Miel, Bồ Đào Nha có cà phê Cortado hay Ấn Độ có cà phê Filter,.. và Việt Nam cũng có cà phê Phin thật sự rất đặc biệt. Không những thế, dạo gần đây, khách du lịch còn bị ấn tượng bởi Cà phê Trứng (Egg Coffee Vietnamese) – được xem là món đặc sản cà phê ở Hà Nội, với mùi và vị cực kì hấp dẫn.  Có thể nói, khi đến Hà Nội, bạn chắc chắn phải thử ngay một tách cà phê Trứng đậm chất nơi đây, và chắc chắn rằng, nó sẽ là một trong những lý do khiến bạn quay lại vùng đất thơ mộng này.

Cà phê Trứng có từ lúc nào?
Không có tài liệu nào ghi lại cà phê Trứng có từ lúc nào, chỉ biết rằng, đến năm 1946, cả thế giới đã được biết về món nước đặc biệt này. Vào thời đó, có một thanh niên tên Nguyễn Văn Giảng, cậu ta làm việc ở khách sạn Metropole Hà Nội với vị trí pha chế cà phê. Tuy nhiên, ở thời đó, cà phê pha khá loãng và được pha chung với sữa. Có một lần do vì thiếu sữa nên cậu lấy trứng thay thế, ấy vậy mà thức uống đó được rất nhiều thực khách đánh giá cao và yêu mến. Sau một thời gian, cậu quyết định nghỉ việc ở khách sạn và tự mở quán cà phê cho riêng mình với cà phê Trứng làm món chủ đạo. Hiện giờ, quán cà phê của cậu vẫn còn ở Hà Nội và được kế thừa bởi con trai cậu Giảng.



Cà phê Giảng Hà Nội - hình sưu tầm

Được kế thừa công thức từ bố, đây là nơi bạn có thể thưởng thức một tách cà phê Trứng chính tông giữa lòng Hà Nội. Nơi đây đã trở thành một địa điểm phải có trong place list của các du khách khi đặt chân xuống vùng đất này.

Theo Vnexpress, ông Mark Lowerson – người điều hành Street Eats Hanoi cho biết “Đa số khách của tôi đều thích đồ uống này. Khi mô tả về nó, họ không thể tưởng tượng được trứng kết hợp với cà phê như thế nào. Và tôi chưa từng thấy ai lại không thích món này.”')
INSERT [dbo].[TINTUC] ([MaTin], [NoiDung]) VALUES (7, N'Tây Nguyên - thủ phủ cà phê trù phú ở Việt Nam
Với diện tích khoảng 51,800 km2, Tây Nguyên được bao bọc bởi địa hình đồi núi cao hiểm trở, những cánh rừng bạt ngàn và đất ba-zan màu mỡ. Vùng đất này chiếm tới 16% diện tích trồng trọt và 22% đất rừng Việt Nam.



Tây Nguyên - thủ phủ cà phê trù phú

Tây Nguyên được hình thành từ năm cao nguyên nối tiếp nhau với độ cao 500m ở phía bắc cao dần lên tới 1500m về phía nam.

Với khí hậu nhiệt đới và đất ba-zan màu mỡ, đây đã trở thành thủ phủ cà phê của Việt Nam, với hai trung tâm sản xuất lớn chính là Buôn Ma Thuột và Cầu Đất.

Cao nguyên phía Bắc có độ cao trung bình 600m, Buôn Ma Thuột là nơi sản hạt cà phê Robusta tập trung quy mô lớn.

Hạt cà phê Robusta từ vùng Buôn Ma Thuột nổi tiếng bởi nước đặc sánh và vị đậm đà khó có nơi nào sánh bằng.



Cà phê Robusta

Về phía Nam, vùng Cầu Đất - một địa danh thuộc Đà Lạt, Lâm Đồng nằm trên một bình nguyên cao tới 1500m, có điều kiện lý tưởng để trồng cà phê Mocha (một giống Arabica) đặc sản.

Mocha Cầu Đất là đặc sản truyền thống được các nhà nhập khẩu cà phê lớn của thế giới ưa chuộng tìm mua.



Cà phê Mocha Cầu Đất

Mocha Cầu Đất được biết tới bởi mùi hương thơm nồng và vị chua thanh khiết hoàn toàn khác so với các loại cà phê khác có nguồn gốc từ Catimor.

Thú vị hơn, từ vùng đất này hạt cà phê Typica (cũng là một giống khác Arabica) đang dần được khôi phục bởi những tín đồ cà phê tâm huyết. Quả cà phê Typica có màu vàng đặc trưng khá lạ và có sản lượng cực kỳ ít ỏi, ít được biết đến vì đã bị thay thế bởi nhiều giống Catimor có năng suất cao. Và dù với số lượng ít ỏi, hương vị truyền thống của Typica chắc chắn sẽ mang lại trải nghiệm mới lạ cho những người sành cà phê.



Cà phê Typica')
INSERT [dbo].[TINTUC] ([MaTin], [NoiDung]) VALUES (8, N'Cà phê – một thức uống phổ biến bậc nhất trên thế giới. Với vị đắng đặc trưng nên thức uống này không thể chiều lòng hết tất thảy mọi người, đó chính là lý do, cà phê được xem là nguồn cảm hứng cho rất nhiều barista tìm tòi và sáng tạo ra những thức uống mới lạ.

Mỗi quốc gia đều có những món cà phê độc đáo, mang đậm nét văn hóa, ví như: Tây Ban Nha có cà phê Miel, Bồ Đào Nha có cà phê Cortado hay Ấn Độ có cà phê Filter,.. và Việt Nam cũng có cà phê Phin thật sự rất đặc biệt. Không những thế, dạo gần đây, khách du lịch còn bị ấn tượng bởi Cà phê Trứng (Egg Coffee Vietnamese) – được xem là món đặc sản cà phê ở Hà Nội, với mùi và vị cực kì hấp dẫn.  Có thể nói, khi đến Hà Nội, bạn chắc chắn phải thử ngay một tách cà phê Trứng đậm chất nơi đây, và chắc chắn rằng, nó sẽ là một trong những lý do khiến bạn quay lại vùng đất thơ mộng này.')
SET IDENTITY_INSERT [dbo].[TINTUC] OFF
ALTER TABLE [dbo].[CTDONHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDONHANG_DONDATHANG] FOREIGN KEY([SoDH])
REFERENCES [dbo].[DONDATHANG] ([SoDH])
GO
ALTER TABLE [dbo].[CTDONHANG] CHECK CONSTRAINT [FK_CTDONHANG_DONDATHANG]
GO
ALTER TABLE [dbo].[CTDONHANG]  WITH CHECK ADD  CONSTRAINT [FK_CTDONHANG_SANPHAM] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CTDONHANG] CHECK CONSTRAINT [FK_CTDONHANG_SANPHAM]
GO
ALTER TABLE [dbo].[CTPHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CTPHIEUNHAP_NHACUNGCAP] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
ALTER TABLE [dbo].[CTPHIEUNHAP] CHECK CONSTRAINT [FK_CTPHIEUNHAP_NHACUNGCAP]
GO
ALTER TABLE [dbo].[CTPHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CTPHIEUNHAP_PHIEUNHAP] FOREIGN KEY([MaPhieu])
REFERENCES [dbo].[PHIEUNHAP] ([MaPhieu])
GO
ALTER TABLE [dbo].[CTPHIEUNHAP] CHECK CONSTRAINT [FK_CTPHIEUNHAP_PHIEUNHAP]
GO
ALTER TABLE [dbo].[CTPHIEUNHAP]  WITH CHECK ADD  CONSTRAINT [FK_CTPHIEUNHAP_SANPHAM] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CTPHIEUNHAP] CHECK CONSTRAINT [FK_CTPHIEUNHAP_SANPHAM]
GO
ALTER TABLE [dbo].[DANHGIASANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIASANPHAM_KHACHHANG] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DANHGIASANPHAM] CHECK CONSTRAINT [FK_DANHGIASANPHAM_KHACHHANG]
GO
ALTER TABLE [dbo].[DANHGIASANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_DANHGIASANPHAM_SANPHAM] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[DANHGIASANPHAM] CHECK CONSTRAINT [FK_DANHGIASANPHAM_SANPHAM]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_HINHTHUCGIAOHANG] FOREIGN KEY([MaHTGH])
REFERENCES [dbo].[HINHTHUCGIAOHANG] ([MaHTGH])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_HINHTHUCGIAOHANG]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_HINHTHUCTHANHTOAN] FOREIGN KEY([MaHTTT])
REFERENCES [dbo].[HINHTHUCTHANHTOAN] ([MaHTTT])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_HINHTHUCTHANHTOAN]
GO
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_MaGiamGia] FOREIGN KEY([IDMaGiam])
REFERENCES [dbo].[MaGiamGia] ([ID])
GO
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_MaGiamGia]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_LOAISP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAISP] ([MaLoai])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_LOAISP]
GO
