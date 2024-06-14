CREATE DATABASE Modul5;

USE Modul5;
drop database Modul5;
CREATE TABLE produk (
  id_produk INT PRIMARY KEY AUTO_INCREMENT,
  nama_produk VARCHAR(100) NOT NULL,
  kategori VARCHAR(50) NOT NULL,
  harga double,
  berat float
);

CREATE TABLE stok (
  id_stok INT PRIMARY KEY AUTO_INCREMENT,
  id_produk INT NOT NULL,
  id_gudang int not null,
  jumlah INT NOT NULL,
  tanggal_update datetime not null,
  FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
  foreign key (id_gudang) references gudang(id_gudang)
);

CREATE TABLE transaksi (
  id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
  id_produk INT NOT NULL,
  id_supplier INT NOT NULL,
  id_karyawan INT NOT NULL,
  jumlah INT NOT NULL,
  total_harga DOUBLE NOT NULL,
  tanggal_transaksi DATETIME NOT NULL,
  FOREIGN KEY (id_produk) REFERENCES produk(id_produk),
  FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
  FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

CREATE TABLE gudang (
  id_gudang INT PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100) NOT NULL,
  alamat VARCHAR(255) NOT NULL
);

CREATE TABLE karyawan (
  id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
  id_gudang int not null,
  nama VARCHAR(100) NOT NULL,
  alamat VARCHAR(255) NOT NULL,
  posisi VARCHAR(50) NOT NULL,
  gaji DOUBLE NOT NULL,
  FOREIGN KEY (id_gudang) REFERENCES gudang(id_gudang)
);

CREATE TABLE supplier (
  id_supplier INT PRIMARY KEY AUTO_INCREMENT,
  nama_supplier VARCHAR(100) NOT NULL,
  alamat VARCHAR(255) NOT NULL,
  telepon char (15) not null,
  email varchar (100) not null
);

INSERT INTO produk (nama_produk, kategori, harga, berat) 
VALUES 
('Laptop Lenovo', 'Elektronik', 8000000.00, 2.5),
('Sneckres jordan', 'Fashion', 500000.00, 0.8),
('Almari baju', 'Furniture', 1000000.00, 10),
('Novel', 'Buku', 75000.00, 0.5),
('bulpoin', 'Alat Tulis', 5000.00, 0.1),
('Celana cargo', 'Fashion', 300000.00, 0.7),
('Printer ', 'Elektronik', 1500000.00, 5),
('Kursi gaming', 'Furniture', 2000000.00, 15),
('Mouse laptop', 'Elektronik', 100000.00, 0.2),
('Buku tulis', 'Buku', 25000.00, 0.3);

INSERT INTO gudang (nama, alamat) 
VALUES 
('Gudang Utama', 'Jl. Gatot Subroto No. 10'),
('Gudang Cabang A', 'Jl. Pangeran Diponegoro No. 20'),
('Gudang Cabang B', 'Jl. Ahmad Yani No. 30');

INSERT INTO karyawan (id_gudang, nama, alamat, posisi, gaji) 
VALUES 
(1, 'Arhan', 'Jl. Jendral Sudirman No. 1', 'Manager', 10000000.00),
(1, 'Aziza', 'Jl. Suharto No. 5', 'Staff', 7000000.00),
(2, 'Fuji', 'Jl. Pangeran Diponegoro No. 15', 'Staff', 7000000.00),
(2, 'rafael', 'Jl. Pangeran Diponegoro No. 25', 'Staff', 7000000.00),
(3, 'maria', 'Jl. Ahmad Yani No. 35', 'Manager', 10000000.00),
(3, 'asnawi', 'Jl. Ahmad Yani No. 45', 'Staff', 7000000.00);

INSERT INTO supplier (nama_supplier, alamat, telepon, email) 
VALUES 
('Supplier Elektronik', 'Jl. Sudirman No. 10', '081234567890', 'supplier.elektronik@email.com'),
('Supplier Fashion', 'Jl. Thamrin No. 20', '081234567891', 'supplier.fashion@email.com'),
('Supplier Furniture', 'Jl. Hayam Wuruk No. 30', '081234567892', 'supplier.furniture@email.com');

-- Anggap saja beberapa produk telah ada di stok untuk setiap gudang
INSERT INTO stok (id_produk, id_gudang, jumlah, tanggal_update) 
VALUES 
(1, 1, 100, NOW()),
(2, 1, 200, NOW()),
(3, 1, 50, NOW()),
(4, 2, 150, NOW()),
(5, 2, 500, NOW()),
(6, 2, 100, NOW()),
(7, 3, 80, NOW()),
(8, 3, 120, NOW()),
(9, 3, 300, NOW()),
(10, 3, 200, NOW());

-- Anggap saja beberapa transaksi telah dilakukan
INSERT INTO transaksi (id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) 
VALUES 
(1, 1, 1, 10, 8000000.00, NOW()),
(2, 2, 2, 20, 10000000.00, NOW()),
(3, 3, 3, 5, 5000000.00, NOW()),
(4, 1, 4, 15, 7500000.00, NOW()),
(5, 2, 5, 50, 2500000.00, NOW()),
(6, 3, 6, 10, 3000000.00, NOW()),
(7, 1, 1, 8, 12000000.00, NOW()),
(8, 2, 2, 12, 24000000.00, NOW()),
(9, 3, 3, 30, 3000000.00, NOW()),
(10, 1, 4, 20, 500000.00, NOW());


-- 1

DELIMITER //

CREATE PROCEDURE total_harga(
    IN karyawanid INT,
    OUT totalharga DECIMAL(10, 2)
)
BEGIN
    DECLARE total DECIMAL(10, 2);
    
    -- Menggunakan SUM() untuk menghitung total harga dari semua transaksi
    SELECT SUM(total_harga) INTO total
    FROM transaksi
    WHERE id_karyawan = karyawanid;

    -- Memasukkan hasil perhitungan ke dalam parameter OUT
    SET totalharga = total;
END //

DELIMITER ;
drop procedure total_harga;
CALL total_harga(1, @totalharga);
SELECT @totalharga AS total_harga_transaksi;

-- 2
DELIMITER //
CREATE PROCEDURE lama_produk()
BEGIN
    SELECT CONCAT('Produk ', p.id_produk, ' berada di gudang ', s.id_gudang, ' selama ', DATEDIFF(CURDATE(), s.tanggal_update), ' hari.') AS result
    FROM produk p
    JOIN stok s ON p.id_produk = s.id_produk;
END //
DELIMITER ;
CALL lama_produk();

-- 3

DELIMITER //
CREATE PROCEDURE hapus_transaksi()
BEGIN
    -- Tentukan tanggal satu bulan yang lalu dari sekarang
    DECLARE bulan_terakhir DATE;
    SET bulan_terakhir = DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
    
    -- Hapus transaksi yang terjadi dalam satu bulan terakhir
    DELETE FROM transaksi
    WHERE tanggal_transaksi >= bulan_terakhir
    AND total_harga <= 200000;

    -- Output pesan bahwa transaksi berhasil dihapus
    SELECT 'Transaksi yang terjadi dalam satu bulan terakhir dan total harganya kurang dari atau sama dengan 200 ribu telah dihapus.' AS message;
END //

DELIMITER ;
drop procedure hapus_transaksi;
call hapus_transaksi();


select * from transaksi;