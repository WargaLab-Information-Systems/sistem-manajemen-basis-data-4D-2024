CREATE DATABASE db_gudang;
USE db_gudang;

CREATE TABLE supplier (
id_supplier INT (11) PRIMARY KEY NOT NULL,
nama_supplier VARCHAR(100),
alamat VARCHAR(255),
telepon CHAR(15),
email VARCHAR(100)
);
DESC supplier;

CREATE TABLE gudang (
id_gudang INT (11) PRIMARY KEY NOT NULL,
nama VARCHAR(100),
alamat VARCHAR(255)
);
DESC gudang;

CREATE TABLE produk (
id_produk INT (11) PRIMARY KEY NOT NULL,
nama_produk VARCHAR (100),
kategori VARCHAR (50),
harga DOUBLE,
berat FLOAT
);
DESC produk;

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

-- Tambahkan data ke tabel supplier
INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email)
VALUES
(1, 'Supplier A', 'Alamat Supplier A', '08123456789', 'supplierA@example.com'),
(2, 'Supplier B', 'Alamat Supplier B', '08234567890', 'supplierB@example.com'),
(3, 'Supplier C', 'Alamat Supplier C', '08345678901', 'supplierC@example.com'),
(4, 'Supplier D', 'Alamat Supplier D', '08456789012', 'supplierD@example.com'),
(5, 'Supplier E', 'Alamat Supplier E', '08567890123', 'supplierE@example.com'),
(6, 'Supplier F', 'Alamat Supplier F', '08678901234', 'supplierF@example.com'),
(7, 'Supplier G', 'Alamat Supplier G', '08789012345', 'supplierG@example.com'),
(8, 'Supplier H', 'Alamat Supplier H', '08890123456', 'supplierH@example.com'),
(9, 'Supplier I', 'Alamat Supplier I', '08901234567', 'supplierI@example.com'),
(10, 'Supplier J', 'Alamat Supplier J', '08912345678', 'supplierJ@example.com');
SELECT * FROM supplier;

-- Tambahkan data ke tabel gudang
INSERT INTO gudang (id_gudang, nama, alamat)
VALUES
(1, 'Gudang A', 'Alamat Gudang A'),
(2, 'Gudang B', 'Alamat Gudang B'),
(3, 'Gudang C', 'Alamat Gudang C'),
(4, 'Gudang D', 'Alamat Gudang D'),
(5, 'Gudang E', 'Alamat Gudang E'),
(6, 'Gudang F', 'Alamat Gudang F'),
(7, 'Gudang G', 'Alamat Gudang G'),
(8, 'Gudang H', 'Alamat Gudang H'),
(9, 'Gudang I', 'Alamat Gudang I'),
(10, 'Gudang J', 'Alamat Gudang J');
SELECT * FROM gudang;

-- Tambahkan data ke tabel produk
INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat)
VALUES
(1, 'Produk A', 'Kategori A', 100000, 1.5),
(2, 'Produk B', 'Kategori B', 200000, 2.5),
(3, 'Produk C', 'Kategori C', 300000, 3.5),
(4, 'Produk D', 'Kategori D', 400000, 4.5),
(5, 'Produk E', 'Kategori E', 500000, 5.5),
(6, 'Produk F', 'Kategori F', 600000, 6.5),
(7, 'Produk G', 'Kategori G', 700000, 7.5),
(8, 'Produk H', 'Kategori H', 800000, 8.5),
(9, 'Produk I', 'Kategori I', 900000, 9.5),
(10, 'Produk J', 'Kategori J', 1000000, 10.5);
SELECT * FROM produk;

-- Tambahkan data ke tabel karyawan
INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji)
VALUES
(1, 1, 'Karyawan A', 'Alamat Karyawan A', 'Posisi A', 5000000),
(2, 2, 'Karyawan B', 'Alamat Karyawan B', 'Posisi B', 6000000),
(3, 3, 'Karyawan C', 'Alamat Karyawan C', 'Posisi C', 7000000),
(4, 4, 'Karyawan D', 'Alamat Karyawan D', 'Posisi D', 8000000),
(5, 5, 'Karyawan E', 'Alamat Karyawan E', 'Posisi E', 9000000),
(6, 6, 'Karyawan F', 'Alamat Karyawan F', 'Posisi F', 10000000),
(7, 7, 'Karyawan G', 'Alamat Karyawan G', 'Posisi G', 11000000),
(8, 8, 'Karyawan H', 'Alamat Karyawan H', 'Posisi H', 12000000),
(9, 9, 'Karyawan I', 'Alamat Karyawan I', 'Posisi I', 13000000),
(10, 10, 'Karyawan J', 'Alamat Karyawan J', 'Posisi J', 14000000);
SELECT * FROM karyawan;

-- Tambahkan data ke tabel stok
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
DROP TABLE stok;

-- Tambahkan data ke tabel transaksi
INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi)
VALUES
(1, 1, 1, 1, 10, 100000, '2024-05-01 08:00:00'),
(2, 2, 2, 2, 20, 200000, '2024-05-02 09:00:00'),
(3, 3, 3, 3, 30, 300000, '2024-05-03 10:00:00'),
(4, 4, 4, 4, 40, 400000, '2024-05-04 11:00:00'),
(5, 5, 5, 5, 50, 500000, '2024-05-05 12:00:00'),
(6, 6, 6, 6, 60, 600000, '2024-05-06 13:00:00'),
(7, 7, 7, 7, 70, 700000, '2024-05-07 14:00:00'),
(8, 8, 8, 8, 80, 800000, '2024-05-08 15:00:00'),
(9, 9, 9, 9, 90, 900000, '2024-05-09 16:00:00'),
(10, 10, 10, 10, 100, 1000000, '2024-05-10 17:00:00');
SELECT * FROM transaksi;
DROP TABLE transaksi;


-- no 1
DELIMITER //
CREATE PROCEDURE total_transaksi(
    IN karyawan_id INT,
    OUT total_harga_transaksi DOUBLE
)
BEGIN
    SELECT SUM(total_harga) INTO total_harga_transaksi
    FROM transaksi
    WHERE id_karyawan = karyawan_id;
END //
DELIMITER ;
SET @id_karyawan = 2;
CALL total_transaksi(2, @total_harga);
SELECT @id_karyawan, @total_harga;

-- no 2
DELIMITER //
CREATE PROCEDURE lama_produk()
BEGIN
    SELECT p.nama_produk, 
           DATEDIFF(NOW(), s.tanggal_update) AS umur_produk_hari
    FROM stok s
    INNER JOIN produk p ON s.id_produk = p.id_produk;
END //
DELIMITER ;
CALL lama_produk();

-- no 3
SET SQL_SAFE_UPDATES = 0;
DELIMITER //
DROP PROCEDURE IF EXISTS hapus_transaksi_bulan_terakhir //
CREATE PROCEDURE hapus_transaksi_bulan_terakhir()
BEGIN
    DELETE FROM transaksi
    WHERE total_harga <= 200000 
    AND tanggal_transaksi >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
END //
DELIMITER ;
CALL hapus_transaksi_bulan_terakhir();
SELECT * FROM transaksi;

DROP PROCEDURE hapus_transaksi_bulan_terakhir;
