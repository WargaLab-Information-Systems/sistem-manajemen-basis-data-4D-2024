CREATE DATABASE modul5
USE modul5

CREATE TABLE supplier(
id_supplier INT NOT NULL PRIMARY KEY ,
nama_supplier VARCHAR (100) NOT NULL,
alamat VARCHAR(255)NOT NULL,
telepon CHAR NOT NULL,
email VARCHAR (100) NOT NULL)

CREATE TABLE gudang(
id_gudang INT NOT NULL PRIMARY KEY ,
nama VARCHAR (100) NOT NULL,
alamat VARCHAR(255)NOT NULL)


CREATE TABLE karyawan (
    id_karyawan INT NOT NULL PRIMARY KEY,
    id_gudang INT NOT NULL,
    nama VARCHAR(100) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    posisi VARCHAR(100) NOT NULL,
    gaji DOUBLE NOT NULL,
    FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);

CREATE TABLE produk (id_produk INT NOT NULL PRIMARY KEY,
nama_produk VARCHAR (100) NOT NULL,
kategori VARCHAR (50) NOT NULL,
harga DOUBLE NOT NULL,
berat FLOAT NOT NULL
);

CREATE TABLE stok (
    id_stok INT NOT NULL PRIMARY KEY,
    id_produk INT NOT NULL,
    id_gudang INT NOT NULL,
    jumlah INT NOT NULL,
    tanggal_update DATE NOT NULL,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);
CREATE TABLE transaksi (
id_transaksi INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
id_produk INT NOT NULL,
id_supplier INT NOT NULL,
id_karyawan INT NOT NULL,
jumlah INT NOT NULL,
total_harga DOUBLE NOT NULL,
tanggal_transaksi DATETIME NOT NULL,
FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan),
FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier)
);

DROP TABLE transaksi

-- data dumy insert to table
INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) VALUES
(1, 'PT Maju Jaya', 'Jl. Pahlawan No. 123', '081234567890', 'info@majujaya.com'),
(2, 'CV Bersama Sentosa', 'Jl. Diponegoro No. 45', '082345678901', 'cs@bersamasentosa.com'),
(3, 'UD Sejahtera Abadi', 'Jl. Ahmad Yani No. 67', '083456789012', 'sejahtera@udabadi.com'),
(4, 'Toko Baru Jaya', 'Jl. Gatot Subroto No. 89', '084567890123', 'toko@barujaya.com'),
(5, 'Pusat Grosir Barokah', 'Jl. Imam Bonjol No. 101', '085678901234', 'grosir@barokah.com'),
(6, 'PT Mega Mulia', 'Jl. Sudirman No. 111', '086789012345', 'mega@mulia.com'),
(7, 'CV Berkah Jaya', 'Jl. Gajah Mada No. 121', '087890123456', 'berkah@jaya.com'),
(8, 'Toko Sentral', 'Jl. K.H. Hasyim Ashari No. 131', '088901234567', 'info@tokosentral.com'),
(9, 'UD Sinar Baru', 'Jl. Cikini Raya No. 141', '089012345678', 'sinarbaru@ud.com'),
(10, 'PT Sukses Mandiri', 'Jl. Hayam Wuruk No. 151', '089123456789', 'sukses@mandiri.com');

INSERT INTO gudang (id_gudang, nama, alamat) VALUES
(1, 'Gudang Utama', 'Jl. Jendral Sudirman No. 1'),
(2, 'Gudang Pusat', 'Jl. Pangeran Antasari No. 2'),
(3, 'Gudang Sentral', 'Jl. Diponegoro No. 3'),
(4, 'Gudang Baru', 'Jl. Gatot Subroto No. 4'),
(5, 'Gudang Mega', 'Jl. Ahmad Yani No. 5'),
(6, 'Gudang Bersama', 'Jl. Imam Bonjol No. 6'),
(7, 'Gudang Maju', 'Jl. K.H. Hasyim Ashari No. 7'),
(8, 'Gudang Sejahtera', 'Jl. Gajah Mada No. 8'),
(9, 'Gudang Sentosa', 'Jl. Hayam Wuruk No. 9'),
(10, 'Gudang Bahagia', 'Jl. Cikini Raya No. 10');

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 1, 'Budi Santoso', 'Jl. Diponegoro No. 11', 'Manager', 5000000.00),
(2, 2, 'Ani Susanti', 'Jl. Sudirman No. 22', 'Supervisor', 3500000.00),
(3, 3, 'Joko Wibowo', 'Jl. Pahlawan No. 33', 'Staff', 2500000.00),
(4, 4, 'Dewi Rahayu', 'Jl. Gajah Mada No. 44', 'Staff', 2500000.00),
(5, 5, 'Agus Setiawan', 'Jl. Gatot Subroto No. 55', 'Staff', 2500000.00),
(6, 6, 'Siti Rahmah', 'Jl. Ahmad Yani No. 66', 'Staff', 2500000.00),
(7, 7, 'Hadi Pranoto', 'Jl. Imam Bonjol No. 77', 'Supervisor', 3500000.00),
(8, 8, 'Rina Amelia', 'Jl. K.H. Hasyim Ashari No. 88', 'Staff', 2500000.00),
(9, 9, 'Indra Wijaya', 'Jl. Hayam Wuruk No. 99', 'Staff', 2500000.00),
(10, 10, 'Dian Kartika', 'Jl. Cikini Raya No. 1010', 'Staff', 2500000.00);

INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES
(1, 'Kemeja Polos', 'Pakaian Pria', 150000.00, 0.5),
(2, 'Celana Jeans', 'Pakaian Pria', 250000.00, 0.7),
(3, 'Blouse Wanita', 'Pakaian Wanita', 200000.00, 0.6),
(4, 'Kaos Oblong', 'Pakaian Unisex', 100000.00, 0.3),
(5, 'Jaket Kulit', 'Pakaian Pria', 500000.00, 1.0),
(6, 'Dress Cantik', 'Pakaian Wanita', 300000.00, 0.8),
(7, 'Hoodie Trendy', 'Pakaian Unisex', 180000.00, 0.5),
(8, 'Kemeja Batik', 'Pakaian Pria', 200000.00, 0.6),
(9, 'Rok Panjang', 'Pakaian Wanita', 150000.00, 0.4),
(10, 'Kaos V-Neck', 'Pakaian Unisex', 120000.00, 0.3);

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) VALUES
(1, 1, 1, 100, '2024-02-01'),
(2, 2, 2, 80, '2024-02-02'),
(3, 3, 3, 120, '2024-02-03'),
(4, 4, 4, 150, '2024-02-04'),
(5, 5, 5, 70, '2024-02-05'),
(6, 6, 6, 90, '2024-02-06'),
(7, 7, 7, 110, '2024-02-07'),
(8, 8, 8, 130, '2024-02-08'),
(9, 9, 9, 100, '2024-02-09'),
(10, 10, 10, 80, '2024-02-10');


INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
(NULL, 1, 1, 1, 50, 7500000.00, '2024-03-01 08:30:00'),
(NULL, 2, 2, 2, 40, 10000000.00, '2024-03-02 09:45:00'),
(NULL, 3, 3, 3, 60, 12000000.00, '2024-03-03 10:20:00'),
(NULL, 4, 4, 4, 80, 12000000.00, '2024-03-04 11:15:00'),
(NULL, 5, 5, 5, 30, 15000000.00, '2024-03-05 12:00:00'),
(NULL, 6, 6, 6, 70, 21000000.00, '2024-03-06 13:30:00'),
(NULL, 7, 7, 7, 90, 16200000.00, '2024-03-07 14:45:00'),
(NULL, 8, 8, 8, 110, 22000000.00, '2024-03-08 15:20:00'),
(NULL, 9, 9, 9, 50, 7500000.00, '2024-05-03 16:10:00'),
(NULL, 10, 10, 10, 40, 4800000.00, '2024-03-10 17:00:00'),
(NULL, 1, 1, 1, 1, 150000.00, '2024-03-01 08:30:00'),
(NULL, 2, 2, 2, 40, 10000000.00, '2024-03-02 09:45:00'),
(NULL, 3, 3, 3, 60, 12000000.00, '2024-03-03 10:20:00'),
(NULL, 4, 4, 4, 80, 12000000.00, '2024-03-04 11:15:00'),
(NULL, 5, 5, 5, 30, 15000000.00, '2024-03-05 12:00:00'),
(NULL, 6, 6, 6, 70, 21000000.00, '2024-03-06 13:30:00'),
(NULL, 7, 7, 7, 90, 16200000.00, '2024-03-07 14:45:00'),
(NULL, 8, 8, 8, 110, 22000000.00, '2024-03-08 15:20:00'),
(NULL, 9, 9, 9, 50, 7500000.00, '2024-05-03 16:10:00'),
(NULL, 10, 10, 10, 40, 4800000.00, '2024-03-10 17:00:00');

TRUNCATE transaksi
SELECT * FROM transaksi
-- create procedure for question

-- soal 1
DELIMITER //

CREATE PROCEDURE soal1(
    IN karyawan_id INT,
    OUT tot_harga DOUBLE
)
BEGIN
    SELECT SUM(total_harga) INTO tot_harga
    FROM transaksi 
    WHERE id_karyawan = karyawan_id;
END //

DELIMITER ;

CALL soal1(5, @tot_harga);
SELECT @tot_harga AS total_harga_transaksi_karyawan;


-- soal 2
DELIMITER //
CREATE OR REPLACE  PROCEDURE soal2()
BEGIN
    SELECT nama_produk, tanggal_update AS Tanggal_Masuk_gudang,CONCAT(DATEDIFF(NOW(), tanggal_update),' Hari') AS lama_diGudang  
    FROM produk 
    NATURAL JOIN stok;
END //
DELIMITER ;

CALL soal2()

-- soal 3
DELIMITER //
CREATE OR REPLACE PROCEDURE soal3()

BEGIN
    
    DELETE FROM transaksi
    WHERE tanggal_transaksi <= DATE_SUB(NOW(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
    ALTER TABLE transaksi DROP id_transaksi;
    ALTER TABLE transaksi ADD id_transaksi INT NOT NULL PRIMARY KEY AUTO_INCREMENT KEY FIRST;

END //
DELIMITER;

CALL soal3()
SELECT* FROM transaksi 