create database tokobarokah;
use tokobarokah;

create table pelanggan(
	id_pelanggan int(11) primary key,
	nama_pelanggan varchar(100),
	email varchar(50),
	alamat varchar(255)
);

CREATE TABLE pesanan(
	id_pesanan INT(11) primary key,
	id_pelanggan INT(11),
	tanggal_pesanan date,
	total INT(11),
	foreign key(id_pelanggan) references Pelanggan(id_pelanggan)
);

create table produk(
	id_produk int(11) primary key,
	nama_produk varchar(100),
	harga int(11),
	stok int(11)
);

create table detail_pesanan(
	id_detail int(11) primary key,
	id_pesanan int(11),
	id_produk int(11),
	jumlah int (11),
	foreign key(id_pesanan) references pesanan(id_pesanan),
	foreign key(id_produk) references produk(id_produk)
);

insert into pelanggan(id_pelanggan, nama_pelanggan, email, alamat) values
(1, 'haidar', 'hauidar@example.com', 'Jl. Menteng Dalam No. 123'),
(2, 'asep', 'pakasep@example.com', 'Jl. Sudirman No. 456'),
(3, 'indra', 'indrajegel@example.com', 'Jl. Gajah Mada No. 789'),
(4, 'ghozi', 'docotorghozi@example.com', 'Jl. Diponegoro No. 1011'),
(5, 'sarminum', 'sarminumair@example.com', 'Jl. Hayam Wuruk No. 1213'),
(6, 'dokoni', 'watashiwaatikdesu@example.com', 'Jl. Gatot Subroto No. 1415');

insert into pesanan(id_pesanan, id_pelanggan, tanggal_pesanan, total) values
(1, 1, '2024-04-01', 500000),
(2, 2, '2024-04-02', 700000),
(3, 3, '2024-05-03', 900000),
(4, 1, '2024-03-04', 1200000),
(5, 4, '2024-03-05', 1500000),
(6, 5, '2024-03-06', 1800000);

insert into produk(id_produk, nama_produk, harga, stok) values 
(1, 'Beras Pandan Wangi', 50000, 3),
(2, 'Minyak Goreng Curah', 20000, 5),
(3, 'Gula Pasir Halus', 15000, 2),
(4, 'Telur Ayam Kampung', 3000, 200),
(5, 'Kecap Bango', 25000, 80),
(6, 'Garam', 5000, 30);

insert into detail_pesanan(id_detail, id_pesanan, id_produk, jumlah) values
(1, 1, 1, 5),
(2, 2, 3, 10),
(3, 3, 2, 3),
(4, 4, 4, 15),
(5, 5, 6, 2),
(6, 6, 5, 8);

CREATE VIEW pesanan_lebih AS
SELECT a.nama_pelanggan, b.total, b.tanggal_pesanan, (SELECT AVG(total) FROM pesanan) AS rata_rata
FROM pesanan b
JOIN pelanggan a ON b.id_pelanggan = a.id_pelanggan
WHERE b.total > (SELECT AVG(total) FROM pesanan);

create view terjual_setiap_pesanan as
select a.nama_produk, a.harga, d.jumlah, a.harga*d.jumlah as total_pendapatan
from produk a
join detail_pesanan d on a.id_produk=d.id_produk;

create view stok_kurang_dari_lima as
select nama_produk, stok
from produk 
where stok<5;

CREATE VIEW pesanan_satu_bulan AS
SELECT a.nama_pelanggan, SUM(b.total) AS total_pesanan, b.tanggal_pesanan
FROM pelanggan a
JOIN pesanan b ON a.id_pelanggan = b.id_pelanggan
WHERE b.tanggal_pesanan >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY a.nama_pelanggan;