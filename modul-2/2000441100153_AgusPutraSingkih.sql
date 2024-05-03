CREATE DATABASE tokosaya;
USE tokosaya;

CREATE TABLE IF NOT EXISTS pelanggan (
id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
nama_pelanggan VARCHAR (100),
email VARCHAR (50),
alamat VARCHAR (255)
);

CREATE TABLE pesanan (
id_pesanan INT AUTO_INCREMENT PRIMARY KEY,
id_pelanggan INT,
tanggal_pesanan DATE,
total INT,
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
);

CREATE TABLE detail_pesanan (
id_detail INT AUTO_INCREMENT PRIMARY KEY,
id_pesanan INT,
id_produk INT,
jumlah INT,
FOREIGN KEY (id_pesanan) REFERENCES pesanan (id_pesanan),
FOREIGN KEY (id_produk) REFERENCES produk (id_produk)
);
 
CREATE TABLE produk (
id_produk INT AUTO_INCREMENT PRIMARY KEY,
nama_produk VARCHAR (100),
harga INT,
stok INT);

INSERT INTO pelanggan (nama_pelanggan, email, alamat)VALUES
('Agus Putra Singkih', 'agussingih@gmail.com', 'karangentang 123'),
('Mohammad Ainul Yaqin', 'ainulyaqin@outlook.com', 'gresik'),
('Rahmatulloh', 'Rahmat@yahoo.com', 'surabaya');


INSERT INTO produk (nama_produk, harga, stok) VALUES
('Laptop Acer', 10000000, 50),
('Smartphone Samsung Galaxy S21', 12000000, 30),
('Kamera Canon EOS 80D', 15000000, 20),
('Smartwatch Apple Watch Series 7', 8000000, 40),
('TV LED LG 55 Inch', 9000000, 15),
('Console Game PlayStation 5', 7000000, 25),
('Mesin Cuci Panasonic', 6000000, 35),
('Speaker Bluetooth JBL Flip 5', 1000000, 60),
('Printer Epson EcoTank L3150', 3000000, 10),
('Headphone Sony WH-1000XM4', 4000000, 45);

INSERT INTO pesanan (id_pelanggan, tanggal_pesanan, total)VALUES
('1','2024-04-01', '2'),
('2','2024-04-01', '4'),
('3', '2024-04-01', '5');

CREATE VIEW IF NOT EXISTS pesanan_diatas_rata AS
SELECT pelanggan.nama_pelanggan, pesanan.total, pesanan.tanggal_pesanan
FROM pelanggan
JOIN pesanan ON pelanggan.id_pelanggan = pesanan.id_pesanan
WHERE pesanan.total > (
	SELECT AVG(total)FROM pesanan
	);
	
CREATE VIEW IF NOT EXISTS detail_penjualan AS
SELECT p.nama_produk, p.harga, dp.jumlah AS jumlah_terjual, (p.harga * dp.jumlah) AS total_pendapatan
FROM produk p
JOIN detail_pesanan dp ON p.id_produk = dp.id_produk;

CREATE VIEW IF NOT EXISTS stok_kurang_dari_5 AS
SELECT nama_produk, stok
FROM produk
WHERE stok < 5 ;

SELECT * FROM stok_kurang_dari_5;

INSERT INTO detail_pesanan (id_pesanan, id_produk, jumlah) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 4, 3);

CREATE VIEW total_pesanan_bulanan AS
SELECT pelanggan.nama_pelanggan, COUNT(pesanan.id_pesanan) AS jumlah_pesanan
FROM pelanggan
LEFT JOIN pesanan ON pelanggan.id_pelanggan = pesanan.id_pelanggan
WHERE pesanan.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY pelanggan.id_pelanggan;

SELECT * FROM pesanan_diatas_rata;

SELECT * FROM pesanan_diatas_rata
INNER JOIN (
    SELECT AVG(total) AS rata_rata_total
    FROM pesanan
) AS subquery ON pesanan_diatas_rata.total > subquery.rata_rata_total;


CREATE VIEW IF NOT EXISTS stok_kurang_dari_5 AS
SELECT nama_produk, stok
FROM produk
WHERE stok < 5 ;

CREATE VIEW view_total_pesanan_perpelanggan AS
SELECT p.nama_pelanggan, SUM(pes.total) AS total_pesanan
FROM pesanan pes
JOIN pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan;

CREATE VIEW view_total_pesanan_perpelanggan AS
SELECT p.nama_pelanggan, 
       pes.tanggal_pesanan AS tanggal_pembelian,
       SUM(pes.total) AS total_pesanan
FROM pesanan pes
JOIN pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan, pes.tanggal_pesanan;