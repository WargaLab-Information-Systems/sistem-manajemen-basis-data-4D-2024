CREATE DATABASE modul7;
USE modul7;
DROP DATABASE modul7;
CREATE TABLE mobil(
    id_mobil INT(11) PRIMARY KEY AUTO_INCREMENT,
    merk VARCHAR(50),
    model VARCHAR(50),
    tahun INT(11),
    warna VARCHAR(20),
    harga_sewa DECIMAL(10,2),
    STATUS ENUM('tersedia', 'disewa', 'dalam_perawatan')
);

INSERT INTO mobil (id_mobil, merk, model, tahun, warna, harga_sewa, STATUS) VALUES
(1, 'Nissan', 'Altima', 2021, 'Hitam', 650000.00, 'tersedia'),
(2, 'Chevrolet', 'Malibu', 2020, 'Putih', 700000.00, 'disewa'),
(3, 'Mazda', '3', 2019, 'Merah', 550000.00, 'dalam_perawatan'),
(4, 'Subaru', 'Impreza', 2018, 'Biru', 600000.00, 'disewa'),
(5, 'Volkswagen', 'Passat', 2017, 'Silver', 500000.00, 'tersedia');


CREATE TABLE pelanggan(
    id_pelanggan INT(11) PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    alamat TEXT,
    no_telepon VARCHAR(15),
    email VARCHAR(50)
);

INSERT INTO pelanggan (id_pelanggan, nama, alamat, no_telepon, email) VALUES
(1, 'Andi', 'Jakarta, Indonesia', '021-1234-5678', 'andi@example.com'),
(2, 'Budi', 'Bandung, Indonesia', '022-2345-6789', 'budi@example.com'),
(3, 'Citra', 'Surabaya, Indonesia', '031-3456-7890', 'citra@example.com'),
(4, 'Dewi', 'Yogyakarta, Indonesia', '0274-4567-8901', 'dewi@example.com'),
(5, 'Eko', 'Medan, Indonesia', '061-5678-9012', 'eko@example.com');

create table pegawai(
    id_pegawai int(11) primary key auto_increment,
    nama varchar(100),
    jabatan varchar(100),
    no_telepon varchar(15),
    email varchar(50)
);

INSERT INTO pegawai (id_pegawai, nama, jabatan, no_telepon, email) VALUES
(1, 'Ahmad', 'Manager', '021-6789-0123', 'ahmad@example.com'),
(2, 'Benny', 'Staff', '022-7890-1234', 'benny@example.com'),
(3, 'Cindy', 'Supervisor', '031-8901-2345', 'cindy@example.com'),
(4, 'David', 'Technician', '061-9012-3456', 'david@example.com'),
(5, 'Eva', 'Receptionist', '0274-0123-4567', 'eva@example.com');

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

INSERT INTO transaksi (id_transaksi, id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
(1, 1, 1, 1, '2024-06-01', '2024-06-05', 2500000.00, 'selesai'),
(2, 2, 2, 2, '2024-06-10', '2024-06-15', 3500000.00, 'pending'),
(3, 3, 3, 3, '2024-06-20', '2024-06-25', 4000000.00, 'dibatalkan'),
(4, 4, 4, 4, '2024-06-05', '2024-06-10', 3000000.00, 'selesai'),
(5, 5, 5, 5, '2024-06-15', '2024-06-20', 2750000.00, 'pending');


create table pembayaran(
    id_pembayaran int(11) primary key auto_increment,
    id_transaksi int(100),
    tanggal_pembayaran date,
    jumlah_pembayaran decimal(10,2),
    metode_pembayaran varchar(50),
    foreign key(id_transaksi) references transaksi(id_transaksi)
);

INSERT INTO pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(1, 1, '2024-06-05', 2500000.00, 'Kartu Kredit'),
(2, 2, '2024-06-15', 3500000.00, 'Transfer Bank'),
(3, 3, '2024-06-25', 4000000.00, 'Tunai'),
(4, 4, '2024-06-10', 3000000.00, 'Kartu Debit'),
(5, 5, '2024-06-20', 2750000.00, 'E-Wallet');


create table perawatan(
	id_perawatan int(11) primary key auto_increment,
    id_mobil int(11),
    tanggal date,
    deskripsi text,
    biaya decimal(10,2),
    foreign key(id_mobil) references mobil(id_mobil)
);

INSERT INTO perawatan (id_perawatan, id_mobil, tanggal, deskripsi, biaya) VALUES
(1, 1, '2024-05-01', 'Ganti oli dan filter', 150000.00),
(2, 2, '2024-05-10', 'Servis rutin', 250000.00),
(3, 3, '2024-05-20', 'Perbaikan AC', 300000.00),
(4, 4, '2024-05-05', 'Penggantian ban', 400000.00),
(5, 5, '2024-05-15', 'Cuci dan detailing', 200000.00);


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

UPDATE transaksi SET status_transaksi = 'selesai';
select * from mobil;
select * from transaksi;


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