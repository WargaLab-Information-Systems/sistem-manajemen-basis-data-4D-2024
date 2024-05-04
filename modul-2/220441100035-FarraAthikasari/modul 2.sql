CREATE DATABASE toko_basmalah;
USE toko_basmalah;

CREATE TABLE produk (
id_produk INT (11) PRIMARY KEY NOT NULL,
nama_produk VARCHAR (100),
harga BIGINT (11),
stok INT(11)
);
DESC produk;

CREATE TABLE pelanggan (
id_pelanggan INT(11) PRIMARY KEY NOT NULL,
nama_pelanggan VARCHAR (50),
email VARCHAR (50),
alamat VARCHAR (255)
);
DESC pelanggan;

CREATE TABLE pesanan (
id_pesanan INT (11) PRIMARY KEY NOT NULL,
id_pelanggan INT (11),
tanggal_pesanan DATE,
total INT (11),
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
);
DESC pesanan;

CREATE TABLE detail_pesanan (
id_detail INT (11) PRIMARY KEY NOT NULL,
id_pesanan INT (11),
id_produk INT (11),
jumlah INT (11),
FOREIGN KEY (id_pesanan) REFERENCES pesanan (id_pesanan),
FOREIGN KEY (id_produk) REFERENCES produk (id_produk)
);
DESC detail_pesanan;

INSERT INTO produk (id_produk, nama_produk, harga, stok) VALUES
(200, 'kopi', 7000, 6),
(201, 'sunlight', 5000, 1),
(202, 'beras', 16000, 2),
(203, 'gula', 15000, 4),
(204, 'telor', 8000, 7),
(205, 'minyak', 18000, 3);
SELECT * FROM produk;

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) VALUES
(01, 'Farra', 'farra@gmail.com', 'Lamongan'),
(02, 'Tasya', 'tasya@gmail.com', 'Surabaya'),
(03, 'Yasmine', 'yasmine@gmail.com', 'Jombang'),
(04, 'Queen', 'queen@gmail.com', 'Madura'),
(05, 'Virgie', 'virgie@gmail.com', 'Gresik');
SELECT * FROM pelanggan;

INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) VALUES
(100, 01, '2024-04-04', 30000),
(101, 02, '2024-03-03', 25000),
(102, 03, '2024-02-03', 70000),
(103, 04, '2024-04-01', 42500),
(104, 05, '2024-04-10', 40000);
SELECT * FROM pesanan;

INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) VALUES
 (120, 100, 200, 5),
 (121, 101, 201, 5),
 (122, 102, 202, 2),
 (123, 103, 203, 10),
 (124, 104, 204, 3);
SELECT * FROM detail_pesanan;

SELECT AVG(ps.total) AS rata_rata_pesanan 
FROM pesanan AS ps WHERE ps.total>(
SELECT AVG(total) FROM pesanan
);

CREATE VIEW view_pesanan_lebih_dari_rata_rata AS 
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan, rp.rata_rata_pesanan
FROM pelanggan p 
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
JOIN (select avg(total) as rata_rata_pesanan from pesanan) as rp on ps.total > rp.rata_rata_pesanan;
SELECT * FROM view_pesanan_lebih_dari_rata_rata;
DROP VIEW view_pesanan_lebih_dari_rata_rata;

CREATE VIEW view_detail_penjualan AS
SELECT 
 pr.nama_produk, 
 pr.harga AS harga_satuan,
 dp.jumlah AS jumlah_produk_terjual,
 (pr.harga * dp.jumlah) AS total_pendapatan 
FROM produk pr
JOIN detail_pesanan dp ON pr.id_produk = dp.id_produk;
SELECT * FROM view_detail_penjualan;

CREATE VIEW view_produk_stok_kurang_dari_5 AS
SELECT 
 nama_produk,
 stok
FROM produk
WHERE stok < 5;
SELECT * FROM view_produk_stok_kurang_dari_5;
SELECT * FROM view_detail_penjualan;

CREATE VIEW total_pesanan_per_pelanggan AS
SELECT p.nama_pelanggan, ps.tanggal_pesanan, COUNT(ps.id_pesanan)
AS jumlah_total_pesanan
FROM pelanggan p
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(),
INTERVAL 1 MONTH) 
GROUP BY p.nama_pelanggan;
SELECT * FROM total_pesanan_per_pelanggan;
DROP VIEW total_pesanan_per_pelanggan;

DROP DATABASE toko_basmalah;