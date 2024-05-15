create database logistik_pakaian;
use logistik_pakaian;
drop database logistik_pakaian;

create table gudang(
id_gudang int (11) primary key not null, 
nama varchar (100) not null, 
alamat varchar (255) not null
);

insert into gudang (id_gudang, nama, alamat) values
(1, 'Gudang Logistik', 'Surabaya'),
(2, 'Gudang Utama', 'Surabaya'),
(3, 'Gudang Sentral', 'Bangkalan'),
(4, 'Gudang Sejahtera', 'Sampang'),
(5, 'Gudang Indah', 'Gresik');

create table supplier(
id_supplier int (11) primary key not null,
nama_supplier varchar (100) not null,
alamat varchar (255) not null, 
telepon char (15) not null,
email varchar (100) not null
);

insert into supplier (id_supplier, nama_supplier, alamat, telepon, email) values
(101, 'Jeno', 'Surabaya', '123456781', 'jeno@gmail.com'),
(102, 'Rose', 'Jakarta', '123456782', 'rose@gmail.com'),
(103, 'Yuwen', 'Jakarta', '123456783', 'yuwen@gmail.com'),
(104, 'Leo', 'Bandung', '123456784', 'leo@gmail.com'),
(105, 'Win', 'Surabaya', '123456785', 'win@gmail.com');

create table karyawan(
id_karyawan int (11) primary key not null,
id_gudang int (11) not null,
nama varchar (100) not null,
alamat varchar (255) not null,
posisi varchar (50)not null,
gaji double not null,
foreign key (id_gudang) references gudang (id_gudang)
);

insert into karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) values
(201, 1, 'Jaemin', 'Jakarta', 'Manager', 8000000),
(202, 2, 'Chiko', 'Gresik', 'Penerima Barang', 3300000),
(203, 3, 'Disa', 'Surabaya', 'Supervisor', 6500000),
(204, 4, 'Lisa', 'Sampang', 'Packing', 4000000),
(205, 5, 'Imam', 'Bangkalan', 'Petugas Penyimpanan', 3700000);

create table produk (
id_produk int (11) primary key not null,
nama_produk varchar (100) not null,
kategori varchar (50) not null,
harga double not null,
berat float not null
);

insert into produk (id_produk, nama_produk, kategori, harga, berat) values
(301, 'Kemeja Polos', 'Kemeja', 110000, 0.3),
(302, 'Celana Jeans', 'Celana', 250000, 0.5),
(303, 'Vest Rajut', 'Vest', 150000, 0.4),
(304, 'Kaos Polos', 'Kaos', 65000, 0.2),
(305, 'Sweater Hoodie', 'Sweater', 185000, 0.7);

create table stok (
id_stok int (11) primary key not null,
id_produk int (11) not null,
id_gudang int (11) not null,
jumlah int (11) not null,
tanggal_update datetime not null,
foreign key (id_produk) references produk (id_produk),
foreign key (id_gudang) references gudang (id_gudang)
);

insert into stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) values
(401, 301, 1, 350, '2024-04-20 00:00:00'),
(402, 302, 2, 400, '2024-04-25 00:00:00'),
(403, 303, 3, 300, '2024-04-30 00:00:00'),
(404, 304, 4, 275, '2024-05-03 00:00:00'),
(405, 305, 5, 250, '2024-05-07 00:00:00');

create table transaksi (
id_transaksi int (11) primary key not null,
id_produk int (11) not null,
id_supplier int (11) not null,
id_karyawan int (11) not null,
jumlah int (11) not null,
total_harga double not null,
tanggal_transaksi datetime not null,
foreign key (id_produk) references produk (id_produk),
foreign key (id_supplier) references supplier (id_supplier),
foreign key (id_karyawan) references karyawan (id_karyawan)
);

insert into transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) values
(501, 301, 101, 201, 10, 2500000, '2024-05-01'),
(502, 302, 102, 202, 20, 3700000, '2024-05-02'),
(503, 303, 103, 203, 15, 2250000, '2024-05-04'),
(504, 304, 104, 204, 50, 200000, '2024-05-08'),
(505, 305, 105, 205, 30, 3300000, '2024-05-07');
drop table transaksi;

-- no 1
DELIMITER //
CREATE PROCEDURE total_transaksi(
    IN karyawan_id INT,
    OUT total_harga_transaksi DOUBLE
)
BEGIN
    SELECT SUM(total_harga) INTO total_harga_transaksi
    FROM transaksi
    WHERE id_karyawan = karyawan_id;
END //
DELIMITER ;
SET @id_karyawan = 201;
CALL total_transaksi(201, @total_harga);
SELECT @id_karyawan, @total_harga;

-- no 2
DELIMITER //
CREATE PROCEDURE lama_produk()
BEGIN
    SELECT p.nama_produk, 
           DATEDIFF(NOW(), s.tanggal_update) AS umur_produk_hari
    FROM stok s
    INNER JOIN produk p ON s.id_produk = p.id_produk;
END //
DELIMITER ;
CALL lama_produk();

-- no 3
DELIMITER //
SET SQL_SAFE_UPDATES = 0;
DELIMITER //
CREATE PROCEDURE hapus_transaksi_bulan_terakhir()
BEGIN
    DELETE FROM transaksi
    WHERE total_harga <= 200000 
    AND tanggal_transaksi >= DATE_SUB(NOW(), INTERVAL 1 MONTH);
END //
DELIMITER ;
drop procedure hapus_transaksi_bulan_terakhir;
SELECT * FROM transaksi;
