-- Membuat database tokobarokah
CREATE DATABASE tokobarokah;
USE tokobarokah;

-- Membuat tabel pelanggan
CREATE TABLE pelanggan (
  id_pelanggan INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama_pelanggan VARCHAR(100) NOT NULL,
  email VARCHAR(50) NOT NULL,
  alamat VARCHAR(255) NOT NULL
);

-- Membuat tabel produk
CREATE TABLE produk (
  id_produk INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama_produk VARCHAR(100) NOT NULL,
  harga INT(11) NOT NULL,
  stok INT(11) NOT NULL
);

-- Membuat tabel pesanan
CREATE TABLE pesanan (
  id_pesanan INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_pelanggan INT(11),
  tanggal_pesanan DATE NOT NULL,
  total INT(11) NOT NULL,
  FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- Membuat tabel detail_pesanan
CREATE TABLE detail_pesanan (
  id_detail INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_pesanan INT(11),
  id_produk INT(11),
  jumlah INT(11) NOT NULL,
  FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
  FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Menambahkan 10 data pada tabel pelanggan
INSERT INTO pelanggan (nama_pelanggan, email, alamat) VALUES
('Budi Santoso', 'budisantoso@gmail.com', 'Jl. Merdeka No. 10'),
('Siti Rahayu', 'sitirahayu@gmail.com', 'Jl. Pahlawan No. 15'),
('Ahmad Ibrahim', 'ahmadibrahim@gmail.com', 'Jl. Diponegoro No. 20'),
('Dewi Kusuma', 'dewikusuma@gmail.com', 'Jl. Gatot Subroto No. 5'),
('Putri Wulandari', 'putriwulandari@gmail.com', 'Jl. Sudirman No. 25'),
('Rudi Setiawan', 'rudisetiawan@gmail.com', 'Jl. Ahmad Yani No. 30'),
('Lina Sari', 'linasari@gmail.com', 'Jl. Surya Sumantri No. 8'),
('Eko Susanto', 'ekosusanto@gmail.com', 'Jl. Rajawali No. 12'),
('Ani Kartini', 'anikartini@gmail.com', 'Jl. Anggrek No. 3'),
('Hadi Prabowo', 'hadiprabowo@gmail.com', 'Jl. Cendrawasih No. 17');

-- Menambahkan 10 data pada tabel produk
INSERT INTO produk (nama_produk, harga, stok) VALUES
('Baju Batik', 150000, 20),
('Celana Jeans', 200000, 4),
('Sepatu Sneakers', 300000, 10),
('Jam Tangan', 250000, 25),
('Tas Ransel', 180000, 30),
('Topi', 50000, 40),
('Dompet Kulit', 100000, 4),
('Kacamata', 75000, 35),
('Gelang', 80000, 3),
('Sandal Jepit', 60000, 45);

-- Menambahkan 10 data pada tabel pesanan
INSERT INTO pesanan (id_pelanggan, tanggal_pesanan, total) VALUES
(1, '2024-04-24', 300000),
(2, '2024-04-23', 250000),
(3, '2024-04-22', 400000),
(4, '2024-04-21', 200000),
(5, '2024-04-20', 350000),
(6, '2024-04-19', 280000),
(7, '2024-04-18', 150000),
(8, '2024-04-17', 180000),
(9, '2024-04-16', 220000),
(10, '2024-04-15', 270000);

-- Menambahkan 10 data pada tabel detail_pesanan
INSERT INTO detail_pesanan (id_pesanan, id_produk, jumlah) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 3),
(4, 4, 2),
(5, 5, 2),
(6, 6, 2),
(7, 7, 1),
(8, 8, 3),
(9, 9, 2),
(10, 10, 1);



-- view rata rata
CREATE VIEW pesanan_diatas_rata_rata AS
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM pelanggan p JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.total > (SELECT AVG(total) FROM pesanan);

-- view detail penjualan
CREATE VIEW detail_penjualan_produk AS
SELECT pr.nama_produk, pr.harga AS harga_satuan, dp.jumlah AS jumlah_terjual, (pr.harga * dp.jumlah) AS total_pendapatan
FROM produk pr JOIN detail_pesanan dp ON pr.id_produk = dp.id_produk;

-- view stok produk
CREATE VIEW produk_stok_kurang AS
SELECT nama_produk, stok
FROM produk
WHERE stok < 5;

-- view pelanggan dalam 1 bulan
CREATE VIEW pesanan_pelanggan_bulanan AS
SELECT p.nama_pelanggan, ps.tanggal_pesanan, COUNT(dp.jumlah) AS jumlah_pesanan
FROM pelanggan p JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan JOIN detail_pesanan dp ON ps.id_pesanan = dp.id_pesanan
WHERE MONTH(ps.tanggal_pesanan) = MONTH(CURRENT_DATE()) AND YEAR(ps.tanggal_pesanan) = YEAR(CURRENT_DATE())
GROUP BY p.nama_pelanggan, ps.tanggal_pesanan;

DROP VIEW pesanan_pelanggan_bulanan;

-- menampilkan semua tabel view
SELECT * FROM pesanan_diatas_rata_rata;

SELECT * FROM detail_penjualan_produk;

SELECT * FROM produk_stok_kurang;

SELECT * FROM pesanan_pelanggan_bulanan;