CREATE DATABASE db_logistik_pakaian;
USE db_logistik_pakaian;
-- DROP DATABASE db_logistik_pakaian;

CREATE TABLE produk(
	id_produk INT(11) NOT NULL PRIMARY KEY,
    nama_produk VARCHAR(100),
    kategori VARCHAR(50),
    harga DOUBLE,
    berat FLOAT
);
INSERT INTO produk VALUES
(1, 'Kemeja Putih', 'Atasan', 150000, 0.3),
(2, 'Celana Jeans', 'Bawahan', 200000, 0.5),
(3, 'Jaket Hitam', 'Outerwear', 250000, 0.8),
(4, 'Dress Floral', 'Dress', 180000, 0.4),
(5, 'Kaos Polos', 'Atasan', 100000, 0.2),
(6, 'Rok Satin', 'Bawahan', 120000, 0.3),
(7, 'Blazer Navy', 'Outerwear', 300000, 0.7),
(8, 'Kemeja Denim', 'Atasan', 170000, 0.4),
(9, 'Celana Panjang', 'Bawahan', 150000, 0.6),
(10, 'Cardigan Abu-abu', 'Outerwear', 220000, 0.5);
select*from produk;

CREATE TABLE gudang(
	id_gudang INT(11) NOT NULL PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255)
);
INSERT INTO gudang VALUES
(1, 'Gudang Utama', 'Jl. Merdeka No. 10'),
(2, 'Gudang Cabang A', 'Jl. Diponegoro No. 20'),
(3, 'Gudang Cabang B', 'Jl. Asia Afrika No. 30'),
(4, 'Gudang Pusat', 'Jl. Gatot Subroto No. 40'),
(5, 'Gudang Timur', 'Jl. Sudirman No. 50'),
(6, 'Gudang Barat', 'Jl. Pahlawan No. 60'),
(7, 'Gudang Selatan', 'Jl. Jenderal Sudirman No. 70'),
(8, 'Gudang Utara', 'Jl. Hayam Wuruk No. 80'),
(9, 'Gudang Sentral', 'Jl. Majapahit No. 90'),
(10, 'Gudang Tengah', 'Jl. Surya No. 100');
select*from gudang;

CREATE TABLE karyawan(
	id_karyawan INT(11) NOT NULL PRIMARY KEY,
    id_gudang INT(11),
    nama VARCHAR(100),
    alamat VARCHAR(255),
    posisi VARCHAR(50),
    gaji DOUBLE,
	FOREIGN KEY (id_gudang) REFERENCES gudang (id_gudang)
);
INSERT INTO karyawan VALUES
(1, 1, 'Budi', 'Jl. Harmoni No. 5', 'Manager', 8000000),
(2, 2, 'Ani', 'Jl. Majapahit No. 15', 'Supervisor', 6000000),
(3, 3, 'Citra', 'Jl. Surya No. 25', 'Staff', 4000000),
(4, 1, 'Dika', 'Jl. Pahlawan No. 35', 'Staff', 4000000),
(5, 2, 'Eka', 'Jl. Diponegoro No. 45', 'Staff', 4000000),
(6, 3, 'Fajar', 'Jl. Gatot Subroto No. 55', 'Supervisor', 6000000),
(7, 1, 'Gita', 'Jl. Asia Afrika No. 65', 'Staff', 4000000),
(8, 2, 'Hadi', 'Jl. Gajah Mada No. 75', 'Staff', 4000000),
(9, 3, 'Indah', 'Jl. Hayam Wuruk No. 85', 'Staff', 4000000),
(10, 1, 'Joko', 'Jl. Sudirman No. 95', 'Supervisor', 6000000);
select*from karyawan;

CREATE TABLE supplier(
	id_supplier INT(11) PRIMARY KEY,
    nama_supplier VARCHAR(100),
    alamat VARCHAR(255),
    telepon CHAR(15),
    email VARCHAR(100)
);
INSERT INTO supplier VALUES
(1, 'Garmentex Industri', 'Jl. Industri No. 1', '08123456789', 'garmentex_industri@example.com'),
(2, 'Modekreasi Factory', 'Jl. Kreatif No. 2', '08234567890', 'modekreasi_factory@example.com'),
(3, 'Fashionfabric Manufacturing', 'Jl. Tekstil No. 3', '08345678901', 'fashionfabric_manufacturing@example.com'),
(4, 'Stylecraft Inc.', 'Jl. Craft No. 4', '08456789012', 'stylecraft_inc@example.com'),
(5, 'Trendywear Factory', 'Jl. Mode No. 5', '08567890123', 'trendywear_factory@example.com'),
(6, 'Couturetextile Production', 'Jl. Tekstil No. 6', '08678901234', 'couturetextile_production@example.com'),
(7, 'Chicstyle Manufacturing', 'Jl. Chic No. 7', '08789012345', 'chicstyle_manufacturing@example.com'),
(8, 'Casualwear Factory', 'Jl. Casual No. 8', '08890123456', 'casualwear_factory@example.com'),
(9, 'Urbanmode Industries', 'Jl. Urban No. 9', '08901234567', 'urbanmode_industries@example.com'),
(10, 'Trendsetter Corporation', 'Jl. Trend No. 10', '08912345678', 'trendsetter_corporation@example.com');
select*from supplier;

