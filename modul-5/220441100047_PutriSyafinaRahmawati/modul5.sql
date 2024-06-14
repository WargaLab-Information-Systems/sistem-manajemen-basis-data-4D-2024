CREATE DATABASE db_modul5;
USE db_modul5;

CREATE TABLE supplier (
id_supplier INT (11) PRIMARY KEY NOT NULL,
nama_supplier VARCHAR(100),
alamat VARCHAR(255),
telepon CHAR(15),
email VARCHAR(100)
);
DESC supplier;
INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email)
VALUES
(1, 'Shafira', 'Jl. Merdeka No. 1, Jakarta', '08123456789', 'shafira@example.com'),
(2, 'Farra', 'Jl. Kebon Jeruk No. 2, Bandung', '08234567890', 'farra@example.com'),
(3, 'Nurul', 'Jl. Pahlawan No. 3, Surabaya', '08345678901', 'nurul@example.com'),
(4, 'Widya', 'Jl. Sudirman No. 4, Medan', '08456789012', 'widya@example.com'),
(5, 'Anisa', 'Jl. Malioboro No. 5, Yogyakarta', '08567890123', 'anisa@example.com'),
(6, 'Ketut', 'Jl. Gajah Mada No. 6, Semarang', '08678901234', 'ketut@example.com'),
(7, 'Lia', 'Jl. Diponegoro No. 7, Denpasar', '08789012345', 'lia@example.com'),
(8, 'Rizal', 'Jl. Ahmad Yani No. 8, Makassar', '08890123456', 'rizal@example.com'),
(9, 'Reggina', 'Jl. Panglima No. 9, Balikpapan', '08901234567', 'reggina@example.com'),
(10, 'Zain', 'Jl. Imam Bonjol No. 10, Malang', '08912345678', 'zain@example.com');
SELECT * FROM supplier;

CREATE TABLE gudang (
id_gudang INT (11) PRIMARY KEY NOT NULL,
nama VARCHAR(100),
alamat VARCHAR(255)
);
DESC gudang;
INSERT INTO gudang (id_gudang, nama, alamat)
VALUES
(1, 'Gudang Jakarta', 'Jl. Industri No. 1, Jakarta'),
(2, 'Gudang Bekasi', 'Jl. Raya Cibitung No. 2, Bekasi'),
(3, 'Gudang Bandung', 'Jl. Perintis Kemerdekaan No. 3, Bandung'),
(4, 'Gudang Surabaya', 'Jl. Raya Pelabuhan No. 4, Surabaya'),
(5, 'Gudang Semarang', 'Jl. Raya Semarang-Demak No. 5, Semarang'),
(6, 'Gudang Pekalongan', 'Jl. Raya Batang No. 6, Pekalongan'),
(7, 'Gudang Sidoarjo', 'Jl. Raya Sidoarjo No. 7, Sidoarjo'),
(8, 'Gudang Makassar', 'Jl. Raya Makassar No. 8, Makassar'),
(9, 'Gudang Medan', 'Jl. Raya Medan-Binjai No. 9, Medan'),
(10, 'Gudang Malang', 'Jl. Imam Bonjol No. 10, Malang');
SELECT * FROM gudang;

CREATE TABLE produk (
id_produk INT (11) PRIMARY KEY NOT NULL,
nama_produk VARCHAR (100),
kategori VARCHAR (50),
harga DOUBLE,
berat FLOAT
);
DESC produk;
INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat)
VALUES
(1, 'Laptop Gaming', 'Elektronik', 10000000, 2.5),
(2, 'Smartphone Pro', 'Elektronik', 15000000, 0.2),
(3, 'Kulkas 2 Pintu', 'Peralatan Rumah Tangga', 5000000, 50.0),
(4, 'Mesin Cuci', 'Peralatan Rumah Tangga', 3500000, 40.0),
(5, 'Televisi LED', 'Elektronik', 4000000, 8.0),
(6, 'Kipas Angin', 'Peralatan Rumah Tangga', 300000, 3.0),
(7, 'Sepeda Gunung', 'Olahraga', 2500000, 15.0),
(8, 'Treadmill', 'Olahraga', 7000000, 60.0),
(9, 'Kamera DSLR', 'Fotografi', 6000000, 1.5),
(10, 'Printer Laser', 'Peralatan Kantor', 1500000, 7.0);
SELECT * FROM produk;

