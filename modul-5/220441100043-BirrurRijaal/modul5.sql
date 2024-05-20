create database praktikummodul5;
use praktikummodul5;

CREATE TABLE produk (
  id_produk INT PRIMARY KEY AUTO_INCREMENT,
  nama_produk VARCHAR(100) NOT NULL,
  kategori VARCHAR(50) NOT NULL,
  harga double,
  berat float
);

CREATE TABLE gudang (
  id_gudang INT PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100) NOT NULL,
  alamat VARCHAR(255) NOT NULL
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

update transaksi set tanggal_transaksi='2024-04-03' where id_transaksi=26;
select * from transaksi;

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

INSERT INTO produk (nama_produk, kategori, harga, berat) 
VALUES 
('Handphone', 'Elektronik', 8000000.00, 2.5),
('Lampu Tidur', 'Furniture', 500000.00, 0.8),
('Kursi', 'Furniture', 100000.00, 10),
('Komik Avengers', 'Buku', 75000.00, 0.5),
('Pensil 2B', 'Alat Tulis', 5000.00, 0.1),
('Sepatu', 'Fashion', 300000.00, 0.7),
('Printer ', 'Elektronik', 1000000.00, 3),
('Meja Belajar', 'Furniture', 1000000.00, 15),
('Sound System', 'Elektronik', 200000.00, 0.2),
('Bantal', 'Furniture', 25000.00, 0.1);

INSERT INTO gudang (nama, alamat) 
VALUES 
('Gudang Utama', 'Jl. Gatot Subroto No. 10'),
('Gudang Produksi Buku', 'Jl. Pangeran Diponegoro No. 21'),
('Gudang Produksi Furniture', 'Jl. Pangeran Diponegoro No. 30'),
('Gudang Produksi Jeans', 'Jl. Soeakrno No. 10'),
('Gudang Produksi Baju', 'Jl. Jakarta No. 20'),
('Gudang Produksi Elektronik', 'Jl. Embong Malang No. 10'),
('Gudang Produksi Alat TUlis', 'Jl. Halim Kusuma No. 20'),
('Gudang Produksi Baju B', 'Jl. Halim Perdana No. 11'),
('Gudang Produksi Furniture B', 'Jl. Mlajeh No. 20'),
('Gudang Alat Tulis B', 'Jl. Ahmad Yani No. 30');

INSERT INTO karyawan (id_gudang, nama, alamat, posisi, gaji) 
VALUES 
(1, '', 'Jl. Merdeka No. 1', 'Manager', 20000000.00),
(2, '', 'Jl. Halim Kusuma No. 25', 'Staff', 5000000.00),
(3, '', 'Jl. Halim Kusuma No. 10', 'Staff', 3000000.00),
(4, '', 'Jl. Halim Kusuma No. 15', 'Staff', 3000000.00),
(5, 'f', 'Jl. Ahmad Yani No. 35', 'Manager', 50000000.00),
(6, '', 'Jl. Ahmad Yani No. 45', 'Manager', 6000000.00),
(2, '', 'Jl. Embong Malang No. 15', 'Staff', 4000000.00),
(2, '', 'Jl. Embong Malang No. 20', 'Staff', 3000000.00),
(2, '', 'Jl. Embong Malang No. 10', 'Staff', 5000000.00),
(2, '', 'Jl. Gatot Subroto No. 5', 'Staff', 6000000.00);

INSERT INTO supplier (nama_supplier, alamat, telepon, email) VALUES
('Toko Buku Bacaan', 'Jl. Pustaka No. 123, Kota Baca, Indonesia', '034567890', 'info@tokobukubacaan.com'),
('Furnitur Elegan', 'Jl. Dekorasi No. 456, Purnawirawan, Indonesia', '087654321', 'sales@furniturelegan.com'),
('Mode Maju', 'Jl. Runway No. 789, Kota Mode, Indonesia', '057924680', 'info@modemaju.com'),
('Buku Novel & Lainnya', 'Jl. Cerita No. 321, Surga Pecinta Buku, Indonesia', '0876543210', 'kontak@bukunovel.com'),
('Perabotan Nyaman', 'Jl. Sudut Nyaman No. 654, Kota Nyaman, Indonesia', '068135790', 'penjualan@perabotannyaman.com'),
('Butik Mode Chic', 'Jl. Fashionista No. 987, Kota Trendi, Indonesia', '076543210', 'info@butikchic.com'),
('Buku Halaman Berputar', 'Jl. Pustaka No. 147, Kota Buku, Indonesia', '092581470', 'halo@bukuhalamanberputar.com'),
('Desain Elegan Furnitur', 'Jl. Mewah No. 258, Kota Desain, Indonesia', '092637480', 'info@desainelegan.com'),
('Pakaian Urban Vogue', 'Jl. Mode No. 369, Kota Trendi, Indonesia', '071594862', 'kontak@urbanvogue.com'),
('Toko Buku Klasik', 'Jl. Antik No. 531, Kota Buku, Indonesia', '031598624', 'info@tokobukuklasik.com');

