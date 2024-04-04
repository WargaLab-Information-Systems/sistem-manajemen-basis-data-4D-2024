// SUKMA AYU MAHARANI
// 220441100077
//SISTEM MANAJEMEN BASIS DATA - 4D

create database db_toko;
use db_toko;
create table pelanggan(
	id_pelanggan int (11) primary key,
    nama_pelanggan varchar (100),
    email varchar (50),
    alamat varchar(225));
insert into pelanggan (id_pelanggan, nama_pelanggan,email,alamat) values
	(01, 'Ardina', 'ardina@gmail.com', 'Banyuwangi'),
    (02, 'Ayu', 'ayu@gmail.com', 'Bojonegoro'),
    (03,'Maharani', 'maharani@gmail.com', 'Surabaya'),
    (04, 'Septya', 'Septya@gmail.com', 'Sidoarjo'),
    (05, 'Dwi', 'dwi@gmail.com', 'Malang');
    
create table pesanan (
	id_pesanan int (11) primary key,
    id_pelanggan int(11),
    tanggal_pesanan date,
    total int (11),
	FOREIGN KEY (id_pelanggan) 
    REFERENCES pelanggan(id_pelanggan));
insert into pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) values
	(20, 01, '2024-03-27', 100000),
    (21, 02, '2024-03-28', 80000),
    (22, 03, '2024-03-29', 60000),
    (23, 04, '2024-03-30', 40000),
    (24, 05, '2024-04-01', 150000);
    

create table produk (
	id_produk int (11) primary key,
    nama_produk varchar(100),
    harga int (11),
    stok int (11));
insert into produk (id_produk, nama_produk, harga, stok) values
	(31, 'Beras', 80000, 3),
    (32, 'Minyak', 50000, 4),
    (33, 'Indomie', 5000, 10),
    (34, 'Shampo', 40000, 3),
    (35, 'Conditioner', 30000, 1);
    
create table detail_pesanan (
	id_detail int (11) primary key,
    id_pesanan int(11),
    id_produk int(11),
    jumlah int(11),
    FOREIGN KEY (id_pesanan) REFERENCES pesanan(id_pesanan),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk));
insert into detail_pesanan (id_detail, id_pesanan, id_produk, jumlah) values
	(111, 20, 31, 2),
    (112, 21, 32, 5),
    (113, 22, 33, 1),
    (114, 23, 34, 3),
    (115, 24, 35, 1);

create view rata_pesanan as
select a.nama_pelanggan, b.total, b.tanggal_pesanan
from pelanggan a
join pesanan b on a.id_pelanggan=b.id_pelanggan
where b.total > (select avg(total)from pesanan);

CREATE VIEW penjualanproduk AS
SELECT c.nama_produk, c.harga AS harga_satuan,
       d.jumlah,
       c.harga * d.jumlah AS total_pendapatan
FROM produk c
JOIN detail_pesanan d ON c.id_produk = d.id_produk;

create view stok_kurang_5 as
select nama_produk, stok 
from produk
where stok < 5;

CREATE VIEW pes_pelanggan AS 
SELECT a.nama_pelanggan, COUNT(b.id_pesanan) AS jumlah_pesanan
FROM pelanggan a
JOIN pesanan b ON a.id_pelanggan = b.id_pelanggan
WHERE b.tanggal_pesanan >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH)
GROUP BY a.nama_pelanggan;

select * from rata_pesanan;
select * from penjualanproduk;
select * from stok_kurang_5;
select * from pes_pelanggan