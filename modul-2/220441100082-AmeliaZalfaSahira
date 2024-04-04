CREATE DATABASE db_tugas3;
USE db_tugas3;

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_pelanggan VARCHAR(255) NOT NULL
);

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan) VALUES
(1, 'Ari Laso'),
(2, 'Erika Carlina'),
(3, 'Romiaka Dewa'),
(4, 'Susi Amberlina'),
(5, 'Marshanda Dewi');


CREATE TABLE produk (
    id_produk INT PRIMARY KEY,
    nama_produk VARCHAR(255) NOT NULL,
    harga_satuan DECIMAL(10, 2) NOT NULL,
    stok INT NOT NULL
);

INSERT INTO produk (id_produk, nama_produk, harga_satuan, stok) VALUES
(1, 'Sepatu', 100000, 10),
(2, 'Kaos', 900000, 5),
(3, 'Kaos Kaki', 23000, 8),
(4, 'Blouse', 78000, 3),
(5, 'Jaket', 980000, 12);

CREATE TABLE pesanan (
    id_pesanan INT PRIMARY KEY,
    id_pelanggan INT,
    id_produk INT,
    jumlah INT NOT NULL,
    total_pesanan DECIMAL(10, 2) NOT NULL,
    tanggal_pesanan DATE NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

INSERT INTO pesanan (id_pesanan, id_pelanggan, id_produk, jumlah, total_pesanan, tanggal_pesanan) VALUES
(1, 5, 1, 2, 200000, '2024-04-01'),
(2, 5, 1, 1, 2000000, '2024-05-02'),
(3, 1, 3, 4, 450000, '2024-04-03'),
(4, 4, 4, 1, 50000, '2024-04-04'),
(5, 5, 5, 2, 1160000, '2024-05-05');

CREATE VIEW pesanan_lebih_rata AS
SELECT p.nama_pelanggan, po.total_pesanan, po.tanggal_pesanan
FROM pesanan po
JOIN pelanggan p ON po.id_pelanggan = p.id_pelanggan
WHERE po.total_pesanan > (SELECT AVG(total_pesanan) FROM pesanan);

SELECT * FROM pesanan_lebih_rata;

CREATE VIEW produk_terjual AS
SELECT pr.nama_produk, pr.harga_satuan, SUM(po.jumlah) AS jumlah_terjual, SUM(pr.harga_satuan * po.jumlah) AS total_pendapatan
FROM pesanan po
JOIN produk pr ON po.id_produk = pr.id_produk
GROUP BY pr.nama_produk, pr.harga_satuan;

SELECT * FROM produk_terjual;

CREATE VIEW produk_stok_kurang AS
SELECT pr.nama_produk, pr.stok
FROM produk pr
WHERE pr.stok < 5;

SELECT * FROM produk_stok_kurang;

CREATE VIEW pelanggan_pesanan_bulan_terakhir AS
SELECT p.nama_pelanggan, COUNT(po.id_pesanan) AS jumlah_pesanan
FROM pesanan po
JOIN pelanggan p ON po.id_pelanggan = p.id_pelanggan
WHERE po.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan;

SELECT * FROM pelanggan_pesanan_bulan_terakhir;

