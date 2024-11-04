CREATE DATABASE Project_63133174
Go
USE Project_63133174
Go
Create Table SANPHAM(
	MaSP varchar(10) primary key
	,MaLSP varchar(10)
	,TenSP nvarchar(200)
	,XuatSu nvarchar(100)
	,Nam varchar(10)
	,Gia int
	,DonGia nvarchar(20)
	,HinhAnh varchar(50)
)
Go
Create Table LOAISANPHAM(
	MaLSP varchar(10) primary key
	,TenLSP nvarchar(100)
)
Go
Create Table GIOHANG(
	SoHD varchar(100) primary key
	,MaKH varchar(10)
	,MaSP varchar(10)
	,NgayDat date
	,NgayGiao date
	,TongTien int
	,DonGia nvarchar(20)
)
Go
Create Table KHACHHANG(
	MaKH varchar(10) primary key
	,HoTen nvarchar(100)
	,DiaChi nvarchar (200)
	,SDT varchar(10)
	,Email varchar(50)
	,MatKhau varchar(50)
)
Go
Create Table NHANVIEN(
	MaNV varchar(10) primary key
	,HoTen nvarchar(100)
	,Email varchar(50)
	,MatKhau varchar(50)
	,Quyen nvarchar(50)
)

Go
Alter table SANPHAM
add constraint fk_sp
foreign key (MaLSP)
references LOAISANPHAM(MaLSP)
Go
ALTER TABLE GIOHANG
ADD CONSTRAINT FK_KhachHang_GioHang
FOREIGN KEY (MaKH)
REFERENCES KHACHHANG(MaKH);
Go
ALTER TABLE GIOHANG
ADD CONSTRAINT FK_SanPham_GioHang
FOREIGN KEY (MaSP)
REFERENCES SANPHAM(MaSP);

---Thêm dữ liệu
Go
Insert into LOAISANPHAM(MaLSP, TenLSP) values
('SenDa', N'Sen Đá')
Go
Insert into SANPHAM(MaSP, MaLSP, TenSP, XuatSu, Nam, Gia, DonGia, HinhAnh) values
('SD01', 'SenDa', N'Sen đá nâu', N'Mexico', '2023', 100000, N'100.000 VNĐ', 'Sendanau.jpg' ),
('SD02', 'SenDa', N'Sen đá Phật Bà', N'Ấn Độ', '2023', 110000, N'110.000 VNĐ', 'Senphatba.jpg' ),
('SD03', 'SenDa', N'Sen đá Dù Hồng', N'Trung Quốc', '2023', 100000, N'100.000 VNĐ', 'Senduhong.jpg' ),
('SD04', 'SenDa', N'Sen đá thạch ngọc đỏ', N'Việt Nam', '2023', 80000, N'80.000 VNĐ', 'Senthachngocdo.jpg' ),
('SD05', 'SenDa', N'Sen đá thạch ngọc xanh', N'Việt Nam', '2023', 80000, N'80.000 VNĐ', 'Senthachngocxanh.jpg' ),
('SD06', 'SenDa', N'Sen đá thạch ngọc vàng', N'Việt Nam', '2023', 80000, N'80.000 VNĐ', 'Senthachngocvang.jpg' ),
('SD07', 'SenDa', N'Sen đá thạch bích', N'Trung Quốc', '2023', 130000, N'130.000 VNĐ', 'Senthachbich.jpg' ),
('SD08', 'SenDa', N'Sen đá thái', N'Thái', '2023', 90000, N'90.000 VNĐ', 'Senthai.jpg' ),
('SD09', 'SenDa', N'Sen đá ruby', N'Việt Nam', '2023', 150000, N'150.000 VNĐ', 'Senruby.jpg' ),
('SD10', 'SenDa', N'Sen đá tứ phương', N'Việt Nam', '2023', 110000, N'110.000 VNĐ', 'Sentuphuong.jpg' ),
('SD11', 'SenDa', N'Sen đá dola Hồng', N'Mỹ', '2023', 300000, N'300.000 VNĐ', 'Sendolahong.jpg' ),
('SD12', 'SenDa', N'Sen đá dola Trắng', N'Mỹ ', '2023', 250000, N'250.000 VNĐ', 'Sendolatrang.jpg' ),
('SD13', 'SenDa', N'Sen đá Ống điếu', N'Mỹ', '2023', 150000, N'150.000 VNĐ', 'Senongdieu.jpg' ),
('SD14', 'SenDa', N'Sen đá kim cương xanh', N'Pháp', '2023', 150000, N'150.000 VNĐ', 'Senkimcuongxanh.jpg' ),
('SD15', 'SenDa', N'Sen đá kim cương trắng', N'Pháp', '2023', 300000, N'300.000 VNĐ', 'Senkimcuongtrang.jpg' ),
('SD16', 'SenDa', N'Sen đá tím', N'Pháp', '2023', 150000, N'150.000 VNĐ', 'Sentim.jpg' ),
('SD17', 'SenDa', N'Sen đá mặt trời', N'Pháp', '2023', 110000, N'110.000 VNĐ', 'Senmattroi.jpg' ),
('SD18', 'SenDa', N'Sen đá mặt trăng', N'Pháp', '2023', 250000, N'250.000 VNĐ', 'Senmattrang.jpg' ),
('SD19', 'SenDa', N'Sen đá sedum vàng', N'Đức', '2023', 300000, N'300.000 VNĐ', 'Sensedumvang.jpg' ),
('SD20', 'SenDa', N'Sen đá sedum xanh', N'Đức', '2023', 150000, N'150.000 VNĐ', 'Sensedumxanh.jpg' ),
('SD21', 'SenDa', N'Sen đá sedum rong biển', N'Đức', '2023', 110000, N'110.000 VNĐ', 'Sensedumrongbien.jpg' ),
('SD22', 'SenDa', N'Sen đá trái tim', N'Hàn Quốc', '2023', 300000, N'300.000 VNĐ', 'Sentraitim.jpg' ),
('SD23', 'SenDa', N'Sen đá tai thỏ', N'Hàn Quốc', '2023', 250000, N'250.000 VNĐ', 'Sentaitho.jpg' ),
('SD24', 'SenDa', N'Sen đá kim', N'Hàn Quốc', '2023', 300000, N'300.000 VNĐ', 'Senkim.jpg' ),
('SD25', 'SenDa', N'Sen đá gấm', N'Hàn Quốc', '2023', 150000, N'150.000 VNĐ', 'Sengam.jpg' ),
('SD26', 'SenDa', N'Sen đá móng rồng', N'Châu Phi', '2023', 110000, N'110.000 VNĐ', 'Senmongrong.jpg' ),
('SD27', 'SenDa', N'Sen đá nhím đen', N'Châu Phi', '2023', 250000, N'250.000 VNĐ', 'Sennhimden.jpg' ),
('SD28', 'SenDa', N'Sen đá chuỗi ngọc', N'Châu Phi', '2023', 300000, N'300.000 VNĐ', 'Senchuoingoc.jpg' ),
('SD29', 'SenDa', N'Sen đá Gilva', N'Việt Nam', '2023', 150000, N'150.000 VNĐ', 'Sengilva.jpg' ),
('SD30', 'SenDa', N'Sen đá kim lam', N'Việt Nam', '2023', 300000, N'300.000 VNĐ', 'Senkimlam.jpg' )



