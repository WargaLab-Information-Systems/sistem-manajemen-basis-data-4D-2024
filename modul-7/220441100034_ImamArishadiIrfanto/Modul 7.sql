CREATE DATABASE rental_mobil;
USE rental_mobil;
-- drop database rental_mobil;

CREATE TABLE mobil(
    id_mobil INT(11) PRIMARY KEY AUTO_INCREMENT,
    merk VARCHAR(50),
    model VARCHAR(50),
    tahun INT(11),
    warna VARCHAR(20),
    harga_sewa DECIMAL(10,2),
    STATUS ENUM('tersedia', 'disewa', 'dalam_perawatan')
);

INSERT INTO mobil (merk, model, tahun, warna, harga_sewa, STATUS) VALUES
('Nissan', 'Altima', 2023, 'Putih', 780000.00, 'tersedia'),
('Mazda', '6', 2022, 'Abu-abu', 760000.00, 'disewa'),
('Chevrolet', 'Malibu', 2021, 'Biru', 620000.00, 'dalam_perawatan'),
('Mercedes', 'C Class', 2020, 'Hitam', 820000.00, 'disewa'),
('Volkswagen', 'Passat', 2019, 'Merah', 670000.00, 'tersedia');

CREATE TABLE pelanggan(
    id_pelanggan INT(11) PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    alamat TEXT,
    no_telepon VARCHAR(15),
    email VARCHAR(50)
);

INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
('Andi', 'Jakarta, Indonesia', '021-1234-5678', 'andi@example.com'),
('Budi', 'Bandung, Indonesia', '022-8765-4321', 'budi@example.com'),
('Citra', 'Surabaya, Indonesia', '031-2345-6789', 'citra@example.com'),
('Dewi', 'Yogyakarta, Indonesia', '0274-9876-5432', 'dewi@example.com'),
('Eko', 'Medan, Indonesia', '061-1111-2222', 'eko@example.com');

CREATE TABLE pegawai(
    id_pegawai INT(11) PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    jabatan VARCHAR(100),
    no_telepon VARCHAR(15),
    email VARCHAR(50)
);

INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
('Rina', 'Manager', '021-8888-9999', 'rina@example.com'),
('Sigit', 'Staff', '0251-6666-7777', 'sigit@example.com'),
('Tina', 'Supervisor', '0341-1111-2222', 'tina@example.com'),
('Umar', 'Technician', '024-4444-5555', 'umar@example.com'),
('Vina', 'Receptionist', '0361-7777-8888', 'vina@example.com');

CREATE TABLE transaksi(
    id_transaksi INT(11) PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT(11),
    id_mobil INT(11),
    id_pegawai INT(11),
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    total_biaya DECIMAL(10,2),
    status_transaksi ENUM('pending', 'selesai', 'dibatalkan'),
    FOREIGN KEY(id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY(id_mobil) REFERENCES mobil(id_mobil),
    FOREIGN KEY(id_pegawai) REFERENCES pegawai(id_pegawai)
);

INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
(1, 1, 1, '2024-07-01', '2024-07-05', 3000000.00, 'selesai'),
(2, 2, 2, '2024-07-10', '2024-07-15', 3600000.00, 'pending'),
(3, 3, 3, '2024-07-20', '2024-07-25', 3000000.00, 'dibatalkan'),
(4, 4, 4, '2024-07-05', '2024-07-10', 4000000.00, 'selesai'),
(5, 5, 5, '2024-07-15', '2024-07-20', 3250000.00, 'pending');

CREATE TABLE pembayaran(
    id_pembayaran INT(11) PRIMARY KEY AUTO_INCREMENT,
    id_transaksi INT(11),
    tanggal_pembayaran DATE,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran VARCHAR(50),
    FOREIGN KEY(id_transaksi) REFERENCES transaksi(id_transaksi)
);

INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(1, '2024-07-05', 3000000.00, 'Kartu Kredit'),
(2, '2024-07-15', 3600000.00, 'Transfer Bank'),
(3, '2024-07-25', 3000000.00, 'Tunai'),
(4, '2024-07-10', 4000000.00, 'Kartu Debit'),
(5, '2024-07-20', 3250000.00, 'E-Wallet');

CREATE TABLE perawatan(
    id_perawatan INT(11) PRIMARY KEY AUTO_INCREMENT,
    id_mobil INT(11),
    tanggal DATE,
    deskripsi TEXT,
    biaya DECIMAL(10,2),
    FOREIGN KEY(id_mobil) REFERENCES mobil(id_mobil)
);

INSERT INTO perawatan (id_mobil, tanggal, deskripsi, biaya) VALUES
(1, '2024-06-01', 'Ganti oli dan filter', 175000.00),
(2, '2024-06-10', 'Servis rutin', 270000.00),
(3, '2024-06-20', 'Perbaikan AC', 320000.00),
(4, '2024-06-05', 'Penggantian ban', 450000.00),
(5, '2024-06-15', 'Cucidan detailing', 220000.00);

-- 1
DELIMITER //
CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi = 'selesai' THEN
        UPDATE mobil
        SET STATUS = 'tersedia'
        WHERE id_mobil = NEW.id_mobil;
    END IF;
END//
DELIMITER ;
UPDATE transaksi SET status_transaksi='Selesai' WHERE id_transaksi = 3;
SELECT * FROM mobil;
SELECT * FROM transaksi;

-- 2
CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_insert_pembayaran
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
    INSERT INTO log_pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
    VALUES (NEW.id_pembayaran, NEW.id_transaksi, NEW.tanggal_pembayaran, NEW.jumlah_pembayaran, NEW.metode_pembayaran);
END//
DELIMITER ;

INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
VALUES (4, '2024-06-05', 110000.00, 'Transfer Bank');
SELECT * FROM log_pembayaran;
SELECT * FROM pembayaran;

-- 3
DELIMITER //
CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE harga_per_hari DECIMAL(10, 2);
    DECLARE jumlah_hari INT;
    
    SELECT harga_sewa INTO harga_per_hari FROM mobil WHERE id_mobil = NEW.id_mobil;
    SET jumlah_hari = DATEDIFF(NEW.tanggal_selesai, NEW.tanggal_mulai);
    SET NEW.total_biaya = harga_per_hari * jumlah_hari;
END//
DELIMITER ;
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi)
VALUES (1, 3, 1, '2024-06-01', '2024-06-03', 'pending');
SELECT * FROM mobil;
SELECT * FROM transaksi;

-- 4
CREATE TABLE log_hapus_transaksi (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_pelanggan INT NOT NULL,
    id_mobil INT NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    total_biaya DECIMAL(10, 2) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END//
DELIMITER ;
DELETE id_transaksi FROM transaksi WHERE id_transaksi = 2;
delete FROM transaksi where id_transaksi = 6;
SELECT * FROM log_hapus_transaksi;
SELECT * FROM transaksi;