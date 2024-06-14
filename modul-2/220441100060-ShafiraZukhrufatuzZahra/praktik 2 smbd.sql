create database db_modul2;
use db_modul2;

create table tb_pelanggan(
	id_pelanggan int (11) primary key,
    nama_pelanggan varchar (100) not null,
    email varchar (50) not null,
    alamat varchar (255) not null
 );
 desc tb_pelanggan;
 insert into tb_pelanggan (id_pelanggan, nama_pelanggan, email, alamat) values
	(001, 'fajar', 'fajar@gmail.com', 'gresik'),
    (002, 'yani', 'yani@gmail.com', 'ambon'),
    (003, 'fira', 'fira@gmail.com', 'gresik'),
    (004, 'adit', 'adit@gmail.com', 'lamongan'),
    (005, 'daffa', 'daffa@gmail.com', 'gresik'),
    (006, 'kevin', 'kevin@gmail.com', 'malang'),
    (007, 'shanum', 'shanum@gmail.com', 'malang'),
    (008, 'rafka', 'rafka@gmail.com', 'kediri'),
    (009, 'laraz', 'laraz@gmail.com', 'pati'),
    (010, 'calista', 'calista@gmail.com', 'gresik');    
select * from tb_pelanggan;

create table tb_pesanan(
	id_pesanan int (11) primary key,
    id_pelanggan int (11),
    tanggal_pesanan date not null,
    total int (11) not null,
    foreign key (id_pelanggan) references tb_pelanggan(id_pelanggan)
);
desc tb_pesanan;
insert into tb_pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total) values
	(3001, 1, '2024-04-01', 1000000),
    (3002, 2, '2024-04-02', 2000000),
    (3003, 3, '2024-04-03', 3000000),
    (3004, 4, '2024-04-04', 1000000),
    (3005, 5, '2024-04-05', 2000000),
    (3006, 6, '2024-04-06', 3000000),
    (3007, 7, '2024-04-07', 1000000),
    (3008, 8, '2024-04-08', 2000000),
    (3009, 9, '2024-04-09', 3000000),
    (3010, 10, '2024-04-10', 1000000);
select * from tb_pesanan;

create table tb_produk(
	id_produk int(11) primary key,
    nama_produk varchar (100) not null,
    harga int (11) not null,
    stok int (11) not null
);
desc tb_produk;
insert into tb_produk (id_produk, nama_produk, harga, stok) values
	(4001, 'domus chair', 900000, 5),
    (4002, 'lounge chair', 850000, 5),
    (4003, 'lukki chair', 800000, 4),
    (4004, 'coffee table', 750000, 4),
    (4005, 'sofa table', 700000, 3),
    (4006, 'pirkka stool', 650000, 3),
    (4007, 'table lamp', 600000, 3),
    (4008, 'ombra', 550000, 2),
    (4009, 'indochine', 500000, 2),
    (4010, 'ara sofa', 450000, 2);
select * from tb_produk;

create table tb_detail_pesanan(
	id_detail int (11) primary key,
    id_pesanan int (11),
    id_produk int (11), 
    jumlah int (11) not null,
    foreign key (id_pesanan) references tb_pesanan(id_pesanan),
    foreign key (id_produk) references tb_produk(id_produk)
);
desc tb_detail_pesanan;
insert into tb_detail_pesanan(id_detail, id_pesanan, id_produk, jumlah) values
	(5001, 3001, 4001, 2),
    (5002, 3002, 4002, 2),
    (5003, 3003, 4003, 3),
    (5004, 3004, 4004, 3),
    (5005, 3005, 4005, 4),
    (5006, 3006, 4006, 4),
    (5007, 3007, 4007, 5),
    (5008, 3008, 4008, 5),
    (5009, 3009, 4009, 6),
    (50010, 3010, 4010, 6);
select * from tb_detail_pesanan;

-- SOAL PRAKTIKUM
-- NOMOR 1
SELECT AVG(ps.total) AS rata_rata_total_pesanan
FROM tb_pesanan AS ps
WHERE ps.total > (
    SELECT AVG(total)
    FROM tb_pesanan
);

CREATE VIEW pelanggan_lebih_ratarata AS 
SELECT pl.nama_pelanggan, ps.total, ps.tanggal_pesanan,  rp.rata_rata_total
FROM tb_pesanan AS ps 
JOIN tb_pelanggan AS pl ON ps.id_pelanggan = pl.id_pelanggan
JOIN (
    SELECT AVG(total) AS rata_rata_total
    FROM tb_pesanan
) AS rp ON ps.total > rp.rata_rata_total;
select * from pelanggan_lebih_ratarata; 



-- NOMOR 2
CREATE VIEW dp_aggregate AS
SELECT
    dp.id_produk,
    SUM(dp.jumlah) AS jumlah_terjual,
    SUM(dp.jumlah * pr.harga) AS total_pendapatan
FROM
    tb_detail_pesanan dp
    JOIN tb_produk pr ON dp.id_produk = pr.id_produk
GROUP BY
    dp.id_produk;
    
CREATE VIEW pendapatan_produk AS
SELECT
    pr.nama_produk,
    pr.harga,
    dp.jumlah_terjual,
    dp.total_pendapatan
FROM
    tb_produk pr
    JOIN dp_aggregate dp ON pr.id_produk = dp.id_produk;
select * from pendapatan_produk;

-- NOMOR 3
create view stok_kurang as
select nama_produk, stok
from tb_produk
where stok < 5;
select * from stok_kurang;

-- NOMOR 4
create view pl_bulan_terakhir as
select pl.nama_pelanggan, ps.tanggal_pesanan, count(*) as total_pesanan
from tb_pesanan as ps
join tb_pelanggan as pl on ps.id_pelanggan = pl.id_pelanggan
where ps.tanggal_pesanan >= date_sub(curdate(), interval 1 month)
group by pl.nama_pelanggan;

drop view pl_bulan_terakhir;
select * from pl_bulan_terakhir;