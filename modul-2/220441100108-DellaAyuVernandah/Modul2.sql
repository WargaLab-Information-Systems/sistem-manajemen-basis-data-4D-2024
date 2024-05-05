CREATE DATABASE pembelian;
use pembelian;

CREATE TABLE tb_produk (
	id_produk INT (11) NOT NULL PRIMARY KEY,
    nama_produk VARCHAR (100) NOT NULL,
    harga INT (11) NOT NULL,
    stock INT (11) NOT NULL
    );
    

INSERT INTO tb_produk (id_produk, nama_produk, harga, stock)
VALUES
    (101, 'buku tulis', 3000, 4),
    (102, 'buku gambar', 5000, 50),
    (103, 'novel', 100000, 4),
    (104, 'majalah', 25000, 40),
    (105, 'kamus lengkap', 50000, 3);
    
    
CREATE TABLE tb_pelanggan(
	id_pelanggan INT (11) NOT NULL PRIMARY KEY,
    nama_pelanggan VARCHAR (100) NOT NULL,
    email VARCHAR (50) NOT NULL,
    alamat VARCHAR (255) NOT NULL
    );
    
INSERT INTO tb_pelanggan (id_pelanggan, nama_pelanggan, email, alamat) 
VALUES 
(001, 'Dwi nurjannah', 'dwinrrr_@example.com', 'Jl. suramadu No. 10, lumajang'),
(002, 'Angga Js', 'Angga.js@example.com', 'Jl. Pahlawan No. 20, Bangkalan'),
(003, 'Sipak saput', 'sipak_saput@example.com', 'Jl. kamal No. 30, Bojonegoro'),
(004, 'Bintang purnomo', 'purnomo.bintang@example.com', 'Jl. pondok indah No. 40, Sidoarjo'),
(005, 'Imam irfan arrafat', 'imam.arrafat@example.com', 'Jl. menuju surga No. 50, Bangkalan');

CREATE TABLE tb_pesanan(
	id_pesanan INT (11) NOT NULL PRIMARY KEY,
    id_pelanggan INT (11) NOT NULL,
    tanggal_pesanan DATE NOT NULL,
    total INT (11) NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES tb_pelanggan(id_pelanggan)
    );
    

INSERT INTO tb_pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) 
VALUES 
(1, 001, '2024-04-01', 500000),
(2, 002, '2024-04-02', 700000),
(3, 003, '2024-04-03', 300000),
(4, 004, '2024-04-04', 900000),
(5, 005, '2024-04-05', 600000);


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
(1, 001, 101, 5),
(2, 001, 102, 3),
(3, 002, 103, 2),
(4, 002, 101, 4),
(5, 003, 102, 6),
(6, 003, 103, 2),
(7, 004, 101, 3),
(8, 004, 102, 5),
(9, 005, 103, 4),
(10, 005, 101, 2);

CREATE VIEW view_total_atas_rata_rata AS
SELECT p.nama_pelanggan, pes.total, pes.tanggal_pesanan
FROM tb_pesanan pes
JOIN tb_pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.total > (SELECT AVG(total) FROM tb_pesanan);

SELECT AVG (total) from tb_pesanan;
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
SELECT p.nama_pelanggan, COUNT(pes.total) AS total_pesanan
FROM tb_pesanan pes
JOIN tb_pelanggan p ON pes.id_pelanggan = p.id_pelanggan
WHERE pes.tanggal_pesanan BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) AND CURRENT_DATE()
GROUP BY p.nama_pelanggan;

SELECT * FROM view_total_pesanan_perpelanggan;
INSERT INTO tb_pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) 
VALUES 
(6, 004, '2024-04-04', 900000),
(7, 001, '2024-04-01', 500000);


select*from tb_produk;