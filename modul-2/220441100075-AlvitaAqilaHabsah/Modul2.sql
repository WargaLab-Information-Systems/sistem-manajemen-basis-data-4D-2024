CREATE DATABASE tokobarokah;
USE tokobarokah;

CREATE TABLE IF NOT EXISTS pelanggan (
	id_pelanggan INT (11) PRIMARY KEY,
	nama_pelanggan VARCHAR (100), 
	email VARCHAR(50),
	alamat VARCHAR (255));

CREATE TABLE IF NOT EXISTS pesanan (
	id_pesanan INT (11) PRIMARY KEY, 
	id_pelanggan INT (11),
	tanggal_pesanan DATE, total INT (11), 
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan));

CREATE TABLE IF NOT EXISTS produk (
	id_produk INT (11) PRIMARY KEY, 
	nama_produk VARCHAR (100),
	harga INT (11), stok INT (11));
	
CREATE TABLE IF NOT EXISTS detail_pesanan (
	id_detail INT (11) PRIMARY KEY, 
	id_pesanan INT (11), id_produk INT (11), 
	jumlah INT(11), 
	FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
	FOREIGN KEY (id_produk) REFERENCES produk(id_produk));

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) VALUES
(1, 'Ahmad', 'ahmad.in@gmail.com', 'Jl. Pahlawan No. 123'),
(2, 'Tya', 'Tya12@gmail.com', 'Jl. Merdeka No. 456'),
(3, 'Cici', 'ciciwulandari@gmail.com', 'Jl. Kemerdekaan No. 789'),
(4, 'Dewi', 'sridewi@gmail.com', 'Jl. Makmur No. 101'),
(5, 'Vita', 'aqVita@gmail.com', 'Jl. Jaya No. 111');

INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) VALUES
(1, 1, '2024-03-28', 500000),
(2, 2, '2024-03-29', 750000),
(3, 3, '2024-03-30', 1000000),
(4, 4, '2024-03-31', 300000),
(5, 5, '2024-04-01', 900000);

INSERT INTO produk (id_produk, nama_produk, harga, stok) VALUES
(1, 'Buku Tulis', 5000, 50),
(2, 'Penggaris', 8000, 4),
(3, 'Bulpoin', 3500, 10),
(4, 'Pensil', 1500, 30),
(5, 'Penghapus', 1000, 20),
(6, 'Lem', 6000, 4);

INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) VALUES
(1, 1, 1, 2),
(2, 1, 2, 3),
(3, 2, 3, 1),
(4, 2, 4, 2),
(5, 3, 1, 1),
(6, 3, 6, 2),
(7, 3, 3, 3),
(8, 4, 4, 1),
(9, 4, 5, 2),
(10, 5, 1, 3);

SHOW TABLES
SELECT * FROM  pelanggan
SELECT * FROM  pesanan
SELECT * FROM  produk
SELECT * FROM  detail_pesanan

CREATE VIEW pesanan_diatas_rata_rata AS
	SELECT a.nama_pelanggan, b.total, b.tanggal_pesanan
	FROM pesanan b JOIN pelanggan a ON b.id_pelanggan = a.id_pelanggan
	WHERE b.total > (SELECT AVG(total) FROM pesanan);
	
CREATE VIEW detail_penjualan AS SELECT c.nama_produk, c.harga 
	AS harga_satuan, d.jumlah 
	AS jumlah_terjual, (c.harga * d.jumlah) 
	AS total_pendapatan
	FROM detail_pesanan d JOIN produk c 
	ON d.id_produk = c.id_produk;

CREATE VIEW stok_kurang_dari_5 AS
	SELECT nama_produk, stok
	FROM produk WHERE stok < 5;

CREATE VIEW total_pesanan_per_pelanggan AS
	SELECT m.nama_pelanggan, SUM(n.total) AS total_pesanan
	FROM pesanan n JOIN pelanggan m 
	ON n.id_pelanggan = m.id_pelanggan
	WHERE n.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
	GROUP BY m.nama_pelanggan;

SELECT * FROM pesanan_diatas_rata_rata;
SELECT * FROM detail_penjualan;
SELECT * FROM stok_kurang_dari_5;
SELECT * FROM total_pesanan_per_pelanggan;
