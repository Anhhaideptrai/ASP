use master
create database BDSdb
use BDSdb
-----------------------
-----------------------
CSDL gồm các 
	table: loaitintuc, tintuc, sanpham, hopdong, nhanvien, nguoidung, tinh, quanhuyen, vitri, hinhanh
			duan,loaisp, motachitiet
	Procedure:
-----------------------
-----------------------


create table loaitintuc_dropdown(
id_loaitintuc nchar(50) not null primary key,
loaitin nvarchar(100)
)
-----------------------------------------------------
-----------------------------------------------------
create table tintuc(
id_loaitintuc nchar(50) not null,
id_tintuc nchar(25) not null primary key,
constraint FK_LOAI_TINTUC foreign key(id_loaitintuc) references loaitintuc_dropdown(id_loaitintuc),
ten_tintuc nvarchar(100) ,
noidung_tintuc ntext,
hinhanh_tintuc nvarchar(50),
ngaydang_tintuc date,
);
-----------------------------------------------------
-----------------------------------------------------
create table tinh_search(
id_tinh nchar(50) not null primary key,
ten_tinh nvarchar(100),
);
-----------------------------------------------------
-----------------------------------------------------
create table tinh_quanhuyen_search(
id_quanhuyen nchar(50) not null primary key,
id_tinh nchar(50) not null,
constraint FK_Tinh_QuanHuyen foreign key(id_tinh) references tinh_search(id_tinh),
ten_quanhuyen nvarchar(100),
);
-----------------------------------------------------
-----------------------------------------------------
create table vitri(
id_vitri nchar(50) not null primary key,
ten_vitri nvarchar(100),
mota_vitri ntext
);
-----------------------------------------------------
----------------------------------------------------- 
create table loaisp_dropdown(
id_loaisp nchar(50) not null primary key,---VD: 1PN, 2PN,...
ten_loaisp nvarchar(100),
mota ntext ,
);
----------------------------------------------------
----------------------------------------------------
create table nguoidung(
id_nguoidung nchar(50) not null primary key,
ten_dangnhap nvarchar(100),
matkhau_nguoidung nchar(50),
email nvarchar(50),
sdt_nguoidung nchar(15),
trangthai_hoatdong int,----0 or 1
);
---------------------------------------------------
---------------------------------------------------
create table nhanvien(
id_nhanvien nchar(50) not null primary key,
ten_nv nvarchar(50),
gioitinh nvarchar(50),
email nvarchar(50),
sdt_nv nchar(15),
);
---------------------------------------------------
---------------------------------------------------
create table hopdong(
id_hopdong nchar(50) not null primary key,---mã số hợp đồng
id_nhanvien nchar(50) not null,
id_nguoidung nchar(50),
constraint FK_hopdong_nguoidung foreign key(id_nguoidung) references nguoidung(id_nguoidung),
constraint FK_hopdong_nhanvien foreign key(id_nhanvien) references nhanvien(id_nhanvien),
sotien_coc money,
ngay_lam_hopdong date,
diachi nvarchar(100),
);
---------------------------------------------------
---------------------------------------------------
create table duan(
id_duan nchar(50) not null primary key,
ten_duan nvarchar(100),
mota_duan ntext,
);
---------------------------------------------------
---------------------------------------------------
create table hinhanh(
id_hinhanh nchar(50) not null primary key,
hinhanh image,--thắc mắc chỗ này
);
----------------------------------------------------
----------------------------------------------------
create table sanpham(
id_sanpham nchar(50) not null primary key,
ten_sanpham nvarchar(100),
NgayNhap date,
gia money,
mota_soluoc ntext,
trangthai nchar(50),
huong nvarchar(50),---Đông, Tây, Nam, ....
hinhanh image,---thắc mắc chỗ này
id_loaisp nchar(50) not null,
id_vitri nchar(50) not null,
id_quanhuyen nchar(50),
id_nguoidung nchar(50),
id_duan nchar(50) not null,
constraint FK_sanpham_loaisp foreign key(id_loaisp) references loaisp_dropdown(id_loaisp),
constraint FK_sanpham_vitri foreign key(id_vitri) references vitri(id_vitri),
constraint FK_sanpham_quanhuyen foreign key(id_quanhuyen) references tinh_quanhuyen_search(id_quanhuyen),
constraint FK_sanpham_nguoidung foreign key(id_nguoidung) references nguoidung(id_nguoidung),
constraint FK_sanpham_duan foreign key(id_duan) references duan(id_duan),
);
----------------------------------------------------
----------------------------------------------------
create table sanpham_hinhanh(
id_hinhanh nchar(50) not null,
id_sanpham nchar(50) not null,
constraint FK_sanpham_hinhanh foreign key(id_hinhanh) references hinhanh(id_hinhanh),
constraint FK_sanpham_hinhanh2 foreign key(id_sanpham) references sanpham(id_sanpham),
);
----------------------------------------------------
---------------------bảng này sẽ cần xem lại: lấy thêm id_hinhanh, id_loaisp, ----------------------------
create table motachitiet(
	id_motachitiet nchar(50) not null primary key,
	id_sanpham nchar(50), 
	soTang int, 
	chieudai float,
	chieurong float,
	so_phongngu int,
	so_toilet int,
	phaply nvarchar(100),----sổ đỏ chính chủ,....
	dientic float,---- đối tượng được sinh ra
	constraint FK_motachitiet_sanpham foreign key(id_sanpham) references sanpham(id_sanpham),
);
---------------------------------------------------
---------------------------------------------------


