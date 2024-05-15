create database mini_market;
use mini_market;

create table produk(
id_produk int(11) primary key,
nama_produk varchar(100),
kategori varchar(50),
harga double,
berat float);

create table gudang(
id_gudang int(11) primary key,
nama varchar(100),
alamat varchar(255)
);

create table supplier(
id_supplier int(11) primary key,
nama_supplier varchar(100),
alamat varchar(255),
telepon char(15),
email varchar(100)
);

create table stok(
id_stok int(11) primary key,
id_produk int(11),
id_gudang int(11),
jumlah int(11),
tanggal_update datetime,
foreign key(id_produk) references produk(id_produk),
foreign key(id_gudang) references gudang(id_gudang)
);

create table karyawan(
id_karyawan int(11) primary key,
id_gudang int(11),
nama varchar(100),
alamat varchar(255),
posisi varchar(50),
gaji double,
foreign key(id_gudang) references gudang(id_gudang)
);

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

-- Produk
INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat)
VALUES
    (1, 'Beras', 'Makanan', 50000, 1),
    (2, 'Sabun Mandi', 'Kebutuhan Rumah Tangga', 10000, 0.2),
    (3, 'Minyak Goreng', 'Makanan', 20000, 1.5),
    (4, 'Pasta Gigi', 'Kebutuhan Rumah Tangga', 5000, 0.1),
    (5, 'Sikat Gigi', 'Kebutuhan Rumah Tangga', 3000, 0.05),
    (6, 'Kopi', 'Minuman', 15000, 0.25),
    (7, 'Teh', 'Minuman', 10000, 0.2),
    (8, 'Sampo', 'Kebutuhan Rumah Tangga', 25000, 0.3),
    (9, 'Pembersih Lantai', 'Kebutuhan Rumah Tangga', 30000, 1),
    (10, 'Gula', 'Makanan', 10000, 0.5);


-- Gudang
INSERT INTO gudang (id_gudang, nama, alamat) 
VALUES 
(1, 'Gudang Utama', 'Jl. Raya No. 123'),
(2, 'Gudang Cabang', 'Jl. Maju No. 45'),
(3, 'Gudang Pusat', 'Jl. Harmoni No. 67'),
(4, 'Gudang Timur', 'Jl. Pantai No. 89'),
(5, 'Gudang Barat', 'Jl. Sejahtera No. 101'),
(6, 'Gudang Selatan', 'Jl. Damai No. 111'),
(7, 'Gudang Utara', 'Jl. Bahagia No. 121'),
(8, 'Gudang Tengah', 'Jl. Makmur No. 131'),
(9, 'Gudang Serasi', 'Jl. Gemilang No. 141'),
(10, 'Gudang Sentosa', 'Jl. Jaya No. 151');

-- Supplier
INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) 
VALUES 
(1, 'Solusi MiniMart', 'Jl. MiniMart No. 1', '1234567890', 'soluminimart@gmail.com'),
(2, 'Inovasi MiniStore', 'Jl. MiniStore No. 2', '0987654321', 'inovasiministore@gmail.com'),
(3, 'Perusahaan QuickMart', 'Jl. QuickMart No. 3', '1122334455', 'perusahaanquickmart@gmail.com'),
(4, 'PT CornerMart', 'Jl. CornerMart No. 4', '5544332211', 'ptcornermart@gmail.com'),
(5, 'ExpressShop', 'Jl. ExpressShop No. 5', '9988776655', 'ExpressShop@gmail.com'),
(6, 'LocalMart', 'Jl. LocalMart No. 6', '1122334455', 'localmart@gmail.com'),
(7, 'PT Toko Tetangga', 'Jl. Toko Tetangga No. 7', '6677889900', 'pttokotetangga@gmail.com'),
(8, 'Solusi Sudut Praktis', 'Jl. Sudut Praktis No. 8', '2244668800', 'soluminimart@gmail.com'),
(9, 'MarketPlus', 'Jl. MarketPlus No. 9', '5544332200', 'marketplus@gmail.com'),
(10, 'Solusi SuperMart', 'Jl. SuperMart No. 10', '7788990011', 'soluminimart@gmail.com');

