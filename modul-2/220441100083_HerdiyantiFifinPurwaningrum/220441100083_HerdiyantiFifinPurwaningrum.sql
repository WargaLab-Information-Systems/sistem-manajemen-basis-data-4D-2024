CREATE DATABASE db_penjualan;
USE db_penjualan; 

CREATE TABLE pelanggan(
id_pelanggan INT (11) NOT NULL PRIMARY KEY,  
nama_pelanggan VARCHAR (100) NOT NULL, 
email VARCHAR (50) NOT NULL, 
alamat VARCHAR (255) NOT NULL
);

CREATE TABLE pesanan(
id_pesanan INT (11) NOT NULL PRIMARY KEY,
id_pelanggan INT (11) NOT NULL,
tanggal_pesanan DATE NOT NULL,
total INT (11) NOT NULL,
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
);

CREATE TABLE produk(
id_produk INT (11) NOT NULL PRIMARY KEY,
nama_produk VARCHAR (100) NOT NULL,
harga INT (11) NOT NULL,
stok INT (11) NOT NULL
);

CREATE TABLE detail_pesanan(
id_detail INT (11) NOT NULL PRIMARY KEY,
id_pesanan INT (11) NOT NULL,
id_produk INT (11) NOT NULL,
jumlah INT (11) NOT NULL,
FOREIGN KEY (id_pesanan) REFERENCES pesanan (id_pesanan),
FOREIGN KEY (id_produk) REFERENCES produk (id_produk)
);

INSERT INTO pelanggan VALUES
(01, 'Latifah', 'itsmelatifah1@gmail.com', 'Jl.Veteran No.20, Gresik'),
(02, 'Anisa Rahma', 'anisarahmaa12@gmail.com', 'Jl.Diponegoro No.04, Surabaya'),
(03, 'Muhammad Fauzan', 'fauzaneksa22@gmail.com', 'Jl.Indro No.24, Surabaya'),
(04, 'Nanda Maryam', 'maryamnandaa@gmail.com', 'Jl.Sudirman No.01, Gresik'),
(05, 'Putri Rahmasari', 'rahmaputri083@gmail.com', 'Jl.Merdeka No.14, Gresik'),
(06, 'Laytsa Abdillah', 'laytsaa@gmail.com', 'Jl.Ahmad Yani No.19, Mojokerto'),
(07, 'Rafi Ardiansyah', 'rafiaansyah@gmail.com', 'Jl.Veteran No.38, Gresik'),
(08, 'Ipeifa', 'iniipee15@gmail.com', 'Jl.Mawar No.18, Gresik'),
(09, 'Erlangga Azzam', 'erlanqqaazz@gmail.com', 'Jl.Kartini No.22, Mojokerto'),
(10, 'Alfin Febriadi', 'finalfin00@gmail.com', 'Jl.Proklamasi No.11, Surabaya ');

INSERT INTO pesanan VALUES
(1, 10, '2024-03-30', 150000),
(2, 02, '2024-03-29', 100000),
(3, 05, '2024-03-29', 167000),
(4, 01, '2024-03-27', 472500),
(5, 09, '2024-03-24', 189000),
(6, 03, '2024-03-24', 378000),
(7, 07, '2024-03-19', 200000),
(8, 04, '2024-03-18', 258000),
(9, 06, '2024-03-12', 135000),
(10, 08, '2024-03-12', 740000);

INSERT INTO produk VALUES
(101, 'Pashmina Shimmer', 37000, 35),
(102, 'Pashmina Dubai Shawl', 25000, 50),
(103, 'Bella Square Premium', 23000, 150),
(201, 'Kaftan Luna', 157500, 15),
(202, 'Mukena Flower', 167000, 5),
(203, 'Humaira Abaya', 148000, 8),
(204, 'Satin Dress', 129000, 3),
(301, 'Kemeja Koko', 189000, 5),
(302, 'Jubah Pria', 135000, 2),
(303, 'Sarung Batik Pria', 50000, 12);

INSERT INTO detail_pesanan VALUES
(111, 1, 303, 3),
(112, 2, 102, 4),
(113, 3, 202, 1),
(114, 4, 201, 3),
(115, 5, 301, 1),
(116, 6, 301, 2),
(117, 7, 303, 4),
(118, 8, 204, 2),
(119, 9, 302, 1),
(120, 10, 203, 5);
SHOW TABLES;
DESC pelanggan;
SELECT*FROM pelanggan;
SELECT*FROM pesanan;
SELECT*FROM produk;
SELECT*FROM detail_pesanan;

-- Definisikan view untuk menampilkan nama pelanggan, total, dan tanggal pesanan untuk 
-- semua pesanan yang memiliki total pesanan lebih dari rata-rata total pesanan.
CREATE VIEW pemesanan AS
SELECT pelanggan.nama_pelanggan, pesanan.total, pesanan.tanggal_pesanan
FROM pesanan JOIN pelanggan ON pelanggan.id_pelanggan = pesanan.id_pelanggan
WHERE pesanan.total > ( SELECT AVG(total)
FROM pesanan
);
SELECT * FROM pemesanan;

-- Buatlah view yang menampilkan nama produk, harga satuan, jumlah produk terjual, dan total 
-- pendapatan untuk setiap produk yang telah terjual dalam setiap pesanan.
CREATE VIEW produk_terjual AS
SELECT produk.nama_produk, produk.harga,
SUM(detail_pesanan.jumlah) AS jumlah_terjual,
SUM(detail_pesanan.jumlah * produk.harga) AS total_pendapatan
FROM detail_pesanan JOIN produk ON detail_pesanan.id_produk = produk.id_produk
GROUP BY detail_pesanan.id_produk;
SELECT * FROM produk_terjual;
-- DROP VIEW produk_terjual;

-- Definisikan view untuk menampilkan nama produk dan jumlah stok yang tersisa untuk 
-- produk-produk yang memiliki stok kurang dari 5.
CREATE VIEW stok AS
SELECT produk.nama_produk, produk.stok
FROM produk
WHERE produk.stok < 5;
SELECT * FROM stok;

-- Buatlah view yang menampilkan nama pelanggan dan jumlah total pesanan yang telah 
-- dilakukan oleh setiap pelanggan dalam satu bulan terakhir
CREATE VIEW pesanan_sebulanterakhir AS
SELECT pelanggan.nama_pelanggan,
COUNT(pesanan.id_pesanan) AS total_pesanan
FROM pesanan JOIN pelanggan ON pelanggan.id_pelanggan = pesanan.id_pelanggan
WHERE pesanan.tanggal_pesanan BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) AND CURRENT_DATE()
GROUP BY pelanggan.id_pelanggan;
SELECT * FROM pesanan_sebulanterakhir;


-- DROP DATABASE db_penjualan;