CREATE TABLE stok(
	id_stok INT (11) NOT NULL PRIMARY KEY,
    id_produk INT(11),
    id_gudang INT(11),
    jumlah INT(11),
    tanggal_update DATETIME,
    FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
	FOREIGN KEY (id_gudang) REFERENCES gudang (id_gudang)
);
INSERT INTO stok VALUES
(1, 1, 1, 200, '2024-05-12 08:00:00'),
(2, 2, 1, 150, '2024-05-12 08:00:00'),
(3, 3, 2, 100, '2024-05-12 08:00:00'),
(4, 4, 2, 120, '2024-05-12 08:00:00'),
(5, 5, 3, 180, '2024-05-12 08:00:00'),
(6, 6, 3, 90, '2024-05-12 08:00:00'),
(7, 7, 1, 80, '2024-05-12 08:00:00'),
(8, 8, 2, 110, '2024-05-12 08:00:00'),
(9, 9, 3, 130, '2024-05-12 08:00:00'),
(10, 10, 1, 70, '2024-05-12 08:00:00');
select*from stok;

CREATE TABLE transaksi(
	id_transaksi INT(11) NOT NULL PRIMARY KEY,
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
INSERT INTO transaksi VALUES
(1, 1, 1, 1, 50, 7500000, '2024-04-23 10:00:00'),
(2, 2, 2, 2, 30, 6000000, '2024-04-29 10:30:00'),
(3, 3, 3, 3, 20, 5000000, '2024-05-11 11:00:00'),
(4, 4, 4, 4, 40, 7200000, '2024-05-11 11:30:00'),
(5, 5, 5, 5, 60, 6000000, '2024-05-12 12:00:00'),
(6, 6, 6, 6, 25, 3000000, '2024-05-13 12:30:00'),
(7, 7, 7, 7, 15, 4500000, '2024-05-13 13:00:00'),
(8, 8, 8, 8, 35, 5950000, '2024-05-13 13:30:00'),
(9, 9, 9, 9, 45, 6750000, '2024-05-1 14:00:00'),
(10, 10, 10, 10, 10, 2200000, '2024-05-13 14:30:00');
UPDATE transaksi SET total_harga = 150000 WHERE id_transaksi = 1;
UPDATE transaksi SET jumlah = 1 WHERE id_transaksi = 1;
select*from transaksi;

-- 1. Buatlah Stored Procedure untuk menghitung total harga dari semua transaksi yang
-- dilakukan oleh seorang karyawan tertentu. Procedure harus menerapkan parameter IN
-- dan parameter OUT.
DELIMITER //
CREATE PROCEDURE totalharga(
    IN karyawan_id INT,
    OUT total_harga_var DOUBLE
)
BEGIN
    SELECT SUM(total_harga) INTO total_harga_var
    FROM transaksi
    WHERE id_karyawan = karyawan_id;
END//
DELIMITER ;
CALL totalharga(2, @total_harga_var);
SELECT @total_harga_var;

-- 2. Buatkanlah procedure untuk mengetahui berapa lama(hari) setiap produk berada
-- digudang sejak tanggal masuk produk.
DELIMITER //
CREATE PROCEDURE Lama_Produk()
BEGIN
    SELECT CONCAT('Produk ', Produk.Nama_Produk, ' Berada di Gudang ', Gudang.Nama, ' Selama ', DATEDIFF(CURDATE(), Stok.Tanggal_Update), ' Hari.') AS Result
    FROM Produk
    JOIN Stok ON Produk.ID_Produk = Stok.ID_Produk
    JOIN Gudang ON Stok.ID_Gudang = Gudang.ID_Gudang;
END //
DELIMITER ;
CALL Lama_Produk();

DELIMITER //
CREATE PROCEDURE LamaProduk_Gudang()
BEGIN
    SELECT p.nama_produk, g.nama, DATEDIFF(CURDATE(), s.tanggal_update) AS lama_di_gudang
    FROM produk p
    JOIN stok s ON p.id_produk = s.id_produk
    JOIN gudang g ON s.id_gudang = g.id_gudang;
END //
DELIMITER ;
CALL LamaProduk_Gudang();

-- 3. Buatkan procedure untuk menghapus transaksi pada 1 bulan terakhir, tetapi jika total
-- harga nya lebih dari 200 ribu maka tidak dapat di hapus.
DELIMITER //
CREATE PROCEDURE hapus_transaksi()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
END //
DELIMITER ;
CALL hapus_transaksi();
SELECT * FROM transaksi; 
-- DROP PROCEDURE hapus_transaksi;