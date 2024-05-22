CREATE DATABASE tokobarokah;
USE tokobarokah;

--  Membuat tabel pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    email VARCHAR(50) NOT NULL,
    alamat VARCHAR(255) NOT NULL
);
INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat)
VALUES 
    (1, 'Budi', 'budi@example.com', 'Jl. Pahlawan No. 123'),
    (2, 'Ani', 'ani@example.com', 'Jl. Merdeka No. 456'),
    (3, 'Cici', 'cici@example.com', 'Jl. Maju Mundur No. 789'),
    (4, 'Doni', 'doni@example.com', 'Jl. Damai No. 321'),
    (5, 'Euis', 'euis@example.com', 'Jl. Bahagia No. 654'),
    (6, 'Fahmi', 'fahmi@example.com', 'Jl. Jalan No. 987'),
    (7, 'Gita', 'gita@example.com', 'Jl. Kebon No. 1234'),
	(8, 'Hani', 'hani@example.com', 'Jl. Raya No. 101'),
    (9, 'Indra', 'indra@example.com', 'Jl. Sawah No. 202'),
    (10, 'Joko', 'joko@example.com', 'Jl. Jembatan No. 303');


-- Membuat tabel pesanan
CREATE TABLE pesanan (
    id_pesanan INT PRIMARY KEY,
    id_pelanggan INT NOT NULL,
	tanggal_pesanan DATE NOT NULL,
    total INT NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);
INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total)
VALUES 
    (1, 1, '2024-03-01', 15000),
    (2, 2, '2024-03-02', 25000),
    (3, 3, '2024-03-03', 10000),
    (4, 4, '2024-03-04', 20000),
    (5, 5, '2024-03-05', 30000),
    (6, 6, '2024-03-06', 35000),
    (7, 7, '2024-03-07', 18000),
    (8, 8, '2024-03-08', 12000),
    (9, 9, '2024-03-09', 18000),
    (10, 10, '2024-03-10', 22000),
    (11, 9, '2024-05-01', 32000),
    (12, 8, '2024-05-02', 28000);

-- Membuat tabel produk
CREATE TABLE produk (
    id_produk INT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    harga INT NOT NULL,
    stok INT NOT NULL
);
INSERT INTO produk (id_produk, nama_produk, harga, stok)
VALUES 
    (1, 'Kertas HVS', 10000, 20),
    (2, 'Stabilo', 5000, 15),
    (3, 'Pensil Warna', 2000, 25),
    (4, 'Penghapus Karet', 1000, 35),
    (5, 'Lem Stick', 3000, 10),
    (6, 'Binder', 15000, 5),
    (7, 'Papan Tulis', 25000, 8),
	(8, 'Pensil', 1500, 3),
    (9, 'Buku Tulis', 5000, 4),
    (10, 'Spidol', 2000, 2);

-- Membuat tabel detail pesanan
CREATE TABLE detail_pesanan (
    id_detail INT PRIMARY KEY,
    id_pesanan INT NOT NULL,
    id_produk INT NOT NULL,
	jumlah INT NOT NULL,
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);
INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah)
VALUES 
    (1, 1, 1, 3),
    (2, 2, 2, 5),
    (3, 3, 3, 2),
    (4, 4, 4, 4),
    (5, 5, 5, 6),
    (6, 6, 6, 3),
    (7, 7, 7, 4),
	(8, 8, 8, 2),
    (9, 9, 9, 3),
    (10, 10, 10, 4);

-- 1. View menampilkan nama pelanggan total pesanan lebih dari rata-rata
CREATE VIEW pesanan_lebih_dari_rata_rata AS
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM pesanan ps
JOIN pelanggan p ON ps.id_pelanggan = p.id_pelanggan
WHERE ps.total > (SELECT AVG(total) FROM pesanan);

-- 2. View yang menampilkan nama detail penjualan
CREATE VIEW detail_penjualan AS
SELECT pr.nama_produk, pr.harga AS harga_satuan, dp.jumlah AS jumlah_terjual, (pr.harga * dp.jumlah) AS total_pendapatan
FROM detail_pesanan dp
JOIN produk pr ON dp.id_produk = pr.id_produk;

-- 3. View untuk menampilkan nama produk dan jumlah stok
CREATE VIEW stok_kurang_dari_5 AS
SELECT nama_produk, stok
FROM produk
WHERE stok < 5;

-- 4. View yang menampilkan nama pelanggan dan jumlah total pesanan
CREATE VIEW total_pesanan_per_pelanggan AS
SELECT p.nama_pelanggan, SUM(ps.total) AS total_pesanan, ps.tanggal_pesanan
FROM pelanggan p
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan, ps.tanggal_pesanan;

SELECT * FROM pesanan_lebih_dari_rata_rata
INNER JOIN (
    SELECT AVG(total) AS rata_rata_total
    FROM pesanan
) AS subquery ON pesanan_lebih_dari_rata_rata.total > subquery.rata_rata_total;
SELECT*FROM detail_penjualan;
SELECT*FROM stok_kurang_dari_5;
SELECT*FROM total_pesanan_per_pelanggan;
