CREATE DATABASE db_tokoelektronik;
USE db_tokoelektronik;
-- drop database db_tokoelektronik;

CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY,
    nama_supplier VARCHAR(100),
    alamat_supplier VARCHAR(255),
    telepon_supplier VARCHAR(20)
);

CREATE TABLE penjual (
    penjual_id INT PRIMARY KEY,
    nama_penjual VARCHAR(100),
    alamat_penjual VARCHAR(255),
    telepon_penjual VARCHAR(20),
    supplier_id INT,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

CREATE TABLE barang (
    barang_id INT PRIMARY KEY,
    nama_barang VARCHAR(100),
    harga_barang DOUBLE,
    stok_barang INT,
    supplier_id INT,
    penjual_id INT,
    FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
    FOREIGN KEY (penjual_id) REFERENCES penjual(penjual_id)
);

CREATE TABLE gudang (
    gudang_id INT PRIMARY KEY,
    penjual_id INT,
    barang_id INT,
    FOREIGN KEY (penjual_id) REFERENCES penjual(penjual_id),
    FOREIGN KEY (barang_id) REFERENCES barang(barang_id)
);

CREATE TABLE pembeli (
    pembeli_id INT PRIMARY KEY,
    nama_pembeli VARCHAR(100),
    alamat_pembeli VARCHAR(255),
    telepon_pembeli VARCHAR(20)
);

CREATE TABLE transaksi (
    transaksi_id INT PRIMARY KEY,
    tanggal_transaksi DATE,
    jumlah_barang INT,
    total_harga DOUBLE,
    penjual_id INT,
    pembeli_id INT,
    FOREIGN KEY (penjual_id) REFERENCES penjual(penjual_id),
    FOREIGN KEY (pembeli_id) REFERENCES pembeli(pembeli_id)
);

CREATE TABLE pembayaran (
    pembayaran_id INT PRIMARY KEY,
    transaksi_id INT,
    metode_pembayaran VARCHAR(50),
    jumlah_pembayaran DOUBLE,
    tanggal_pembayaran DATE,
    FOREIGN KEY (transaksi_id) REFERENCES transaksi(transaksi_id)
);

-- Isi data dummy untuk tabel supplier
INSERT INTO supplier (supplier_id, nama_supplier, alamat_supplier, telepon_supplier) VALUES
(1, 'PT Elektronik Jaya', 'Jl. Raya No. 123', '081234567890'),
(2, 'CV Tekno Mandiri', 'Jl. Merdeka No. 45', '085678901234'),
(3, 'UD Sinar Baru', 'Jl. Diponegoro No. 78', '082345678901'),
(4, 'Toko Elektronik Maju', 'Jl. Pahlawan No. 10', '081234567890'),
(5, 'Electro Gadgets', 'Jl. Gatot Subroto No. 32', '085678901234'),
(6, 'Mitra Elektronik', 'Jl. Surya Sumantri No. 15', '082345678901'),
(7, 'Energi Elektronik', 'Jl. Asia Afrika No. 56', '081234567890'),
(8, 'Maju Jaya Elektronik', 'Jl. Hayam Wuruk No. 25', '085678901234'),
(9, 'Cahaya Elektronik', 'Jl. Ahmad Yani No. 38', '082345678901'),
(10, 'Galaxy Electronics', 'Jl. Sudirman No. 20', '081234567890');

-- Isi data dummy untuk tabel penjual
INSERT INTO penjual (penjual_id, nama_penjual, alamat_penjual, telepon_penjual, supplier_id) VALUES
(1, 'Budi Elektronik', 'Jl. Gatot Subroto No. 10', '081234567890', 1),
(2, 'Ani Tekno', 'Jl. Merdeka No. 20', '085678901234', 2),
(3, 'Joko Gadget', 'Jl. Asia Afrika No. 30', '082345678901', 3),
(4, 'Siti Electronic', 'Jl. Pahlawan No. 40', '081234567890', 4),
(5, 'Dewi Store', 'Jl. Surya Sumantri No. 50', '085678901234', 5),
(6, 'Agus Elektronik', 'Jl. Hayam Wuruk No. 60', '082345678901', 6),
(7, 'Rudi Tech', 'Jl. Diponegoro No. 70', '081234567890', 7),
(8, 'Yuni Shop', 'Jl. Ahmad Yani No. 80', '085678901234', 8),
(9, 'Eka Electronic', 'Jl. Sudirman No. 90', '082345678901', 9),
(10, 'Fani Electronics', 'Jl. Raya No. 100', '081234567890', 10);

-- Isi data dummy untuk tabel barang
INSERT INTO barang (barang_id, nama_barang, harga_barang, stok_barang, supplier_id, penjual_id) VALUES
(1, 'Televisi LED 32 inci', 2500000, 10, 1, 1),
(2, 'Kulkas 2 Pintu', 3500000, 8, 2, 2),
(3, 'Laptop ASUS', 8000000, 15, 3, 3),
(4, 'Mesin Cuci Front Loading', 4000000, 12, 4, 4),
(5, 'Kamera Mirrorless', 6000000, 7, 5, 5),
(6, 'Smartphone Samsung', 5000000, 20, 6, 6),
(7, 'AC Split 1 PK', 4500000, 9, 7, 7),
(8, 'Soundbar Sony', 3000000, 5, 8, 8),
(9, 'Speaker Bluetooth', 1000000, 25, 9, 9),
(10, 'Powerbank Xiaomi', 200000, 30, 10, 10);

-- Isi data dummy untuk tabel pembeli
INSERT INTO pembeli (pembeli_id, nama_pembeli, alamat_pembeli, telepon_pembeli) VALUES
(1, 'Ahmad', 'Jl. Veteran No. 5', '081234567890'),
(2, 'Siti', 'Jl. Ahmad Yani No. 10', '085678901234'),
(3, 'Budi', 'Jl. Diponegoro No. 15', '082345678901'),
(4, 'Dewi', 'Jl. Merdeka No. 20', '081234567890'),
(5, 'Eka', 'Jl. Asia Afrika No. 25', '085678901234'),
(6, 'Fani', 'Jl. Gatot Subroto No. 30', '082345678901'),
(7, 'Gita', 'Jl. Sudirman No. 35', '081234567890'),
(8, 'Hadi', 'Jl. Hayam Wuruk No. 40', '085678901234'),
(9, 'Ika', 'Jl. Pahlawan No. 45', '082345678901'),
(10, 'Joko', 'Jl. Surya Sumantri No. 50', '081234567890');

-- Isi data dummy untuk tabel transaksi
INSERT INTO transaksi (transaksi_id, tanggal_transaksi, jumlah_barang, total_harga, penjual_id, pembeli_id) VALUES
(1, '2024-04-01', 2, 5000000, 1, 1),
(2, '2024-04-02', 1, 3500000, 2, 2),
(3, '2024-04-03', 3, 24000000, 3, 3),
(4, '2024-04-04', 1, 4000000, 4, 4),
(5, '2024-04-05', 2, 12000000, 5, 5),
(6, '2024-04-06', 1, 5000000, 6, 6),
(7, '2024-04-07', 1, 4500000, 7, 7),
(8, '2024-04-08', 1, 3000000, 8, 8),
(9, '2024-04-09', 5, 5000000, 9, 9),
(10, '2024-04-10', 10, 2000000, 10, 10);

-- Isi data dummy untuk tabel pembayaran
INSERT INTO pembayaran (pembayaran_id, transaksi_id, metode_pembayaran, jumlah_pembayaran, tanggal_pembayaran) VALUES
(1, 1, 'Transfer Bank', 5000000, '2024-04-01'),
(2, 2, 'Kartu Kredit', 3500000, '2024-04-02'),
(3, 3, 'Tunai', 24000000, '2024-04-03'),
(4, 4, 'Transfer Bank', 4000000, '2024-04-04'),
(5, 5, 'Kartu Debit', 12000000, '2024-04-05'),
(6, 6, 'Tunai', 5000000, '2024-04-06'),
(7, 7, 'Transfer Bank', 4500000, '2024-04-07'),
(8, 8, 'Kartu Kredit', 3000000, '2024-04-08'),
(9, 9, 'Tunai', 5000000, '2024-04-09'),
(10, 10, 'Kartu Debit', 2000000, '2024-04-10');
show tables;

-- soal 1 menampilkan nama pelanggan, total, tanggal pesanan diatas rata- rata
CREATE VIEW view_pesanan_lebih_dari_rata_rata AS 
SELECT p.nama_pembeli, ps.total_harga, ps.tanggal_transaksi, rp.rata_rata_pesanan
FROM pembeli p 
JOIN transaksi ps ON p.pembeli_id = ps.pembeli_id
JOIN (select avg(total_harga) as rata_rata_pesanan from transaksi) as rp on ps.total_harga > rp.rata_rata_pesanan;
SELECT * FROM view_pesanan_lebih_dari_rata_rata;

-- soal 2 menampilkan nama barang dan jumlah stok yang kurang dari 10
CREATE VIEW stok_produk_terbatas AS
SELECT nama_barang, stok_barang
FROM barang
WHERE stok_barang < 10;
SELECT * FROM stok_produk_terbatas;

-- soal 3 membuat view untuk mengetahui detail data setiap transaksi
CREATE VIEW detail_penjualan_produk AS
SELECT d.transaksi_id, p.jumlah_barang, p.total_harga AS s, (p.harga_barang * d.jumlah_barang) AS total_harga
FROM transaksi d
JOIN barang p ON d.barang_id = p.barang_id;
show tables;
SELECT * FROM detail_penjualan_produk;

-- soal 4 menampilkan data pada tabel barang berdasarkan nama barang yang mengandung huruf "e" dan stok barang lebih dari 6
DELIMITER //

CREATE PROCEDURE GetbarangByNamaBarangStokBarang (
    IN p_nama_barang varchar(100),
    IN p_stok_barang double
)
BEGIN
    SELECT * FROM  barang
    WHERE nama_barang = p_nama_barang AND stok_barang = p_stok_barang;
END //

DELIMITER ;
CALL GetbarangByNamaBarangStokBarang('Televisi LED 32 inci', '10');

-- soal 5 untuk menghapus tabel store procedure
DELIMITER $$
CREATE PROCEDURE nama_barang(IN id varchar(100))
BEGIN
SELECT * FROM barang
WHERE id = barang_id;
END$$
DELIMITER ;
CALL nama_barang('Laptop ASUS');
drop PROCEDURE nama_barang;
select * from barang;

-- soal 6 memasukkan data pada tabel supplier
DELIMITER //
CREATE PROCEDURE GetDataSupplier (
    IN p_nama_supplier varchar(100),
    IN alamat_supplier varchar(225),
    OUT p_telepon_supplier varchar(20)
)
BEGIN
    SELECT COUNT(*) INTO p_Jumlah_supplier
    FROM supplier
    WHERE nama_alamat = p_nama_supplier AND alamat_supplier = p_telepon_supplier;
END //

DELIMITER ;
SET @nama_supplier='fina';
SET @alamat_supplier = 'jl. bumi sari  2';
set @telepon_supplier = '085704769491';
CALL GetDataSupplier(@nama_supplier, @alamat_supplier, @telepon_supplier);
SELECT @nama_supplier,@alamat_supplier,@telepon_supplier AS supplier;
select * from supplier;











