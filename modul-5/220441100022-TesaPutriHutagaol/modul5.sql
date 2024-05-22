CREATE DATABASE modul5;
USE modul5;

CREATE TABLE produk(
id_produk INT(11) PRIMARY KEY,
nama_produk VARCHAR(100),
kategori VARCHAR(50),
harga DOUBLE,
berat FLOAT);

INSERT INTO produk(id_produk, nama_produk, kategori, harga, berat)
VALUES
(1, 'Topi Baseball Hitam', 'Aksesoris', 50000, 0.1),
(2, 'Kacamata Sunglasses', 'Aksesoris', 80000, 0.15),
(3, 'Sepatu Sneakers Casual', 'Sepatu', 300000, 0.6),
(4, 'Tas Ransel Vintage', 'Tas', 250000, 0.7),
(5, 'Dompet Kulit Asli', 'Aksesoris', 150000, 0.2),
(6, 'Jam Tangan Analog', 'Aksesoris', 120000, 0.3),
(7, 'Scarf Rajut Hangat', 'Aksesoris', 70000, 0.25),
(8, 'Celana Pendek Cargo', 'Celana', 150000, 0.4),
(9, 'Kaos Polo Tahan Lama', 'Kaos', 100000, 0.3),
(10, 'Jas Formal Slim Fit', 'Jas', 500000, 1.2);


CREATE TABLE gudang(
id_gudang INT(11) PRIMARY KEY,
nama VARCHAR(100),
alamat VARCHAR(255)
);

INSERT INTO gudang (id_gudang, nama, alamat) 
VALUES
(1, 'Gudang Sentral', 'Jl. Gatot Subroto No. 100'),
(2, 'Gudang Sentosa', 'Jl. Surya Sumantri No. 200'),
(3, 'Gudang Bersama', 'Jl. Hayam Wuruk No. 300'),
(4, 'Gudang Mandiri', 'Jl. Thamrin No. 400'),
(5, 'Gudang Makmur', 'Jl. Dipatiukur No. 500'),
(6, 'Gudang Jaya', 'Jl. Ciliwung No. 600'),
(7, 'Gudang Baru', 'Jl. Taman Sari No. 700'),
(8, 'Gudang Indah', 'Jl. Teuku Umar No. 800'),
(9, 'Gudang Asri', 'Jl. Dipati Ewang No. 900'),
(10, 'Gudang Sejahtera', 'Jl. Surapati No. 1000');


CREATE TABLE supplier(
id_supplier INT(11) PRIMARY KEY,
nama_supplier VARCHAR(100),
alamat VARCHAR(255),
telepon CHAR(15),
email VARCHAR(100)
);

INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) 
VALUES
(1, 'PT Perkasa Mandiri', 'Jl. Diponegoro No. 50', '081234567890', 'perkasamandiri@perkasa.com'),
(2, 'CV Jaya Abadi', 'Jl. Surya Kencana No. 12', '085678901234', 'jayaabadi@cvjabadi.co.id'),
(3, 'UD Sentosa Gemilang', 'Jl. Hayam Wuruk No. 15', '082345678901', 'sentosagemilang@gmail.com'),
(4, 'PT Maju Jaya', 'Jl. Thamrin No. 25', '081234567890', 'majujaya@outlook.com'),
(5, 'CV Gemilang Sejahtera', 'Jl. Dipatiukur No. 18', '085678901234', 'gemilangsejahtera@yahoo.com'),
(6, 'PT Berkah Bersama', 'Jl. Ciliwung No. 30', '082345678901', 'berkahbersama@outlook.com'),
(7, 'CV Sentra Mode', 'Jl. Taman Sari No. 5', '081234567890', 'sentramode.cv@gmail.com'),
(8, 'PT Mandiri Sentosa', 'Jl. Teuku Umar No. 40', '085678901234', 'mandirisentosa@outlook.com'),
(9, 'UD Berkah Makmur', 'Jl. Dipati Ewang No. 10', '082345678901', 'berkahmakmur.ud@yahoo.com'),
(10, 'CV Jaya Wijaya', 'Jl. Surapati No. 8', '081234567890', 'jayawijaya.cv@gmail.com');


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
(1, 1, 1, 250, '2024-06-10 08:00:00'),
(2, 2, 2, 200, '2024-03-15 09:30:00'),
(3, 3, 3, 150, '2024-02-10 10:45:00'),
(4, 4, 4, 120, '2023-08-05 12:00:00'),
(5, 5, 5, 400, '2023-09-05 13:20:00'),
(6, 6, 6, 70, '2023-10-05 14:40:00'),
(7, 7, 7, 150, '2024-05-10 16:00:00'),
(8, 8, 8, 110, '2024-05-20 17:15:00'),
(9, 9, 9, 180, '2024-05-21 18:30:00'),
(10, 10, 10, 220, '2024-05-22 19:45:00');



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
(1, 1, 'Rizky', 'Jl. Mangga Besar No. 10', 'Manajer', 12000000),
(2, 2, 'Ahmad', 'Jl. Cendrawasih No. 20', 'Supervisor', 9000000),
(3, 3, 'Budi', 'Jl. Diponegoro No. 30', 'Staff', 6000000),
(4, 4, 'Cahya', 'Jl. A. Yani No. 40', 'Staff', 6000000),
(5, 5, 'Dian', 'Jl. Sudirman No. 50', 'Supervisor', 9000000),
(6, 6, 'Eka', 'Jl. Veteran No. 60', 'Staff', 6000000),
(7, 7, 'Fani', 'Jl. Pahlawan No. 70', 'Manajer', 12000000),
(8, 8, 'Gita', 'Jl. Merdeka No.11', 'Manajer', 12000000),
(9, 9, 'Hadi', 'Jl. Gajah Mada No. 80', 'Staff', 6000000),
(10, 10, 'Ira', 'Jl. Imam Bonjol No. 90', 'Supervisor', 9000000);

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
(1, 1, 1, 1, 70, 105000, '2024-06-15 08:30:00'),
(2, 2, 2, 2, 40, 48000, '2024-04-20 09:45:00'),
(3, 3, 3, 3, 25, 5000000, '2024-03-06 11:00:00'),
(4, 4, 4, 4, 20, 5000000, '2024-02-27 12:30:00'),
(5, 5, 5, 4, 120, 9600000, '2024-02-28 14:00:00'),
(6, 6, 6, 6, 15, 4500000, '2023-07-20 15:15:00'),
(7, 7, 7, 7, 50, 6000000, '2023-10-29 16:45:00'),
(8, 8, 8, 8, 30, 2700000, '2022-09-20 18:00:00'),
(9, 9, 9, 9, 45, 12600000, '2024-05-20 19:30:00'),
(10, 10, 10, 10, 60, 21000000, '2023-10-25 21:45:00');

DROP TABLE transaksi;

-- 1. Buatlah Stored Procedure untuk menghitung total harga dari semua transaksi yang
-- dilakukan oleh seorang karyawan tertentu. Procedure harus menerapkan parameter IN
-- dan parameter OUT.

DELIMITER //

CREATE PROCEDURE total_transaksi(
IN karyawan INT(11),
OUT harga_transaksi BIGINT(30)
)
BEGIN
SELECT SUM(total_harga) INTO harga_transaksi
FROM transaksi
WHERE id_karyawan = karyawan;
END //
DELIMITER ;

DROP PROCEDURE total_transaksi;
CALL total_transaksi(7, @harga_transaksi);
SELECT @harga_transaksi AS total_transaksi_satu_karyawan;


-- 2. Buatkanlah procedure untuk mengetahui berapa lama(hari) setiap produk berada
-- digudang sejak tanggal masuk produk.

DELIMITER //

CREATE PROCEDURE lama_produk()
BEGIN
    SELECT CONCAT('Produk ', id_produk, ' berada di gudang selama ', DATEDIFF(NOW(), tanggal_update), ' hari.') 
    AS lama_produk_digudang
    FROM stok;
END //
DELIMITER ;

CALL lama_produk();
DROP PROCEDURE lama_produk;

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
DROP PROCEDURE hapus_transaksi;

CALL hapus_transaksi;
SELECT * FROM transaksi;
