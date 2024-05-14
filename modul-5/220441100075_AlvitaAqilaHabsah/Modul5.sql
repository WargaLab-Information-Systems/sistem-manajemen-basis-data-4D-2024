CREATE DATABASE logistik_pakaian;
USE logistik_pakaian;

CREATE TABLE supplier (
    id_supplier INT PRIMARY KEY,
    nama_supplier VARCHAR(100),
    alamat VARCHAR(255),
    telpon CHAR(15),
    email VARCHAR (100));

CREATE TABLE gudang (
    id_gudang INT PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255));
    
CREATE TABLE karyawan (
    id_karyawan INT PRIMARY KEY,
    id_gudang INT,
    nama VARCHAR(100),
    alamat VARCHAR(255),
    posisi VARCHAR(50),
    FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang));

CREATE TABLE produk (
    id_produk INT PRIMARY KEY,
    nama_produk VARCHAR(100),
    kategori VARCHAR(50),
    harga DOUBLE,
    berat FLOAT );
    
CREATE TABLE stok (
    id_stok INT PRIMARY KEY,
    id_produk INT,
    id_gudang INT,
    jumlah INT,
    tanggal_update DATETIME,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang));
    
CREATE TABLE transaksi (
    id_transaksi INT PRIMARY KEY,
    id_produk INT,
    id_supplier INT,
    id_karyawan INT,
    jumlah INT,
    total_harga DOUBLE,
    tanggal_transaksi DATETIME,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan));
    
INSERT INTO supplier (id_supplier, nama_supplier, alamat, telpon, email) VALUES
(1, 'PT. Prima Jaya', 'Jl. Sudirman No. 10', '021-5551234', 'primajaya@email.com'),
(2, 'CV. Citra Mandiri', 'Jl. Diponegoro No. 20', '022-6663456', 'citramandiri@email.com'),
(3, 'UD. Anugrah', 'Jl. Martadinata No. 30', '023-7775678', 'anugrah@email.com'),
(4, 'PT. Surya Gemilang', 'Jl. Gajah Mada No. 40', '024-8887901', 'suryagemilang@email.com'),
(5, 'CV. Bintang Jaya', 'Jl. Thamrin No. 50', '025-9991011', 'bintangjaya@email.com');

INSERT INTO gudang (id_gudang, nama, alamat) VALUES
(1, 'Gudang Pusat', 'Jl. Raya Bogor No. 100'),
(2, 'Gudang Timur', 'Jl. Ahmad Yani No. 200'),
(3, 'Gudang Barat', 'Jl. Soekarno-Hatta No. 300');

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi) VALUES
(1, 1, 'Budi', 'Jalan Kembang No. 1', 'Manager'),
(2, 1, 'Ani', 'Jalan Sudirman No. 22', 'Staff'),
(3, 2, 'Cindy', 'Jalan Kuning No. 13', 'Staff'),
(4, 3, 'Doni', 'Jalan Kedanggan No. 4', 'Staff'),
(5, 3, 'Eka', 'Jalan Imam Bonjol No. 10', 'Staff');

INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES
(1, 'Kemeja', 'Pakaian', 150000, 0.3),
(2, 'Celana Jeans', 'Pakaian', 200000, 0.5),
(3, 'Jaket', 'Pakaian', 250000, 0.8),
(4, 'Topi', 'Aksesoris', 50000, 0.1),
(5, 'Sandal', 'Aksesoris', 75000, 0.2);

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) VALUES
(1, 1, 1, 100, '2024-05-02 10:14:00'),
(2, 2, 1, 150, '2024-03-12 10:32:00'),
(3, 3, 2, 80, '2024-02-17 13:40:00'),
(4, 4, 2, 200, '2024-05-02 10:10:00'),
(5, 5, 3, 120, '2024-04-08 09:54:00');

INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
(1, 1, 1, 2, 50, 7500000, '2024-05-02 10:14:00'),
(2, 2, 2, 3, 30, 6000000, '2024-03-04 11:30:00'),
(3, 3, 3, 4, 20, 5000000, '2024-03-04 16:22:00'),
(4, 4, 4, 5, 70, 3500000, '2024-04-25 13:46:00'),
(5, 5, 5, 1, 40, 3000000, '2024-05-23 14:08:00');

SELECT * FROM supplier;
SELECT * FROM gudang;
SELECT * FROM karyawan;
SELECT * FROM produk;
SELECT * FROM stok;
SELECT * FROM transaksi;

-- menghitung total harga dari semua transaksi oleh karyawan tertentu
DELIMITER //
CREATE PROCEDURE total_transaksi_karyawan(
    IN karyawan_id INT,
    OUT harga_total DOUBLE )
BEGIN
    SELECT SUM(total_harga) INTO harga_total
    FROM transaksi
    WHERE id_karyawan = karyawan_id;
END //
DELIMITER ;

CALL total_transaksi_karyawan(2, @harga_total);
SELECT @harga_total AS total_transaksi;

-- Durasi lama digudang sejak tanggal masuk produk.
DELIMITER //
CREATE PROCEDURE lama_produk()
BEGIN
    SELECT CONCAT('Produk ', id_produk, ' berada di gudang selama ', DATEDIFF(NOW(), tanggal_update), ' hari.') 
    AS lama_produk_digudang
    FROM stok;
END //
DELIMITER ;

CALL lama_produk();

-- menghapus transaksi pada 1 bulan terakhir, tetapi jika total harga nya lebih dari 200 ribu maka tidak dapat di hapus.
DELIMITER //
CREATE PROCEDURE hapus_transaksi()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
END //
DELIMITER ;

CALL hapus_transaksi;
SELECT * FROM transaksi;
