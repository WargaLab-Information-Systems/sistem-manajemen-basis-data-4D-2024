CREATE DATABASE db_modul2;

DROP DATABASE db_modul2;
USE db_modul2;

CREATE TABLE tb_produk (
	id_produk INT (11) NOT NULL PRIMARY KEY,
	nama_produk VARCHAR (100) NOT NULL,
	harga INT (11) NOT NULL,
	stock INT (11) NOT NULL
);

INSERT INTO tb_produk (id_produk, nama_produk, harga, stock)
VALUES 
	(1, 'Baju Kaos', 50000, 20),
	(2, 'Celana Jeans', 100000, 15),
	(3, 'Sepatu Olahraga', 150000, 10),
	(4, 'Topi Snapback', 35000, 30),
	(5, 'Tas Ransel', 75000, 8);

DROP TABLE IF EXISTS tb_produk;

CREATE TABLE tb_pelanggan(
	id_pelanggan INT (11) NOT NULL PRIMARY KEY,
	nama_pelanggan VARCHAR (100) NOT NULL,
	email VARCHAR (50) NOT NULL,
	alamat VARCHAR (255) NOT NULL
);

INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, email, alamat)
VALUES 
	(1, 'Vikalp toro', 'torovikal@google.com', 'Jl. Sudirman No. 10'),
	(2, 'Dtifeb Putri', 'febput@yahoo.com', 'Jl. Merdeka No. 25'),
	(3, 'Mosky Ger', 'moskyger@yahoo.com', 'Jl. Thamrin No. 50');

DROP TABLE IF EXISTS tb_pelanggan;

CREATE TABLE tb_pesanan(
	id_pesanan INT (11) NOT NULL PRIMARY KEY,
	id_pelanggan INT (11) NOT NULL,
	tanggal_pesanan DATE NOT NULL,
	total INT (11) NOT NULL
);

ALTER TABLE tb_pesanan
ADD CONSTRAINT id_pelanggan
FOREIGN KEY (id_pelanggan)
REFERENCES tb_pelanggan(id_pelanggan);

INSERT INTO tb_pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total)
VALUES 
	(1, 1, '2024-04-01', 120000),
	(2, 2, '2024-04-01', 85000);

DROP TABLE IF EXISTS tb_pesanan;

CREATE TABLE tb_detail_pesanan(
	id_detail INT (11) NOT NULL PRIMARY KEY,
	id_pesanan INT (11) NOT NULL,
	id_produk INT (11) NOT NULL,
	jumlah INT (11) NOT NULL,
	FOREIGN KEY (id_pesanan) REFERENCES tb_pesanan(id_pesanan),
	FOREIGN KEY (id_produk) REFERENCES tb_produk(id_produk)
);

INSERT INTO tb_detail_pesanan (id_detail, id_pesanan, id_produk, jumlah)
VALUES (1, 1, 1, 2),
       (2, 1, 4, 1),
       (3, 2, 2, 1),
       (4, 2, 3, 1);

DROP TABLE IF EXISTS tb_detail_pesanan;

CREATE VIEW view_total_atas_rata_rata AS
SELECT p.nama_pelanggan, pes.total, pes.tanggal_pesanan
FROM tb_pesanan pes
JOIN tb_pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.total > (SELECT AVG(total) FROM tb_pesanan);

SELECT * FROM view_total_atas_rata_rata;

CREATE VIEW view_produk_terjual AS
SELECT pr.nama_produk, pr.harga AS harga_satuan, dp.jumlah AS jumlah_terjual, pr.harga * dp.jumlah AS total_pendapatan
FROM tb_detail_pesanan dp
JOIN tb_produk pr ON dp.id_produk = pr.id_produk;

SELECT * FROM view_produk_terjual;

CREATE VIEW view_produk_stok_kurang_5 AS
SELECT nama_produk, stock AS jumlah_stok_tersisa
FROM tb_produk
WHERE stock < 5;

DROP VIEW view_produk_stok_kurang_5;

SELECT * FROM view_produk_stok_kurang_5;

CREATE VIEW view_total_pesanan_perpelanggan AS
SELECT p.nama_pelanggan, SUM(pes.total) AS total_pesanan
FROM tb_pesanan pes
JOIN tb_pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan;

SELECT * FROM view_total_pesanan_perpelanggan;