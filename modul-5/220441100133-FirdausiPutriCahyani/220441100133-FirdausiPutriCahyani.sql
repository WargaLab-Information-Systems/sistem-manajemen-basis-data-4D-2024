CREATE DATABASE logistik_pakaian;
USE logistik_pakaian;

CREATE TABLE supplier (
	id_supplier INT (11) NOT NULL PRIMARY KEY,
    nama_supplier VARCHAR (100),
    alamat VARCHAR (255),
    telepon CHAR (15),
    email VARCHAR (100)
);

CREATE TABLE produk (
	id_produk INT (11) NOT NULL PRIMARY KEY,
    nama_produk VARCHAR (100),
    kategori VARCHAR (50),
    harga DOUBLE,
    berat FLOAT
);

CREATE TABLE gudang (
	id_gudang INT (11) NOT NULL PRIMARY KEY,
    nama VARCHAR (100),
    alamat VARCHAR (255)
);

CREATE TABLE stok (
	id_stok INT (11) NOT NULL PRIMARY KEY,
    id_produk INT (11) NOT NULL,
	id_gudang INT (11) NOT NULL,
    jumlah INT (11),
    tanggal_update DATETIME,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)    
);

CREATE TABLE karyawan (
	id_karyawan INT (11) NOT NULL PRIMARY KEY,
	id_gudang INT (11) NOT NULL,
    nama VARCHAR (100),
    alamat VARCHAR (255),
    posisi VARCHAR (50),
    gaji DOUBLE,
    FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)    
);

CREATE TABLE transaksi (
	id_transaksi INT (11) NOT NULL PRIMARY KEY,
	id_produk INT (11) NOT NULL,
	id_supplier INT (11) NOT NULL,
	id_karyawan INT (11) NOT NULL,
    jumlah INT (11),
    total_harga DOUBLE,
    tanggal_transaksi DATETIME,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) VALUES
(1, 'PT Makmur Jaya', 'Jl. Pahlawan No. 1', '0211234567', 'makmurjaya@example.com'),
(2, 'CV Bersama Sentosa', 'Jl. Merdeka No. 2', '0222345678', 'bersamasentosa@example.com'),
(3, 'UD Sejahtera Abadi', 'Jl. Asia No. 3', '0313456789', 'sejahteraabadi@example.com'),
(4, 'PT Cahaya Terang', 'Jl. Cahaya No. 4', '0344567890', 'cahayaterang@example.com'),
(5, 'CV Berkat Mulia', 'Jl. Berkat No. 5', '0355678901', 'berkatmulia@example.com'),
(6, 'UD Gemilang Makmur', 'Jl. Gemilang No. 6', '0366789012', 'gemilangmakmur@example.com'),
(7, 'PT Sukses Sejahtera', 'Jl. Sukses No. 7', '0377890123', 'suksessejahtera@example.com'),
(8, 'CV Jaya Baru', 'Jl. Baru No. 8', '0388901234', 'jayabaru@example.com'),
(9, 'UD Sentosa Makmur', 'Jl. Sentosa No. 9', '0399012345', 'sentosamakmur@example.com'),
(10, 'PT Sejahtera Bersama', 'Jl. Sejahtera No. 10', '0310123456', 'sejahterabersama@example.com');

INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES
(1, 'Kaos Polos', 'Kaos', 25000, 0.2),
(2, 'Kemeja Putih', 'Kemeja', 75000, 0.5),
(3, 'Celana Jeans', 'Celana', 120000, 0.8),
(4, 'Jaket Parka', 'Jaket', 200000, 1.2),
(5, 'Sweater Rajut', 'Sweater', 150000, 0.7),
(6, 'Rok Mini', 'Rok', 80000, 0.4),
(7, 'Hoodie', 'Jaket', 180000, 1.0),
(8, 'Blouse Motif', 'Blouse', 90000, 0.3),
(9, 'Celana Jogger', 'Celana', 100000, 0.6),
(10, 'Dress Satin', 'Dress', 160000, 0.9);


