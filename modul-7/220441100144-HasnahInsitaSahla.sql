create database modul7;
use modul7;

create table mobil(
	id_mobil int(11) primary key auto_increment,
    merk varchar(50),
    model varchar(50),
    tahun int(11),
    warna varchar(20),
    harga_sewa decimal(10,2),
    status ENUM('tersedia', 'disewa', 'dalam_perawatan')
);

INSERT INTO mobil ( merk, model, tahun, warna, harga_sewa, status) VALUES
('Hyundai', 'Elantra', 2020, 'Merah', 500000.00, 'disewa'),
('Toyota', 'Corolla', 2019, 'Hitam', 600000.00, 'disewa'),
('Honda', 'Civic', 2021, 'Putih', 700000.00, 'dalam_perawatan'),
('Kia', 'Soul', 2018, 'Biru', 550000.00, 'tersedia'),
('Ford', 'Focus', 2017, 'Silver', 450000.00, 'tersedia');


create table pelanggan(
	id_pelanggan int(11) primary key auto_increment,
    nama varchar(100),
    alamat text,
    no_telepon varchar(15),
    email varchar(50)
);

INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
('Karina', 'Seoul, South Korea', '010-1234-5678', 'karina@example.com'),
('Giselle', 'Tokyo, Japan', '010-2345-6789', 'giselle@example.com'),
('Winter', 'Busan, South Korea', '010-3456-7890', 'winter@example.com'),
('Ningning', 'Harbin, China', '010-4567-8901', 'ningning@example.com'),
('Suho', 'Seoul, South Korea', '010-5678-9012', 'suho@example.com');

create table pegawai(
	id_pegawai int(11) primary key auto_increment,
    nama varchar(100),
    jabatan varchar(100),
    no_telepon varchar(15),
    email varchar(50)
);

INSERT INTO pegawai ( nama, jabatan, no_telepon, email) VALUES
('Baekhyun', 'Manager', '010-6789-0123', 'baekhyun@example.com'),
( 'Chanyeol', 'Staff', '010-7890-1234', 'chanyeol@example.com'),
( 'D.O.', 'Supervisor', '010-8901-2345', 'do@example.com'),
( 'Kai', 'Technician', '010-9012-3456', 'kai@example.com'),
( 'Sehun', 'Receptionist', '010-0123-4567', 'sehun@example.com');

create table transaksi(
	id_transaksi int(11) primary key auto_increment,
    id_pelanggan int(11),
    id_mobil int(11),
    id_pegawai int(11),
    tanggal_mulai date,
    tanggal_selesai date,
    total_biaya decimal(10,2),
    status_transaksi ENUM('pending', 'selesai', 'dibatalkan'),
    foreign key(id_pelanggan) references pelanggan(id_pelanggan),
    foreign key(id_mobil) references mobil(id_mobil),
    foreign key(id_pegawai) references pegawai(id_pegawai)
);

INSERT INTO transaksi ( id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
( 1, 1, 1, '2024-05-01', '2024-05-05', 2000000.00, 'selesai'),
( 2, 2, 2, '2024-05-10', '2024-05-15', 3000000.00, 'pending'),
( 3, 3, 3, '2024-05-20', '2024-05-25', 3500000.00, 'dibatalkan'),
( 4, 4, 4, '2024-05-05', '2024-05-10', 2750000.00, 'selesai'),
( 5, 5, 5, '2024-05-15', '2024-05-20', 2250000.00, 'pending');


create table pembayaran(
	id_pembayaran int(11) primary key auto_increment,
    id_transaksi int(100),
    tanggal_pembayaran date,
    jumlah_pembayaran decimal(10,2),
    metode_pembayaran varchar(50),
    foreign key(id_transaksi) references transaksi(id_transaksi)
);

INSERT INTO pembayaran ( id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
( 1, '2024-05-05', 2000000.00, 'Kartu Kredit'),
( 2, '2024-05-15', 3000000.00, 'Transfer Bank'),
( 3, '2024-05-25', 3500000.00, 'Tunai'),
( 4, '2024-05-10', 2750000.00, 'Kartu Debit'),
( 5, '2024-05-20', 2250000.00, 'E-Wallet');

create table perawatan(
	id_perawatan int(11) primary key auto_increment,
    id_mobil int(11),
    tanggal date,
    deskripsi text,
    biaya decimal(10,2),
    foreign key(id_mobil) references mobil(id_mobil)
);

INSERT INTO perawatan ( id_mobil, tanggal, deskripsi, biaya) VALUES
( 1, '2024-05-01', 'Ganti oli dan filter', 150000.00),
( 2, '2024-05-10', 'Servis rutin', 250000.00),
( 3, '2024-05-20', 'Perbaikan AC', 300000.00),
( 4, '2024-05-05', 'Penggantian ban', 400000.00),
( 5, '2024-05-15', 'Cuci dan detailing', 200000.00);


-- 1.Buatlah sebuah trigger bernama after_update_transaksi yang akan memperbarui 
-- status mobil menjadi tersedia setiap kali status transaksi berubah menjadi selesai! 
DELIMITER //

CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi = 'selesai' THEN
        UPDATE mobil
        SET status = 'tersedia'
        WHERE id_mobil = NEW.id_mobil;
    END IF;
END //

DELIMITER ;
select * from mobil;

select * from transaksi;
UPDATE transaksi
SET status_transaksi = 'selesai';
select * from mobil;


-- 2.
create table log_pembayaran(
	id_log int(11) primary key auto_increment,
    id_pembayaran int(11) not null,
    id_transaksi int(11) not null,
    tanggal_pembayaran date not null,
    jumlah_pembayaran decimal(10,2) not null,
    metode_pembayaran varchar(50) not null,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER after_insert_pembayaran
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
    INSERT INTO log_pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
    VALUES (NEW.id_pembayaran, NEW.id_transaksi, NEW.tanggal_pembayaran, NEW.jumlah_pembayaran, NEW.metode_pembayaran);
END //

DELIMITER ;

INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
VALUES (1, '2024-05-29', 100000.00, 'Transfer Bank');

SELECT * FROM log_pembayaran;
select * from pembayaran;

-- 3.Buatlah sebuah trigger bernama before_insert_transaksi yang akan 
-- menghitung total biaya sewa secara otomatis sebelum transaksi 
-- baru dimasukkan ke dalam tabel transaksi. Total biaya dihitung 
-- berdasarkan harga sewa per hari dari tabel mobil dikalikan dengan 
-- jumlah hari sewa (tanggal_selesai - tanggal_mulai). 

DELIMITER //

CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    SET NEW.total_biaya = (SELECT harga_sewa * DATEDIFF(NEW.tanggal_selesai, NEW.tanggal_mulai) 
    FROM mobil WHERE id_mobil = NEW.id_mobil);
END//
DELIMITER ; 

INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi)
VALUES (1, 5, 1, '2024-06-01', '2024-06-03', 'pending');
select * from transaksi;


-- 4.
CREATE TABLE log_hapus_transaksi (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_transaksi INT NOT NULL,
    id_pelanggan INT NOT NULL,
    id_mobil INT NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    total_biaya DECIMAL(10, 2) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //
DELIMITER ;
DELETE FROM transaksi WHERE id_transaksi = 6;
SELECT * FROM log_hapus_transaksi;
select * from transaksi;
drop database modul7;