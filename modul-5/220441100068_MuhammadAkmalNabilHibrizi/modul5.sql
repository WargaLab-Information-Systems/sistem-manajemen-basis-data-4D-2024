create database db_pabrik;
use db_pabrik;

create table produk(
id_produk int(11) primary key,
nama_produk varchar(100),
kategori varchar(50),
harga double,
berat float);

insert into produk(id_produk, nama_produk, kategori, harga, berat)
values
(1, 'Kemeja Pria Polos', 'Kemeja', 150000, 0.3),
(2, 'Blus Wanita Motif Bunga', 'Blus', 120000, 0.25),
(3, 'Celana Jeans Slim Fit', 'Celana', 200000, 0.5),
(4, 'Dress Formal Putih', 'Dress', 250000, 0.4),
(5, 'Kaos Lengan Panjang', 'Kaos', 80000, 0.2),
(6, 'Jaket Bomber Unisex', 'Jaket', 300000, 0.6),
(7, 'Rok Pendek Denim', 'Rok', 100000, 0.3),
(8, 'Hoodie Sweater Anak', 'Sweater', 90000, 0.4),
(9, 'Setelan Kemeja dan Celana', 'Setelan', 280000, 0.7),
(10, 'Gaun Pesta Sequin', 'Gaun', 350000, 0.8);

create table gudang(
id_gudang int(11) primary key,
nama varchar(100),
alamat varchar(255)
);

insert into gudang (id_gudang, nama, alamat) 
values
(1, 'Gudang Utama', 'Jl. Raya No. 10'),
(2, 'Gudang Pusat', 'Jl. Merdeka No. 25'),
(3, 'Gudang Barat', 'Jl. Veteran No. 30'),
(4, 'Gudang Timur', 'Jl. A. Yani No. 15'),
(5, 'Gudang Selatan', 'Jl. Sudirman No. 40'),
(6, 'Gudang Bawah', 'Jl. Cendrawasih No. 8'),
(7, 'Gudang Atas', 'Jl. Pahlawan No. 12'),
(8, 'Gudang Tengah', 'Jl. Diponegoro No. 20'),
(9, 'Gudang Depan', 'Jl. Gajah Mada No. 5'),
(10, 'Gudang Belakang', 'Jl. Imam Bonjol No. 18');

create table supplier(
id_supplier int(11) primary key,
nama_supplier varchar(100),
alamat varchar(255),
telepon char(15),
email varchar(100)
);

insert into supplier (id_supplier, nama_supplier, alamat, telepon, email) 
values
(1, 'PT Fashion Trends', 'Jl. Gatot Subroto No. 50', '081234567890', 'info@fashiontrends.com'),
(2, 'CV Mode Berkah', 'Jl. Pangeran Diponegoro No. 12', '085678901234', 'contact@modeberkah.co.id'),
(3, 'UD Busana Cemerlang', 'Jl. Teuku Umar No. 15', '082345678901', 'busanacemerlang@gmail.com'),
(4, 'PT Glamour Style', 'Jl. Sudirman No. 25', '081234567890', 'glamourstyle@outlook.com'),
(5, 'CV Urban Chic', 'Jl. Merdeka No. 18', '085678901234', 'urbanchic@yahoo.com'),
(6, 'PT Style Creations', 'Jl. Veteran No. 30', '082345678901', 'stylecreations@outlook.com'),
(7, 'CV Trendy Wear', 'Jl. Pahlawan No. 5', '081234567890', 'trendywear.cv@gmail.com'),
(8, 'PT Elegance Mode', 'Jl. A. Yani No. 40', '085678901234', 'elegancemode@outlook.com'),
(9, 'UD Glamourous Fashion', 'Jl. Gajah Mada No. 10', '082345678901', 'glamourousfashion.ud@yahoo.com'),
(10, 'CV Classic Styles', 'Jl. Imam Bonjol No. 8', '081234567890', 'classicstyles.cv@gmail.com');

create table stok(
id_stok int(11) primary key,
id_produk int(11),
id_gudang int(11),
jumlah int(11),
tanggal_update datetime,
foreign key(id_produk) references produk(id_produk),
foreign key(id_gudang) references gudang(id_gudang)
);

