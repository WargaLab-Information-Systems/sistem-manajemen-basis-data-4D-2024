CREATE DATABASE db_pemesanan;
USE db_pemesanan;

CREATE TABLE pesanan (
	id_pesanan INT (11) AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT (11),
    tanggal_pesanan DATE,
    total INT(11),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

CREATE TABLE pelanggan (
	id_pelanggan INT (11) AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR (100),
    email VARCHAR (100),
    alamat VARCHAR (255)
);

CREATE TABLE produk (
	id_produk INT (11) AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR (100),
    harga INT (11),
    stok INT (11)
);

CREATE TABLE detail_pesanan (
	id_detail INT (11) AUTO_INCREMENT PRIMARY KEY,
    id_pesanan INT (11),
    id_produk INT (11),
    jumlah INT (11),
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

INSERT INTO pelanggan (nama_pelanggan, email, alamat) VALUES 
('Putri Cahyani', 'putri123@gmail.com', 'Gresik'),
('Annisyafaah', 'anisa123@gmail.com', 'Bangkalan'),
('Anisah Nuril', 'icha123@gmail.com', 'Kamal'),
('Fifin Purwaningrum', 'fifin123@gmail.com', 'Gresik'),
('Adhelia', 'adhel123@gmail.com', 'Gresik');

INSERT INTO produk (nama_produk, harga, stok) 
VALUES 
('Buku Catatan', 10000, 5),
('Pulpen', 5000, 100),
('Earphone', 20000, 7),
('Flashdisk', 15000, 10),
('Mouse', 25000, 4);

INSERT INTO pesanan (id_pelanggan, tanggal_pesanan, total)
VALUES 
(1, '2024-03-31', 35000),
(2, '2024-03-31', 75000),
(3, '2024-03-30', 30000);

INSERT INTO detail_pesanan (id_pesanan, id_produk, jumlah)
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 3),
(2, 4, 1),
(3, 5, 2);

CREATE VIEW pesanan_upper_rata AS
SELECT pelanggan.nama_pelanggan, pesanan.total, pesanan.tanggal_pesanan
FROM pesanan JOIN pelanggan 
ON pesanan.id_pelanggan = pelanggan.id_pelanggan
WHERE pesanan.total > (SELECT AVG(total) FROM pesanan);

CREATE VIEW detail_penjualan AS
SELECT b.nama_produk, b.harga,
SUM(a.jumlah) AS total_terjual,
SUM(a.jumlah * b.harga) AS total_pendapatan
FROM detail_pesanan a JOIN produk b
ON a.id_produk = b.id_produk
GROUP BY a.id_produk;

CREATE VIEW stok_kurang AS
SELECT produk.nama_produk, produk.stok
FROM produk
WHERE produk.stok < 5;

CREATE VIEW total_pesanan_pelanggan AS
SELECT p.nama_pelanggan, 
COUNT(ps.id_pesanan) AS jumlah_total_pesanan
FROM pelanggan p
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY p.id_pelanggan;
