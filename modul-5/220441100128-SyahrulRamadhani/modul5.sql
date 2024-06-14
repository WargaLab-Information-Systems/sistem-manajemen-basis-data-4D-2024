-- Membuat database dan tabel
CREATE DATABASE modul5;
USE modul5;

drop database modul5;

CREATE TABLE produk(
    id_produk INT(11) PRIMARY KEY,
    nama_produk VARCHAR(100),
    kategori VARCHAR(50),
    harga DOUBLE,
    berat FLOAT
);

INSERT INTO produk(id_produk, nama_produk, kategori, harga, berat)
VALUES
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

CREATE TABLE gudang(
    id_gudang INT(11) PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255)
);

INSERT INTO gudang (id_gudang, nama, alamat)
VALUES
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

CREATE TABLE supplier(
    id_supplier INT(11) PRIMARY KEY,
    nama_supplier VARCHAR(100),
    alamat VARCHAR(255),
    telepon CHAR(15),
    email VARCHAR(100)
);

INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email)
VALUES
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

CREATE TABLE stok(
    id_stok INT(11) PRIMARY KEY,
    id_produk INT(11),
    id_gudang INT(11),
    jumlah INT(11),
    tanggal_update DATETIME,
    FOREIGN KEY(id_produk) REFERENCES produk(id_produk),
    FOREIGN KEY(id_gudang) REFERENCES gudang(id_gudang)
);

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update)
VALUES
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

CREATE TABLE karyawan(
    id_karyawan INT(11) PRIMARY KEY,
    id_gudang INT(11),
    nama VARCHAR(100),
    alamat VARCHAR(255),
    posisi VARCHAR(50),
    gaji DOUBLE,
    FOREIGN KEY(id_gudang) REFERENCES gudang(id_gudang)
);

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 1, 'Sehun', 'Jl. Mangga Besar No. 10', 'Manager', 15000000),
(2, 2, 'Chen', 'Jl. Cendrawasih No. 20', 'Supervisor', 10000000),
(3, 3, 'Baekhyun', 'Jl. Diponegoro No. 30', 'Staff', 7000000),
(4, 4, 'Chanyeol', 'Jl. A. Yani No. 40', 'Staff', 7000000),
(5, 5, 'Jaemin', 'Jl. Sudirman No. 50', 'Supervisor', 10000000),
(6, 6, 'Chenle', 'Jl. Veteran No. 60', 'Staff', 7000000),
(7, 7, 'Renjun', 'Jl. Pahlawan No. 70', 'Manager', 15000000),
(8, 8, 'Haechan', 'Jl. Merdeka No.11', 'Manager', 15000000),
(9, 9, 'Xiumin', 'Jl. Gajah Mada No. 80', 'Staff', 7000000),
(10, 10, 'Kyungsoo', 'Jl. Imam Bonjol No. 90', 'Supervisor', 10000000);

CREATE TABLE transaksi(
    id_transaksi INT(11) PRIMARY KEY,
    id_produk INT(11),
    id_supplier INT(11),
    id_karyawan INT(11),
    jumlah INT(11),
    total_harga DOUBLE,
    tanggal_transaksi DATETIME,
    FOREIGN KEY(id_produk) REFERENCES produk(id_produk),
    FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier),
    FOREIGN KEY(id_karyawan) REFERENCES karyawan(id_karyawan)
);

INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi)
VALUES
(1, 1, 1, 1, 50, 7500000, '2024-05-02 10:30:00'),
(2, 2, 2, 2, 30, 3600000, '2024-03-10 11:45:00'),
(3, 3, 3, 3, 20, 4000000, '2024-02-06 13:00:00'),
(4, 4, 4, 4, 15, 3750000, '2024-01-27 14:30:00'),
(5, 5, 5, 4, 100, 8000000, '2024-01-28 16:00:00'),
(6, 6, 6, 6, 10, 3000000, '2023-04-20 17:15:00'),
(7, 7, 7, 7, 40, 4800000, '2023-07-29 18:45:00'),
(8, 8, 8, 8, 25, 2250000, '2022-06-20 20:00:00'),
(9, 9, 9, 9, 35, 9800000, '2024-04-20 21:30:00'),
(10, 10, 10, 10, 45, 15750000, '2023-07-25 22:45:00');

DELIMITER //

CREATE PROCEDURE total_transaksi(
    IN karyawan_id INT,
    OUT harga_transaksi BIGINT
)
BEGIN
    SELECT SUM(total_harga) INTO harga_transaksi
    FROM transaksi
    WHERE id_karyawan = karyawan_id;
END //

DELIMITER ;
CALL total_transaksi(4, @harga_transaksi);
SELECT @harga_transaksi AS total_transaksi_satu_karyawan;
select * from transaksi;


DELIMITER //

CREATE PROCEDURE lama_produk()
BEGIN
    SELECT CONCAT('Produk ', id_produk, ' berada di gudang selama ', DATEDIFF(NOW(), tanggal_update), ' hari.') 
    AS lama_produk_digudang
    FROM stok;
END //

DELIMITER ;

CALL lama_produk();
select * from stok;



SET SQL_SAFE_UPDATES = 0;

DELIMITER //

CREATE OR REPLACE PROCEDURE hapus_transaksi3()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
END //

DELIMITER ;
CALL hapus_transaksi3();

select * from transaksi;

SET SQL_SAFE_UPDATES = 1;
SELECT * FROM transaksi;