CREATE TABLE karyawan (
id_karyawan INT (11) PRIMARY KEY NOT NULL,
id_gudang INT(11),
nama VARCHAR(100),
alamat VARCHAR(255),
posisi VARCHAR(50),
gaji DOUBLE,
FOREIGN KEY (id_gudang) REFERENCES gudang (id_gudang)
);
DESC karyawan;
INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji)
VALUES
(1, 1, 'Ahmad', 'Jl. Melati No. 5, Jakarta', 'Manajer Gudang', 5000000),
(2, 2, 'Marsya', 'Jl. Anggrek No. 10, Bekasi', 'Asisten Manajer', 6000000),
(3, 3, 'Dewi', 'Jl. Kenanga No. 15, Bandung', 'Supervisor', 7000000),
(4, 4, 'Setiawan', 'Jl. Mawar No. 20, Surabaya', 'Kepala Gudang', 8000000),
(5, 5, 'Putra', 'Jl. Flamboyan No. 25, Semarang', 'Staff Gudang', 9000000),
(6, 6, 'Fajar', 'Jl. Cempaka No. 30, Pekalongan', 'Staff Gudang', 10000000),
(7, 7, 'Dita', 'Jl. Dahlia No. 35, Sidoarjo', 'Operator Forklift', 11000000),
(8, 8, 'Hadiaz', 'Jl. Kamboja No. 40, Makassar', 'Pengawas Gudang', 12000000),
(9, 9, 'Indra', 'Jl. Teratai No. 45, Medan', 'Admin Gudang', 13000000),
(10, 10, 'Sesil', 'Jl. Bougenville No. 50, Malang', 'Petugas Keamanan', 14000000);
SELECT * FROM karyawan;

CREATE TABLE stok (
id_stok INT (11) PRIMARY KEY NOT NULL,
id_produk INT(11),
id_gudang INT(11),
jumlah INT(11),
tanggal_update DATETIME,
FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
FOREIGN KEY (id_gudang) REFERENCES gudang (id_gudang)
);
DESC stok;
INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update)
VALUES
(1, 1, 1, 100, '2024-05-01 08:00:00'),
(2, 2, 2, 200, '2024-05-02 09:00:00'),
(3, 3, 3, 300, '2024-05-03 10:00:00'),
(4, 4, 4, 400, '2024-05-04 11:00:00'),
(5, 5, 5, 500, '2024-05-05 12:00:00'),
(6, 6, 6, 600, '2024-05-06 13:00:00'),
(7, 7, 7, 700, '2024-05-07 14:00:00'),
(8, 8, 8, 800, '2024-05-08 15:00:00'),
(9, 9, 9, 900, '2024-05-09 16:00:00'),
(10, 10, 10, 1000, '2024-05-10 17:00:00');
SELECT * FROM stok;
drop table stok;

CREATE TABLE transaksi (
	id_transaksi INT (11) PRIMARY KEY NOT NULL,
	id_produk INT(11),
	id_supplier INT(11),
	id_karyawan INT(11),
	jumlah INT(11),
	total_harga DOUBLE,
	tanggal_transaksi DATETIME,
FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
FOREIGN KEY (id_supplier) REFERENCES supplier (id_supplier),
FOREIGN KEY (id_karyawan) REFERENCES karyawan (id_karyawan)
);
DESC transaksi;
INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi)
VALUES
(1, 1, 1, 1, 10, 200000, '2024-05-01 08:00:00'),
(2, 2, 2, 2, 20, 2000000, '2024-05-02 09:00:00'),
(3, 3, 3, 3, 30, 3000000, '2024-05-03 10:00:00'),
(4, 4, 4, 4, 40, 4000000, '2024-05-04 11:00:00'),
(5, 5, 5, 5, 50, 5000000, '2024-05-05 12:00:00'),
(6, 6, 6, 6, 60, 6000000, '2024-05-06 13:00:00'),
(7, 7, 7, 7, 70, 7000000, '2024-05-07 14:00:00'),
(8, 8, 8, 8, 80, 8000000, '2024-05-08 15:00:00'),
(9, 9, 9, 9, 90, 9000000, '2024-05-09 16:00:00'),
(10, 10, 10, 10, 100, 10000000, '2024-05-10 17:00:00');
SELECT * FROM transaksi;
drop table transaksi;


-- SOAL
-- NOMOR 1
DELIMITER //
CREATE PROCEDURE total_transaksi(
    IN karyawan_id INT,
    OUT total_harga_transaksi DOUBLE)
BEGIN
    SELECT SUM(total_harga) INTO total_harga_transaksi
    FROM transaksi
    WHERE id_karyawan = karyawan_id;
END //
DELIMITER ;
SET @id_karyawan = 3;
CALL total_transaksi(3, @total_harga);
SELECT @id_karyawan, @total_harga AS total_harga_transaksi_karyawan;

-- NOMOR 2
DELIMITER //
CREATE PROCEDURE lama_produk()
BEGIN
    SELECT p.nama_produk, DATEDIFF(NOW(), s.tanggal_update) AS umur_produk_hari
    FROM stok s
    INNER JOIN produk p ON s.id_produk = p.id_produk;
END //
DELIMITER ;
CALL lama_produk();
SELECT * FROM transaksi;

-- NOMOR 3
SET SQL_SAFE_UPDATES = 0;
DELIMITER //
CREATE PROCEDURE hapus_transaksi_bulan_terakhir()
BEGIN
    DELETE FROM transaksi
    WHERE total_harga <= 200000 
    AND tanggal_transaksi >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
END //
DELIMITER ;
drop procedure hapus_transaksi_bulan_terakhir;
CALL hapus_transaksi_bulan_terakhir();
SELECT * FROM transaksi;


