-- Membuat database "tokobarokah"
CREATE DATABASE IF NOT EXISTS toko_barokah;

-- Menggunakan database "tokobarokah"
USE toko_barokah;

-- Membuat tabel "pelanggan"
CREATE TABLE IF NOT EXISTS pelanggan (
    id_pelanggan INT(11) PRIMARY KEY AUTO_INCREMENT NULL,
    nama_pelanggan VARCHAR(100),
    email VARCHAR(50),
    alamat VARCHAR(255)
);

-- Membuat tabel "pesanan"
CREATE TABLE IF NOT EXISTS pesanan (
    id_pesanan INT(11) PRIMARY KEY AUTO_INCREMENT NULL,
    id_pelanggan INT(11),
    tanggal_pesanan DATE,
    total INT(11),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan) ON DELETE CASCADE ON UPDATE CASCADE
);


-- Membuat tabel "produk"
CREATE TABLE IF NOT EXISTS produk (
    id_produk INT(11) PRIMARY KEY AUTO_INCREMENT NULL,
    nama_produk VARCHAR(100),
    harga INT(11),
    stok INT(11)
);

-- Membuat tabel "detail_pesanan"
CREATE TABLE IF NOT EXISTS detail_pesanan (
    id_detail INT(11) PRIMARY KEY AUTO_INCREMENT NULL,
    id_pesanan INT(11),
    id_produk INT(11),
    jumlah INT(11),
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Mengisi data ke tabel "pelanggan"
INSERT INTO pelanggan (nama_pelanggan, email, alamat) VALUES
    ('John Doe', 'johndoe@example.com', 'Jl. Contoh No. 123'),
    ('Jane Smith', 'janesmith@example.com', 'Jl. Contoh No. 456'),
    ('Michael Johnson', 'michaeljohnson@example.com', 'Jl. Contoh No. 789'),
    ('Sarah Williams', 'sarahwilliams@example.com', 'Jl. Contoh No. 012'),
    ('David Brown', 'davidbrown@example.com', 'Jl. Contoh No. 345');

-- Mengisi data ke tabel "pesanan"
INSERT INTO pesanan (id_pelanggan, tanggal_pesanan, total) VALUES
    (1, '2022-01-01', 100000),
    (2, '2022-01-02', 150000),
    (3, '2022-01-03', 200000),
    (4, '2022-01-04', 250000),
    (5, '2022-01-05', 300000);

-- Mengisi data ke tabel "produk"
INSERT INTO produk (nama_produk, harga, stok) VALUES
    ('Produk A', 50000, 10),
    ('Produk B', 75000, 5),
    ('Produk C', 100000, 3),
    ('Produk D', 125000, 8),
    ('Produk E', 150000, 2);
    
-- Mengisi data ke tabel "detail_pesanan"
INSERT INTO detail_pesanan (id_pesanan, id_produk, jumlah) VALUES
    (1, 1, 2),
    (1, 2, 3),
    (2, 3, 1),
    (2, 4, 2),
    (3, 5, 4);

CREATE VIEW pesanan_lebih_rata AS
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM pesanan ps
JOIN pelanggan p ON ps.id_pelanggan = p.id_pelanggan
WHERE ps.total > (SELECT AVG(total) FROM pesanan);


CREATE VIEW produk_terjual AS
SELECT pr.nama_produk, pr.harga, dp.jumlah, (pr.harga * dp.jumlah) AS total_pendapatan
FROM produk pr
JOIN detail_pesanan dp ON pr.id_produk = dp.id_produk;


CREATE VIEW produk_stok_kurang AS
SELECT nama_produk, stok
FROM produk
WHERE stok < 5;


CREATE VIEW total_pesanan_per_pelanggan AS
SELECT p.nama_pelanggan, COUNT(ps.id_pesanan) AS jumlah_pesanan
FROM pelanggan p
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND ps.tanggal_pesanan <= CURDATE()
GROUP BY p.nama_pelanggan;



