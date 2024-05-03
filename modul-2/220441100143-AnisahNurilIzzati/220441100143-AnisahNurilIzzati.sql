CREATE DATABASE tokobarokah;
USE tokobarokah;

CREATE TABLE pelanggan (
id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
nama_pelanggan VARCHAR(100) NOT NULL,
email VARCHAR(50) NOT NULL,
alamat VARCHAR(255) NOT NULL
);
CREATE TABLE pesanan (
id_pesanan INT AUTO_INCREMENT PRIMARY KEY,
id_pelanggan INT NOT NULL,
tanggal_pesanan DATE NOT NULL,
total INT(11) NOT NULL,
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);
CREATE TABLE produk (
id_produk INT AUTO_INCREMENT PRIMARY KEY,
nama_produk VARCHAR(100) NOT NULL,
harga INT NOT NULL,
stok INT NOT NULL
);
CREATE TABLE detail_pesanan (
id_detail INT AUTO_INCREMENT PRIMARY KEY,
id_pesanan INT NOT NULL,
id_produk INT NOT NULL,
jumlah INT NOT NULL,
FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

INSERT INTO pelanggan (nama_pelanggan, email, alamat) VALUES
('Anisah Nuril Izzati', 'anisahnurilizzati@gmail.com', 'Bangkalan'),
('Anisyafaah', 'anisa@gmail.com', 'Bangkalan'),
('Firdausi Putri Cahyani', 'firdausiputri@gmail.com', 'Gresik'),
('Nadia Aprilia', 'aprilia@gmail.com', 'Nganjuk'),
('Hasnah Insita', 'hasnahinsita@gmail.com', 'Sidoarjo'),
('Adhelia', 'adheliakusumawati@gmail.com', 'Gresik'),
('Herdiyanti Fifin', 'herdiyanti@gmail.com', 'Gresik'),
('Rosalia Dewi', 'dewirosalian@gmail.com', '5Bangkalan'),
('Devi Pebianti', 'deviipebianti@gmail.com', 'Mojokerto'),
('Nur Alipia', 'nuralipia@gmail.com', 'Sampang');

INSERT INTO pesanan (id_pelanggan, tanggal_pesanan, total) VALUES
(1, '240113', 15000),
(2, '240115', 10000),
(3, '240205', 25000),
(4, '240208', 8000),
(5, '240210', 12000),
(6, '240215', 18000),
(7, '240407', 30000),
(8, '240408', 5000),
(9, '240409', 20000),
(10, '240410', 15000);

INSERT INTO produk (nama_produk, harga, stok) VALUES
('Buku Tulis', 5000, 35),
('Pensil', 1000, 20),
('Krayon', 20000, 3),
('Bolpoin', 1500, 25),
('Penghapus', 500, 15),
('Penggaris', 2000, 4),
('Spidol', 3000, 10),
('Stabilo', 2500, 10),
('Kertas Folio', 10000, 20),
('Rautan Pensil', 500, 5);

INSERT INTO detail_pesanan (id_pesanan, id_produk, jumlah) VALUES
(1, 1, 13),
(2, 2, 15),
(3, 3, 12),
(4, 4, 4),
(5, 5, 8),
(6, 6, 13),
(7, 7, 6),
(8, 8, 12),
(9, 9, 25),
(10, 10, 17);

use tokobarokah;

-- soal1
CREATE OR REPLACE VIEW info_pemesanan AS
SELECT pelanggan.nama_pelanggan, pesanan.total AS total_harga, pesanan.tanggal_pesanan
FROM pesanan
JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id_pelanggan
WHERE pesanan.total > (SELECT AVG(total) FROM pesanan);

-- soal2
CREATE OR REPLACE VIEW penjualan_produk AS
SELECT produk.nama_produk, produk.harga AS harga_satuan, 
       detail_pesanan.jumlah AS jumlah_terjual, 
       (detail_pesanan.jumlah * produk.harga) AS total_pendapatan
FROM produk 
JOIN detail_pesanan ON produk.id_produk = detail_pesanan.id_produk;

-- soal 3
CREATE OR REPLACE VIEW stok_produk AS
SELECT produk.nama_produk, produk.stok AS stok_produk
FROM produk
WHERE stok < 5;

-- soal4
CREATE OR REPLACE VIEW laporan_pembelian AS
SELECT pelanggan.nama_pelanggan, COUNT(pesanan.id_pesanan) AS total_pesanan, pesanan.tanggal_pesanan
FROM pesanan
JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id_pelanggan
WHERE pesanan.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY pelanggan.id_pelanggan;

select * from info_pemesanan;
select * from penjualan_produk;
select * from stok_produk;
select * from laporan_pembelian;
