CREATE DATABASE pabrik;
USE pabrik;

CREATE TABLE produk(
	id_produk INT NOT NULL PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    kategori VARCHAR(50) NOT NULL,
    harga DOUBLE,
    berat FLOAT
);
DESC produk;

CREATE TABLE gudang(
	id_gudang INT NOT NULL PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255)
);
DESC gudang;

CREATE TABLE karyawan(
	id_karyawan INT NOT NULL PRIMARY KEY,
    id_gudang INT NOT NULL,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    posisi VARCHAR(50) NOT NULL,
    gaji DOUBLE,
    FOREIGN KEY (id_gudang) REFERENCES gudang (id_gudang)
);
DESC karyawan;

CREATE TABLE supplier(
	id_supplier INT NOT NULL PRIMARY KEY,
    nama_supplier VARCHAR(100),
    alamat VARCHAR(255),
    telepon CHAR(15),
    email VARCHAR(100)
);
DESC supplier;

CREATE TABLE stok(	
	id_stok INT NOT NULL PRIMARY KEY,
    id_produk INT NOT NULL,
    id_gudang INT NOT NULL,
    jumlah INT NOT NULL,
    tanggal_update DATETIME,
    FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
    FOREIGN KEY (id_gudang) REFERENCES gudang (id_gudang)
);
DESC stok;

CREATE TABLE transaksi(
	id_transaksi INT NOT NULL PRIMARY KEY,
    id_produk INT NOT NULL,
    id_supplier INT NOT NULL,
    id_karyawan INT NOT NULL,
    jumlah INT NOT NULL,
    total_harga DOUBLE,
    tanggal_transaksi DATETIME,
    FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
    FOREIGN KEY (id_supplier) REFERENCES supplier (id_supplier),
    FOREIGN KEY (id_karyawan) REFERENCES karyawan (id_karyawan)
);
DESC transaksi;

INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES
	(1, 'Laptop Acer', 'Elektronik', 2000.00, 1.5),
	(2, 'Baju T-shirt', 'Pakaian', 25.99, 0.2),
	(3, 'Mouse Logitech', 'Elektronik', 35.50, 0.1),
	(4, 'Celana Jeans', 'Pakaian', 49.99, 0.5),
	(5, 'Smartphone Samsung', 'Elektronik', 899.99, 0.3),
	(6, 'Sepatu Sneakers', 'Pakaian', 79.99, 0.7),
	(7, 'Printer HP', 'Elektronik', 149.99, 2.0),
	(8, 'Kemeja Formal', 'Pakaian', 39.99, 0.3),
	(9, 'Headset Sony', 'Elektronik', 69.99, 0.4),
	(10, 'Topi Baseball', 'Aksesoris', 15.00, 0.1);
SELECT * FROM produk;

INSERT INTO gudang (id_gudang, nama, alamat) VALUES
	(11, 'Gudang Utama', 'Jl. Merdeka No. 123'),
	(12, 'Gudang Jaya Sukses', 'Jl. Sudirman No. 456'),
	(13, 'Gudang Mega', 'Jl. Gatot Subroto No. 789'),
	(14, 'Gudang Berkat Jaya', 'Jl. Diponegoro No. 1011'),
	(15, 'Gudang Sentral', 'Jl. Thamrin No. 1213'),
	(16, 'Gudang Bersama', 'Jl. HR Rasuna Said No. 1415'),
	(17, 'Gudang Logistik', 'Jl. Asia Afrika No. 1617'),
	(18, 'Gudang Terpadu', 'Jl. Jenderal Sudirman No. 1819'),
	(19, 'Gudang Pusat', 'Jl. Pahlawan No. 2021'),
	(20, 'Gudang Strategis', 'Jl. Diponegoro No. 2223');
SELECT * FROM gudang;

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
	(21, 11, 'Andi', 'Jl. Untung Suropati No. 1', 'Manager', 3000),
	(22, 12, 'Budi', 'Jl. Raya Pacet No. 2', 'Staf', 2000),
	(23, 13, 'Cici', 'Jl. Diponegoro No. 3', 'Staf', 2500),
	(24, 14, 'Dedi', 'Jl. Embong Malang No. 4', 'Staf', 2300),
	(25, 15, 'Eva', 'Jl. Ahmad Yani No. 5', 'Staf', 2100),
	(26, 16, 'Feri', 'Jl. Ir.Soekarno No. 6', 'Staf', 2550),
	(27, 17, 'Gita', 'Jl. Raya Telang No. 7', 'Staf', 2700),
	(28, 18, 'Hani', 'Jl. Kamal No. 8', 'Staf', 2450),
	(29, 19, 'Indra', 'Jl. Masjid Junok No. 9', 'Staf', 2120),
	(30, 20, 'Joni', 'Jl. Suramadu No. 10', 'Staf', 2350);
SELECT * FROM karyawan;

INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) VALUES
	(31, 'PT Cahaya Makmur Sentosa', 'Ngoro', '1234567890', 'makmur@gamil.com'),
	(32, 'CV Berkah Jaya Abadi', 'Mojosari', '9876543210', 'berkah@gamil.com'),
	(33, 'UD Mitra Sejahtera', 'Kutorejo', '1112223330', 'mitra@gmail.com'),
	(34, 'Toko Sinar Baru', 'Prambon', '4445556660', 'sinar@gmail.com'),
	(35, 'Graha Cahaya Indah', 'Krian', '7778889990', 'graha@gmail.com'),
	(36, 'Pabrik Berkah Sukses', 'Trosobo', '0001112220', 'berkah@gmail.com'),
	(37, 'Perusahaan Harapan Baru', 'Waru', '3334445550', 'baru@gmail.com'),
	(38, 'Toko Cahaya Sejahtera', 'Balongbendo', '6667778880', 'cahaya@gmail.com'),
	(39, 'Produsen Jaya Makmur', 'Trowulan', '9990001110', 'jaya@gmail.com'),
	(40, 'Distributor Sentosa Jaya', 'Mojoagung', '2223334440', 'sentosa@gmail.com');
SELECT * FROM supplier;

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) VALUES
    (41, 1, 11, 100, '2024-01-10 07:00:00'),
    (42, 2, 12, 50, '2024-02-20 06:15:00'),
    (43, 3, 13, 20, '2024-03-30 08:30:00'),
    (44, 4, 14, 30, '2024-04-24 00:00:00'),
    (45, 5, 15, 10, '2023-10-15 12:15:00'),
    (46, 6, 16, 15, '2023-12-16 15:15:15'),
    (47, 7, 17, 25, '2024-04-30 08:09:03'),
    (48, 8, 18, 12, '2023-12-31 10:10:10'),
    (49, 9, 19, 40, '2024-03-29 12:30:05'),
    (50, 10, 20, 60, '2023-11-10 19:25:01');
SELECT * FROM stok;

INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
    (51, 1, 31, 21, 10, 150, '2024-01-01 08:00:00'),
    (52, 2, 32, 22, 5, 125, '2024-02-02 09:30:00'),
    (53, 3, 33, 23, 2, 1600, '2024-03-03 10:45:00'),
    (54, 4, 34, 24, 3, 45, '2024-04-04 11:15:00'),
    (55, 5, 35, 25, 1, 100, '2024-05-05 12:20:00'),
    (56, 6, 36, 26, 2, 300, '2024-06-06 13:00:00'),
    (57, 7, 37, 27, 1, 200, '2024-07-07 14:10:00'),
    (58, 8, 38, 28, 4, 2000, '2024-08-08 15:30:00'),
    (59, 9, 39, 29, 6, 12, '2024-09-09 16:45:00'),
    (60, 10, 40, 30, 7, 21, '2024-10-10 17:55:00');
SELECT * FROM transaksi;


-- NOMOR1-- 
DELIMITER //
CREATE PROCEDURE calculate_total_harga(
    IN karyawan_id INT,
    OUT total_harga_transaksi DOUBLE
)
BEGIN
    DECLARE total DOUBLE;
    SELECT SUM(total_harga) INTO total
    FROM transaksi
    WHERE id_karyawan = karyawan_id;
    SET total_harga_transaksi = total;
END //
DELIMITER ;
CALL calculate_total_harga(26, @total_harga);
SELECT @total_harga;


-- NOMOR2-- 
DELIMITER //
CREATE PROCEDURE durasi_produk(
    IN tanggal_sekarang DATE
)
BEGIN
    SELECT p.nama_produk, DATEDIFF(tanggal_sekarang, s.tanggal_update) AS durasi_hari
    FROM produk p
    JOIN stok s ON p.id_produk = s.id_produk;
END //
DELIMITER ;
CALL durasi_produk(NOW());
DROP PROCEDURE durasi_produk;

-- NOMOR3-- 
DELIMITER //
CREATE PROCEDURE HapusTransaksiTerbaru(
    IN tanggal_awal DATE,
    IN tanggal_akhir DATE,
    IN maks_total_harga DOUBLE
)
BEGIN
    DECLARE id_transaksi_terbaru INT;
    -- Mendapatkan id_transaksi yang memenuhi kriteria tanggal_transaksi dan total_harga
    SELECT id_transaksi INTO id_transaksi_terbaru
    FROM transaksi
    WHERE tanggal_transaksi BETWEEN tanggal_awal AND tanggal_akhir
    AND total_harga <= maks_total_harga
    LIMIT 1;
    -- Menghapus transaksi dalam rentang waktu tertentu, kecuali yang memiliki total harga lebih dari batasan yang ditentukan
    DELETE FROM transaksi 
    WHERE tanggal_transaksi BETWEEN tanggal_awal AND tanggal_akhir
    AND total_harga <= maks_total_harga
    AND id_transaksi = id_transaksi_terbaru;
END //
DELIMITER ;
CALL HapusTransaksiTerbaru('2024-04-01', '2024-04-30', 200000);
SELECT * FROM transaksi; 





  












 










				
				
				
				