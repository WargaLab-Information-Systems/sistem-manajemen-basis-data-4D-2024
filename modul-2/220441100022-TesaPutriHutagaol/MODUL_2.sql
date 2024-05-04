CREATE DATABASE db_pembelian;
USE db_pembelian;

CREATE TABLE tb_produk (
	id_produk INT (11) NOT NULL PRIMARY KEY,
    nama_produk VARCHAR (100) NOT NULL,
    harga INT (11) NOT NULL,
    stock INT (11) NOT NULL
    );
    
INSERT INTO tb_produk (id_produk, nama_produk, harga, stock)
VALUES
    (1, 'Kaos', 10000, 5),
    (2, 'Kemeja', 15000, 8),
    (3, 'Pollo', 20000, 7),
    (4, 'Celana Pendek', 25000, 6),
    (5, 'Celana Panjang', 30000, 9),
    (6, 'Celana Jeans', 35000, 4),
    (7, 'Celana Kargo', 40000, 3);
    
CREATE TABLE tb_pelanggan(
    id_pelanggan INT (11) NOT NULL PRIMARY KEY,
    nama_pelanggan VARCHAR (100) NOT NULL,
    email VARCHAR (50) NOT NULL,
    alamat VARCHAR (255) NOT NULL
    );
    
INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, email, alamat) 
VALUES 
(1, 'Budi Santoso', 'budi.santoso@example.com', 'Jl. Merdeka No. 10, Jakarta'),
(2, 'Ani Wijaya', 'ani.wijaya@example.com', 'Jl. Pahlawan No. 20, Surabaya'),
(3, 'Agus Surya', 'agus.surya@example.com', 'Jl. Diponegoro No. 30, Bandung'),
(4, 'Dewi Indah', 'dewi.indah@example.com', 'Jl. A. Yani No. 40, Yogyakarta'),
(5, 'Eko Pratama', 'eko.pratama@example.com', 'Jl. Gajah Mada No. 50, Semarang');

CREATE OR REPLACE TABLE tb_pesanan(
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
(1, 1, '2024-03-01', 500000),
(2, 2, '2024-03-02', 700000),
(3, 3, '2024-03-03', 300000),
(4, 4, '2024-03-04', 900000),
(5, 5, '2024-03-05', 600000),
(6, 1, '2024-03-06', 800000),
(7, 2, '2024-03-07', 400000),
(8, 3, '2024-03-08', 1000000),
(9, 4, '2024-03-09', 450000),
(10, 5, '2024-03-10', 850000);


CREATE TABLE tb_detail_pesanan(
    id_detail INT (11) NOT NULL PRIMARY KEY,
    id_pesanan INT (11) NOT NULL,
    id_produk INT (11) NOT NULL,
    jumlah INT (11) NOT NULL,
    FOREIGN KEY (id_pesanan) REFERENCES tb_pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES tb_produk(id_produk)
    );
    
INSERT INTO tb_detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) 
VALUES 
(1, 1, 1, 5),
(2, 1, 2, 3),
(3, 2, 3, 2),
(4, 2, 1, 4),
(5, 3, 2, 6),
(6, 3, 3, 2),
(7, 4, 1, 3),
(8, 4, 2, 5),
(9, 5, 3, 4),
(10, 5, 1, 2),
(11, 6, 2, 3),
(12, 6, 3, 3),
(13, 7, 1, 4),
(14, 7, 2, 4),
(15, 8, 3, 5),
(16, 8, 1, 6),
(17, 9, 2, 2),
(18, 9, 3, 3),
(19, 10, 1, 4),
(20, 10, 2, 4);

  
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

SELECT * FROM view_produk_stok_kurang_5;

CREATE VIEW view_total_pesanan_perpelanggan AS
SELECT p.nama_pelanggan, pes.tanggal_pesanan , SUM(pes.total) AS total_pesanan
FROM tb_pesanan pes
JOIN tb_pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan;

SELECT * FROM view_total_pesanan_perpelanggan;

SELECT * FROM view_total_atas_rata_rata
INNER JOIN (
    SELECT AVG(total) AS rata_rata_total
    FROM tb_pesanan
) AS subquery ON view_total_atas_rata_rata.total > subquery.rata_rata_total;

