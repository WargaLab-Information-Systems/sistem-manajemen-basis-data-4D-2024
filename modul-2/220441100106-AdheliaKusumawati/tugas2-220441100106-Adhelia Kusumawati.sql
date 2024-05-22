CREATE DATABASE toko;
USE toko;

-- Membuat tabel pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT (11) PRIMARY KEY,
    nama_pelanggan VARCHAR(100),
    email varchar (50),
    alamat VARCHAR(100)
);

-- Isi tabel pelanggan
INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) VALUES
(1, 'adhel', 'adhel@gmail.com', 'gresik'),
(2, 'vira', 'vira@gmail.com', 'lamongan'),
(3, 'suci', 'suci@gmail.com', 'tuban'),
(4, 'bella', 'bella@gmail.com', 'surabaya'),
(5, 'nana', 'nana@gmail.com', 'jombang'),
(6, 'fera', 'fera@gmail.com', 'kediri'),
(7, 'dini', 'dini@gmail.com', 'nganjuk'),
(8, 'nanda', 'nanda@gmail.com', 'kebomas');

-- Membuat tabel pesanan
CREATE TABLE pesanan (
    id_pesanan INT (11) PRIMARY KEY,
    id_pelanggan int (11),
    tanggal_pesanan date,
    total int (11),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- Isi tabel pesanan
INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) VALUES
(11, 1, '2024-03-30', 50000),
(12, 2, '2024-02-29', 70000),
(13, 3, '2024-02-28', 30000),
(14, 4, '2024-03-27', 90000),
(15, 5, '2024-03-19', 100000),
(16, 6, '2024-01-26', 5000),
(17, 7, '2024-01-27', 150000),
(18, 8, '2024-02-11', 305000);

-- Membuat tabel produk
CREATE TABLE produk (
    id_produk INT (11) PRIMARY KEY,
    nama_produk varchar (100),
    harga INT (11),
    stok int (11)
);

-- Isi tabel produk
INSERT INTO produk (id_produk, nama_produk, harga, stok) VALUES
(21, 'sandal', 10000, 10),
(22, 'tas', 35000, 15),
(23, 'rak', 15000, 8),
(24, 'sepatu', 45000, 20),
(25, 'kerudung', 40000, 4),
(26, 'kaos kaki', 5000, 2),
(27, 'baju', 75000, 50),
(28, 'celana', 105000, 40);

-- Membuat tabel detail_pesanan
CREATE TABLE detail_pesanan (
    id_detail INT PRIMARY KEY,
    id_pesanan int (11),
    id_produk int (11),
    jumlah int (11),
	FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Isi tabel detail_pesanan
INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) VALUES
(31, 11, 21, 5),
(32, 12, 22, 2),
(33, 13, 23, 2),
(34, 14, 24, 2),
(35, 15, 25, 1),
(36, 16, 26, 1),
(37, 17, 27, 2),
(38, 18, 28, 3);

SELECT * FROM pelanggan;
SELECT * FROM pesanan;
SELECT * FROM produk;
SELECT * FROM detail_pesan an;

-- nomer satu 
SELECT AVG(total) FROM pesanan;
CREATE VIEW pesanan_diatas_rata_rata AS
SELECT pelanggan.nama_pelanggan, pesanan.total, pesanan.tanggal_pesanan
FROM pesanan
JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id_pelanggan
WHERE pesanan.total > (SELECT AVG(total) FROM pesanan);
select * from pesanan_diatas_rata_rata;

-- nomor dua
CREATE VIEW detail_penjualan_produk AS
SELECT produk.nama_produk, produk.harga AS harga_satuan, 
       detail_pesanan.jumlah AS jumlah_terjual, (produk.harga * detail_pesanan.jumlah) AS total_pendapatan
FROM detail_pesanan
JOIN produk ON detail_pesanan.id_produk = produk.id_produk;
select * from detail_penjualan_produk;

-- nomor tiga
CREATE VIEW produk_terbatas AS
SELECT nama_produk, stok
FROM produk
WHERE stok < 5;
select * from produk_terbatas;

-- nomor empat
CREATE VIEW total_pesanan_per_pelanggan  AS
SELECT pelanggan.nama_pelanggan, COUNT(pesanan.id_pesanan) AS total_pesanan 
FROM pelanggan 
JOIN pesanan ON pelanggan.id_pelanggan = pesanan.id_pelanggan 
WHERE pesanan.tanggal_pesanan BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) AND CURRENT_DATE() 
GROUP BY pelanggan.id_pelanggan;
select * from total_pesanan_per_pelanggan ;

drop database toko;