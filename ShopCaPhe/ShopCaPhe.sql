USE [CàPhe]
GO
ALTER TABLE [dbo].[SANPHAM] DROP CONSTRAINT [FK_SANPHAM_LOAISP]
GO
ALTER TABLE [dbo].[DONDATHANG] DROP CONSTRAINT [FK_DONDATHANG_HINHTHUCTHANHTOAN]
GO
ALTER TABLE [dbo].[DONDATHANG] DROP CONSTRAINT [FK_DONDATHANG_HINHTHUCGIAOHANG]
GO
ALTER TABLE [dbo].[DANHGIASANPHAM] DROP CONSTRAINT [FK_DANHGIASANPHAM_SANPHAM]
GO
ALTER TABLE [dbo].[DANHGIASANPHAM] DROP CONSTRAINT [FK_DANHGIASANPHAM_KHACHHANG]
GO
ALTER TABLE [dbo].[CTPHIEUNHAP] DROP CONSTRAINT [FK_CTPHIEUNHAP_SANPHAM]
GO
ALTER TABLE [dbo].[CTPHIEUNHAP] DROP CONSTRAINT [FK_CTPHIEUNHAP_PHIEUNHAP]
GO
ALTER TABLE [dbo].[CTPHIEUNHAP] DROP CONSTRAINT [FK_CTPHIEUNHAP_NHACUNGCAP]
GO
ALTER TABLE [dbo].[CTDONHANG] DROP CONSTRAINT [FK_CTDONHANG_SANPHAM]
GO
ALTER TABLE [dbo].[CTDONHANG] DROP CONSTRAINT [FK_CTDONHANG_DONDATHANG]
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[SANPHAM]
GO
/****** Object:  Table [dbo].[PHIEUNHAP]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[PHIEUNHAP]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[NHACUNGCAP]
GO
/****** Object:  Table [dbo].[MENU]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[MENU]
GO
/****** Object:  Table [dbo].[LOAISP]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[LOAISP]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[KHACHHANG]
GO
/****** Object:  Table [dbo].[HINHTHUCTHANHTOAN]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[HINHTHUCTHANHTOAN]
GO
/****** Object:  Table [dbo].[HINHTHUCGIAOHANG]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[HINHTHUCGIAOHANG]
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[DONDATHANG]
GO
/****** Object:  Table [dbo].[DANHGIASANPHAM]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[DANHGIASANPHAM]
GO
/****** Object:  Table [dbo].[CTPHIEUNHAP]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[CTPHIEUNHAP]
GO
/****** Object:  Table [dbo].[CTDONHANG]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[CTDONHANG]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 12/5/2019 2:11:04 PM ******/
DROP TABLE [dbo].[ADMIN]
GO
/****** Object:  Table [dbo].[ADMIN]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[CTDONHANG]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[CTPHIEUNHAP]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[DANHGIASANPHAM]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 12/5/2019 2:11:04 PM ******/
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
	[Ngaygiaohang] [nvarchar](50) NULL,
	[TriGia] [decimal](18, 0) NULL,
	[TrangThai] [nvarchar](50) NULL,
	[TenNguoiNhan] [nvarchar](50) NULL,
	[DiaChiNhan] [nvarchar](50) NULL,
	[DienThoaiNhan] [varchar](15) NULL,
	[MaHTTT] [int] NULL,
	[MaHTGH] [int] NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[SoDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HINHTHUCGIAOHANG]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[HINHTHUCTHANHTOAN]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 12/5/2019 2:11:04 PM ******/
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
	[NgaySinh] [smalldatetime] NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAISP]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[MENU]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[PHIEUNHAP]    Script Date: 12/5/2019 2:11:04 PM ******/
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
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 12/5/2019 2:11:04 PM ******/
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
	[NgayTao] [smalldatetime] NULL,
	[NgayChinhSua] [smalldatetime] NULL,
	[TrangThai] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
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
SET IDENTITY_INSERT [dbo].[DANHGIASANPHAM] OFF
SET IDENTITY_INSERT [dbo].[DONDATHANG] ON 

INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (5, 1, CAST(0x4D400B00 AS Date), N'2019-11-27', CAST(5720000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421 le chi dan', N'0868515151', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (7, 1, CAST(0x52400B00 AS Date), N'2019-11-27', CAST(1338000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc2', N'421 le chi dan', N'0868515151', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (11, 1, CAST(0x58400B00 AS Date), N'2019-11-27', CAST(350000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (12, 1, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(770000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (13, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(889000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (14, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(700000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (15, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(1410000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (16, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(2500000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (17, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(790000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (18, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(1470000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (19, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(11508000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (20, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(1738000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (21, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(11470000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (22, 18, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(4200000 AS Decimal(18, 0)), N'Đã giao', N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (23, 19, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(889000 AS Decimal(18, 0)), N'Đang giao', N'black', N'111, minh phuc', N'123456', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (24, 19, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(1700000 AS Decimal(18, 0)), N'Đang giao', N'black', N'111, minh phuc', N'123456', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (25, 19, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(500000 AS Decimal(18, 0)), N'Đang giao', N'black', N'111, minh phuc', N'123456', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (26, 1, CAST(0x65400B00 AS Date), N'2019-11-27', CAST(440000 AS Decimal(18, 0)), N'Đang giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL)
INSERT [dbo].[DONDATHANG] ([SoDH], [MaKH], [NgayDH], [Ngaygiaohang], [TriGia], [TrangThai], [TenNguoiNhan], [DiaChiNhan], [DienThoaiNhan], [MaHTTT], [MaHTGH]) VALUES (27, 0, CAST(0x6D400B00 AS Date), N'2019-11-27', CAST(440000 AS Decimal(18, 0)), N'Đã giao', N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', NULL, NULL)
SET IDENTITY_INSERT [dbo].[DONDATHANG] OFF
SET IDENTITY_INSERT [dbo].[KHACHHANG] ON 

INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email]) VALUES (1, N'Phạm Minh Phúc', N'421, Lê chí dân', N'0868396150', N'phucpm', N'asd', CAST(0x8CC90000 AS SmallDateTime), N'Nam', N'phamminhphuc990@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email]) VALUES (18, N'Phúc', N'421, Le Chi dan', N'01882221110', NULL, NULL, NULL, N'Nam', N'mylove169295@gmail.com')
INSERT [dbo].[KHACHHANG] ([MaKH], [HoTenKH], [DiaChiKH], [DienThoaiKH], [TenDN], [MatKhau], [NgaySinh], [GioiTinh], [Email]) VALUES (19, N'black', N'111, minh phuc', N'123456', NULL, NULL, NULL, N'Nam', N'blackblack007795@gmail.com')
SET IDENTITY_INSERT [dbo].[KHACHHANG] OFF
SET IDENTITY_INSERT [dbo].[LOAISP] ON 

INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (1, N'Cà Phê Chồn')
INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (2, N'Cà Phê Hạt Nguyên Chất')
INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (3, N'Cà Phê Dạng Bột')
INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (4, N'Máy Pha Cà Phê')
INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (5, N'Máy Xay Cà Phê')
INSERT [dbo].[LOAISP] ([MaLoai], [TenLoai]) VALUES (6, N'Cà Phê Hòa Tan')
SET IDENTITY_INSERT [dbo].[LOAISP] OFF
SET IDENTITY_INSERT [dbo].[MENU] ON 

INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (1, N'Trang Chủ', 0, NULL, NULL, N'/Home/TrangChu')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (2, N'Giới Thiệu', 0, NULL, NULL, N'/Home/GioiThieu')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (3, N'Sản Phẩm', 0, NULL, NULL, N'/Home/Index')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (4, N'Tin Tức-Bài Viết', 0, NULL, NULL, N'#')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (5, N'Liên Hệ', 0, NULL, NULL, N'#')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (6, N'Cà Phê Chồn', 3, NULL, NULL, N'/ViewSP/LoaiSP?MaLoai=1')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (7, N'Cà Phê Bột', 3, NULL, NULL, N'/ViewSP/LoaiSP?MaLoai=3')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (8, N'Cà Phê Hòa Tan', 3, NULL, NULL, N'/ViewSP/LoaiSP?MaLoai=6')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (9, N'Máy Xay Cà Phê', 3, NULL, NULL, N'/ViewSP/LoaiSP?MaLoai=5')
INSERT [dbo].[MENU] ([ID], [MenuName], [ParentID], [CreateDate], [UpdateDate], [Link]) VALUES (10, N'Máy Pha Cà Phê', 3, NULL, NULL, N'/ViewSP/LoaiSP?MaLoai=4')
SET IDENTITY_INSERT [dbo].[MENU] OFF
SET IDENTITY_INSERT [dbo].[SANPHAM] ON 

INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (14, N'Cà phê Chồn Mocha 250gram', N'Hộp', CAST(350000 AS Decimal(18, 0)), N'Cà phê Chồn Robusta được sản xuất từ trái cà phê Buôn Mê Thuột, vốn nổi tiếng với nước đặc sánh và vị đậm đà. Cà phê Robusta Chồn Buôn Mê Thuột vẫn có nước đặc sánh, khi uống lại êm mượt, đậm đà, lại có vị ngọt thanh bám rất lâu ở cuối cổ họng. Khác với cà phê Robusta thường, cà phê Robusta Chồn có vị chua trái cây, vốn là điểm đặc trưng của các loại cà phê Arabica đặc sản. Mùi hương của cà phê Robusta Chồn thơm nồng hơn hẳn cà phê thường, lại vương mùi chocolate rất nhẹ, ngọt ngào nhưng khó nắm bắt.

Sự phối trộn 90% Robusta đặc sản với 10% Robusta Chồn sẽ càng tạo thêm sự khác biệt với hương thơm chocolate ấm áp, vị đắng ít hơn cùng hậu vị ngọt vương lâu cuối lưỡi, mang lại vị mới lạ dành cho tín đồ yêu thích Cà phê.', N'caphechon1.jpg', 1, NULL, CAST(0xAB0D02DE AS SmallDateTime), N'Trưng Bày', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (19, N'Cà phê Chồn Mocha 51 gram', N'Hộp', CAST(350000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Cầu Đất, địa danh thuộc Đà Lạt, Lâm Đồng, có điều kiện lý tưởng để trồng cà phê Arabica truyền thống. Hạt cà phê Arabica Cầu Đất lại được biết tới bởi mùi thơm nồng và vị chua thanh khiết. Mùi thơm của Mocha Chồn vương nhẹ sô-cô-la tinh tế. Nước cà phê chỉ vừa đủ sánh, lại êm mượt. Phối trộn giữa 10 % cà phê Chồn và 90% cà phê Arabica tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Phối trộn giữa cà phê Chồn và cà phê đặc sản tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt mang lại cho bạn cảm giác thưởng thức chưa từng được biết đến.

', N'caphechon2.jpg', 1, NULL, CAST(0xAB0504DB AS SmallDateTime), N'Đang Bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (20, N'Cà phê Chồn Robusta 51 gram', N'Hộp', CAST(440000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Cầu Đất, địa danh thuộc Đà Lạt, Lâm Đồng, có điều kiện lý tưởng để trồng cà phê Arabica truyền thống. Hạt cà phê Arabica Cầu Đất lại được biết tới bởi mùi thơm nồng và vị chua thanh khiết. Mùi thơm của Mocha Chồn vương nhẹ sô-cô-la tinh tế. Nước cà phê chỉ vừa đủ sánh, lại êm mượt. Phối trộn giữa 10 % cà phê Chồn và 90% cà phê Arabica tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Phối trộn giữa cà phê Chồn và cà phê đặc sản tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt mang lại cho bạn cảm giác thưởng thức chưa từng được biết đến.

', N'caphechon3.jpg', 1, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (28, N'Cà phê Chồn Moutain''s Legend Mocha 200G', N'Ký', CAST(449000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Cầu Đất, địa danh thuộc Đà Lạt, Lâm Đồng, có điều kiện lý tưởng để trồng cà phê Arabica truyền thống. Hạt cà phê Arabica Cầu Đất lại được biết tới bởi mùi thơm nồng và vị chua thanh khiết. Mùi thơm của Mocha Chồn vương nhẹ sô-cô-la tinh tế. Nước cà phê chỉ vừa đủ sánh, lại êm mượt. Phối trộn giữa 10 % cà phê Chồn và 90% cà phê Arabica tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Phối trộn giữa cà phê Chồn và cà phê đặc sản tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt mang lại cho bạn cảm giác thưởng thức chưa từng được biết đến.

', N'caphexaysan1.png', 3, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (29, N'Cà phê Chồn Moutain''s Legend Robusta 200G', N'Ký', CAST(360000 AS Decimal(18, 0)), N'Cà phê Chồn Robusta được sản xuất từ trái cà phê Buôn Mê Thuột, vốn nổi tiếng với nước đặc sánh và vị đậm đà. Cà phê Robusta Chồn Buôn Mê Thuột vẫn có nước đặc sánh, khi uống lại êm mượt, đậm đà, lại có vị ngọt thanh bám rất lâu ở cuối cổ họng. Khác với cà phê Robusta thường, cà phê Robusta Chồn có vị chua trái cây, vốn là điểm đặc trưng của các loại cà phê Arabica đặc sản. Mùi hương của cà phê Robusta Chồn thơm nồng hơn hẳn cà phê thường, lại vương mùi chocolate rất nhẹ, ngọt ngào nhưng khó nắm bắt.

Sự phối trộn 90% Robusta đặc sản với 10% Robusta Chồn sẽ càng tạo thêm sự khác biệt với hương thơm chocolate ấm áp, vị đắng ít hơn cùng hậu vị ngọt vương lâu cuối lưỡi, mang lại vị mới lạ dành cho tín đồ yêu thích Cà phê.', N'caphexaysan2.png', 3, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (31, N'Cà phê chồn Mocha Moutain’s Legend 150 gram', N'Hộp', CAST(300000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Cầu Đất, địa danh thuộc Đà Lạt, Lâm Đồng, có điều kiện lý tưởng để trồng cà phê Arabica truyền thống. Hạt cà phê Arabica Cầu Đất lại được biết tới bởi mùi thơm nồng và vị chua thanh khiết. Mùi thơm của Mocha Chồn vương nhẹ sô-cô-la tinh tế. Nước cà phê chỉ vừa đủ sánh, lại êm mượt. Phối trộn giữa 10 % cà phê Chồn và 90% cà phê Arabica tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Lon nhựa P.E.T thực phẩm đảm bảo an toàn cho Cà phê trong quá trình vận chuyển, bảo quản, hình trụ thon dài tạo dáng vẻ tinh tế, sang trọng. Thiết kế gọn nhẹ giúp bạn dễ dàng mang theo hay làm quà tặng nhỏ.', N'caphechon4.jpg', 1, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (33, N'Cà phê Chồn Mocha Rare Wild - Hộp Sơn Mài 125gr', N'Hộp', CAST(470000 AS Decimal(18, 0)), N'Cầu Đất nằm trên một bình nguyên cao tới 1’500m, có điều kiện lý tưởng để trồng cà phê Mocha (là cách gọi khác của Arabica) đặc sản. Cà phê Chồn tự nhiên thường được thu lượm sau nhiều ngày nằm trong rẫy hay đất rừng, dễ bị đen hạt hoặc bị mốc. Vì thế, với nguồn đã ít lại cần chọn lọc kỹ càng khiến nó trở nên vô cùng hiếm hoi. So với cà phê Chồn nuôi thì cà phê Chồn Tự Nhiên có một mùi vị êm mượt và đậm đà hơn, rất khó mô tả, và cơ hội để khám phá sự độc đáo này sẽ mang lại cho bạn trải nghiệm vô giá.

Bên trong hộp gồm 1 túi cà phê 125 gram dạng bột hoặc hạt được bao bọc trong túi lụa may thủ công. Mỗi túi đều có van 1 chiều sau lưng cho thoát mùi hương nhưng không cho hơi ẩm thâm nhập. Kèm theo đó là một quyển sách nhỏ để bạn tìm hiểu thêm những câu chuyện thú vị về Cà phê Chồn.

Toàn bộ sản phẩm, phin, sách được xếp trong hộp sơn mài ba lớp bền chắc, sang trọng kết hợp giỏ lục bình đan tay đậm chất truyền thống dân gian Việt Nam.', N'caphechon5.jpg', 1, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (37, N'Cà phê Chồn Mocha Rare Wild - Hộp Sơn Mài 250gr', N'Hộp', CAST(940000 AS Decimal(18, 0)), N'Cầu Đất nằm trên một bình nguyên cao tới 1’500m, có điều kiện lý tưởng để trồng cà phê Mocha (là cách gọi khác của Arabica) đặc sản. Cà phê Chồn tự nhiên thường được thu lượm sau nhiều ngày nằm trong rẫy hay đất rừng, dễ bị đen hạt hoặc bị mốc. Vì thế, với nguồn đã ít lại cần chọn lọc kỹ càng khiến nó trở nên vô cùng hiếm hoi. So với cà phê Chồn nuôi thì cà phê Chồn Tự Nhiên có một mùi vị êm mượt và đậm đà hơn, rất khó mô tả, và cơ hội để khám phá sự độc đáo này sẽ mang lại cho bạn trải nghiệm vô giá.

Bên trong hộp gồm 2 túi cà phê 125 gram dạng bột hoặc hạt được bao bọc trong túi lụa may thủ công. Mỗi túi đều có van 1 chiều sau lưng cho thoát mùi hương nhưng không cho hơi ẩm thâm nhập. Kèm theo đó là bộ phin inox cao cấp, mẫu phân chồn thô và một quyển sách nhỏ để bạn tìm hiểu thêm những câu chuyện thú vị về Cà phê Chồn.

Toàn bộ sản phẩm, phin, sách được xếp trong hộp sơn mài ba lớp bền chắc, sang trọng kết hợp giỏ lục bình đan tay đậm chất truyền thống dân gian Việt Nam.', N'caphechon6.jpg', 1, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (38, N'Cà phê Chồn Robusta 125 gram', N'Hộp', CAST(250000 AS Decimal(18, 0)), N'Vùng đất Buôn Ma Thuột nổi tiếng với những quả cà phê Robusta chín mọng- nguyên liệu chính cho ra chất cà phê sánh đặc, vị đắng mạnh cùng mùi đậm rất đặc trưng.Sẽ càng đặc biệt hơn khi Robusta được đi qua dạ dày của Chồn hương, mang lại trải nghiệm mới mẻ chưa từng được biết đến: hương thơm chocolate quyến rũ, nồng nàn, hậu vị ngọt kéo dài cuối lưỡi.

Bên trong hộp gồm 2 túi cà phê 125 gram dạng bột hoặc hạt được bao bọc trong túi lụa may thủ công. Mỗi túi đều có van 1 chiều sau lưng cho thoát mùi hương nhưng không cho hơi ẩm thâm nhập. Kèm theo đó là bộ phin inox cao cấp, mẫu phân chồn thô và một quyển sách nhỏ để bạn tìm hiểu thêm những câu chuyện thú vị về Cà phê Chồn.

Toàn bộ sản phẩm, phin, sách được xếp trong hộp sơn mài ba lớp bền chắc, sang trọng kết hợp giỏ lục bình đan tay đậm chất truyền thống dân gian Việt Nam.', N'caphechon7.jpg', 1, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (39, N'Cà phê Chồn Robusta 250 gram', N'Hộp', CAST(500000 AS Decimal(18, 0)), N'Vùng đất Buôn Ma Thuột nổi tiếng với những quả cà phê Robusta chín mọng- nguyên liệu chính cho ra chất cà phê sánh đặc, vị đắng mạnh cùng mùi đậm rất đặc trưng.

Sẽ càng đặc biệt hơn khi Robusta được đi qua dạ dày của Chồn hương, mang lại trải nghiệm mới mẻ chưa từng được biết đến: hương thơm chocolate quyến rũ, nồng nàn, hậu vị ngọt kéo dài cuối lưỡi.

Mỗi hộp gồm 1 gói Cà phê Chồn 125gr được bao bọc cẩn thận trong túi lụa may thủ công, sau lưng có van 1 chiều giúp thoát mùi hương nhưng không cho hơi ẩm thâm nhập. Bạn có thể tìm hiểu thêm những câu chuyện thú vị về Cà phê Chồn trong cuốn sách nhỏ do chúng tôi tâm huyết viết nên. Hộp sơn mài 3 lớp sang trọng, bền chắc đảm bảo xứng đáng với niềm vui của người nhận và sự an tâm của người tặng.', N'caphechon8.jpg', 1, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (43, N'Cà phê M''ja Hòa tan', N'Ký', CAST(38000 AS Decimal(18, 0)), N'Được chiết xuất từ những hạt cà phê nguyên chất, Cà phê hòa tan M''ja có hương thơm nồng nàn cùng vị đậm đà thanh khiết. Chắc chắn, mỗi tách cà phê sẽ khiến bạn vô cùng sảng khoái. Đem đến những cảm xúc và hương vị mới lạ dành riêng cho bạn.', N'caphehoatan1.jpg', 6, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (44, N'Cà phê M''Ja Túi lọc 150 gram', N'Ký', CAST(120000 AS Decimal(18, 0)), N'Được chiết xuất từ những hạt cà phê nguyên chất, Cà phê hòa tan M''ja có hương thơm nồng nàn cùng vị đậm đà thanh khiết. Chắc chắn, mỗi tách cà phê sẽ khiến bạn vô cùng sảng khoái. Đem đến những cảm xúc và hương vị mới lạ dành riêng cho bạn.', N'caphehoatan2.jpg', 6, CAST(0xAAF60000 AS SmallDateTime), CAST(0xAAF60000 AS SmallDateTime), N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (45, N'Cà phê chồn túi lọc Mocha Moutain’s Legend 75 gram', N'Túi', CAST(195000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Robusta được sản xuất từ những hạt cà phê Buôn Ma Thuột vốn nổi tiếng bởi nước pha đặc sánh và vị đậm đà. Cà phê Robusta Chồn vẫn giữ vị đậm đà, nhưng lại có vị ngọt thanh bám rất lâu ở cuối cổ họng. Mùi hương của cà phê Robusta Chồn thơm nồng hơn hẳn cà phê thường, lại vương mùi chocolate ngọt ngào. Phối trộn giữa 10% cà phê Chồn cà phê 90% Robusta tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Khi phối trộn 90% Robusta đặc sản với 10% Robusta Chồn sẽ càng tạo thêm sự khác biệt với hương thơm chocolate ấm áp, vị đắng ít hơn cùng hậu vị ngọt vương lâu cuối lưỡi, mang lại vị mới lạ dành cho tín đồ yêu thích Cà phê.

Sản phẩm gồm 5 túi lọc dành cho 5 ly Cà phê tiện dụng. Kèm theo là đường để bạn sử dụng bất kì nơi đâu.', N'caphehoatan3.jpg', 6, CAST(0xAAF60000 AS SmallDateTime), CAST(0xAB0D02DE AS SmallDateTime), N'Trưng Bày', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (56, N'Cà phê chồn túi lọc Robusta Moutain Legend 75 gram', N'Túi', CAST(165000 AS Decimal(18, 0)), N'Với độ cao 500 – 1500 m và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Buôn Ma Thuột và Đà Lạt là 2 trung tâm. Robusta được sản xuất từ những hạt cà phê Buôn Ma Thuột vốn nổi tiếng bởi nước pha đặc sánh và vị đậm đà. Cà phê Robusta Chồn vẫn giữ vị đậm đà, nhưng lại có vị ngọt thanh bám rất lâu ở cuối cổ họng. Mùi hương của cà phê Robusta Chồn thơm nồng hơn hẳn cà phê thường, lại vương mùi chocolate ngọt ngào. Phối trộn giữa 10% cà phê Chồn cà phê 90% Robusta tương ứng tạo nên loại cà phê có nước đậm trung bình, vị chua nhẹ nhàng, giàu mùi ca cao, hậu vị êm mượt.

Khi phối trộn 90% Robusta đặc sản với 10% Robusta Chồn sẽ càng tạo thêm sự khác biệt với hương thơm chocolate ấm áp, vị đắng ít hơn cùng hậu vị ngọt vương lâu cuối lưỡi, mang lại vị mới lạ dành cho tín đồ yêu thích Cà phê.

Sản phẩm gồm 5 túi lọc dành cho 5 ly Cà phê tiện dụng. Kèm theo là đường để bạn sử dụng bất kì nơi đâu.', N'caphehoatan4.jpg', 6, CAST(0xAAF60000 AS SmallDateTime), CAST(0xAAF60000 AS SmallDateTime), N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (57, N'Cà phê M’Ja Mocha 200 gram', N'Ký', CAST(150000 AS Decimal(18, 0)), N'Với độ cao 1500m so với mặt nước biển cùng đất giàu Bazan, Cầu Đất ( Lâm Đồng) là huyện trồng Mocha ngon bậc nhất ở Việt Nam. Cũng bởi diện tích hạn chế mà sản lượng Mocha Cầu Đất hiện tại rất ít, dần trở nên quý hiếm.

Mocha Cầu Đất vang danh bởi vị đắng nhẹ kèm vị chua thanh khiết trái cây, mang lại cảm giác nhẹ nhàng, không đậm gắt. Đặc biệt sau mỗi lần nhấp từng ngụm, bạn sẽ cảm nhận rõ hậu vị ngọt vương lâu cuối lưỡi hoàn toàn khác biệt. Chất Cà phê sánh nâu màu hổ phách được rang chuẩn bởi bàn tay những người thợ dày dặn kinh nghiệm.

Cà phê đựng trong túi Kraff gợi lên vẻ mộc mạc, ấm áp của đặc sản truyền thống Việt. Van 1 chiều giúp bạn cảm nhận mùi thơm nhưng không cho hơi ẩm thâm nhập vào. Một món quà đẹp và trang nhã dành tặng những người yêu thích Cà phê.', N'caphexaysan3.jpg', 3, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (61, N'Cà phê M’Ja Bourbon 200 gram', N'Ký', CAST(200000 AS Decimal(18, 0)), N'Với độ cao trên 1500m và khí hậu mát lạnh trong lành, Đà Lạt là nơi lý tưởng để trồng giống cà phê Bourbon và cho ra những quả cà phê chất lượng hảo hạng nhất.

Hương cà phê thoang thoảng mùi chocolate nhẹ nhàng kèm vị chua nhẹ tựa trái cây làm nên sự say đắm của biết bao tín đồ cà phê.

Sản phẩm được đóng trong túi kiếng thực phẩm có van hơi 1 chiều, ngăn không cho không khí thấm ngược vào trong cà phê.

Túi giấy trang nhã, thân thiện với môi trường, giữ nguyên bản hương vị cà phê đặc sản đậm chất truyền thống Việt Nam.', N'caphexaysan4.jpg', 3, CAST(0xAAF60000 AS SmallDateTime), CAST(0xAAF60000 AS SmallDateTime), N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (66, N'Cà phê M’Ja Mocha 150 gram', N'Ký', CAST(250000 AS Decimal(18, 0)), N'Với độ cao trung bình 1500m so với mực nước biển, Cầu Đất là huyện kế cận thành phố Đà Lạt hội đủ điều kiện tự nhiên để trồng Mocha ngon. Mocha nơi đây là dòng Cà phê được thế giới yêu thích bởi vị đắng nhẹ, hương thơm nồng nàn và hậu vị ngọt.

Sản phẩm được sản xuất theo quy trình cà phê sạch từ khâu chăm sóc, thu hoạch và lựa chọn quả.  Màu rang chuẩn, nước cà phê sánh có màu hổ phách, hương thơm nồng, vị đắng dịu cùng vị chua thanh khiết trái cây và hậu vị ngọt.  

Thiết kế hộp từ giấy cứng Kraff in hoa văn tạo vẻ mộc mạc của đặc sản truyền thống, ngoài ra đảm bảo bền chắc trong suốt quá trình vận chuyển. Đính kèm theo là chiếc phin inox cao cấp để bạn sẵn sàng thưởng thức một tách Cà phê phin Việt đúng điệu. Một món quà tinh tế, chất lượng chắc chắn sẽ làm hài lòng cả người nhận lẫn người tặng.

', N'caphexaysan5.jpg', 3, NULL, NULL, N'Đang bán', 1000)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (67, N'Cà phê M’Ja Combo 500 gram', N'Ký', CAST(120000 AS Decimal(18, 0)), N'Với độ cao trung bình 1500m so với mực nước biển, Cầu Đất là huyện kế cận thành phố Đà Lạt hội đủ điều kiện tự nhiên để trồng Mocha ngon. Mocha nơi đây là dòng Cà phê được thế giới yêu thích bởi vị đắng nhẹ, hương thơm nồng nàn và hậu vị ngọt.

Sản phẩm được sản xuất theo quy trình cà phê sạch từ khâu chăm sóc, thu hoạch và lựa chọn quả.  Màu rang chuẩn, nước cà phê sánh có màu hổ phách, hương thơm nồng, vị đắng dịu cùng vị chua thanh khiết trái cây và hậu vị ngọt.  

Thiết kế hộp từ giấy cứng Kraff in hoa văn tạo vẻ mộc mạc của đặc sản truyền thống, ngoài ra đảm bảo bền chắc trong suốt quá trình vận chuyển. Đính kèm theo là chiếc phin inox cao cấp để bạn sẵn sàng thưởng thức một tách Cà phê phin Việt đúng điệu. Một món quà tinh tế, chất lượng chắc chắn sẽ làm hài lòng cả người nhận lẫn người tặng.

', N'caphexaysan6.jpg', 3, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (69, N'Cà phê M’Ja Arabica 100 gram', N'Ký', CAST(530000 AS Decimal(18, 0)), N'Tây Nguyên có diện tích xấp xỉ 51’800 km2 với địa hình núi đá, rừng rậm và đất bazan màu mỡ, chiếm khoảng 16% tổng diện tích đất trồng trọt. Năm cao nguyên của Tây Nguyên có độ cao từ 500m ở phía Bắc dốc dần lên khoảng chừng 1’500m ở phía Nam. Với khí hậu nhiệt đới nhiều nắng, nhiều mưa và đất đỏ bazalt màu mỡ, Tây Nguyên là vùng đất lý tưởng để sản xuất cà phê, với Đắk Lắk và Lâm Đồng là 2 trung tâm. Cầu Đất, địa danh thuộc tỉnh Lâm Đồng, nằm trên một bình nguyên cao tới 1’500m, có điều kiện lý tưởng để trồng cà phê Arabica. Hạt cà phê Arabica vốn có vị chát nhẹ, ít đắng và hương thơm quyến rũ.

Vị đắng nhẹ kèm vị chua thanh khiết trái cây dễ chịu, đặc biệt hậu vị ngọt vương lâu sau khi nhấp từng ngụm.

Sản phẩm chỉ 100 gram , nhỏ gọn thuận tiện làm quà tặng xách tay hoặc dùng thử.

Bao bì giấy trang nhã, mộc mạc mang lại cảm giác ấm áp của đặc sản cà phê truyền thống Việt Nam.', N'caphexaysan7.jpg', 3, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (70, N'Cà phê M’Ja Robusta 250 gram', N'Ký', CAST(750000 AS Decimal(18, 0)), N'Robusta từ vùng đất Buôn Ma Thuột nổi tiếng vì chất Cà phê ngon và vị đậm đà. Đặc biệt, quả Cà phê được chọn lựa từ quá trình quy hoạch nguyên liệu chọn quả tươi cho Chồn ăn nên là loại tốt.

Hạt Cà phê được rang sáng và đều màu. Nước Cà phê màu nâu cánh gián, vị đắng đậm, chua thanh trái cây kèm hậu vị ngọt lâu trên cuống lưỡi.

Cà phê được đựng trong túi PE trong suốt, van hơi một chiều giúp thoát khí nhưng không cho hơi ẩm xâm nhập vào. Zipper kéo tiện dụng tránh sản phẩm bị biến chất trong suốt quá trình sử dụng.

', N'caphexaysan8.jpg', 3, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (71, N'Cà phê M’Ja Robusta 500 gram', N'Ký', CAST(150000 AS Decimal(18, 0)), N'Từ những quả cà phê đỏ mọng được hái thủ công và chế biến theo phương pháp ướt để đạt hiệu suất 100% quả chín, Robusta có vị đắng dễ chịu và đậm ngọt đặc trưng, hương thơm nồng nàn không pha trộn nguyên liệu.

Để có được nguồn nguyên liệu tốt, chúng tôi đã tâm huyết chọn lọc hạt từ những vườn Cà phê chất lượng tại Đắk Lắk. Từ khâu thu hái, tuyển lựa cho đến chế biến, tất cả đều tuân theo qui trình nghiêm ngặt được kiểm soát chặt chẽ nhằm mang đến Cà phê ngon nhất cho người thưởng thức.

Bao bì giấy Kraff thực phẩm trang nhã, thân thiện với môi trường nhưng vẫn đảm bảo chất lượng sản phẩm nhờ màng nhôm phía trong. Van 1 chiều giúp thoát khí nhưng không cho hơi ẩm thâm nhập vào. Gói 500gr dùng lâu và giúp tiết kiệm cho bạn.', N'caphexaysan9.jpg', 3, NULL, NULL, N'Đang bán', 100)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (73, N'Máy pha cà phê Espresso', N'Máy', CAST(4500000 AS Decimal(18, 0)), N'Để có được một tách cà phê ngon và chất lượng thì ngoài việc pha cafe bằng phin, bằng tay, thì hiện nay việc sử dụng máy để pha cà phê không còn quá xa lạ nữa.

Dòng máy pha cà phê WMF espresso là sản phẩm được ra mắt vào năm 2015, có nguồn gốc xuất xứ từ Đức. Là dòng máy được lựa chọn phù hợp cho việc kinh doanh các quán cafe, nhà hàng, khách sạn 5*, thiết kế bắt mắt và tối ưu hoá được nguồn nhân lực nhờ năng suất máy lên tới 300 tách cafe một ngày.', N'mayphacaphe1.jpg', 4, NULL, NULL, N'Đang bán', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (74, N'Máy pha cafe Zojirushi EC-DAQ50', N'Máy', CAST(2500000 AS Decimal(18, 0)), N'Máy pha cafe Zojirushi EC-DAQ50 công suất 650W chính hãng Zojirushi được sản suất trên dây chuyền công nghệ hiện đại, tiên tiến, sẽ cho bạn có được ly cà phê thơm đúng chất, bên cạnh đó máy cũng được chú trọng vào thiết kế với chất liệu hoàn toàn cao cấp, chống trầy xước, cho độ bền cao, mang lại vẻ đẹp sáng bóng cho sản phẩm và sự tinh tế cho căn phòng của bạn.', N'mayphacaphe2.jpg', 4, NULL, NULL, N'Đang bán', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (76, N'Máy pha cà phê HAUSER CE-929 Espresso ', N'Máy', CAST(1700000 AS Decimal(18, 0)), N'Để có được một tách cà phê ngon và chất lượng thì ngoài việc pha cafe bằng phin, bằng tay, thì hiện nay việc sử dụng máy để pha cà phê không còn quá xa lạ nữa.

Dòng máy pha cà phê WMF espresso là sản phẩm được ra mắt vào năm 2015, có nguồn gốc xuất xứ từ Đức. Là dòng máy được lựa chọn phù hợp cho việc kinh doanh các quán cafe, nhà hàng, khách sạn 5*, thiết kế bắt mắt và tối ưu hoá được nguồn nhân lực nhờ năng suất máy lên tới 300 tách cafe một ngày', N'mayphacaphe3.jpg', 4, NULL, NULL, N'Đang bán', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (77, N'Máy Pha Cà Phê Espresso Delonghi ECP31.21', N'Máy', CAST(3600000 AS Decimal(18, 0)), N'Máy Pha Cà Phê Espresso Delonghi ECP31.21 được thiết kế nhỏ gọn, hiện đại, có nhiều ưu điểm vượt trội giúp cho bạn pha cà phê nhanh chóng và kết hợp với gam màu đen tinh tế, sẽ mang đến sự sang trọng và tiện nghi cho không gian bếp nhà bạn.', N'mayphacaphe4.jpg', 4, NULL, NULL, N'Đang bán', 20)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (79, N'Máy xay cà phê Nuova Simonelli MDX', N'Máy', CAST(21000000 AS Decimal(18, 0)), N'Máy xay cà phê Nuova Simonelli MDX là dòng máy xay cà phê với công suất cực lớn được sản xuất bởi thương hiệu nổi tiếng Nuova Simonellia của Ý.', N'mayxaycaphe1.jpg', 5, NULL, NULL, N'Đang bán', 10)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (80, N'Máy xay cà phê Philip Enea', N'Máy', CAST(17000000 AS Decimal(18, 0)), N'Máy xay cà phê Casadio Enea là một sự chọn lựa lý tưởng trong các dòng máy xay cà phê chuyên nghiệp. Từ thiết kế bên ngoài cho đến vật liệu cấu thành máy đều được nhà sản xuất chú trọng và gia công tỉ mỉ để đáp ứng mong muốn của các chủ quán về dòng máy xay cà phê bền đẹp.', N'mayxacaphe2.jpg', 5, NULL, NULL, N'Đang bán', 10)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (82, N'Máy xay cà phê mini Eagle 600N', N'Máy', CAST(11000000 AS Decimal(18, 0)), N'
Eagle – 600N là dòng máy xay cà phê hạt mini bằng điện. Đây là sản phẩm được sản xuất số lượng lớn để phục vụ cho thị trường Trung Quốc và xuất khẩu nhiều nước trên thế giới.', N'mayxaycaphe3.jpg', 5, NULL, NULL, N'Đang bán', 10)
INSERT [dbo].[SANPHAM] ([MaSP], [TenSP], [Donvitinh], [DonGia], [MoTa], [HinhMinhHoa], [MaLoai], [NgayTao], [NgayChinhSua], [TrangThai], [SoLuong]) VALUES (83, N'Máy xay cà phê Robust RMX-60', N'Máy', CAST(500000 AS Decimal(18, 0)), N'Ngay từ những ngày đầu xuất hiện tại thị trường Việt Nam, máy xay cà phê ROBUST RMX-60 đã nhanh chóng đánh bại hầu hết mọi đối thủ ngang tầm khi chứng minh được đẳng cấp trong tốc độ xay nhanh, sự vượt trội về cấu tạo đĩa xay, về hình dáng hiện đại, bắt mắt khác hẳn những chiếc máy xay cà phê khác tại Việt Nam hiện nay.', N'mayxaycaphe4.jpg', 5, NULL, NULL, N'Đang bán', 10)
SET IDENTITY_INSERT [dbo].[SANPHAM] OFF
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
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [FK_SANPHAM_LOAISP] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LOAISP] ([MaLoai])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [FK_SANPHAM_LOAISP]
GO
