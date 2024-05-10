CREATE DATABASE tokobarokah;
USE tokobarokah;

CREATE TABLE produk (
	id_produk INT (11) NOT NULL PRIMARY KEY,
    nama_produk VARCHAR (100) NOT NULL,
    harga INT (11) NOT NULL,
    stock INT (11) NOT NULL
    );
    
INSERT INTO produk (id_produk, nama_produk, harga, stock)
VALUES
    (1, 'beras', 10000, 5),
    (2, 'air', 15000, 8),
    (3, 'minyak', 20000, 7),
    (4, 'rinso', 25000, 6),
    (5, 'ketan', 30000, 9)
   
CREATE TABLE pelanggan(
    id_pelanggan INT (11) NOT NULL PRIMARY KEY,
    nama_pelanggan VARCHAR (100) NOT NULL,
    email VARCHAR (50) NOT NULL,
    alamat VARCHAR (255) NOT NULL
    );
    
INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) 
VALUES 
(1, 'ninis', 'ni2s@gmail.com', 'Jl. agus No. 10, Sampang '),
(2, 'anis', 'anis@gmail.com', 'Jl. wartono No. 20, Surabaya'),
(3, 'pak wowo', 'wo@gmail.com', 'Jl. Diponegoro No. 30, Jakarta'),
(4, 'masgib', 'dgibs@gmail.com', 'Jl. A. Yani No. 40, Yogyakarta'),
(5, 'bang ganjar', 'ganj@gmail.com', 'Jl. pahlawan No. 50, Surabaya');

CREATE TABLE pesanan(
    id_pesanan INT (11) NOT NULL PRIMARY KEY,
    id_pelanggan INT (11) NOT NULL,
    tanggal_pesanan DATE NOT NULL,
    total INT (11) NOT NULL
    );
    

INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) 
VALUES 
(11, 1, '2024-03-01', 500000),
(12, 2, '2024-03-02', 700000),
(13, 3, '2024-03-03', 300000),
(14, 4, '2024-03-04', 900000),
(15, 5, '2024-03-05', 600000)



CREATE TABLE detail_pesanan(
	id_detail INT (11) NOT NULL PRIMARY KEY,
    id_pesanan INT (11) NOT NULL,
    id_produk INT (11) NOT NULL,
    jumlah INT (11) NOT NULL,
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
    );
    
INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) 
VALUES 
(21, 11, 1, 5),
(22, 12, 2, 3),
(23, 13, 3, 2),
(24, 14, 4, 4),
(25, 15, 5, 6)


CREATE VIEW pesanan_diatas_rata AS
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM pesanan ps
JOIN pelanggan p ON ps.id_pelanggan = p.id_pelanggan
WHERE ps.total > (SELECT AVG(total) FROM pesanan);

    
CREATE VIEW detail_penjualan AS
SELECT pr.nama_produk, pr.harga AS harga_satuan, dp.jumlah AS jumlah_terjual, (pr.harga * dp.jumlah) AS total_pendapatan
FROM detail_pesanan dp
JOIN produk pr ON dp.id_produk = pr.id_produk;

CREATE VIEW stok_tersisa AS
SELECT nama_produk, stock
FROM produk
WHERE stock < 5;

CREATE VIEW pesanan_per_pelanggan AS
SELECT p.nama_pelanggan, SUM(ps.total) AS total_pesanan
FROM pesanan ps
JOIN pelanggan p ON ps.id_pelanggan = p.id_pelanggan
WHERE ps.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan;

