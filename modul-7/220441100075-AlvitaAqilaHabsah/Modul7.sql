CREATE DATABASE sewamobil ;
USE sewamobil;
DROP DATABASE sewamobil;

CREATE TABLE pelanggan (
	id_pelanggan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (100) NOT NULL,
	alamat TEXT NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL);

CREATE TABLE pegawai (
    id_pegawai INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nama VARCHAR(100) NOT NULL,
    jabatan VARCHAR(50) NOT NULL,
    no_telepon VARCHAR(15) NOT NULL,
    email VARCHAR(50)NOT NULL);

CREATE TABLE mobil (
	id_mobil INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	merk VARCHAR (50) NOT NULL,
	model VARCHAR (50) NOT NULL,
	tahun INT (11) NOT NULL,
	warna VARCHAR (20) NOT NULL,
	harga_sewa DECIMAL (10,2) NOT NULL,
	STATUS ENUM ('Disewa','Tersedia'));

CREATE TABLE perawatan (
	id_perawatan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_mobil INT (11)NOT NULL ,
	tanggal DATE NOT NULL,
	deskripsi TEXT NOT NULL ,
	biaya DECIMAL (10,2) NOT NULL,
	FOREIGN KEY (id_mobil)REFERENCES mobil(id_mobil));

CREATE TABLE transaksi (
	id_transaksi INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_pelanggan INT (11) NOT NULL,
	id_mobil INT (11) NOT NULL,
	id_pegawai INT (11) NOT NULL,
	tanggal_mulai DATE NOT NULL,
	tanggal_Selesai DATE NOT NULL,
	total_biaya DECIMAL (10,2) NOT NULL,
	status_transaksi ENUM ('Proses','Selesai') NOT NULL,
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
	FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
	FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai));

CREATE TABLE pembayaran (
	id_pembayaran INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_transaksi INT(11) NOT NULL,
	tanggal_pembayaran DATE NOT NULL,
	jumlah_pembayaran DECIMAL (10,2),
	metode_pembayaran VARCHAR (50),
	FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi));
	
INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
('Andi Pratama', 'Jl. Kenanga No. 5', '08123456789', 'andi.pratama@example.com'),
('Siti Aisyah', 'Jl. Mawar No. 12', '08129876543', 'siti.aisyah@example.com'),
('Budi Santoso', 'Jl. Melati No. 3', '081277889900', 'budi.santoso@example.com'),
('Dewi Lestari', 'Jl. Anggrek No. 20', '081322334455', 'dewilestari@example.com'),
('Rina Setiawan', 'Jl. Bougenville No. 8', '081344556677', 'rina.setiawan@example.com'),
('Dewi Sartika', 'Jl. Juanda No. 8', '08137890123', 'dewisartika@example.com'),
('Eka Putra', 'Jl. Hasanuddin No. 9', '08138901234', 'ekaputra@example.com');

INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
('Agus Hariyanto', 'Manager', '08111222333', 'agus.hari@example.com'),
('Ratna Wijaya', 'Staf', '08133445566', 'ratna.wijaya@example.com'),
('Dian Kusuma', 'Admin', '081355667788', 'diankusum@example.com'),
('Eko Purwanto', 'Teknisi', '081377889900', 'ekopurwanto@example.com'),
('Lina Juwita', 'Staf', '081399001122', 'linajuwita@example.com');

INSERT INTO mobil (merk, model, tahun, warna, harga_sewa, STATUS) VALUES
('Toyota', 'Avanza', 2020, 'Hitam', 350000, 'Tersedia'),
('Honda', 'Civic', 2021, 'Putih', 450000, 'Disewa'),
('Suzuki', 'Ertiga', 2019, 'Merah', 400000, 'Tersedia'),
('Daihatsu', 'Xenia', 2018, 'Biru', 250000, 'Tersedia'),
('Nissan', 'Livina', 2021, 'Biru', 400000, 'Disewa'),
('Mitsubishi', 'Xpander', 2022, 'Hitam', 450000, 'Tersedia'),
('Wuling', 'Almaz', 2020, 'Putih', 350000, 'Tersedia');