-- Stok
INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update)
VALUES
    (1, 1, 1, 100, '2024-05-01 08:00:00'),
    (2, 2, 2, 50, '2024-05-02 10:00:00'),
    (3, 3, 1, 75, '2024-05-03 12:00:00'),
    (4, 4, 3, 30, '2024-05-04 14:00:00'),
    (5, 5, 2, 100, '2024-05-05 16:00:00'),
    (6, 6, 1, 80, '2024-05-06 08:00:00'),
    (7, 7, 3, 60, '2024-05-07 10:00:00'),
    (8, 8, 2, 45, '2024-05-08 12:00:00'),
    (9, 9, 1, 70, '2024-05-09 14:00:00'),
    (10, 10, 3, 90, '2024-05-10 16:00:00');

-- Karyawan
INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) 
VALUES 
(1, 1, 'Budi', 'Jl. Anggrek No. 1', 'Staf', 3200000.0),
(3, 3, 'Cahyani', 'Jl. Kenanga No. 3', 'Staf Kebersihan', 3100000.0),
(4, 4, 'Eko', 'Jl. Mawar No. 4', 'Staf Gudang', 3300000.0),
(5, 5, 'Fitriani', 'Jl. Dahlia No. 5', 'Asisten Kasir', 3400000.0),
(6, 6, 'Kurniawan', 'Jl. Anggrek No. 6', 'Kasir', 3500000.0),
(7, 7, 'Ika', 'Jl. Melati No. 7', 'Kasir', 3600000.0),
(8, 8, 'Joko', 'Jl. Kenanga No. 8', 'Supervisor', 3700000.0),
(9, 9, 'Kartika Dewi', 'Jl. Mawar No. 9', 'Manager', 3800000.0),
(10, 10, 'Indah', 'Jl. Dahlia No. 10', 'Asisten Manager', 3900000.0);

-- Transaksi
INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) 
VALUES 
(1, 1, 1, 6, 10, 500000, '2024-05-01 08:30:00'), 
(2, 2, 2, 5, 20, 200000, '2024-05-02 10:30:00'), 
(3, 3, 3, 6, 15, 300000, '2024-05-03 12:30:00'), 
(4, 4, 4, 7, 25, 125000, '2024-05-04 14:30:00'), 
(5, 5, 5, 6, 30, 90000, '2024-05-05 16:30:00'),  
(6, 6, 6, 5, 12, 180000, '2024-05-06 08:30:00'), 
(7, 7, 7, 6, 18, 180000, '2024-05-07 10:30:00'), 
(8, 8, 8, 7, 5, 125000, '2024-05-08 12:30:00'), 
(9, 9, 9, 5, 22, 660000, '2024-05-09 14:30:00'), 
(10, 10, 10, 7, 14, 140000, '2024-05-10 16:30:00'); 

-- 1. Stored Procedure Menghitung Total Harga dari Semua Transaksi
DELIMITER //
CREATE PROCEDURE total_harga (
    IN karyawan_id INT,
    OUT karyawan_id_out INT,
	OUT total_harga_transaksi DECIMAL(10, 2)
)
BEGIN
    SELECT 
        k.id_karyawan AS karyawan_id_out,
        SUM(t.total_harga) AS total_harga_transaksi
    INTO karyawan_id_out,
		total_harga_transaksi
    FROM transaksi t
    JOIN karyawan k ON t.id_karyawan = k.id_karyawan
    WHERE t.id_karyawan = karyawan_id;
END //
DELIMITER ;
CALL total_harga(6, @karyawan_id_out, @total_harga_transaksi);
SELECT @karyawan_id_out AS karyawan_id, @total_harga_transaksi AS total_harga_transaksi;


-- 2. Stored Procedure LamaProduk di Gudang Sejak Tanggal Masuk Produk
DELIMITER //
CREATE PROCEDURE lama_produk()
BEGIN
    SELECT 
        p.id_produk AS 'Produk ID',
        p.nama_produk AS 'Nama Produk',
        DATEDIFF(NOW(), s.tanggal_update) AS 'Lama di Gudang (hari)'
    FROM produk p
    JOIN stok s ON p.id_produk = s.id_produk;
END //
DELIMITER ;
CALL lama_produk();

-- 3. Stored Procedure Menghapus Transaksi 1 Bulan Terakhir
DELIMITER //
CREATE PROCEDURE hapus_transaksi()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
END //
DELIMITER ;
call hapus_transaksi;
select * from transaksi;