create database QLXNK2
use QLXNK2


create table KHOHANG
(
	MaKhoHang integer identity(1,1) primary key not null,
	LoaiKho	nvarchar(200) not null,
	TenKhohang nvarchar(255) not null,
	DiaChi nvarchar(255) not null,
	SDTKho varchar(20) not null,
)

create table VITRIKHO
(
	MaVTK integer identity(1,1) primary key not null,
	TenVTK nvarchar(255) not null,
	MoTa nvarchar(255),
	MaKhoHang integer not null,
	foreign key (MaKhoHang) references KHOHANG on update cascade
)

create table NHACUNGCAP
(
	MaNCC integer identity(1,1) primary key not null,
	TenNCC nvarchar(255) not null,
	DiachiNCC nvarchar(255) not null,
	SDTNCC varchar(20) not null
)

create table NHOMSANPHAM
(
	MaNhomSP integer identity(1,1) primary key not null,
	TenNhomSP nvarchar(255) not null,
	Mota nvarchar(255)
)

create table SANPHAM
(
	MaSP integer identity(1,1) primary key not null,
	TenSP nvarchar(255) not null,
	Mota nvarchar(255), 
	DonGia float not null,
	DonViTinh varchar(50) not null,
	SoLuongTon integer not null,
	HinhAnh varchar(255),
	KhoiLuong float ,
	MaNCC integer not null,
	MaNhomSP integer not null,
	foreign key (MaNCC) references NHACUNGCAP on update cascade,
	foreign key (MaNhomSP) references NHOMSANPHAM on update cascade
)

create table VITRISP
(
	MaVTSP integer identity(1,1) primary key not null,
	SoLuong integer not null,
	MaSP integer not null,
	MaVTK integer not null,
	foreign key (MaSP) references SANPHAM on update cascade,
	foreign key (MaVTK) references VITRIKHO on update cascade
)

create table DONHANG
(
	MaDH integer identity(1,1) primary key not null,
	KhachHang nvarchar(255) not null,
	DiaChi nvarchar(255) not null,
	SDT varchar(20) not null,
	NgayLapDonHang date not null,
	GiaTriDH float not null
)

create table CHITIETDONHANG
(
	MaCTDH integer identity(1,1) primary key not null,
	MaSP integer not null,
	MaDH integer not null,
	DonGia float not null,
	SoLuong integer not null,
	foreign key (MaSP) references SANPHAM on update cascade,
	foreign key (MaDH) references DONHANG on update cascade
)

create table PHIEUNHAPKHO
(
	MaPNK integer identity(1,1) primary key not null,
	NgayNhap date not null,
	TongTien float not null,
	TongSPNhapKho integer not null,
	MaNCC integer not null,
	foreign key (MaNCC) references NHACUNGCAP on update cascade
)

create table CTPHIEUNHAPKHO
(
	MaCTPNK integer identity(1,1) primary key not null,
	MaSP integer not null,
	MaPNK integer not null,
	DonGia float not null,
	SoLuongNhap integer not null,
	foreign key (MaSP) references SANPHAM on update cascade,
	foreign key (MaPNK) references PHIEUNHAPKHO 
)

create table PHIEUXUATKHO
(
	MaPXK integer identity(1,1) primary key not null,
	NgayXuat date not null, 
	TongTien float not null,
	TongSPXuatKho integer not null
)

create table CTPHIEUXUATKHO
(
	MaCTPXK integer identity(1,1) primary key not null,
	MaSP integer not null,
	MaPXK integer not null,
	DonGia float not null,
	SoLuongXuat integer not null,
	foreign key (MaSP) references SANPHAM on update cascade,
	foreign key (MaPXK) references PHIEUXUATKHO on update cascade
)

create table CHUCVU
(
	MaCV integer identity(1,1) primary key not null,
	TenCV nvarchar(255) not null,
	MoTa nvarchar(255)
)

create table NHANVIEN
(
	MaNV integer identity(1,1) primary key not null,
	TenNV nvarchar(255) not null,
	Email varchar(255) not null,
	MatKhau varchar(50) not null,
	ImgUrl text ,
	MaCV integer not null,
	foreign key (MaCV) references CHUCVU on update cascade
)