INSERT INTO stok (id_produk, id_gudang, jumlah, tanggal_update) VALUES
(2, 6, 100, '2024-05-12 08:00:00'),
(1, 1, 75, '2024-05-12 08:05:00'),
(3, 4, 50, '2024-05-12 08:10:00'),
(4, 7, 120, '2024-05-12 08:15:00'),
(5, 10, 90, '2024-05-12 08:20:00'),
(6, 3, 60, '2024-05-12 08:25:00'),
(7, 2, 110, '2024-05-12 08:30:00'),
(8, 8, 80, '2024-05-12 08:35:00'),
(9, 9, 70, '2024-05-12 08:40:00'),
(10, 5, 95, '2024-05-12 08:45:00');

update stok set tanggal_update = '2024-03-08 09:00:00'
where id_stok = 8;

select * from stok;

INSERT INTO transaksi (id_transaksi,id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
(1, 1, 1, 1, 10, 1000000, '2024-05-01 08:00:00'),
(2, 2, 2, 2, 20, 2000000, '2024-05-02 09:00:00'),
(3, 3, 3, 3, 30, 3000000, '2024-05-03 10:00:00'),
(4, 4, 4, 4, 40, 4000000, '2024-05-04 11:00:00'),
(5, 5, 5, 5, 50, 5000000, '2024-05-05 12:00:00'),
(6, 6, 6, 6, 60, 6000000, '2024-05-06 13:00:00'),
(7, 7, 7, 7, 70, 7000000, '2024-05-07 14:00:00'),
(8, 8, 8, 8, 80, 8000000, '2024-05-08 15:00:00'),
(9, 9, 9, 9, 90, 9000000, '2024-05-09 16:00:00'),
(10, 10, 10, 10, 100, 10000000, '2024-05-10 17:00:00');

delete from transaksi where id_transaksi = 22;

select * from transaksi;

DELIMITER //
CREATE PROCEDURE nomer1(
    IN id INT,
    OUT totalharga double
)
BEGIN
    SELECT SUM(total_harga) INTO totalharga
    FROM transaksi
    WHERE id_karyawan = id;
END //
DELIMITER ;
drop procedure nomer1;
CALL nomer1(4, @totalharga);
SELECT @totalharga AS total_harga_transaksi;

DELIMITER //
CREATE PROCEDURE nomer1(
    IN id_karyawan INT,
    OUT total_harga_transaksi DOUBLE
)
BEGIN
    SELECT SUM(total_harga) INTO total_harga_transaksi
    FROM transaksi
    WHERE id_karyawan = id_karyawan;
END //
DELIMITER ;
CALL nomer1(4, @total_harga);
SELECT 4 AS id_karyawan, @total_harga AS total_harga_transaksi;


DELIMITER //
CREATE PROCEDURE nomer2()
BEGIN
    SELECT CONCAT(produk.nama_produk, ' ada di gudang ', stok.id_gudang, ' selama ', DATEDIFF(CURDATE(), stok.tanggal_update), ' hari.') AS result
    FROM produk 
    JOIN stok  ON produk.id_produk = stok.id_produk;
END //
DELIMITER ;
CALL nomer2();

SET SQL_SAFE_UPDATES = 0;

select * from transaksi;

DELIMITER //
CREATE PROCEDURE nomer3d()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi <= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <=310000;
END //
DELIMITER ;
select * from transaksi;
CALL nomer3d();

DELIMITER //

CREATE PROCEDURE nomer3()
BEGIN
    DELETE FROM transaksi
    WHERE tanggal_transaksi <= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND total_harga <= 200000;
END //
DELIMITER ;

CALL nomer3();
SELECT * FROM transaksi;
