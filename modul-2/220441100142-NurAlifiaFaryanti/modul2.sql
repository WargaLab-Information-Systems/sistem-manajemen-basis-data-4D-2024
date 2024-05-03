CREATE DATABASE warung_madura;
USE warung_madura;

CREATE TABLE tb_pelanggan(
	id_pelanggan INT NOT NULL PRIMARY KEY,
    nama_pelanggan VARCHAR (50),
    email VARCHAR (50),
	alamat VARCHAR (50)
);
DESC tb_pelanggan;

CREATE TABLE tb_pesanan(
	id_pesanan INT NOT NULL PRIMARY KEY,
    id_pelanggan INT,
    tanggal_pesanan DATE,
    total INT,
    FOREIGN KEY (id_pelanggan) REFERENCES tb_pelanggan(id_pelanggan)
);
DESC tb_pesanan;

CREATE TABLE tb_produk(
	id_produk INT NOT NULL PRIMARY KEY,
    nama_produk VARCHAR(50),
    harga INT,
    stok int
);
DESC tb_produk;

CREATE TABLE detail_pesanan(
	id_detail INT NOT NULL PRIMARY KEY,
    id_pesanan INT,
    id_produk INT,
    jumlah INT,
    FOREIGN KEY (id_pesanan) REFERENCES tb_pesanan (id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES tb_produk (id_produk)
);
DESC detail_pesanan;

INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, email, alamat) VALUES
	(01, 'Jennie', 'jennie@gmail.com', 'Nganjuk'),
    (02, 'Rose', 'rose@gmail.com', 'Surabaya'),
    (03, 'Lisa', 'lisa@gmail.com', 'Jombang'),
    (04, 'Zayyan', 'zayyan@gmail.com', 'Probolinggo'),
    (05, 'Jaemin', 'jaemin@gmail.com', 'Sampang');
SELECT * FROM tb_pelanggan;
    
INSERT INTO tb_pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) VALUES
	(201, 01, '2024-04-04', 30000),
    (202, 02, '2024-03-03', 35000),
    (203, 03, '2024-01-02', 500000),
    (204, 04, '2024-02-21', 85000),
    (205, 05, '2024-03-30', 30000);
SELECT * FROM tb_pesanan;

INSERT INTO tb_produk (id_produk, nama_produk, harga, stok) VALUES
	(101, 'Mie Dara', 5000, 6),
    (102, 'Gula', 7000, 5),
    (103, 'Beras', 10000, 8),
    (104, 'Garam', 5000, 6),
    (105, 'Minyak', 10000, 4);
SELECT * FROM tb_produk;

UPDATE tb_produk
SET stok = stok - 3
WHERE id_produk = 105;


INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) VALUES
	(11, 201, 101, 6),
    (12, 202, 102, 5),
    (13, 203, 103, 5),
    (14, 204, 104, 6),
    (15, 205, 105, 3);
SELECT * FROM detail_pesanan;
    
CREATE VIEW view_pesanan_lebih_dari_rata_rata AS 
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM tb_pelanggan p JOIN tb_pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.total >(
SELECT AVG(total) FROM tb_pesanan
);
SELECT * FROM view_pesanan_lebih_dari_rata_rata;

CREATE VIEW view_detail_penjualan AS
SELECT 
	a.nama_produk, 
    a.harga AS harga_satuan,
    b.jumlah AS jumlah_produk_terjual,
	(a.harga * b.jumlah) AS total_pendapatan 
FROM tb_produk a
JOIN detail_pesanan b ON a.id_produk = b.id_produk;
SELECT * FROM view_detail_penjualan;

CREATE VIEW view_produk_stok_kurang_dari_5 AS
SELECT nama_produk, stok
FROM tb_produk
WHERE stok < 5;
SELECT * FROM view_produk_stok_kurang_dari_5;

CREATE OR REPLACE VIEW total_pesanan_per_pelanggan AS
SELECT p.nama_pelanggan, 
       COUNT(ps.id_pesanan) AS jumlah_total_pesanan,
       GROUP_CONCAT(ps.tanggal_pesanan ORDER BY ps.tanggal_pesanan DESC) AS tanggal_pesanan
FROM tb_pelanggan p
JOIN tb_pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) 
GROUP BY p.nama_pelanggan;

SELECT * FROM total_pesanan_per_pelanggan;
