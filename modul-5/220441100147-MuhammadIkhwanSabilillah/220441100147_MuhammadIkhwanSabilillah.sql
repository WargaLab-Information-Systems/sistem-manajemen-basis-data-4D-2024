CREATE DATABASE logistik_pakaian;
USE logistik_pakaian;
CREATE TABLE produk (
	id_produk INT PRIMARY KEY,
    nama_produk VARCHAR(100),
    kategori VARCHAR(50),
    harga DOUBLE,
    berat FLOAT
);

CREATE TABLE gudang (
	id_gudang INT PRIMARY KEY,
    nama VARCHAR(100),
    alamat VARCHAR(255)
);

CREATE TABLE stok (
	id_stok INT PRIMARY KEY,
    id_produk INT,
    id_gudang INT,
    jumlah INT,
    tanggal_update DATETIME,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
    FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);

CREATE TABLE supplier (
	id_supplier INT PRIMARY KEY,
    nama_supplier VARCHAR(100),
    alamat VARCHAR(255),
    telepon CHAR(15),
    email VARCHAR(100)
);

CREATE TABLE karyawan (
	id_karyawan INT PRIMARY KEY,
    id_gudang INT,
    nama VARCHAR(100),
    alamat VARCHAR(255),
    posisi VARCHAR(50),
    gaji DOUBLE,
    FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);

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
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES
(1, 'Kemeja', 'Pakaian Pria', 150000.00, 0.3),
(2, 'Kaos', 'Pakaian Pria', 270000.00, 0.3),
(3, 'Kemeja Flanel', 'Pakaian Pria', 300000.00, 0.4),
(4, 'Outer', 'Pakaian Wanita', 80000.00, 0.2),
(5, 'Celana Jeans', 'Pakaian Pria', 150000.00, 0.5),
(6, 'Celana Kain', 'Pakaian Pria', 220000.00, 0.4),
(7, 'Blouse Putih', 'Pakaian Wanita', 100000.00, 0.3),
(8, 'Dress Floral', 'Pakaian Wanita', 250000.00, 0.4),
(9, 'Jaket Jeans', 'Pakaian Unisex', 300000.00, 0.6),
(10, 'Skirt', 'Pakaian Wanita', 150000.00, 0.7);

INSERT INTO gudang (id_gudang, nama, alamat) VALUES
(1, 'Gudang Utama', 'Jl. Merdeka No. 10, Jakarta'),
(2, 'Gudang Cabang', 'Jl. Sudirman No. 20, Surabaya'),
(3, 'Gudang Pusat', 'Jl. Gatot Subroto No. 30, Bandung');

INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) VALUES
(1, 1, 1, 100, '2024-05-01 08:00:00'),
(2, 2, 1, 120, '2024-05-02 08:00:00'),
(3, 3, 2, 80, '2024-05-03 08:00:00'),
(4, 4, 2, 150, '2024-05-04 08:00:00'),
(5, 5, 3, 90, '2024-05-04 08:00:00'),
(6, 6, 3, 110, '2024-05-05 08:00:00'),
(7, 7, 1, 200, '2024-05-06 08:00:00'),
(8, 8, 2, 130, '2024-05-07 08:00:00'),
(9, 9, 3, 70, '2024-05-08 08:00:00'),
(10, 10, 1, 180, '2024-05-10 08:00:00');

INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) VALUES
(1, 'Hasnah', 'Jl. Mangga No. 5, Jakarta', '081234567890', 'hasnah@gmail.com'),
(2, 'Putri', 'Jl. Anggrek No. 10, Surabaya', '085678901234', 'putri@gmail.com'),
(3, 'Pipin', 'Jl. Mawar No. 15, Bandung', '081122334455', 'pipin@gmail.com.com'),
(4, 'Nadia', 'Jl. Melati No. 20, Semarang', '081998877665', 'nadia@gmail.com'),
(5, 'Anisa', 'Jl. Kenanga No. 25, Medan', '087654321098', 'anisa@gmail.com'),
(6, 'Icha', 'Jl. Cempaka No. 30, Makassar', '081234567891', 'icha@gmail.com'),
(7, 'Adhel', 'Jl. Raya No. 35, Denpasar', '081112223344', 'adhel@gmail.com'),
(8, 'Salwa', 'Jl. Sudirman No. 40, Yogyakarta', '085678901237', 'salwa@gmail.com'),
(9, 'Faradisil', 'Jl. Gatot Subroto No. 45, Malang', '081234567892', 'faradisil@gmail.com'),
(10, 'Syahda', 'Jl. Diponegoro No. 50, Bandar Lampung', '081122334478', 'syahda@gmail.com');

INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(1, 1, 'Budi Santoso', 'Jl. Merdeka No. 10, Jakarta', 'Manager Gudang', 5000000.00),
(2, 2, 'Ani Cahaya', 'Jl. Sudirman No. 20, Surabaya', 'Kepala Gudang', 4500000.00),
(3, 3, 'Citra Dewi', 'Jl. Gatot Subroto No. 30, Bandung', 'Staff Gudang', 4000000.00),
(4, 1, 'Dodi Wibowo', 'Jl. Merdeka No. 10, Jakarta', 'Pengirim', 3500000.00),
(5, 2, 'Eka Putri', 'Jl. Sudirman No. 20, Surabaya', 'Penerima', 3500000.00),
(6, 3, 'Fajar Setiawan', 'Jl. Gatot Subroto No. 30, Bandung', 'Pengawas Gudang', 3800000.00),
(7, 1, 'Gita Puspita', 'Jl. Merdeka No. 10, Jakarta', 'Pengepakan', 3300000.00),
(8, 2, 'Hadi Firmansyah', 'Jl. Sudirman No. 20, Surabaya', 'Penyortir', 3300000.00),
(9, 3, 'Indah Permata', 'Jl. Gatot Subroto No. 30, Bandung', 'Admin Gudang', 3000000.00),
(10, 1, 'Joko Budiman', 'Jl. Merdeka No. 10, Jakarta', 'Kurir', 3200000.00);

INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
(1, 1, 1, 1, 3, 4500000.00, '2024-05-02 09:00:00'),
(2, 2, 2, 2, 10, 2700000.00, '2024-05-03 10:00:00'),
(3, 3, 3, 3, 6, 1800000.00, '2024-05-04 11:00:00'),
(4, 4, 4, 4, 2, 160000.00, '2024-05-05 12:00:00'),
(5, 5, 5, 5, 5, 750000.00, '2024-05-06 13:00:00'),
(6, 6, 6, 6, 10, 2200000.00, '2024-05-07 14:00:00'),
(7, 7, 7, 7, 1, 100000.00, '2024-05-08 15:00:00'),
(8, 8, 8, 8, 3, 750000.00, '2024-05-09 16:00:00'),
(9, 9, 9, 9, 5, 1500000.00, '2024-05-10 17:00:00'),
(10, 10, 10, 10, 2, 300000.00, '2024-05-11 18:00:00');


-- soal 1
DELIMITER //
CREATE PROCEDURE total_harga (
	IN idkaryawan INT,
    OUT totalharga DOUBLE)
    BEGIN
		SELECT SUM(total_harga) INTO totalharga
        FROM transaksi
        WHERE id_karyawan = idkaryawan;
	END //
DELIMITER ;

CALL total_harga(1, @totalharga);
SELECT @totalharga AS total_harga;
select * from transaksi;

-- soal 2
DELIMITER //
CREATE PROCEDURE lama_produk()
BEGIN
    SELECT produk.nama_produk, gudang.nama, DATEDIFF(CURDATE(), stok.tanggal_update) AS lama_di_gudang
    FROM produk
    JOIN stok ON produk.id_produk = stok.id_produk
    JOIN gudang ON stok.id_gudang = gudang.id_gudang
    ORDER BY produk.id_produk;
END //
DELIMITER ;
CALL lama_produk();
select * from stok;

-- Nomor 3
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

INSERT INTO Transaksi (ID_Transaksi, ID_Produk, ID_Supplier, ID_Karyawan, Jumlah, Total_Harga, Tanggal_Transaksi) VALUES
	(4, 4, 4, 4, 2, 160000.00, '2024-05-05 12:00:00'),
	(7, 7, 7, 7, 1, 100000.00, '2024-05-08 15:00:00');