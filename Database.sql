USE [QLBienDongDangKyDatDai]
GO
/****** Object:  Table [dbo].[CanBo]    Script Date: 15/02/2022 12:53:11 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CanBo](
	[IDCanBo] [int] IDENTITY(1,1) NOT NULL,
	[IDTo] [int] NULL,
	[HoTenCanBo] [nvarchar](50) NULL,
	[NgaySinh] [smalldatetime] NULL,
	[GioiTinh] [bit] NULL,
	[SDT] [varchar](15) NULL,
	[Email] [varchar](100) NULL,
	[TenDangNhap] [varchar](20) NULL,
	[MatKhau] [varchar](20) NULL,
	[TrangThaiHoatDong] [bit] NULL,
	[SuperAdmin] [bit] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[IDCanBo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoSo]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoSo](
	[IDHoSo] [int] IDENTITY(1,1) NOT NULL,
	[MaHoSo] [int] NULL,
	[IDLoaiHoSo] [int] NULL,
	[IDPhuongXa] [int] NULL,
	[SDTNguoiNopHoSo] [varchar](15) NULL,
	[NguoiChuyenQSDD] [nvarchar](max) NULL,
	[NguoiChuyenDongSoHuu] [bit] NULL,
	[NguoiNhanQSDD] [nvarchar](max) NULL,
	[NguoiNhanDongSoHuu] [bit] NULL,
	[NgayNhanHoSo] [smalldatetime] NULL,
	[NgayTraKQGiaiQuyetHS] [smalldatetime] NULL,
	[NgayBienLai] [smalldatetime] NULL,
	[NgayHenTraGiayChungNhan] [smalldatetime] NULL,
	[PhuongThucTiepNhanHS] [bit] NULL,
	[SoPhieuChuyen] [int] NULL,
	[NgayGiao] [smalldatetime] NULL,
	[SoToTrinh] [int] NULL,
	[NgayToTrinh] [smalldatetime] NULL,
	[NgayTraHoSo] [smalldatetime] NULL,
	[NoiDungTraHoSo] [nvarchar](max) NULL,
	[IDCanBoTiepNhan] [int] NULL,
	[IDCanBoThuLyHoSo] [int] NULL,
	[NgayTraKetQua] [smalldatetime] NULL,
	[LePhi] [decimal](18, 0) NULL,
	[NgayLuuKho] [smalldatetime] NULL,
	[IDTrangThai] [tinyint] NULL,
	[HoSoTrucTuyen] [bit] NULL,
 CONSTRAINT [PK_HoSo] PRIMARY KEY CLUSTERED 
(
	[IDHoSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiHoSo]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHoSo](
	[IDLoaiHoSo] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiHoSo] [nvarchar](50) NULL,
 CONSTRAINT [PK_Loại Hồ Sơ] PRIMARY KEY CLUSTERED 
(
	[IDLoaiHoSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuongXa]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongXa](
	[IDPhuongXa] [int] IDENTITY(1,1) NOT NULL,
	[TenPhuongXa] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phường/Xã] PRIMARY KEY CLUSTERED 
(
	[IDPhuongXa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThaiHoSo]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiHoSo](
	[IDTrangThai] [tinyint] NOT NULL,
	[TenTrangThai] [nvarchar](50) NULL,
 CONSTRAINT [PK_TrangThaiHoSo] PRIMARY KEY CLUSTERED 
(
	[IDTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vHoSo]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vHoSo]
AS
SELECT        A.IDHoSo, A.MaHoSo, A.IDLoaiHoSo, C.TenLoaiHoSo, A.IDPhuongXa, B.TenPhuongXa, A.SDTNguoiNopHoSo, A.NguoiChuyenQSDD, A.NguoiChuyenDongSoHuu, A.NguoiNhanQSDD, A.NguoiNhanDongSoHuu, A.NgayNhanHoSo, 
                         A.NgayTraKQGiaiQuyetHS, A.NgayBienLai, CONVERT(CHAR(10), A.NgayBienLai, 103) AS NgayBienLai_Text, A.PhuongThucTiepNhanHS, 
                         CASE A.PhuongThucTiepNhanHS WHEN 1 THEN N'Trực tuyến' ELSE N'Trực tiếp' END AS TenPhuongThucTiepNhanHS, A.SoPhieuChuyen, A.NgayGiao, A.SoToTrinh, A.NgayToTrinh, A.NgayTraHoSo, A.NoiDungTraHoSo, 
                         A.IDCanBoTiepNhan, A.IDCanBoThuLyHoSo, A.NgayTraKetQua, A.LePhi, A.NgayLuuKho, A.IDTrangThai, D.TenTrangThai, A.NgayHenTraGiayChungNhan, CONVERT(char(10), A.NgayHenTraGiayChungNhan, 103) 
                         AS NgayHenTraGiayChungNhan_Text, B.TenPhuongXa + ' (' + CAST(A.MaHoSo AS varchar) 
                         + ')-' + A.NguoiChuyenQSDD + ' ' + C.TenLoaiHoSo + ' ' + A.NguoiNhanQSDD + + CASE A.PhuongThucTiepNhanHS WHEN 1 THEN N' - Trực tuyến' ELSE N'' END AS TomTatHoSo, E.HoTenCanBo AS CanBoTiepNhan, 
                         F.HoTenCanBo AS CanBoThuLy
FROM            dbo.HoSo AS A INNER JOIN
                         dbo.PhuongXa AS B ON A.IDPhuongXa = B.IDPhuongXa INNER JOIN
                         dbo.LoaiHoSo AS C ON C.IDLoaiHoSo = A.IDLoaiHoSo INNER JOIN
                         dbo.TrangThaiHoSo AS D ON D.IDTrangThai = A.IDTrangThai INNER JOIN
                         dbo.CanBo AS E ON A.IDCanBoTiepNhan = E.IDCanBo LEFT OUTER JOIN
                         dbo.CanBo AS F ON A.IDCanBoThuLyHoSo = F.IDCanBo
GO
/****** Object:  View [dbo].[vDanhSachHoSo_TiepNhan]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vDanhSachHoSo_TiepNhan]
AS
SELECT        IDHoSo, MaHoSo, IDLoaiHoSo, TenLoaiHoSo, IDPhuongXa, TenPhuongXa, SDTNguoiNopHoSo, NguoiChuyenQSDD, NguoiChuyenDongSoHuu, NguoiNhanQSDD, NguoiNhanDongSoHuu, CONVERT(char(10), NgayNhanHoSo, 103) 
                         AS NgayNhanHoSo, CONVERT(char(10), NgayTraHoSo, 103) AS NgayTraHoSo, PhuongThucTiepNhanHS, IDCanBoTiepNhan, CanBoTiepNhan, IDTrangThai, TenTrangThai, TomTatHoSo
FROM            dbo.vHoSo AS A
GO
/****** Object:  Table [dbo].[ChiTietThuaDat]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietThuaDat](
	[IDThuaDat] [int] NOT NULL,
	[IDLoaiDat] [int] NOT NULL,
	[DienTich] [float] NULL,
	[GhiChu] [nvarchar](max) NULL,
	[MucDichSD_ChiTiet] [nvarchar](max) NULL,
	[NgayHinhThanh] [datetime] NULL,
	[SuDungDenNgay] [datetime] NULL,
 CONSTRAINT [PK_ChiTietThuaDat] PRIMARY KEY CLUSTERED 
(
	[IDThuaDat] ASC,
	[IDLoaiDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDat]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDat](
	[IDLoaiDat] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiDat] [nvarchar](50) NULL,
 CONSTRAINT [PK_Loại Đất] PRIMARY KEY CLUSTERED 
(
	[IDLoaiDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vChiTietThuaDat]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vChiTietThuaDat]
AS
SELECT        A.IDThuaDat, A.IDLoaiDat, B.TenLoaiDat, A.DienTich, A.GhiChu, A.MucDichSD_ChiTiet, A.NgayHinhThanh, A.SuDungDenNgay
FROM            dbo.ChiTietThuaDat AS A INNER JOIN
                         dbo.LoaiDat AS B ON B.IDLoaiDat = A.IDLoaiDat
GO
/****** Object:  Table [dbo].[GiayChungNhan]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiayChungNhan](
	[IDGCN] [int] IDENTITY(1,1) NOT NULL,
	[IDHoSo] [int] NULL,
	[SoPhatHanhGCN] [varchar](10) NOT NULL,
	[SoVaoSo] [varchar](50) NULL,
	[NgayKyBia] [smalldatetime] NULL,
 CONSTRAINT [PK_GCN_1] PRIMARY KEY CLUSTERED 
(
	[IDGCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vGiayChungNhan]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vGiayChungNhan]
as
SELECT IDGCN
      ,IDHoSo
      ,SoPhatHanhGCN
      ,SoVaoSo
      ,CONVERT(CHAR(10),NgayKyBia, 103) NgayKyBia
  FROM QLBienDongDangKyDatDai.dbo.GiayChungNhan
GO
/****** Object:  Table [dbo].[ThongTinThuaDat]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinThuaDat](
	[IDThuaDat] [int] IDENTITY(1,1) NOT NULL,
	[IDHoSo] [int] NULL,
	[IDGCN] [int] NULL,
	[ToBanDoSo] [varchar](50) NULL,
	[ThuaDatSo] [varchar](50) NULL,
	[TongDienTich] [float] NULL,
	[QuaTrinhSuDung] [nvarchar](max) NULL,
	[DiaChi] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThongTinThuaDat] PRIMARY KEY CLUSTERED 
(
	[IDThuaDat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vThongTinThuaDat]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vThongTinThuaDat]
AS
SELECT        A.IDThuaDat, A.IDHoSo, A.IDGCN, A.ToBanDoSo, A.ThuaDatSo, A.TongDienTich, A.QuaTrinhSuDung, N'Tờ bản đố số ' + CAST(A.ToBanDoSo AS VARCHAR) + N' - Thửa đất số ' + CAST(A.ThuaDatSo AS VARCHAR) 
                         + N' - Tổng diện tích ' + CAST(A.TongDienTich AS VARCHAR) + N' - Địa chỉ ' + C.GhiChu + ' ' + C.TenPhuongXa + ', Tp.Thái Nguyên' AS TomTatThuaDat
FROM            dbo.ThongTinThuaDat AS A INNER JOIN
                         dbo.HoSo AS B ON B.IDHoSo = A.IDHoSo INNER JOIN
                         dbo.PhuongXa AS C ON C.IDPhuongXa = B.IDPhuongXa
GO
/****** Object:  Table [dbo].[ChucNang]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChucNang](
	[IDChucNang] [int] NOT NULL,
	[TenChucNang] [nvarchar](150) NULL,
	[TenControler] [varchar](250) NULL,
	[TenAction] [varchar](250) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_ChucNang] PRIMARY KEY CLUSTERED 
(
	[IDChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuSuDung]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuSuDung](
	[IDHoGiaDinh] [int] IDENTITY(1,1) NOT NULL,
	[TenChuHo] [nvarchar](max) NULL,
 CONSTRAINT [PK_HoGiaDinh] PRIMARY KEY CLUSTERED 
(
	[IDHoGiaDinh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyenNguoiDung]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyenNguoiDung](
	[IDCanBo] [int] NOT NULL,
	[IDChucNang] [int] NOT NULL,
	[DuocXem] [bit] NOT NULL,
	[DuocSua] [bit] NOT NULL,
 CONSTRAINT [PK_PhanQuyenNguoiDung] PRIMARY KEY CLUSTERED 
(
	[IDCanBo] ASC,
	[IDChucNang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[To]    Script Date: 15/02/2022 12:53:12 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[To](
	[IDTo] [int] IDENTITY(1,1) NOT NULL,
	[TenTo] [nvarchar](150) NULL,
	[IDCanBo] [int] NULL,
 CONSTRAINT [PK_PhongBAn] PRIMARY KEY CLUSTERED 
(
	[IDTo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CanBo] ON 

INSERT [dbo].[CanBo] ([IDCanBo], [IDTo], [HoTenCanBo], [NgaySinh], [GioiTinh], [SDT], [Email], [TenDangNhap], [MatKhau], [TrangThaiHoatDong], [SuperAdmin]) VALUES (1, 1, N'Dương Thị Yến', CAST(N'1999-11-15T00:00:00' AS SmallDateTime), 0, N'060998745', NULL, N'duongyen', N'123654', 1, 1)
SET IDENTITY_INSERT [dbo].[CanBo] OFF
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (1, 1, 40, N'111', N'đ 22 dâd', CAST(N'2021-01-05T00:10:00.000' AS DateTime), CAST(N'2021-01-05T00:10:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (1, 2, 40, N'111', N'234ssss', CAST(N'2021-01-26T00:01:00.000' AS DateTime), CAST(N'2021-01-26T00:01:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (3, 2, 123, N'ư12ww2', N'123', CAST(N'2021-01-08T00:10:00.000' AS DateTime), CAST(N'2021-01-08T00:10:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (8, 4, 50, N'hihi', N'nuôi mèo', CAST(N'1985-01-08T00:01:00.000' AS DateTime), CAST(N'1985-01-08T00:01:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (8, 5, 80, N'hihi', N'nuôi vợ', CAST(N'1985-01-08T00:01:00.000' AS DateTime), CAST(N'1985-01-08T00:01:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (9, 4, 50, N'', N'', CAST(N'2021-01-09T00:01:00.000' AS DateTime), CAST(N'2021-01-09T00:01:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (9, 5, 50, N'', N'', CAST(N'2021-01-09T00:01:00.000' AS DateTime), CAST(N'2021-01-09T00:01:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (10, 2, 150, N'', N'', CAST(N'2021-01-09T00:10:00.000' AS DateTime), CAST(N'2021-01-09T00:10:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (11, 1, 100, N'', N'', CAST(N'2021-01-09T00:10:00.000' AS DateTime), CAST(N'2021-01-09T00:10:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (11, 4, 50, N'', N'', CAST(N'2021-01-09T00:10:00.000' AS DateTime), CAST(N'2021-01-09T00:10:00.000' AS DateTime))
INSERT [dbo].[ChiTietThuaDat] ([IDThuaDat], [IDLoaiDat], [DienTich], [GhiChu], [MucDichSD_ChiTiet], [NgayHinhThanh], [SuDungDenNgay]) VALUES (12, 4, 50, N'', N'', CAST(N'2021-01-09T00:10:00.000' AS DateTime), CAST(N'2021-01-09T00:10:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[GiayChungNhan] ON 

INSERT [dbo].[GiayChungNhan] ([IDGCN], [IDHoSo], [SoPhatHanhGCN], [SoVaoSo], [NgayKyBia]) VALUES (1, 4, N'1', N'2', CAST(N'2021-09-11T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[GiayChungNhan] OFF
SET IDENTITY_INSERT [dbo].[HoSo] ON 

INSERT [dbo].[HoSo] ([IDHoSo], [MaHoSo], [IDLoaiHoSo], [IDPhuongXa], [SDTNguoiNopHoSo], [NguoiChuyenQSDD], [NguoiChuyenDongSoHuu], [NguoiNhanQSDD], [NguoiNhanDongSoHuu], [NgayNhanHoSo], [NgayTraKQGiaiQuyetHS], [NgayBienLai], [NgayHenTraGiayChungNhan], [PhuongThucTiepNhanHS], [SoPhieuChuyen], [NgayGiao], [SoToTrinh], [NgayToTrinh], [NgayTraHoSo], [NoiDungTraHoSo], [IDCanBoTiepNhan], [IDCanBoThuLyHoSo], [NgayTraKetQua], [LePhi], [NgayLuuKho], [IDTrangThai], [HoSoTrucTuyen]) VALUES (1, 1, 1, 2, N'0123654789', N'Trần Văn Tấn', 1, N'Bồ Thị Hạnh', 0, CAST(N'2021-09-23T00:00:00' AS SmallDateTime), NULL, NULL, NULL, 1, 1000, CAST(N'2021-10-06T00:00:00' AS SmallDateTime), 1478, CAST(N'2021-10-08T00:00:00' AS SmallDateTime), CAST(N'2021-10-01T00:00:00' AS SmallDateTime), NULL, 1, 1, NULL, NULL, CAST(N'2021-10-08T21:57:00' AS SmallDateTime), 2, NULL)
INSERT [dbo].[HoSo] ([IDHoSo], [MaHoSo], [IDLoaiHoSo], [IDPhuongXa], [SDTNguoiNopHoSo], [NguoiChuyenQSDD], [NguoiChuyenDongSoHuu], [NguoiNhanQSDD], [NguoiNhanDongSoHuu], [NgayNhanHoSo], [NgayTraKQGiaiQuyetHS], [NgayBienLai], [NgayHenTraGiayChungNhan], [PhuongThucTiepNhanHS], [SoPhieuChuyen], [NgayGiao], [SoToTrinh], [NgayToTrinh], [NgayTraHoSo], [NoiDungTraHoSo], [IDCanBoTiepNhan], [IDCanBoThuLyHoSo], [NgayTraKetQua], [LePhi], [NgayLuuKho], [IDTrangThai], [HoSoTrucTuyen]) VALUES (2, 2, 2, 3, N'0948907245', N'Dương Thị Nguyệt', 1, N'Dương Hồng Hạnh', 0, CAST(N'2021-10-01T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-10-08T00:00:00' AS SmallDateTime), CAST(N'2021-10-20T00:00:00' AS SmallDateTime), 0, NULL, NULL, NULL, NULL, CAST(N'2021-10-03T00:00:00' AS SmallDateTime), NULL, 1, NULL, NULL, NULL, CAST(N'2021-10-08T21:57:00' AS SmallDateTime), 5, NULL)
INSERT [dbo].[HoSo] ([IDHoSo], [MaHoSo], [IDLoaiHoSo], [IDPhuongXa], [SDTNguoiNopHoSo], [NguoiChuyenQSDD], [NguoiChuyenDongSoHuu], [NguoiNhanQSDD], [NguoiNhanDongSoHuu], [NgayNhanHoSo], [NgayTraKQGiaiQuyetHS], [NgayBienLai], [NgayHenTraGiayChungNhan], [PhuongThucTiepNhanHS], [SoPhieuChuyen], [NgayGiao], [SoToTrinh], [NgayToTrinh], [NgayTraHoSo], [NoiDungTraHoSo], [IDCanBoTiepNhan], [IDCanBoThuLyHoSo], [NgayTraKetQua], [LePhi], [NgayLuuKho], [IDTrangThai], [HoSoTrucTuyen]) VALUES (3, 3, 3, 3, N'0475124845', N'Lã Anh Tuấn', 1, N'Nguyễn Tuấn Anh', 0, CAST(N'2021-10-01T00:00:00' AS SmallDateTime), NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, CAST(N'2021-10-04T00:00:00' AS SmallDateTime), NULL, 1, NULL, CAST(N'2021-10-08T00:00:00' AS SmallDateTime), CAST(155555 AS Decimal(18, 0)), CAST(N'2021-10-09T07:33:00' AS SmallDateTime), 5, NULL)
INSERT [dbo].[HoSo] ([IDHoSo], [MaHoSo], [IDLoaiHoSo], [IDPhuongXa], [SDTNguoiNopHoSo], [NguoiChuyenQSDD], [NguoiChuyenDongSoHuu], [NguoiNhanQSDD], [NguoiNhanDongSoHuu], [NgayNhanHoSo], [NgayTraKQGiaiQuyetHS], [NgayBienLai], [NgayHenTraGiayChungNhan], [PhuongThucTiepNhanHS], [SoPhieuChuyen], [NgayGiao], [SoToTrinh], [NgayToTrinh], [NgayTraHoSo], [NoiDungTraHoSo], [IDCanBoTiepNhan], [IDCanBoThuLyHoSo], [NgayTraKetQua], [LePhi], [NgayLuuKho], [IDTrangThai], [HoSoTrucTuyen]) VALUES (4, 6, 3, 9, N'025632145', N'Dương Mai Lan', 1, N'Dương Phương Thảo', 0, CAST(N'2021-10-01T00:00:00' AS SmallDateTime), NULL, NULL, NULL, 1, 12, CAST(N'2021-10-05T00:00:00' AS SmallDateTime), 323, CAST(N'2021-10-14T00:00:00' AS SmallDateTime), CAST(N'2021-10-11T00:00:00' AS SmallDateTime), NULL, 1, 1, NULL, NULL, CAST(N'2021-10-09T07:33:00' AS SmallDateTime), 5, NULL)
INSERT [dbo].[HoSo] ([IDHoSo], [MaHoSo], [IDLoaiHoSo], [IDPhuongXa], [SDTNguoiNopHoSo], [NguoiChuyenQSDD], [NguoiChuyenDongSoHuu], [NguoiNhanQSDD], [NguoiNhanDongSoHuu], [NgayNhanHoSo], [NgayTraKQGiaiQuyetHS], [NgayBienLai], [NgayHenTraGiayChungNhan], [PhuongThucTiepNhanHS], [SoPhieuChuyen], [NgayGiao], [SoToTrinh], [NgayToTrinh], [NgayTraHoSo], [NoiDungTraHoSo], [IDCanBoTiepNhan], [IDCanBoThuLyHoSo], [NgayTraKetQua], [LePhi], [NgayLuuKho], [IDTrangThai], [HoSoTrucTuyen]) VALUES (5, 1008, 1, 28, N'0947526458', N'Trần Thị Tuyết', 0, N'Dương Văn Nam', 0, CAST(N'2021-10-03T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-10-08T00:00:00' AS SmallDateTime), CAST(N'2021-10-13T00:00:00' AS SmallDateTime), 0, 1456, CAST(N'2021-10-07T00:00:00' AS SmallDateTime), 8456, CAST(N'2021-10-08T00:00:00' AS SmallDateTime), CAST(N'2021-10-13T00:00:00' AS SmallDateTime), NULL, 1, 1, CAST(N'2021-10-08T00:00:00' AS SmallDateTime), CAST(100 AS Decimal(18, 0)), CAST(N'2021-10-09T00:06:00' AS SmallDateTime), 5, NULL)
INSERT [dbo].[HoSo] ([IDHoSo], [MaHoSo], [IDLoaiHoSo], [IDPhuongXa], [SDTNguoiNopHoSo], [NguoiChuyenQSDD], [NguoiChuyenDongSoHuu], [NguoiNhanQSDD], [NguoiNhanDongSoHuu], [NgayNhanHoSo], [NgayTraKQGiaiQuyetHS], [NgayBienLai], [NgayHenTraGiayChungNhan], [PhuongThucTiepNhanHS], [SoPhieuChuyen], [NgayGiao], [SoToTrinh], [NgayToTrinh], [NgayTraHoSo], [NoiDungTraHoSo], [IDCanBoTiepNhan], [IDCanBoThuLyHoSo], [NgayTraKetQua], [LePhi], [NgayLuuKho], [IDTrangThai], [HoSoTrucTuyen]) VALUES (6, 2000, 1, 8, N'04875125846', N'Nguyễn Lan Anh', 0, N'Hoàng Thị Mai', 0, CAST(N'2021-10-07T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-10-09T00:00:00' AS SmallDateTime), CAST(N'2021-10-13T00:00:00' AS SmallDateTime), 1, 7485, CAST(N'2021-10-08T00:00:00' AS SmallDateTime), 9748, CAST(N'2021-10-13T00:00:00' AS SmallDateTime), CAST(N'2021-10-20T00:00:00' AS SmallDateTime), NULL, 1, 1, CAST(N'2021-10-09T00:00:00' AS SmallDateTime), CAST(100000 AS Decimal(18, 0)), CAST(N'2021-10-09T07:27:00' AS SmallDateTime), 5, NULL)
INSERT [dbo].[HoSo] ([IDHoSo], [MaHoSo], [IDLoaiHoSo], [IDPhuongXa], [SDTNguoiNopHoSo], [NguoiChuyenQSDD], [NguoiChuyenDongSoHuu], [NguoiNhanQSDD], [NguoiNhanDongSoHuu], [NgayNhanHoSo], [NgayTraKQGiaiQuyetHS], [NgayBienLai], [NgayHenTraGiayChungNhan], [PhuongThucTiepNhanHS], [SoPhieuChuyen], [NgayGiao], [SoToTrinh], [NgayToTrinh], [NgayTraHoSo], [NoiDungTraHoSo], [IDCanBoTiepNhan], [IDCanBoThuLyHoSo], [NgayTraKetQua], [LePhi], [NgayLuuKho], [IDTrangThai], [HoSoTrucTuyen]) VALUES (7, 142, 2, 3, N'04875125846', N'Dương Văn Hà', 0, N'Đồng Thị Kiểm', 0, CAST(N'2021-10-04T00:00:00' AS SmallDateTime), NULL, CAST(N'2021-10-09T00:00:00' AS SmallDateTime), CAST(N'2021-10-21T00:00:00' AS SmallDateTime), 0, NULL, NULL, NULL, NULL, CAST(N'2021-10-14T00:00:00' AS SmallDateTime), NULL, 1, NULL, NULL, NULL, CAST(N'2021-10-09T09:01:00' AS SmallDateTime), 5, NULL)
SET IDENTITY_INSERT [dbo].[HoSo] OFF
SET IDENTITY_INSERT [dbo].[LoaiDat] ON 

INSERT [dbo].[LoaiDat] ([IDLoaiDat], [TenLoaiDat]) VALUES (1, N'ODT')
INSERT [dbo].[LoaiDat] ([IDLoaiDat], [TenLoaiDat]) VALUES (2, N'ONT')
INSERT [dbo].[LoaiDat] ([IDLoaiDat], [TenLoaiDat]) VALUES (3, N'CNL')
INSERT [dbo].[LoaiDat] ([IDLoaiDat], [TenLoaiDat]) VALUES (4, N'BHK')
INSERT [dbo].[LoaiDat] ([IDLoaiDat], [TenLoaiDat]) VALUES (5, N'LUK')
INSERT [dbo].[LoaiDat] ([IDLoaiDat], [TenLoaiDat]) VALUES (6, N'LUC')
INSERT [dbo].[LoaiDat] ([IDLoaiDat], [TenLoaiDat]) VALUES (7, N'NTS')
INSERT [dbo].[LoaiDat] ([IDLoaiDat], [TenLoaiDat]) VALUES (8, N'RSX')
SET IDENTITY_INSERT [dbo].[LoaiDat] OFF
SET IDENTITY_INSERT [dbo].[LoaiHoSo] ON 

INSERT [dbo].[LoaiHoSo] ([IDLoaiHoSo], [TenLoaiHoSo]) VALUES (1, N'CN')
INSERT [dbo].[LoaiHoSo] ([IDLoaiHoSo], [TenLoaiHoSo]) VALUES (2, N'TC')
INSERT [dbo].[LoaiHoSo] ([IDLoaiHoSo], [TenLoaiHoSo]) VALUES (3, N'TK')
INSERT [dbo].[LoaiHoSo] ([IDLoaiHoSo], [TenLoaiHoSo]) VALUES (4, N'CĐ')
INSERT [dbo].[LoaiHoSo] ([IDLoaiHoSo], [TenLoaiHoSo]) VALUES (5, N'CM')
INSERT [dbo].[LoaiHoSo] ([IDLoaiHoSo], [TenLoaiHoSo]) VALUES (6, N'CL')
SET IDENTITY_INSERT [dbo].[LoaiHoSo] OFF
SET IDENTITY_INSERT [dbo].[PhuongXa] ON 

INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (1, N'Cam Giá', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (2, N'Chùa Hang', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (3, N'Gia Sàng', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (4, N'Hoàng Văn Thụ', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (5, N'Hương Sơn', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (6, N'Phan Đình Phùng', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (7, N'Phú Xá', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (8, N'Quang Trung', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (9, N'Quang Vinh', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (10, N'Quán Triều', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (11, N'Thịnh Đán', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (12, N'Trung Thành ', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (13, N'Trưng Vương', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (14, N'Tân Long', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (15, N'Tân Lập', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (16, N'Tân Thành', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (17, N'Tân Thịnh', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (18, N'Tích Lương', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (19, N'Túc Duyên', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (20, N'Đồng Bẩm', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (21, N'Đồng Quang', N'Phường')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (22, N'Cao Ngạn', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (23, N'Huống Thượng', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (24, N'Linh Sơn', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (25, N'Phúc Hà ', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (26, N'Phúc Trìu', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (27, N'Phúc Xuân', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (28, N'Quyết Thắng', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (29, N'Sơn Cẩm', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (30, N'Thịnh Đức', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (31, N'Tân Cương', N'Xã')
INSERT [dbo].[PhuongXa] ([IDPhuongXa], [TenPhuongXa], [GhiChu]) VALUES (32, N'Đồng Liên', N'Xã')
SET IDENTITY_INSERT [dbo].[PhuongXa] OFF
SET IDENTITY_INSERT [dbo].[ThongTinThuaDat] ON 

INSERT [dbo].[ThongTinThuaDat] ([IDThuaDat], [IDHoSo], [IDGCN], [ToBanDoSo], [ThuaDatSo], [TongDienTich], [QuaTrinhSuDung], [DiaChi]) VALUES (1, 2, NULL, N'3', N'4', 5, N'6', N'Tổ 3, p.Tân Thịnh, TP.Thái Nguyên')
INSERT [dbo].[ThongTinThuaDat] ([IDThuaDat], [IDHoSo], [IDGCN], [ToBanDoSo], [ThuaDatSo], [TongDienTich], [QuaTrinhSuDung], [DiaChi]) VALUES (3, 2, NULL, N'123w', N'3', 500, N'123 không chhdh', NULL)
INSERT [dbo].[ThongTinThuaDat] ([IDThuaDat], [IDHoSo], [IDGCN], [ToBanDoSo], [ThuaDatSo], [TongDienTich], [QuaTrinhSuDung], [DiaChi]) VALUES (4, 2, NULL, N'123', N'3', 500, N'hahahahahaa', NULL)
INSERT [dbo].[ThongTinThuaDat] ([IDThuaDat], [IDHoSo], [IDGCN], [ToBanDoSo], [ThuaDatSo], [TongDienTich], [QuaTrinhSuDung], [DiaChi]) VALUES (6, 1, NULL, N'1', N'15', 400, N'', NULL)
INSERT [dbo].[ThongTinThuaDat] ([IDThuaDat], [IDHoSo], [IDGCN], [ToBanDoSo], [ThuaDatSo], [TongDienTich], [QuaTrinhSuDung], [DiaChi]) VALUES (8, 4, NULL, N'2', N'1', 130, N'nuôi chó', NULL)
INSERT [dbo].[ThongTinThuaDat] ([IDThuaDat], [IDHoSo], [IDGCN], [ToBanDoSo], [ThuaDatSo], [TongDienTich], [QuaTrinhSuDung], [DiaChi]) VALUES (9, 1, NULL, N'12', N'142', 100, N'', NULL)
INSERT [dbo].[ThongTinThuaDat] ([IDThuaDat], [IDHoSo], [IDGCN], [ToBanDoSo], [ThuaDatSo], [TongDienTich], [QuaTrinhSuDung], [DiaChi]) VALUES (10, 5, NULL, N'15', N'147', 150, N'', NULL)
INSERT [dbo].[ThongTinThuaDat] ([IDThuaDat], [IDHoSo], [IDGCN], [ToBanDoSo], [ThuaDatSo], [TongDienTich], [QuaTrinhSuDung], [DiaChi]) VALUES (11, 6, NULL, N'12', N'142', 150, N'', NULL)
INSERT [dbo].[ThongTinThuaDat] ([IDThuaDat], [IDHoSo], [IDGCN], [ToBanDoSo], [ThuaDatSo], [TongDienTich], [QuaTrinhSuDung], [DiaChi]) VALUES (12, 6, NULL, N'12', N'740', 50, N'', NULL)
SET IDENTITY_INSERT [dbo].[ThongTinThuaDat] OFF
SET IDENTITY_INSERT [dbo].[To] ON 

INSERT [dbo].[To] ([IDTo], [TenTo], [IDCanBo]) VALUES (1, N'Tổ hành chính', NULL)
INSERT [dbo].[To] ([IDTo], [TenTo], [IDCanBo]) VALUES (2, N'Văn thư', NULL)
INSERT [dbo].[To] ([IDTo], [TenTo], [IDCanBo]) VALUES (3, N'Đăng ký', NULL)
SET IDENTITY_INSERT [dbo].[To] OFF
INSERT [dbo].[TrangThaiHoSo] ([IDTrangThai], [TenTrangThai]) VALUES (1, N'Tiếp nhận')
INSERT [dbo].[TrangThaiHoSo] ([IDTrangThai], [TenTrangThai]) VALUES (2, N'Đã thụ lý')
INSERT [dbo].[TrangThaiHoSo] ([IDTrangThai], [TenTrangThai]) VALUES (3, N'Có biên lai')
INSERT [dbo].[TrangThaiHoSo] ([IDTrangThai], [TenTrangThai]) VALUES (4, N'Đã trả kết quả')
INSERT [dbo].[TrangThaiHoSo] ([IDTrangThai], [TenTrangThai]) VALUES (5, N'Lưu kho')
ALTER TABLE [dbo].[CanBo]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([IDTo])
REFERENCES [dbo].[To] ([IDTo])
GO
ALTER TABLE [dbo].[CanBo] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
ALTER TABLE [dbo].[ChiTietThuaDat]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietThuaDat_LoaiDat] FOREIGN KEY([IDLoaiDat])
REFERENCES [dbo].[LoaiDat] ([IDLoaiDat])
GO
ALTER TABLE [dbo].[ChiTietThuaDat] CHECK CONSTRAINT [FK_ChiTietThuaDat_LoaiDat]
GO
ALTER TABLE [dbo].[ChiTietThuaDat]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietThuaDat_ThongTinThuaDat] FOREIGN KEY([IDThuaDat])
REFERENCES [dbo].[ThongTinThuaDat] ([IDThuaDat])
GO
ALTER TABLE [dbo].[ChiTietThuaDat] CHECK CONSTRAINT [FK_ChiTietThuaDat_ThongTinThuaDat]
GO
ALTER TABLE [dbo].[GiayChungNhan]  WITH CHECK ADD  CONSTRAINT [FK_GiayChungNhan_HoSo] FOREIGN KEY([IDHoSo])
REFERENCES [dbo].[HoSo] ([IDHoSo])
GO
ALTER TABLE [dbo].[GiayChungNhan] CHECK CONSTRAINT [FK_GiayChungNhan_HoSo]
GO
ALTER TABLE [dbo].[HoSo]  WITH CHECK ADD  CONSTRAINT [FK_HoSo_Loại Hồ Sơ] FOREIGN KEY([IDLoaiHoSo])
REFERENCES [dbo].[LoaiHoSo] ([IDLoaiHoSo])
GO
ALTER TABLE [dbo].[HoSo] CHECK CONSTRAINT [FK_HoSo_Loại Hồ Sơ]
GO
ALTER TABLE [dbo].[HoSo]  WITH CHECK ADD  CONSTRAINT [FK_HoSo_NhanVien] FOREIGN KEY([IDCanBoTiepNhan])
REFERENCES [dbo].[CanBo] ([IDCanBo])
GO
ALTER TABLE [dbo].[HoSo] CHECK CONSTRAINT [FK_HoSo_NhanVien]
GO
ALTER TABLE [dbo].[HoSo]  WITH CHECK ADD  CONSTRAINT [FK_HoSo_PhuongXa] FOREIGN KEY([IDPhuongXa])
REFERENCES [dbo].[PhuongXa] ([IDPhuongXa])
GO
ALTER TABLE [dbo].[HoSo] CHECK CONSTRAINT [FK_HoSo_PhuongXa]
GO
ALTER TABLE [dbo].[HoSo]  WITH CHECK ADD  CONSTRAINT [FK_HoSo_TrangThaiHoSo] FOREIGN KEY([IDTrangThai])
REFERENCES [dbo].[TrangThaiHoSo] ([IDTrangThai])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[HoSo] CHECK CONSTRAINT [FK_HoSo_TrangThaiHoSo]
GO
ALTER TABLE [dbo].[PhanQuyenNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyenNguoiDung_ChucNang] FOREIGN KEY([IDChucNang])
REFERENCES [dbo].[ChucNang] ([IDChucNang])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhanQuyenNguoiDung] CHECK CONSTRAINT [FK_PhanQuyenNguoiDung_ChucNang]
GO
ALTER TABLE [dbo].[PhanQuyenNguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyenNguoiDung_NhanVien] FOREIGN KEY([IDCanBo])
REFERENCES [dbo].[CanBo] ([IDCanBo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PhanQuyenNguoiDung] CHECK CONSTRAINT [FK_PhanQuyenNguoiDung_NhanVien]
GO
ALTER TABLE [dbo].[ThongTinThuaDat]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinThuaDat_GiayChungNhan] FOREIGN KEY([IDGCN])
REFERENCES [dbo].[GiayChungNhan] ([IDGCN])
GO
ALTER TABLE [dbo].[ThongTinThuaDat] CHECK CONSTRAINT [FK_ThongTinThuaDat_GiayChungNhan]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 269
               Bottom = 102
               Right = 439
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vChiTietThuaDat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vChiTietThuaDat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vDanhSachHoSo_TiepNhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vDanhSachHoSo_TiepNhan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 266
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 340
               Left = 447
               Bottom = 436
               Right = 617
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 234
               Left = 38
               Bottom = 330
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "E"
            Begin Extent = 
               Top = 155
               Left = 611
               Bottom = 285
               Right = 807
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "F"
            Begin Extent = 
               Top = 147
               Left = 1068
               Bottom = 277
               Right = 1264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 34
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vHoSo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vHoSo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vHoSo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "A"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "B"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 136
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 522
               Bottom = 119
               Right = 692
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vThongTinThuaDat'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vThongTinThuaDat'
GO