INSERT INTO gudang (id_gudang, nama, alamat) VALUES
(1, 'Gudang Utama', 'Jl. Utama No. 1'),
(2, 'Gudang Pusat', 'Jl. Pusat No. 2'),
(3, 'Gudang Sentral', 'Jl. Sentral No. 3'),
(4, 'Gudang Baru', 'Jl. Baru No. 4'),
(5, 'Gudang Maju', 'Jl. Maju No. 5'),
(6, 'Gudang Makmur', 'Jl. Makmur No. 6'),
(7, 'Gudang Sejahtera', 'Jl. Sejahtera No. 7'),
(8, 'Gudang Berkah', 'Jl. Berkah No. 8'),
(9, 'Gudang Sinar', 'Jl. Sinar No. 9'),
(10, 'Gudang Sukses', 'Jl. Sukses No. 10');

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) VALUES
(1, 1, 1, 100, '2024-05-01 08:00:00'),
(2, 2, 2, 150, '2024-05-02 08:30:00'),
(3, 3, 3, 200, '2024-05-03 09:00:00'),
(4, 4, 4, 80, '2024-05-04 09:30:00'),
(5, 5, 5, 120, '2024-05-05 10:00:00'),
(6, 6, 6, 100, '2024-05-06 10:30:00'),
(7, 7, 7, 200, '2024-05-07 11:00:00'),
(8, 8, 8, 150, '2024-05-08 11:30:00'),
(9, 9, 9, 180, '2024-05-09 12:00:00'),
(10, 10, 10, 250, '2024-05-10 12:30:00');

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 1, 'Budi', 'Jl. Raden Saleh No. 1', 'Manager', 10000000),
(2, 2, 'Siti', 'Jl. Diponegoro No. 2', 'Asisten Manager', 8000000),
(3, 3, 'Andi', 'Jl. Pahlawan No. 3', 'Supervisor', 7000000),
(4, 4, 'Rina', 'Jl. Merdeka No. 4', 'Operator', 5000000),
(5, 5, 'Dewi', 'Jl. Asia No. 5', 'Operator', 5000000),
(6, 6, 'Eko', 'Jl. Gemilang No. 6', 'Operator', 5000000),
(7, 7, 'Wati', 'Jl. Sukses No. 7', 'Operator', 5000000),
(8, 8, 'Agus', 'Jl. Baru No. 8', 'Operator', 5000000),
(9, 9, 'Lina', 'Jl. Sentosa No. 9', 'Kasir', 6000000),
(10, 10, 'Rudi', 'Jl. Sejahtera No. 10', 'Kasir', 6000000);

INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
(1, 1, 1, 1, 50, 1000000, '2024-05-01 10:00:00'),
(2, 2, 2, 2, 80, 1200000, '2024-05-02 10:30:00'),
(3, 3, 3, 3, 100, 2500000, '2024-05-03 11:00:00'),
(4, 4, 4, 4, 30, 300000, '2024-05-04 11:30:00'),
(5, 5, 5, 5, 50, 600000, '2024-05-05 12:00:00'),
(6, 6, 6, 6, 60, 480000, '2024-05-06 12:30:00'),
(7, 7, 7, 7, 70, 150000, '2024-05-07 13:00:00'),
(8, 8, 8, 8, 40, 600000, '2024-05-08 13:30:00'),
(9, 9, 9, 9, 90, 4500000, '2024-05-09 14:00:00'),
(10, 10, 10, 10, 120, 4200000, '2024-05-10 14:30:00');

-- 1. Buatlah Stored Procedure untuk menghitung total harga dari semua transaksi yang
-- dilakukan oleh seorang karyawan tertentu. Procedure harus menerapkan parameter IN
-- dan parameter OUT.
DELIMITER //
CREATE PROCEDURE totalharga(
    IN input_karyawan_id INT,
    OUT totalharga DOUBLE
)
BEGIN
    SELECT SUM(total_harga) INTO totalharga
    FROM transaksi
    WHERE id_karyawan = input_karyawan_id;
END//
DELIMITER ;
CALL totalharga(2, @totalharga);
SELECT @totalharga;

-- 2. Buatkanlah procedure untuk mengetahui berapa lama(hari) setiap produk berada
-- digudang sejak tanggal masuk produk.
DELIMITER //
CREATE PROCEDURE Lama_Produk()
BEGIN
    SELECT p.nama_produk, g.nama, DATEDIFF(CURDATE(), s.tanggal_update) AS lama_di_gudang
    FROM produk p
    JOIN stok s ON p.id_produk = s.id_produk
    JOIN gudang g ON s.id_gudang = g.id_gudang;
END //
DELIMITER ;
CALL Lama_Produk();

-- 3. Buatkan procedure untuk menghapus transaksi pada 1 bulan terakhir, tetapi jika total harga nya lebih dari 200 ribu maka tidak dapat di hapus.
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
