create database toko;
use toko;

create table pelanggan (id_pelanggan int(11), nama_pelanggan varchar(100), email varchar(50), alamat varchar (255));
create table pesanan (id_pesanan int(11),id_pelanggan int(11), tanggal_pesanan date, total int(11));
create table detail_pesanan (id_detail int(11),id_pesanan int(11), id_produk int(11), jumlah int(11));
create table produk (id_produk int(11),nama_produk varchar(100), harga int(11), stok int(11));

alter table pelanggan add primary key (id_pelanggan);
alter table pesanan add primary key (id_pesanan);
alter table detail_pesanan add primary key (id_detail);
alter table produk add primary key (id_produk);

alter table pesanan add constraint id_pelanggan foreign key (id_pelanggan) references pelanggan(id_pelanggan);
alter table detail_pesanan add constraint id_pesanan foreign key (id_pesanan) references pesanan(id_pesanan);
alter table detail_pesanan add constraint fk_produk foreign key (id_produk) references produk(id_produk);

INSERT INTO pelanggan (id_pelanggan, nama_pelanggan, email, alamat) 
VALUES 
    (1, 'Budi', 'budi@gmail.com', 'Jl. Merdeka No. 123'),
    (2, 'Ani', 'ani@gmai.com', 'Jl. Jenderal Sudirman No. 45'),
    (3, 'Joko', 'joko@gmai.com', 'Jl. Pahlawan No. 67'),
    (4, 'Eka', 'eka@gmai.com', 'Jl. Gatot Subroto No. 89'),
    (5, 'Dewi', 'dewi@gmai.com', 'Jl. Diponegoro No. 101');
INSERT INTO produk (id_produk, nama_produk, harga, stok) 
VALUES 
    (1, 'beras 5kg', 35000, 3),
    (2, 'gula', 12000, 20),
    (3, 'minyak goreng', 25000, 4),
    (4, 'Mie instan', 3000, 50),
    (5, 'tepung terigu', 7000, 30),
    (6, 'telur', 2500, 30);

INSERT INTO pesanan (id_pesanan, id_pelanggan, tanggal_pesanan, total)
VALUES
    (1, 1, '2024-04-01', 50000),
    (2, 2, '2024-04-02', 75000),
    (3, 3, '2024-04-03', 30000),
    (4, 4, '2024-04-04', 60000),
    (5, 5, '2024-04-05', 45000),
    (6, 1, '2024-04-06', 80000),
    (7, 2, '2024-04-07', 55000),
    (8, 3, '2024-04-08', 70000),
    (9, 4, '2024-04-09', 40000),
    (10, 5, '2024-04-10', 90000);
INSERT INTO detail_pesanan (id_detail, id_pesanan, id_produk, jumlah)
VALUES
    (1, 1, 1, 2), 
    (2, 1, 2, 3), 
    (3, 2, 3, 1),
    (4, 2, 4, 5),
    (5, 3, 4, 2),
    (6, 3, 5, 4),
    (7, 4, 1, 1),
    (8, 4, 2, 2), 
    (9, 5, 3, 3),
    (10, 5, 4, 4),
    (11, 6, 4, 3),
    (12, 6, 5, 2),
    (13, 7, 1, 2),
    (14, 7, 2, 1),
    (15, 8, 3, 4),
    (16, 8, 4, 3),
    (17, 9, 4, 1),
    (18, 9, 5, 2), 
    (19, 10, 1, 4),
    (20, 10, 2, 3);
    
CREATE VIEW pesanan_lebih_dari_rata_rata AS
SELECT
    pelanggan.nama_pelanggan,
    pesanan.total,
    pesanan.tanggal_pesanan
FROM
    pesanan
JOIN
    pelanggan ON pesanan.id_pelanggan = pelanggan.id_pelanggan
WHERE
    pesanan.total > (SELECT AVG(total) FROM pesanan);
select *from pesanan_lebih_dari_rata_rata;
    
CREATE VIEW penjualan_produk AS
SELECT
    produk.nama_produk,
    produk.harga AS harga_satuan,
    detail_pesanan.jumlah AS jumlah_terjual,
    (produk.harga * detail_pesanan.jumlah) AS total_pendapatan
FROM
    detail_pesanan
JOIN
    produk ON detail_pesanan.id_produk = produk.id_produk;
select *from penjualan_produk;

CREATE VIEW produk_stok_kurang AS
SELECT
    nama_produk,
    stok
FROM
    produk
WHERE
    stok < 5;
SELECT * FROM produk_stok_kurang;


CREATE VIEW pesanan_pelanggan_bulan_ini AS
SELECT p.nama_pelanggan, ps.tanggal_pesanan, SUM(ps.total) AS total_pesanan
FROM pesanan ps
JOIN pelanggan p ON ps.id_pelanggan = p.id_pelanggan
WHERE EXTRACT(YEAR_MONTH FROM ps.tanggal_pesanan) = EXTRACT(YEAR_MONTH FROM CURRENT_DATE()) - 1
GROUP BY ps.id_pelanggan;

select * from pesanan_pelanggan_bulan_ini;
