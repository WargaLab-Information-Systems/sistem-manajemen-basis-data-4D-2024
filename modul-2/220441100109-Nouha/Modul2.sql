create database toko_barokah;
use  toko_barokah;

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY ,
    nama_pelanggan VARCHAR(100) ,
    email VARCHAR(50) ,
    alamat varchar(255)
);
CREATE TABLE pesanan (
    id_pesanan INT PRIMARY KEY ,
    id_pelanggan INT,
    tanggal_pesanan DATE ,
    total int,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);
CREATE TABLE detail_pesanan (
    id_detail INT PRIMARY KEY ,
    id_pesanan INT,
    id_produk INT,
    jumlah INT ,
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);
drop table detail_pesanan;
CREATE TABLE produk (
    id_produk INT PRIMARY KEY ,
    nama_produk VARCHAR(100) ,
    harga int,
    stok INT 
);
INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) VALUES 
(01, 'Joni', 'joni@gmail.com', 'Pamekasan'),
(02, 'Galang', 'galang@gmail.com', 'Sampang'),
(03, 'Dina', 'dina@gmail.com', 'Sumenep'),
(04, 'Cipung', 'cipung@gmail.com', 'Sumenep'),
(05, 'Amena', 'amena@gmail.com', 'Bangkalan');


INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) VALUES 
(101, 01, '2024-01-04', 25000),
(102, 02, '2024-03-29', 75000),
(103, 03, '2024-02-01', 90000),
(104, 04, '2024-03-28', 80000),
(105, 05, '2024-01-12', 50000);

update pesanan
set tanggal_pesanan = '2024-01-12'
where id_pesanan = '105';

INSERT INTO produk (id_produk, nama_produk, harga, stok) VALUES 
(999, 'gula', 12500 , 5),
(888, 'minyak', 37500, 4),
(777, 'kopi', 22500, 3),
(666, 'beras', 26500, 4),
(555, 'mie' , 10000, 2);

INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) VALUES 
(111, 101,  999, 2),
(222, 102, 888, 2),
(333, 103, 777,  3),
(444, 104, 666,  4),
(232, 105, 555,  2);
 
show tables;

CREATE VIEW view_pesanan_lebih_dari_rata AS
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM pelanggan p
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.total > (
    SELECT AVG(total) FROM pesanan
); 
select * from view_pesanan_lebih_dari_rata;
CREATE VIEW view_detail_penjualan AS
SELECT 
    pr.nama_produk,
    pr.harga AS harga_satuan,
    dp.jumlah AS jumlah_produk_terjual,
    (pr.harga * dp.jumlah) AS total_pendapatan
FROM produk pr
JOIN detail_pesanan dp ON pr.id_produk = dp.id_produk;

select * from view_detail_penjualan;

CREATE VIEW view_detail_penjualan AS
SELECT 
    pr.nama_produk,
    pr.harga AS harga_satuan,
    dp.jumlah AS jumlah_produk_terjual,
    (pr.harga * dp.jumlah) AS total
FROM produk pr
JOIN detail_pesanan dp ON pr.id_produk = dp.id_produk;

CREATE VIEW view_produk_stok_kurang_dari_5 AS
SELECT 
    nama_produk,
    stok
FROM produk
WHERE stok < 5;
select * from view_produk_stok_kurang_dari_5;

CREATE VIEW total_pesanan_per_pelanggan AS
SELECT p.nama_pelanggan, COUNT(ps.id_pesanan) AS jumlah_total_pesanan
FROM pelanggan p
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan; 

select * from total_pesanan_per_pelanggan;