Go
Insert into KHACHHANG(MaKH, HoTen, DiaChi, SDT, Email, MatKhau) values
('01', N'Lê Quang Huy', N'71/26 Trần Phú', '0359109658','huy.lq@gmail.com','quanghuy123'),
('02', N'Nguyễn Phước Khang', N'69/9 Tây Hải', '0358357823','khang.np@gmail.com','phuockhang123'),
('03', N'Lê Quốc Huy', N'2/11 Dã Tượng', '0352471237','huy.lm@gmail.com','quochuy123'),
('04', N'Dương Công Hiếu', N'5/12/13 Hỏa Tiễn', '0353476928','hieu.dc@gmail.com','conghieu123'),
('05', N'Trần Vũ Minh', N'Thôn Phước Tân - Xã Phước Đồng', '0351962357','minh.vt@gmail.com','vuminh123'),
('06', N'Lê Đức Cảnh', N'71/26 Trần Phú', '0359109658','huy.lq@gmail.com','quanghuy123'),
('07', N'Vũ Diễm My', N'71/26 Trần Phú', '0359109658','huy.lq@gmail.com','quanghuy123'),
('08', N'Joe Nguyen', N'36 GreenWood stress', '0352147692','joe.nguyen@gmail.com','joenguyen123'),
('09', N'Jessica Tran', N'22/12 MixSquare', '0351258266','jessica.tran@gmail.com','jessica123'),
('10', N'Jonathan Quach', N'256 Maxwell', '0352148534','jonathan.quach@gmail.com','jonathan123'),
('11', N'Nguyễn Thế Công', N'43 Tôn Thất Tùng', '0357246798','cong.tn@gmail.com','thecong123'),
('12', N'Mạc Đĩnh Cao', N'42/12 Mạc Đĩnh Chi', '0352146641','chi.md@gmail.com','dinhchi123'),
('13', N'Cao Bá Đạo', N'213/23/3 Cao Bá Quát', '0359869034','dao.bc@gmail.com','badao123'),
('14', N'Phan Thành Đạt', N'55/1 Phan Văn Trị', '0357281398','dat.tp@gmail.com','thanhdat123'),
('15', N'Đào Thế Giang', N'124 Đào Bá Lộc', '0358735682','giang.bd@gmail.com','thegiang123'),
('16', N'Xing Xuan', N'66/5/1 Taobao', '0352223982','xuan.xing@gmail.com','xingxuan123'),
('17', N'Maria Hill', N'597 Mason', '0351111234','maria.h@gmail.com','maria123'),
('18', N'Monica Reambau', N'768 Calisa', '0356968992','monica.rb@gmail.com','monica123'),
('19', N'Scarlet Hill', N'5/2/1 Ykohama', '0351285028','scarlet.h@gmail.com','scarlet123'),
('20', N'Hank Host', N'5523 NewWorld', '0351285387','hank.h@gmail.com','hankhost123')

