-- Membuat database tokobarokah
CREATE DATABASE tokobarokah;
use tokobarokah;

-- Membuat tabel pelanggan
CREATE TABLE tokobarokah.pelanggan (
  id_pelanggan INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama_pelanggan VARCHAR(100) NOT NULL,
  email VARCHAR(50) NOT NULL,
  alamat VARCHAR(255) NOT NULL
);

-- Membuat tabel produk
CREATE TABLE tokobarokah.produk (
  id_produk INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama_produk VARCHAR(100) NOT NULL,
  harga INT(11) NOT NULL,
  stok INT(11) NOT NULL
);

-- Membuat tabel pesanan
CREATE TABLE tokobarokah.pesanan (
  id_pesanan INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_pelanggan INT(11),
  tanggal_pesanan DATE NOT NULL,
  total INT(11) NOT NULL,
  FOREIGN KEY (id_pelanggan) REFERENCES tokobarokah.pelanggan(id_pelanggan)
);

-- Membuat tabel detail_pesanan
CREATE TABLE tokobarokah.detail_pesanan (
  id_detail INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_pesanan INT(11),
  id_produk INT(11),
  jumlah INT(11) NOT NULL,
  FOREIGN KEY (id_pesanan) REFERENCES tokobarokah.pesanan(id_pesanan),
  FOREIGN KEY (id_produk) REFERENCES tokobarokah.produk(id_produk)
);

-- isi
INSERT INTO tokobarokah.pelanggan (nama_pelanggan, email, alamat) VALUES
('John Doe', 'john@example.com', 'Jl. Raya No. 123'),
('Jane Smith', 'jane@example.com', 'Jl. Mawar No. 45'),
('Michael Johnson', 'michael@example.com', 'Jl. Melati No. 67'),
('Emily Brown', 'emily@example.com', 'Jl. Anggrek No. 89'),
('Daniel Lee', 'daniel@example.com', 'Jl. Kenanga No. 101'),
('Olivia Garcia', 'olivia@example.com', 'Jl. Tulip No. 111'),
('William Martinez', 'william@example.com', 'Jl. Lavender No. 121'),
('Sophia Robinson', 'sophia@example.com', 'Jl. Sakura No. 131'),
('James Clark', 'james@example.com', 'Jl. Cendana No. 141'),
('Ella Hernandez', 'ella@example.com', 'Jl. Alamanda No. 151');

INSERT INTO tokobarokah.produk (nama_produk, harga, stok) VALUES
('Baju', 100000, 50),
('Celana', 150000, 30),
('Sepatu', 200000, 40),
('Topi', 50000, 20),
('Kacamata', 80000, 25),
('Jam Tangan', 250000, 15),
('Tas', 180000, 35),
('Dompet', 70000, 45),
('Perhiasan', 300000, 10),
('Sabuk', 60000, 30);

INSERT INTO tokobarokah.produk (nama_produk, harga, stok) VALUES
('Pensil', 60000, 4);
INSERT INTO tokobarokah.pesanan (id_pelanggan, tanggal_pesanan, total) VALUES
(1, '2024-04-01', 250000),
(2, '2024-04-02', 300000),
(3, '2024-04-03', 400000),
(4, '2024-04-04', 150000),
(5, '2024-04-05', 200000),
(6, '2024-04-06', 180000),
(7, '2024-04-07', 350000),
(8, '2024-04-08', 280000),
(9, '2024-04-09', 220000),
(10, '2024-04-10', 190000);

INSERT INTO tokobarokah.detail_pesanan (id_pesanan, id_produk, jumlah) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(2, 5, 2),
(2, 8, 1),
(3, 4, 3),
(3, 6, 1),
(4, 7, 1),
(5, 9, 2),
(6, 10, 1);


-- view
CREATE VIEW v_pesanan_diatas_rata2 AS
SELECT
  pel.nama_pelanggan,
  p.total,
  p.tanggal_pesanan
FROM tokobarokah.pesanan AS p
INNER JOIN tokobarokah.pelanggan AS pel ON p.id_pelanggan = pel.id_pelanggan
WHERE p.total > (SELECT AVG(total) FROM tokobarokah.pesanan);

CREATE VIEW v_detail_penjualan AS
SELECT
  prod.nama_produk,
  prod.harga,
  dp.jumlah,
  dp.jumlah * prod.harga AS total_pendapatan
FROM tokobarokah.detail_pesanan AS dp
INNER JOIN tokobarokah.produk AS prod ON dp.id_produk = prod.id_produk;


CREATE VIEW v_stok_rendah AS
SELECT
  prod.nama_produk,
  prod.stok
FROM tokobarokah.produk AS prod
WHERE prod.stok < 5;

CREATE VIEW v_pelanggan_teraktif AS
SELECT
  pel.nama_pelanggan,
  COUNT(p.id_pesanan) AS total_pesanan
FROM tokobarokah.pesanan AS p
INNER JOIN tokobarokah.pelanggan AS pel ON p.id_pelanggan = pel.id_pelanggan
WHERE p.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);


CREATE VIEW v_coba AS
SELECT 
    prd.nama_produk, COUNT(pdn.id_produk) AS total_produk
FROM tokobarokah.detail_pesanan AS pdn
INNER JOIN tokobarokah.produk AS prd ON pdn.id_produk = prd.id_produk;

CREATE VIEW v_cobain AS
SELECT 
    prd.nama_produk, COUNT(pdn.id_produk) AS total_produk
FROM tokobarokah.detail_pesanan AS pdn
JOIN tokobarokah.produk AS prd ON pdn.id_produk = prd.id_produk;

select * from tokobarokah.pesanan;

CREATE VIEW v_pelanggan_teraktiff AS
SELECT
  pel.nama_pelanggan,
  p.tanggal_pesanan,
  COUNT(p.id_pesanan) AS total_pesanan
FROM tokobarokah.pesanan AS p
INNER JOIN tokobarokah.pelanggan AS pel ON p.id_pelanggan = pel.id_pelanggan
WHERE p.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH);

-- buatkan view yang menampilkan  id pelanggan tanggal pesanan jumlah pesanan

create view v_tugas as
select  id_pelanggan,tanggal_pesanan, jumlah from tokobarokah.pesanan a natural join tokobarokah.detail_pesanan b; 

drop view v_tugas;

SELECT * FROM v_pesanan_diatas_rata2;
SELECT * FROM v_detail_penjualan;
SELECT * FROM v_stok_rendah;
SELECT * FROM v_pelanggan_teraktif;
SELECT * FROM v_pelanggan_teraktiff;
select * from v_tugas;
select * from v_cobain;