INSERT INTO perawatan (id_perawatan, id_mobil, tanggal, deskripsi, biaya) VALUES
(1, 2, '2023-07-05', 'Ganti oli', 150000),
(2, 5, '2023-07-17', 'Servis rutin', 300000),
(3, 1, '2023-08-19', 'Ganti ban', 200000),
(4, 3, '2023-08-23', 'Cek rem', 180000),
(5, 6, '2023-09-08', 'Tune up', 250000),
(6, 4, '2023-10-15', 'Ganti aki', 250000),
(7, 5, '2023-10-26', 'Cuci mesin', 100000);

INSERT INTO transaksi ( id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
(1, 3, 2, '2023-06-04', '2023-06-05', 400000, 'Selesai'),
(2, 6, 1, '2023-06-10', '2023-06-14', 1800000, 'Selesai'),
(3, 1, 3, '2023-06-15', '2023-06-17', 700000, 'Selesai'),
(4, 7, 2, '2023-06-21', '2023-06-23', 700000, 'Selesai'),
(5, 4, 1, '2023-06-25', '2023-06-30', 1250000, 'Selesai'),
(6, 2, 4, '2023-07-03', '2023-06-07', 1800000, 'Proses'),
(7, 5, 5, '2023-07-04', '2023-07-07', 1200000, 'Proses');

INSERT INTO pembayaran ( id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(1, '2023-06-04', 400000, 'cash'),
(2, '2023-06-14', 1800000, 'Transfer Bank'),
(3, '2023-06-15', 700000, 'cash'),
(4, '2023-06-23', 700000, 'Kartu Debit'),
(5, '2023-06-25', 1250000, 'cash'),
(6, '2023-06-27', 1800000, 'Kartu Kredit');
-- (7, '2023-07-09', 1200000, 'Transfer Bank');

SELECT * FROM pelanggan;
SELECT * FROM pegawai;
SELECT * FROM mobil;
SELECT * FROM perawatan;
SELECT * FROM transaksi;
SELECT * FROM pembayaran;
DROP TABLE transaksi

DELIMITER //
CREATE TRIGGER after_update_transaksi AFTER UPDATE ON transaksi
FOR EACH ROW -- Menentukan bahwa trigger ini akan dieksekusi untuk setiap baris
BEGIN
    IF NEW.status_transaksi = 'Selesai' THEN
        UPDATE mobil SET STATUS = 'Tersedia' WHERE id_mobil = NEW.id_mobil;
    END IF;
END//
DELIMITER ;
UPDATE transaksi SET status_transaksi='Selesai' WHERE id_transaksi = 6;
SELECT * FROM transaksi;
SELECT * FROM mobil;

CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

DELIMITER //
CREATE TRIGGER after_insert_pembayaran AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN 
    INSERT INTO log_pembayaran (id_pembayaran,id_transaksi,tanggal_pembayaran,jumlah_pembayaran,metode_pembayaran)
    VALUES (new.id_pembayaran,new.id_transaksi,new.tanggal_pembayaran,new.jumlah_pembayaran,new.metode_pembayaran);
END //
DELIMITER ;
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES 
(7, '2023-07-09', 1200000, 'Transfer Bank');
SELECT * FROM pembayaran;
SELECT * FROM log_pembayaran;

DELIMITER //
CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE harga DECIMAL(10,2);
    DECLARE jumlah_hari INT;

    -- Mengambil harga sewa per hari dari tabel mobil
    SELECT harga_sewa INTO harga FROM mobil WHERE id_mobil = NEW.id_mobil;
    -- Menghitung jumlah hari sewa
    SET jumlah_hari = DATEDIFF(NEW.tanggal_selesai, NEW.tanggal_mulai);
    -- Menghitung total biaya sewa
    SET NEW.total_biaya = harga * jumlah_hari;
END //
DELIMITER ;
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi) VALUES 
(7, 3, 5, '2023-07-08', '2023-07-10', 'Proses');
SELECT * FROM transaksi;

CREATE TABLE log_hapus_transaksi (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_pelanggan INT NOT NULL,
    id_mobil INT NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    total_biaya DECIMAL(10, 2) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

DELIMITER //
CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi 
FOR EACH ROW -- Menentukan bahwa trigger ini akan dieksekusi untuk setiap baris
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //
DELIMITER ;
SELECT * FROM transaksi; 
DELETE FROM transaksi WHERE id_transaksi = 8;
SELECT * FROM log_hapus_transaksi; 