Go
Insert into NHANVIEN(MaNV, HoTen, Email, MatKhau, Quyen) values
('NV01', N'Nguyễn Minh Tâm','tam.mn@gmail.com', 'tam123', N'Quản lí'),
('NV02', N'Trần Bảo Khoa','khoa.tb@gmail.com', 'khoa123', N'Nhân Viên'),
('NV03', N'Minh Dự','du.m@gmail.com', 'du123', 'Nhân Viên'),
('NV04', N'Nguyễn Thị Ngọc Bích','bich.nt@gmail.com', 'bich123', N'Nhân Viên'),
('NV05', N'Hà Anh Tuấn','tuan.ha@gmail.com', 'tuan123', N'Nhân Viên'),
('NV06', N'Trung Quân','quan.t@gmail.com', 'quan123', N'Nhân Viên'),
('NV07', N'Trần Mỹ Tâm','tam.m@gmail.com', 'tammy123', N'Nhân Viên'),
('NV08', N'Lâm Tâm Sự','su.tl@gmail.com', 'su123', N'Nhân Viên'),
('NV09', N'Hồ Ngọc Qúi','qui.hn@gmail.com', 'qui123', N'Nhân Viên'),
('NV10', N'Kiều Nga','nga.k@gmail.com', 'nga123', N'Nhân Viên')

Go
Insert into GIOHANG(SoHD,MaKH,MaSP,NgayDat,NgayGiao,TongTien,DonGia) values
('HD01','01','SD10', '2023-10-20', '2023-10-22', 110000, N'110.000 VNĐ'),
('HD02','03','SD09', '2023-10-21', '2023-10-22', 150000, N'150.000 VNĐ'),
('HD03','05','SD08', '2023-10-25', '2023-10-26', 90000, N'90.000 VNĐ'),
('HD04','07','SD07', '2023-10-23', '2023-10-29', 130000, N'130.000 VNĐ'),
('HD05','09','SD06', '2023-10-23', '2023-10-28', 80000, N'80.000 VNĐ')

Go
--Tìm kiếm sản phẩm User
CREATE PROCEDURE Search
 @TenSP NVARCHAR(200)=NULL
AS
BEGIN 
	SELECT *
    FROM SANPHAM
    WHERE TenSP LIKE '%' + @TenSP + '%'
	

END
Go
-------------------
--Tìm kiếm nhân viên
CREATE PROCEDURE NhanVien_TimKiem1
    @MaNV varchar(8)=NULL,
	@HoTen nvarchar(40)=NULL,
	@Email varchar(50)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM NHANVIEN
       WHERE  (1=1)
       '
IF @MaNV IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaNV LIKE ''%'+@MaNV+'%'')
              '
IF @HoTen IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (HoTen LIKE N''%'+@HoTen+'%'')
              '
IF @Email IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (Email LIKE ''%'+@Email+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr
END
Go
--Tìm kiếm sản phẩm
CREATE PROCEDURE SanPham_TimKiem1
	@TenSP nvarchar(200)=NULL,
    @MaSP varchar(8)=NULL,
	@MaLSP varchar(40)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM SANPHAM
       WHERE  (1=1)
       '
IF @TenSP IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (TenSP LIKE ''%'+@TenSP+'%'')
              '

IF @MaSP IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaSP LIKE ''%'+@MaSP+'%'')
              '
IF @MaLSP IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaLSP LIKE N''%'+@MaLSP+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr
END
--Tìm kiếm khách hàng
Go
CREATE PROCEDURE KhachHang_TimKiem1
    @MaKH varchar(8)=NULL,
	@HoTen nvarchar(40)=NULL,
	@DiaChi nvarchar(70)=NULL,
	@SDT varchar(10)=NULL,
	@Email varchar(50)=NULL
AS
BEGIN
DECLARE @SqlStr NVARCHAR(4000),
		@ParamList nvarchar(2000)
SELECT @SqlStr = '
       SELECT * 
       FROM KHACHHANG
       WHERE  (1=1)
       '
IF @MaKH IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (MaKH LIKE ''%'+@MaKH+'%'')
              '
IF @HoTen IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (HoTen LIKE N''%'+@HoTen+'%'')
              '
IF @DiaChi IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (DiaChi LIKE N''%'+@DiaChi+'%'')
              '
IF @Email IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (Email LIKE ''%'+@Email+'%'')
              '
IF @SDT IS NOT NULL
       SELECT @SqlStr = @SqlStr + '
              AND (SDT LIKE ''%'+@SDT+'%'')
              '
	EXEC SP_EXECUTESQL @SqlStr
END

