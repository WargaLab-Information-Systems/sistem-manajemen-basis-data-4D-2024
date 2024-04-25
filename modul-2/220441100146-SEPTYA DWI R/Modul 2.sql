create database db_toko;
drop database db_toko;
use db_toko;

create table pelanggan(
	id_pelanggan int (11) primary key,
    nama_pelanggan varchar(100),
    email varchar (50),
    alamat varchar(255)
    );
select * from pelanggan;

create table pesanan(
	id_pesanan int (11) primary key,
    id_pelanggan int(11),
    foreign key (id_pelanggan) references pelanggan(id_pelanggan),
    tanggal_pesanan date,
    total int(11)
);

create table produk(
	id_produk int(11) primary key,
    nama_produk varchar (100),
    harga int (11),
    stok int (11)
);

create table detail_pesanan(
	id_detail int(11) primary key,
    id_pesanan int(11),
    foreign key (id_pesanan)references pesanan(id_pesanan),
    id_produk int(11),
    foreign key (id_produk) references produk(id_produk),
    jumlah int(11)
);

insert into pelanggan (id_pelanggan, nama_pelanggan, email, alamat) values
(11,'Septya Dwi','septyadwir09@gmail.com', 'Sidoarjo'),
(12,'Nouha','Nouha@gmail.com','Sampang'),
(13,'Nur Hidayah','Yani@gmail.com','Bangkalan'),
(14,'Sukma Ayu','Sukma@gmail.com','Bojonegoro'),
(15,'Rahmalia Putri','Rahmalia@gmail.com','Surabaya');

insert into pesanan(id_pesanan, id_pelanggan, tanggal_pesanan, total) values
('21','11','2024-04-01','100000'),
('22','12','2024-04-10','120000'),
('23','13','2024-05-20','300000'),
('24','14','2024-06-20','500000'),
('25','15','2024-12-12','200000');

insert into produk(id_produk, nama_produk, harga, stok) values
('1111','rinso','15000','10'),
('1112','shampo','7000','8'),
('1113','sabun','10000','30'),
('1114','sapu','25000','12'),
('1115','kaca','20000','9');
update produk
set stok = 2
where id_produk = '1112';

insert into detail_pesanan(id_detail,id_pesanan, id_produk, jumlah) values
('1','21','1111','2'),
('2','22','1112','5'),
('3','23','1113','7'),
('4','24','1114','2'),
('5','25','1115','7');

SELECT AVG(total) AS rata_rata_total_pesanan FROM pesanan;

CREATE VIEW view_pesanan_lebih_dari_rata_rata AS
SELECT pelanggan.nama_pelanggan, pesanan.total, pesanan.tanggal_pesanan
FROM pelanggan
JOIN pesanan ON pelanggan.id_pelanggan = pesanan.id_pelanggan
WHERE pesanan.total > (SELECT AVG(total) FROM pesanan);

SELECT * FROM view_pesanan_lebih_dari_rata_rata;

CREATE VIEW view_detail_penjualan AS
SELECT produk.nama_produk, produk.harga AS harga_satuan, detail_pesanan.jumlah,
    (produk.harga * detail_pesanan.jumlah) AS total_pendapatan
FROM produk
JOIN detail_pesanan ON produk.id_produk = detail_pesanan.id_produk;
    
SELECT * FROM view_detail_penjualan;

CREATE VIEW view_stok_tersisa AS
SELECT nama_produk, stok FROM produk WHERE stok < 5;
SELECT * FROM view_stok_tersisa;

CREATE VIEW view_total_pesanan_bulan_terakhir AS
SELECT pelanggan.nama_pelanggan, COUNT(pesanan.id_pesanan) AS total_pesanan
FROM pelanggan
JOIN  pesanan ON pelanggan.id_pelanggan = pesanan.id_pelanggan
WHERE pesanan.tanggal_pesanan between DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) and CURRENT_DATE()
GROUP BY pelanggan.id_pelanggan;

SELECT * FROM view_total_pesanan_bulan_terakhir;
    