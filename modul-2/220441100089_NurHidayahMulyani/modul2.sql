create database db_toko;
use db_toko;
CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_pelanggan VARCHAR(100),
    email varchar (50),
    alamat varchar(255)
); 

CREATE TABLE pesanan(
    id_pesanan INT PRIMARY KEY,
    id_pelanggan int,
    tanggal_pesanan date,
    total int,
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
); 

CREATE TABLE produk(
    id_produk INT PRIMARY KEY,
    nama_produk varchar(100),
    harga int,
    stok int
); 

CREATE TABLE detail_pesanan(
    id_detail INT PRIMARY KEY,
    id_pesanan int,
    id_produk int,
    jumlah int,
	FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
	FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
); 

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) VALUES
(01, 'Sukma ayu', 'sukma@gmail.com', 'Bojonegoro'),
(02, 'Nur hidayah', 'nurhidayah@gmail.com', 'Bangkalan'),
(03, 'Septya dwi', 'septya@gmail.com', 'Sidoajo'),
(04, 'Nouha nurul afia', 'nouha@gmail.com', 'Sampang'),
(05, 'Nur afni', 'nurafni@gmail.com', 'Lamongan');

INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) VALUES
(1, 01, '2024-04-01', 150),
(2, 02, '2024-04-02', 200),
(3, 03, '2024-04-03', 100),
(4, 04, '2024-04-04', 300),
(5, 05, '2024-04-05', 250);

INSERT INTO produk (id_produk, nama_produk, harga, stok) VALUES
(11, 'Baju', 150000, 3),
(22, 'Celana', 200000, 6),
(33, 'Sepatu', 300000, 4),
(44, 'Topi', 50000, 10),
(55, 'Tas', 250000, 5);

update produk
set stok = 5
where id_produk = '55';
select*from produk;

INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) VALUES
(100, 1, 11, 2),
(101, 2, 22, 1),
(102, 3, 33, 3),
(103, 4, 44, 5),
(104, 5, 55, 2);


SELECT AVG(total) AS rata_rata_total FROM pesanan;


CREATE VIEW pesanan_diatas_rata AS
SELECT p.nama_pelanggan, ps.total, ps.tanggal_pesanan
FROM pesanan ps
JOIN pelanggan p ON ps.id_pelanggan = p.id_pelanggan
WHERE ps.total > (SELECT AVG(total) FROM pesanan);

CREATE VIEW detail_penjualan_produk AS
SELECT pr.nama_produk, pr.harga AS harga_satuan, 
       dp.jumlah AS jumlah_terjual, 
       (pr.harga * dp.jumlah) AS total_pendapatan
FROM detail_pesanan dp
JOIN produk pr ON dp.id_produk = pr.id_produk;

CREATE VIEW stok_kurang_dari_5 AS
SELECT nama_produk, stok
FROM produk
WHERE stok < 5;

CREATE VIEW total_pesanan_per_pelanggan AS
SELECT p.nama_pelanggan, COUNT(ps.id_pesanan) AS jumlah_total_pesanan
FROM pelanggan p
JOIN pesanan ps ON p.id_pelanggan = ps.id_pelanggan
WHERE ps.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY p.nama_pelanggan;

select*from detail_pesanan;

select*from pesanan_diatas_rata;
select*from detail_penjualan_produk;
select*from stok_kurang_dari_5;
select*from total_pesanan_per_pelanggan;





