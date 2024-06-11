CREATE DATABASE kosmetik;
USE kosmetik;



create table gudang(
id_gudang int (11) primary key not null, 
nama varchar (100) not null, 
alamat varchar (255) not null
);


create table supplier(
id_supplier int (11) primary key not null,
nama_supplier varchar (100) not null,
alamat varchar (255) not null, 
telepon char (15) not null,
email varchar (100) not null
);


create table karyawan(
id_karyawan int (11) primary key not null,
id_gudang int (11) not null,
nama varchar (100) not null,
alamat varchar (255) not null,
posisi varchar (50)not null,
gaji double not null,
foreign key (id_gudang) references gudang (id_gudang)
);


create table produk (
id_produk int (11) primary key not null,
nama_produk varchar (100) not null,
kategori varchar (50) not null,
harga double not null,
berat float not null
);



create table stok (
id_stok int (11) primary key not null,
id_produk int (11) not null,
id_gudang int (11) not null,
jumlah int (11) not null,
tanggal_update datetime not null,
foreign key (id_produk) references produk (id_produk),
foreign key (id_gudang) references gudang (id_gudang)
);


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


INSERT INTO gudang (id_gudang, nama, alamat) VALUES
(101, 'Gudang Pusat', 'Jalan Kartini No. 1'),
(102, 'Gudang Timur', 'Jalan Diponegoro No. 2'),
(103, 'Gudang Barat', 'Jalan Sudirman No. 3'),
(104, 'Gudang Utara', 'Jalan Gatot Subroto No. 4'),
(105, 'Gudang Selatan', 'Jalan Thamrin No. 5');


INSERT INTO supplier (id_supplier, nama_supplier, alamat, telepon, email) VALUES
(201, 'Supplier Prima', 'Jalan Kenanga No. 1', '081234567890', 'prima@example.com'),
(202, 'Supplier Sentosa', 'Jalan Melati No. 2', '081234567891', 'sentosa@example.com'),
(203, 'Supplier Jaya', 'Jalan Anggrek No. 3', '081234567892', 'jaya@example.com'),
(204, 'Supplier Makmur', 'Jalan Kamboja No. 4', '081234567893', 'makmur@example.com'),
(205, 'Supplier Sukses', 'Jalan Teratai No. 5', '081234567894', 'sukses@example.com');


INSERT INTO karyawan (id_karyawan, id_gudang, nama, alamat, posisi, gaji) VALUES
(301, 101, 'Jenoo', 'Jalan Cemara No. 1', 'Manager', 5000000),
(302, 102, 'Jaemin', 'Jalan Pinus No. 2', 'Supervisor', 4000000),
(303, 103, 'Mark', 'Jalan Akasia No. 3', 'Staff', 3000000),
(304, 104, 'Haechan', 'Jalan Mahoni No. 4', 'Staff', 3000000),
(305, 105, 'Jisung', 'Jalan Jati No. 5', 'Admin', 3500000);


INSERT INTO produk (id_produk, nama_produk, kategori, harga, berat) VALUES
(401, 'Lipstik Matte', 'Kosmetik', 150000, 0.05),
(402, 'Foundation', 'Kosmetik', 200000, 0.1),
(403, 'Bedak Tabur', 'Kosmetik', 50000, 0.05),
(404, 'Maskara', 'Kosmetik', 75000, 0.02),
(405, 'Eyeliner', 'Kosmetik', 60000, 0.01);


INSERT INTO stok (id_stok, id_produk, id_gudang, jumlah, tanggal_update) VALUES
(501, 401, 101, 100, '2024-04-20'),
(502, 402, 102, 200, '2024-04-25'),
(503, 403, 103, 150, '2024-04-30'),
(504, 404, 104, 300, '2024-05-03'),
(505, 405, 105, 250, '2024-05-07');


INSERT INTO transaksi (id_transaksi, id_produk, id_supplier, id_karyawan, jumlah, total_harga, tanggal_transaksi) VALUES
(1, 401, 201, 301, 10, 1500000, '2024-04-13'),
(2, 402, 202, 302, 20, 4000000, '2024-04-26'),
(3, 403, 203, 303, 15, 7500000, '2024-05-04'),
(4, 404, 204, 304, 30, 2250000, '2024-04-12'),
(5, 405, 205, 305, 25, 150000, '2024-05-07');

DROP table stok;
drop table transaksi;

-- SOAL MODUL 5

drop database kosmetik;

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
SET @id_karyawan = 302;
CALL total_transaksi(302, @total_harga);
SELECT @id_karyawan, @total_harga;




-- ------------------------
-- no 2
DELIMITER //
CREATE PROCEDURE lama_barang()
BEGIN
    SELECT p.nama_produk, 
           DATEDIFF(NOW(), s.tanggal_update) AS umur_produk_hari
    FROM stok s
    INNER JOIN produk p ON s.id_produk = p.id_produk;
END //
DELIMITER ;
CALL lama_barang();


-- ----------------------------
-- no 3
DELIMITER //
CREATE PROCEDURE HapusTransaksi(
    IN tanggal_awal DATE,
    IN tanggal_akhir DATE,
    IN maks_total_harga DOUBLE
)
BEGIN
    DECLARE id_transaksi_terbaru INT;
    
    -- Mendapatkan id_transaksi yang memenuhi kriteria tanggal_transaksi dan total_harga
    SELECT id_transaksi INTO id_transaksi_terbaru
    FROM transaksi
    WHERE tanggal_transaksi BETWEEN tanggal_awal AND tanggal_akhir
    AND total_harga <= maks_total_harga
    LIMIT 1;
    
    -- Menghapus transaksi dalam rentang waktu tertentu, kecuali yang memiliki total harga lebih dari batasan yang ditentukan
    DELETE FROM transaksi 
    WHERE tanggal_transaksi BETWEEN tanggal_awal AND tanggal_akhir
    AND total_harga <= maks_total_harga
    AND id_transaksi = id_transaksi_terbaru;
END //
DELIMITER ;
CALL HapusTransaksi('2024-04-01', '2024-05-30', 200000);
SELECT * FROM transaksi;
DROP PROCEDURE HapusTransaksi;
