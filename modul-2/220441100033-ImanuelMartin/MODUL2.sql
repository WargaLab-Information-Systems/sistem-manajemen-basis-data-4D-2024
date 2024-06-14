CREATE DATABASE toko_baroqah
USE toko_baroqah
-- bikin tb pelanggan
CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_pelanggan VARCHAR(100),
    email VARCHAR(50),
    alamat VARCHAR(255)
);
-- bikin tb pesanan
CREATE TABLE pesanan (
    id_pesanan INT PRIMARY KEY,
    id_pelanggan INT,
    tanggal_pesanan DATE,
    total INT,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);
-- bikin tb produk
CREATE TABLE produk (
    id_produk INT PRIMARY KEY,
    nama_produk VARCHAR(100),
    harga INT,
    stok INT
);
-- bikin tb detail pesanan
CREATE TABLE detail_pesanan (
    id_detail INT PRIMARY KEY,
    id_pesanan INT,
    id_produk INT,
	jumlah INT,
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- Testing 
SHOW DATABASES LIKE 'toko_baroqah';
USE toko_baroqah;
SHOW TABLES LIKE 'pelanggan';
SHOW TABLES LIKE 'pesanan';
SHOW TABLES LIKE 'produk';
SHOW TABLES LIKE 'detail_pesanan';

-- insert data dummy dulu gan
-- data dummy tabel pelanggan
INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat)
VALUES 
    (1, 'Syarief Khan', 'syarief@trunojoyo.ac.id', 'Jl. Proklamasi No. 55'),
    (2, 'Yasid Wahab', 'yasid@trunojoyo.ac.id', 'Jl. Merdeka No. 456'),
    (3, 'Zain Abdurrahman', 'zain@trunojoyo.ac.id', 'Jl. Maju Mundur No. 789'),
    (4, 'Budi Santoso', 'budi@trunojoyo.ac.id', 'Jl. Damai No. 321'),
    (5, 'Aeri Kusuma', 'aeri@trunojoyo.ac.id', 'Jl. Bahagia No. 654'),
    (6, 'Yeni Kartika', 'yeni@trunojoyo.ac.id', 'Jl. Jalan No. 987'),
    (7, 'Ali Fauzi', 'ali@trunojoyo.ac.id', 'Jl. Kebon No. 1234'),
    (8, 'Wahyudi Sutanto', 'wahyudi@trunojoyo.ac.id', 'Jl. Raya No. 101'),
    (9, 'Purwanto Setiawan', 'purwanto@trunojoyo.ac.id', 'Jl. Sawah No. 202'),
    (10, 'Doni Prasetyo', 'doni@trunojoyo.ac.id', 'Jl. Jembatan No. 303');
   -- cek 
   SELECT * FROM pelanggan

-- insert data dummy tabel pesanan
INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total)
VALUES 
    (1, 1, '2022-03-18', 20000),
    (2, 2, '2022-03-19', 25000),
    (3, 3, '2022-03-19', 30000),
    (4, 4, '2022-03-19', 20000),
    (5, 5, '2022-03-20', 30000),
    (6, 6, '2022-03-21', 35000),
    (7, 7, '2022-03-21', 16000),
    (8, 8, '2022-03-22', 20000),
    (9, 9, '2022-03-23', 12000),
    (10, 10, '2024-03-24', 25000);
    -- cek    
   SELECT * FROM pesanan
   
-- insert  data dummy tb produk
INSERT INTO produk (id_produk, nama_produk, harga, stok) 
VALUES 
    (1, 'Materai sepuluh ribu', 10000, 20),
    (2, 'Buku Tulis', 5000, 50),
    (3, 'Pensil', 2000, 30),
    (4, 'lem Kertas Colek', 1000, 50),
    (5, 'Pulpen Pilot Biru', 3000, 10),
    (6, 'Pensil Warna', 25000, 10),
    (7, 'Meja Belajar Kartun', 30000, 10),
    (8, 'Buku Kas', 7000, 50),
    (9, 'Tipe X', 8000, 25),
    (10, 'Clay', 20000, 5);
    -- cek
    SELECT * FROM produk
    -- tambah stok kurang dari 5 agar muncul di view
    INSERT INTO produk (id_produk, nama_produk, harga, stok)  VALUES (11,'Kaos Kaki Hitam',15000,3)
    
-- insert data dummy tb detail pesanan
INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah)
VALUES 
    (1, 1, 1, 2),
    (2, 2, 2, 5),
    (3, 3, 3, 15),
    (4, 4, 4, 20),
    (5, 5, 5, 6),
    (6, 6, 8, 5),
    (7, 7, 9, 2),
    (8, 8, 1, 2),
    (9, 9, 5, 4),
    (10, 10, 2, 5);


-- SOAL 1
-- ratarata
SELECT * FROM pesanan
SELECT AVG(total)FROM pesanan

CREATE VIEW v_pesanan_lebih_dari_rata_rata AS
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM pesanan ps
JOIN pelanggan p ON ps.id_pelanggan = p.id_pelanggan
WHERE ps.total > (SELECT AVG(total) FROM pesanan);

-- SOAL 2
CREATE VIEW v_detail_penjualan AS
SELECT pr.nama_produk, pr.harga AS harga_satuan, dp.jumlah AS jumlah_terjual, (pr.harga * dp.jumlah) AS total_pendapatan
FROM detail_pesanan dp
JOIN produk pr ON dp.id_produk = pr.id_produk;

-- SOAL 3
CREATE VIEW v_stok_kurang_dari_5 AS
SELECT nama_produk, stok
FROM produk
WHERE stok < 5;

-- SOAL 4
CREATE VIEW v_total_pesanan_per_pelanggan AS
SELECT p.nama_pelanggan, SUM(ps.total) AS total_pesanan
FROM pelanggan p
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= DATE_SUB('2022-04-01', INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan;

create view topes as 

SELECT * FROM pesanan 
SELECT *  FROM produk
SELECT * FROM pelanggan

CREATE VIEW v_nama_pel_dan_pesanan_harga AS 
SELECT pelanggan.nama_pelanggan,produk.nama_produk,produk.harga FROM pelanggan JOIN pesanan ON pesanan.id_pesanan=pelanggan.id_pelanggan JOIN pesanan 
ON pelanggan.id_pelanggan = pesananan.id_pelanggan GROUP BY pelanggan.nama_pelanggan;



CREATE VIEW test3 AS
SELECT nama_pelanggan,nama_produk,harga FROM pelanggan JOIN pesanan ON pelanggan.id_pelanggan=pesanan.id_pelanggan JOIN detail_pesanan ON pesanan.id_pesanan = detail_pesanan.id_pesanan NATURAL JOIN produk
GROUP BY pelanggan.nama_pelanggan

SELECT * FROM test3

-- AKSES
SELECT * FROM v_pesanan_lebih_dari_rata_rata;
SELECT * FROM v_detail_penjualan;
SELECT * FROM v_stok_kurang_dari_5;
SELECT * FROM v_total_pesanan_per_pelanggan;
select * from pesanan

drop view test4

create view test4 as
select nama_pelanggan,nama_produk,harga,tanggal_pesanan as tanggal_beli from pelanggan 
NATURAL JOIN pesanan 
join detail_pesanan on detail_pesanan.id_pesanan = pesanan.id_pesanan 
join produk on detail_pesanan.id_produk=produk.id_produk 
group by nama_produk

select * from test4