insert into stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) 
values
(1, 1, 1, 200, '2024-05-02 10:00:00'),
(2, 2, 2, 150, '2024-02-20 11:30:00'),
(3, 3, 3, 100, '2024-01-20 12:45:00'),
(4, 4, 4, 80, '2023-07-20 14:00:00'),
(5, 5, 5, 300, '2023-08-20 15:20:00'),
(6, 6, 6, 50, '2023-09-20 16:40:00'),
(7, 7, 7, 120, '2024-04-02 18:00:00'),
(8, 8, 8, 90, '2024-04-14 19:15:00'),
(9, 9, 9, 150, '2024-04-15 20:30:00'),
(10, 10, 10, 180, '2024-04-16 21:45:00');

drop table stok;
create table karyawan(
id_karyawan int(11) primary key,
id_gudang int(11),
nama varchar(100),
alamat varchar(255),
posisi varchar(50),
gaji double,
foreign key(id_gudang) references gudang(id_gudang)
);

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 1, 'Sehun', 'Jl. Mangga Besar No. 10', 'Manager', 15000000),
(2, 2, 'Chen', 'Jl. Cendrawasih No. 20', 'Supervisor', 10000000),
(3, 3, 'Baekyhun', 'Jl. Diponegoro No. 30', 'Staff', 7000000),
(4, 4, 'Chanyeol', 'Jl. A. Yani No. 40', 'Staff', 7000000),
(5, 5, 'Jaemin', 'Jl. Sudirman No. 50', 'Supervisor', 10000000),
(6, 6, 'Chenle', 'Jl. Veteran No. 60', 'Staff', 7000000),
(7, 7, 'Renjun', 'Jl. Pahlawan No. 70', 'Manager', 15000000),
(8, 8, 'Haechan', 'Jl. Merdeka No.11','Manager',15000000),
(9, 9, 'Xiumin', 'Jl. Gajah Mada No. 80', 'Staff', 7000000),
(10, 10, 'Kyungsoo', 'Jl. Imam Bonjol No. 90', 'Supervisor', 10000000);

create table transaksi(
id_transaksi int(11) primary key,
id_produk int(11),
id_supplier int(11),
id_karyawan int(11),
jumlah int(11),
total_harga double,
tanggal_transaksi datetime,
foreign key(id_produk) references produk(id_produk),
foreign key(id_supplier) references supplier(id_supplier),
foreign key(id_karyawan) references karyawan(id_karyawan)
);

drop table transaksi;

insert into transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi)
values
(1, 1, 1, 1, 50, 75000, '2024-05-02 10:30:00'),
(2, 2, 2, 2, 30, 36000, '2024-03-10 11:45:00'),
(3, 3, 3, 3, 20, 4000000, '2024-02-06 13:00:00'),
(4, 4, 4, 4, 15, 3750000, '2024-01-27 14:30:00'),
(5, 5, 5, 4, 100, 8000000, '2024-01-28 16:00:00'),
(6, 6, 6, 6, 10, 3000000, '2023-04-20 17:15:00'),
(7, 7, 7, 7, 40, 4800000, '2023-07-29 18:45:00'),
(8, 8, 8, 8, 25, 2250000, '2022-06-20 20:00:00'),
(9, 9, 9, 9, 35, 9800000, '2024-04-20 21:30:00'),
(10, 10, 10, 10, 45, 15750000, '2023-07-25 22:45:00');

drop table transaksi;

-- 1

DELIMITER //

create procedure transaksi_total(
in karyawan int(11),
out harga_transaksi bigint(30)
)
begin
select sum(total_harga) into harga_transaksi
from transaksi
where karyawan=id_karyawan;
end //
DELIMITER ;

call transaksi_total(4,@harga_transaksi);
select @harga_transaksi;


-- 2

DELIMITER //

create procedure produk_lama()
begin
    select CONCAT('Produk ', id_produk, ' berada di gudang selama ', DATEDIFF(NOW(), tanggal_update), ' hari.') 
    from stok;
end //
DELIMITER ;

call produk_lama();
drop procedure produk_lama;

-- 3

DELIMITER //
CREATE PROCEDURE hapus_transaksi()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
END //
DELIMITER ;

drop procedure hapus_transaksi;

call hapus_transaksi;
select * from transaksi;