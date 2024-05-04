CREATE DATABASE tokobarokah;
USE tokobarokah;


CREATE TABLE tb_pelanggan (
id_pelanggan INT(11) NOT NULL PRIMARY KEY, 
nama_pelanggan VARCHAR(100) NOT NULL, 
email VARCHAR(50) NOT NULL, 
alamat VARCHAR(255) NOT NULL);
DESC tb_pelanggan;


CREATE TABLE tb_pesanan (
id_pesanan INT(11) NOT NULL PRIMARY KEY, 
id_pelanggan INT(11) NOT NULL, 
tanggal_pesanan DATE NOT NULL, 
total INT(11) NOT NULL, 
FOREIGN KEY (id_pelanggan) REFERENCES tb_pelanggan(id_pelanggan));
DESC tb_pesanan;


CREATE TABLE tb_produk(
id_produk INT(11) NOT NULL PRIMARY KEY,
 nama_produk VARCHAR(100) NOT NULL,
 harga INT(11) NOT NULL,
 stok INT(11) NOT NULL);
DESC tb_produk;


CREATE TABLE detail_pesanan(
id_detail INT(11) NOT NULL PRIMARY KEY,
id_pesanan INT(11) NOT NULL,
id_produk INT(11) NOT NULL,
jumlah INT(11) NOT NULL,
FOREIGN KEY (id_pesanan) REFERENCES tb_pesanan (id_pesanan),
FOREIGN KEY (id_produk) REFERENCES tb_produk (id_produk)
);
DESC tb_pelanggan;





INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, email, 
alamat) VALUES
 (01, 'Andini', 'andini@gmail.com', 'Mojokerto'),
 (02, 'Steven', 'steven@gmail.com', 'Surabaya'),
 (03, 'Andika', 'andika@gmail.com', 'Jombang'),
 (04, 'Adinda', 'adinda@gmail.com', 'Sidoarjo'),
 (05, 'Alifia', 'alifia@gmail.com', 'Sampang');
SELECT * FROM tb_pelanggan;


INSERT INTO tb_pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, 
total) VALUES
 (100, 01, '2024-04-04', 30000),
 (101, 02, '2024-03-03', 25000),
 (102, 03, '2024-01-02', 20000),
 (103, 04, '2024-02-21', 75000),
 (104, 05, '2024-03-30', 52500);
SELECT * FROM tb_pesanan;


INSERT INTO tb_produk (id_produk, nama_produk, harga, stok) 
VALUES
 (200, 'kopi', 6000, 6),
 (201, 'Sunlight', 5000, 10),
 (202, 'Rinso', 10000, 5),
 (203, 'Garam', 7500, 3),
 (204, 'Minyak', 17500, 7);
SELECT * FROM tb_produk;


INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) 
VALUES
 (120, 100, 200, 5),
 (121, 101, 201, 5),
 (122, 102, 202, 2),
 (123, 103, 203, 10),
 (124, 104, 204, 3);
SELECT * FROM detail_pesanan;





CREATE VIEW view_pesanan_lebih_dari_rata_rata AS 
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM tb_pelanggan p
JOIN tb_pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.total >(
SELECT AVG(total) FROM tb_pesanan
);
SELECT * FROM view_pesanan_lebih_dari_rata_rata;


CREATE VIEW view_detail_penjualan AS
SELECT 
 pr.nama_produk, 
 pr.harga AS harga_satuan,
 dp.jumlah AS jumlah_produk_terjual,
 (pr.harga * dp.jumlah) AS total_pendapatan 
FROM tb_produk pr
JOIN detail_pesanan dp ON pr.id_produk = dp.id_produk;
SELECT * FROM view_detail_penjualan;


CREATE VIEW view_produk_stok_kurang_dari_5 AS
SELECT 
 nama_produk,
 stok
FROM tb_produk
WHERE stok < 5;
SELECT * FROM view_produk_stok_kurang_dari_5;


CREATE VIEW pesanan_terakhir_satu_bulan AS
SELECT p.nama_pelanggan, ps.tanggal_pesanan, SUM(ps.total) AS total_pesanan
FROM tb_pelanggan p
JOIN tb_pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= '2024-03-01' AND ps.tanggal_pesanan <= '2024-03-31'
GROUP BY p.nama_pelanggan, ps.tanggal_pesanan;
SELECT * FROM pesanan_terakhir_satu_bulan;

