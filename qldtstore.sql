SELECT * FROM quanlydetai.giaovien;

delimiter //
drop procedure if exists sp_InsertGiaoVien;
create procedure sp_InsertGiaoVien(
	in pHoTen varchar(40),
    in pLuong decimal,
    in pPhai varchar(3),
    in pNgaySinh date,
    in pDiaChi varchar(50),
    in pGVQLCM varchar(3),
    inout pMABM varchar(3),
    out pMessage varchar(200)
)
begin
	declare maxMAGV decimal;
    declare strMAGV varchar(3);
    set maxMAGV = cast((SELECT MAGV FROM quanlydetai.giaovien order by MAGV desc limit 1) as decimal);
    set maxMAGV = maxMAGV + 1;
    if(maxMAGV<10) then
		set strMAGV = concat('00', maxMAGV);
	end if;
	if(maxMAGV<100) then
		set strMAGV = concat('0', maxMAGV);
	end if;
	if(maxMAGV<1000) then
		set strMAGV = maxMAGV;
	end if;
	if(exists (select * from bomon where bomon.MABM = pMABM)) then
		insert into giaovien(MAGV,HOTEN,LUONG,PHAI,NGSINH,DIACHI,GVQLCM,MABM) values
		(strMAGV,pHoTen,pLuong,pPhai,pNgaySinh,pDiaChi,pGVQLCM,pMABM);
        set pMaGV = strMaGV;
        else
			set pMessage = "Ma bo mon khong ton tai";
	end if;
end;//
DELIMITER ;

DELIMITER //

DROP procedure  if exists `sp_xoamotkhoa`;
CREATE PROCEDURE `sp_xoamotkhoa`(
in pTenKhoa varchar(40),
out pMessage varchar(50)
)
BEGIN
	declare pMakhoa varchar(10);
    set pMakhoa = (select khoa.makhoa from khoa
	where khoa.tenkhoa = pTenKhoa);
if 
	exists (select khoa.makhoa from khoa
	where khoa.tenkhoa = pTenKhoa)
then 
	UPDATE bomon SET bomon.makhoa = NULL WHERE bomon.makhoa = pMakhoa;
	DELETE FROM khoa WHERE khoa.makhoa = pMakhoa;

else
		set pMessage = 'ten khoa khong co trong danh sach';
	end if;
END//

DELIMITER ; 


DELIMITER //

Drop procedure if exists `sp_themcongviec`;
CREATE PROCEDURE `sp_themcongviec`(
in Ptencongviec varchar(50),
in Pmadetai varchar(3),
in Pmagiaovien varchar(3),
in Pngaybatdau date,
in Pngayketthuc date,
out Pmessage varchar(50)
)
BEGIN

-- nhập vào: tên công việc, mã đề tài, mã giáo viên
-- b1: nhập tên công việc
-- b2: nhập mã đề tài
-- b3: nhập mã giáo viên tham gia
-- check: 
-- + mã đề tài xem có trong danh sách hay không, nếu không có alert = 'mã đề tài không có trong danh sách';
-- + check SOTT tăng dần
-- + check mã giáo viên có trong danh sách hay không, nếu không có alert = 'mã giáo viên không có trong danh sách';

	declare maxSOTT int;
		set maxSOTT = (select max(congviec.sott) from congviec where madt = Pmadetai group by madt);
		set maxSOTT = maxSOTT + 1;		

-- cach 1;

-- if 
-- exists(select detai.madt from detai where detai.madt = Pmadetai)  
-- and exists(select giaovien.magv from giaovien where giaovien.magv = Pmagiaovien)
-- en
-- insert into congviec(madt,sott,tencv)
-- values(Pmadetai,maxSOTT,Ptencongviec);
--   insert into thamgiadt(magv,madt,stt)
--    values(Pmagiaovien,Pmadetai,maxSOTT);
-- else
-- set Pmessage = 'ma id detai hoc giaovien khong ton tai';

-- cach 2;
if
	not exists(select detai.madt from detai where detai.madt = Pmadetai) 
    then  set Pmessage = 'ma id detai khong ton tai';
elseif
	not exists(select giaovien.magv from giaovien where giaovien.magv = Pmagiaovien)
    then  set Pmessage = 'ma id giaovien khong ton tai';
-- elseif
--	not exists(select congviec.madt from congviec where congviec.madt = Pmadetai)
--    then  set Pmessage = 'de tai nay chua co cong viec nao';
elseif
	exists(select congviec.tencv from congviec
    where congviec.tencv = Ptencongviec and congviec.madt = Pmadetai)
    then set Pmessage = 'ten cong viec da ton tai trong he thong';
else
	if
		not exists(select congviec.madt from congviec where congviec.madt = Pmadetai)
		then
        insert into congviec(madt,sott,tencv,ngaybd,ngaykt)
		values(Pmadetai,1,Ptencongviec,Pngaybatdau,Pngayketthuc);
		insert into thamgiadt(magv,madt,stt)
		values(Pmagiaovien,Pmadetai,1);
    else
		insert into congviec(madt,sott,tencv,ngaybd,ngaykt)
		values(Pmadetai,maxSOTT,Ptencongviec,Pngaybatdau,Pngayketthuc);
		insert into thamgiadt(magv,madt,stt)
		values(Pmagiaovien,Pmadetai,maxSOTT);
     end if;

end if;
END//

DELIMITER ;

delimiter //
drop procedure if exists sp_themcongviecNhieuGiaoVien;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_themcongviecNhieuGiaoVien`(
in pMaGV varchar(300)
)
BEGIN
    -- Kiểm tra dữ liệu nhập vào của bảng công việc
    -- Các bạn thêm vào bảng công việc ở đây
    set @lenghtCount = LENGTH(pMaGV) - LENGTH(replace(pMaGV, ',', '')) +1;
    set @item = 0;
	CREATE TEMPORARY TABLE if not exists tb_giaovien  (
		MaGV varchar(3)
    );
    while @item < @lenghtCount do
		set @valueMaGV = SUBSTR(pMaGV, 1 + 4*@item, 3);
        set @item = @item+1;
        -- Các bạn thêm vào bảng tham gia đề tài ở đây
		insert into `tb_giaovien`(MaGV) values (@valueMaGV);
	end while;
    select * from tb_giaovien;
    drop table tb_giaovien;
END //

Delimiter ;