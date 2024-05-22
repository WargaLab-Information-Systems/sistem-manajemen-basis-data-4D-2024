create database db_tokobarokah;
use db_tokobarokah;
show databases;

create table pesanan(
id_pesanan int(11) primary key,
id_pelanggan int(11),
tanggal_pesanan date,
total int(11),
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) VALUES
(1, 1, '2024-03-01', 10000),
(2, 2, '2024-03-02', 15000),
(3, 3, '2024-01-03', 20000),
(4, 4, '2024-03-04', 25000),
(5, 5, '2024-04-05', 30000),
(6, 6, '2024-04-06', 35000),
(7, 7, '2024-04-07', 40000),
(8, 8, '2024-04-08', 45000),
(9, 9, '2024-04-09', 50000),
(10, 10, '2024-04-10', 55000);
drop table pesanan;

create table pelanggan(
id_pelanggan int(11) primary key,
nama_pelanggan varchar(100),
email varchar(50),
alamat varchar(255)
);

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) VALUES
(1, 'Pipin', 'pipin@gmail.com', 'Jl. pahlawan No. 1, Surabaya'),
(2, 'Hasnah', 'hasnah@gmail.com', 'Jl. sulawesi No. 2, Sidoarjo'),
(3, 'Anisa', 'anisa@gmail.com', 'Jl. sumpah pemuda No. 3, Surabaya'),
(4, 'Icha', 'icha@gmail.com', 'Jl. imam bonjol No. 4, Surabaya'),
(5, 'Adhel', 'adhel@gmail.com', 'Jl. pahlawan No. 5, Surabaya'),
(6, 'Sindy', 'sindy@gmail.com', 'Jl. A.Yani No. 56, Sidoarjo'),
(7, 'Maya', 'maya@gmail.com', 'Jl. sumpah pemuda No. 09, Madura'),
(8, 'Tyas', 'tyas@gmail.com', 'Jl. sulawesi No. 8, Surabaya'),
(9, 'Hanifa', 'hanifa@gmail.com', 'Jl. pahlawan No. 13, Surabaya'),
(10, 'Desi', 'desi@gmail.com', 'Jl. Gatot No. 35, Surabaya');
drop table pelanggan;

create table produk(
id_produk int(11) primary key,
nama_produk varchar(100),
harga int(11),
stok int(11)
);

INSERT INTO produk (id_produk, nama_produk, harga, stok) VALUES
(1, 'Parfum', 10000, 15),
(2, 'Bedak bayi', 25000, 10),
(3, 'Tisu basah', 12000, 15),
(4, 'Tisu', 20000, 4),
(5, 'sampo 250ml', 30000, 10),
(6, 'Sabun cuci muka wardah', 35000, 10),
(7, 'Sabun GIV', 14000, 4),
(8, 'Indomie goreng', 3500, 10),
(9, 'Indomie soto lamongan', 3500, 10),
(10, 'Sunlight', 15000, 10);


create table detail_pesanan(
id_detail int(11) primary key,
id_pesanan int(11),
id_produk int(11),
jumlah int(11),
FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 2, 3, 3),
(4, 2, 4, 1),
(5, 3, 5, 2),
(6, 3, 6, 1),
(7, 4, 7, 2),
(8, 4, 8, 1),
(9, 5, 9, 3),
(10, 5, 10, 1);


CREATE VIEW pesanan_lebih_rata_rata AS
SELECT pelanggan.nama_pelanggan, pesanan.total, pesanan.tanggal_pesanan
FROM pesanan
JOIN pelanggan ON pesanan.id_pelanggan = pelanggan.id_pelanggan
WHERE pesanan.total > (SELECT AVG(total) FROM pesanan);
select * from pesanan_lebih_rata_rata;



CREATE VIEW produk_terjual AS
SELECT produk.nama_produk, produk.harga AS harga_satuan, 
SUM(detail_pesanan.jumlah) AS jumlah_produk_terjual, 
SUM(produk.harga * detail_pesanan.jumlah) AS total_pendapatan
FROM produk
JOIN detail_pesanan ON produk.id_produk = detail_pesanan.id_produk
GROUP BY produk.id_produk;
select * from produk_terjual;

CREATE VIEW produk_stok_kurang_5 AS
SELECT nama_produk, stok AS jumlah_stok_tersisa
FROM produk
WHERE stok < 5;
select *from produk_stok_kurang_5;

CREATE VIEW pesanan_sebulanterakhir AS
SELECT pelanggan.nama_pelanggan,
COUNT(pesanan.id_pesanan) AS total_pesanan
FROM pesanan JOIN pelanggan ON pelanggan.id_pelanggan = pesanan.id_pelanggan
WHERE pesanan.tanggal_pesanan BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) AND CURRENT_DATE()
GROUP BY pelanggan.id_pelanggan;
SELECT * FROM pesanan_sebulanterakhir;