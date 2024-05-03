create database tokobarokah;
use tokobarokah;

create table pelanggan(
id_pelanggan int primary key,
nama_pelanggan varchar(100),
email varchar(50),
alamat varchar(255)
);
insert into pelanggan(id_pelanggan, nama_pelanggan, email, alamat) values
(1, 'Nana', 'nana@gmail.com', 'Bangkalan'),
(2, 'Nina', 'nina@gmail.com', 'Surabaya'),
(3, 'Nino', 'nino@gmail.com', 'Kamla'),
(4, 'Nuno', 'nuno@gmail.com', 'Bangkalan'),
(5, 'Nani', 'nani@gmail.com', 'Surabaya');

create table pesanan(
id_pesanan int primary key,
id_pelanggan int,
tanggal_pesanan date,
total int,
foreign key (id_pelanggan) references pelanggan (id_pelanggan)
);
insert into pesanan(id_pesanan, id_pelanggan, tanggal_pesanan, total) values
(11, 1, '2024-01-10', 10000),
(22, 2, '2024-01-15', 25000),
(33, 3, '2024-02-05', 35000),
(44, 4, '2024-03-28', 50000),
(55, 5, '2024-04-02', 15000);

create table produk(
id_produk int primary key,
nama_produk varchar(100),
harga int,
stok int
);
insert into produk(id_produk, nama_produk, harga, stok) values
(111, 'Bolpoin', 2000, 7),
(222, 'Tisu', 12500, 5),
(333, 'Buku', 35000, 3),
(444, 'Sampo', 25000, 5),
(555, 'Sabun', 5000, 2);

create table detail_pesanan(
id_detail int primary key,
id_pesanan int,
id_produk int,
jumlah int,
foreign key(id_pesanan) references pesanan (id_pesanan),
foreign key(id_produk) references produk (id_produk)
);
insert into detail_pesanan(id_detail, id_pesanan, id_produk, jumlah) values
(101, 11, 111, 4),
(102, 22, 222, 2),
(103, 33, 333, 5),
(104, 44, 444, 2),
(105, 55, 555, 3);

select avg (b.total) as rata_rata_pesanan 
	from pesanan as b where b.total > (
	select avg (total) from pesanan 
);

create view pesanan_melebihi_rata_rata as 
select a.nama_pelanggan, b.total, b.tanggal_pesanan, rp.rata_rata_pesanan
from pelanggan a
join pesanan b on a.id_pelanggan = b.id_pelanggan 
join ( select avg (total) as rata_rata_pesanan from pesanan) as rp on b.total > rp.rata_rata_pesanan;

select * from pesanan_melebihi_rata_rata;
drop view pesanan_melebihi_rata_rata;

create view penjualan_produk as
select c.nama_produk, c.harga as harga_satuan, d.jumlah as jumlah_produk_terjual, 
(c.harga * d.jumlah) as total 
from produk c 
join detail_pesanan d on c.id_produk = d.id_produk;
select * from penjualan_produk;

create view stok_produk_kurang_dari_5 as
select nama_produk, stok 
from produk
where stok <5;
select * from stok_produk_kurang_dari_5;

create view total_pesanan_setiap_pelaggan as
select a.nama_pelanggan, b.tanggal_pesanan, count(b.id_pesanan) as jumlah_total_pesanan
from pelanggan a
join pesanan b on a.id_pelanggan = b.id_pelanggan
where b.tanggal_pesanan >= date_sub(current_date(), interval 1 month)
group by a.nama_pelanggan;
select * from total_pesanan_setiap_pelaggan;
drop view total_pesanan_setiap_pelaggan;

drop database tokobarokah;