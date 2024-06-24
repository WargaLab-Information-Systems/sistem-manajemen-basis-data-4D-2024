CREATE DATABASE  rentalmobil;
USE rentalmobil;
-- drop database modul7R2

CREATE TABLE mobil (
id_mobil INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
merk VARCHAR (50) NOT NULL,
model VARCHAR (50) NOT NULL,
tahun INT (11) NOT NULL,
warna VARCHAR (20) NOT NULL,
harga_sewa DECIMAL (10,2) NOT NULL,
STATUS ENUM ('Dipinjam','Tersedia')
);

CREATE TABLE perawatan (
id_perawatan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_mobil INT (11)NOT NULL ,
tanggal DATE NOT NULL,
deskripsi TEXT NOT NULL ,
biaya DECIMAL (10,2) NOT NULL,
FOREIGN KEY (id_mobil)REFERENCES mobil(id_mobil)
);

CREATE TABLE pelanggan (
id_pelanggan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
nama VARCHAR (100) NOT NULL,
alamat TEXT NOT NULL,
no_telepon VARCHAR (15)NOT NULL,
email VARCHAR (50) NOT NULL 
);

CREATE TABLE pegawai(
id_pegawai INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
nama VARCHAR (50) NOT NULL,
jabatan VARCHAR (50) NOT NULL,
no_telepon VARCHAR (15)NOT NULL,
email VARCHAR (50) NOT NULL 
);



CREATE TABLE transaksi (
id_transaksi INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_pelanggan INT (11) NOT NULL,
id_mobil INT (11) NOT NULL,
id_pegawai INT (11) NOT NULL,
tanggal_mulai DATE NOT NULL,
tanggal_Selesai DATE NOT NULL,
total_biaya DECIMAL (10,2) NOT NULL,
status_transaksi ENUM ('Belum Selesai','Selesai') NOT NULL,
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);

CREATE TABLE pembayaran (
id_pembayaran INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_transaksi INT(11) NOT NULL,
tanggal_pembayaran DATE NOT NULL,
jumlah_pembayaran DECIMAL (10,2),
metode_pembayaran VARCHAR (50),
FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi)
);

INSERT INTO mobil (merk, model, tahun, warna, harga_sewa, STATUS) VALUES
('Toyota', 'Avanza', 2012, 'Hitam', 250000, 'Dipinjam'), -- b
('Honda', 'Civic', 2015, 'Putih', 350000, 'Tersedia'),
('Suzuki', 'Ertiga', 2016, 'Merah', 270000, 'Dipinjam'),-- b
('Mitsubishi', 'Pajero', 2017, 'Abu-Abu', 450000, 'Tersedia'),
('Nissan', 'Juke', 2013, 'Hitam', 300000, 'Dipinjam'),-- b
('Daihatsu', 'Xenia', 2014, 'Putih', 240000, 'Tersedia'),
('Kia', 'Rio', 2018, 'Merah', 320000, 'Dipinjam'),-- b
('Hyundai', 'Tucson', 2016, 'Biru', 400000, 'Tersedia'),
('Mazda', 'CX-5', 2015, 'Silver', 380000, 'Dipinjam'),-- b
('Chevrolet', 'Trax', 2017, 'Hitam', 360000, 'Tersedia');

SELECT * FROM mobil;

INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
('Budi Santoso', 'Jl. Melati No. 12, Jakarta', '081234567890', 'budi.santoso@gmail.com'),
('Andi Wijaya', 'Jl. Kenanga No. 8, Jakarta', '081234567891', 'andi.wijaya@gmail.com'),
('Siti Aminah', 'Jl. Mawar No. 3, Jakarta', '081234567892', 'siti.aminah@gmail.com'),
('Rina Kurniawati', 'Jl. Anggrek No. 5, Jakarta', '081234567893', 'rina.kurniawati@gmail.com'),
('Dewi Lestari', 'Jl. Dahlia No. 10, Jakarta', '081234567894', 'dewi.lestari@gmail.com'),
('Ali Syahbana', 'Jl. Tulip No. 15, Jakarta', '081234567895', 'ali.syahbana@gmail.com'),
('Eka Prasetya', 'Jl. Kamboja No. 7, Jakarta', '081234567896', 'eka.prasetya@gmail.com'),
('Ratna Sari', 'Jl. Seroja No. 9, Jakarta', '081234567897', 'ratna.sari@gmail.com'),
('Dani Setiawan', 'Jl. Anyelir No. 4, Jakarta', '081234567898', 'dani.setiawan@gmail.com'),
('Fajar Nugroho', 'Jl. Melur No. 6, Jakarta', '081234567899', 'fajar.nugroho@gmail.com');
SELECT * FROM pelanggan;

INSERT INTO perawatan (id_mobil, tanggal, deskripsi, biaya) VALUES
(1, '2023-01-15', 'Ganti oli dan filter', 150000.00),
(2, '2023-02-20', 'Servis rutin', 250000.00),
(3, '2023-03-18', 'Ganti rem dan aki', 500000.00),
(4, '2023-04-22', 'Ganti ban', 1000000.00),
(5, '2023-05-10', 'Perbaikan mesin', 2000000.00),
(6, '2023-06-11', 'Servis besar', 1500000.00),
(7, '2023-07-25', 'Ganti oli', 120000.00),
(8, '2023-08-14', 'Perbaikan AC', 400000.00),
(9, '2023-09-17', 'Servis rutin', 250000.00),
(10, '2023-10-29', 'Ganti lampu', 150000.00);

SELECT * FROM perawatan;

INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
('Doni Prasetyo', 'Manager', '081234567891', 'doni@gmail.com'),
('Rina Saputri', 'Admin', '082345678912', 'rina.saputri@gmail.com'),
('Arman Sudrajat', 'Mekanik', '083456789123', 'arman@gmail.com'),
('Susi Handayani', 'Customer Service', '084567891234', 'susi@gmail.com'),
('Budi Haryanto', 'Driver', '085678912345', 'budi.h@gmail.com'),
('Eka Wulandari', 'Marketing', '086789123456', 'eka@gmail.com'),
('Firman Santoso', 'IT Support', '087891234567', 'firman@gmail.com'),
('Lina Marlina', 'HRD', '088912345678', 'lina@gmail.com'),
('Dewi Anggraini', 'Kasir', '089123456789', 'dewi@gmail.com'),
('Anto Wijaya', 'Kasir', '081234567892', 'anto@gmail.com');

INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
(1, 1, 9, '2024-05-23', '2024-05-25', 500000.00, 'Belum Selesai'),
(2, 2, 9, '2024-05-23', '2024-05-24', 350000.00, 'Selesai'),
(3, 3, 9, '2024-05-23', '2024-05-25', 540000.00, 'Belum Selesai'),
(4, 4, 9, '2024-05-23', '2024-05-24', 450000.00, 'Selesai'),
(5, 5, 9, '2024-05-23', '2024-05-25', 600000.00, 'Belum Selesai'),
(6, 6, 10,'2024-05-23', '2024-05-24', 240000.00, 'Selesai'),
(7, 7, 10,'2024-05-23', '2024-05-25', 640000.00, 'Belum Selesai'),
(8, 8, 10,'2024-05-23', '2024-05-24', 400000.00, 'Selesai'),
(9, 9, 10,'2024-05-23', '2024-05-25', 760000.00, 'Belum Selesai'),
(10,10,10,'2024-05-23', '2024-05-24', 360000.00, 'Selesai');
SELECT * FROM transaksi;
SELECT * FROM transaksi;
-- truncate transaksi
-- drop table pembayaran

INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(1, '2024-05-25', 500000.00, 'Transfer Bank'),
(2, '2024-05-24', 350000.00, 'Tunai'),
(3, '2024-05-25', 540000.00, 'QRis'),
(4, '2024-05-24', 450000.00, 'Transfer Bank'),
(5, '2024-05-25', 600000.00, 'Tunai'),
(6, '2024-05-24', 240000.00, 'QRis'),
(7, '2024-05-25', 640000.00, 'Transfer Bank'),
(8, '2024-05-24', 400000.00, 'Tunai'),
(9, '2024-05-25', 760000.00, 'QRis');
-- (10, '2024-05-24', 360000.00, 'Transfer Bank');
SELECT * FROM pembayaran;

-- jawaban soal 1
DELIMITER //

CREATE OR REPLACE TRIGGER after_update_transaksi
	AFTER UPDATE 
	ON transaksi
	FOR EACH ROW
BEGIN
	IF new.status_transaksi = 'Selesai' THEN
		UPDATE mobil SET STATUS='Tersedia' WHERE id_mobil=new.id_mobil;
	END IF;
END //

DELIMITER ;


UPDATE transaksi SET status_transaksi='Selesai' WHERE id_transaksi = 1;

-- cek 
SELECT * FROM transaksi;
SELECT * FROM mobil;

-- soal nomor 2
-- kita bikin tabel log_pembayaran
CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
-- cek dulu isi tabel 
SELECT * FROM pembayaran;
SELECT * FROM transaksi;

-- kita buat triggernya

DELIMITER //

CREATE OR REPLACE TRIGGER after_insert_pembayaran
	AFTER INSERT 
	ON pembayaran
	FOR EACH ROW
BEGIN 
	-- select * from log_pembayaran
	INSERT INTO log_pembayaran (id_pembayaran,id_transaksi,tanggal_pembayaran,jumlah_pembayaran,metode_pembayaran)
	VALUES (new.id_pembayaran,new.id_transaksi,new.tanggal_pembayaran,new.jumlah_pembayaran,new.metode_pembayaran);

END //

DELIMITER ;

-- trigger sudah dibuat saatnya ujji coba dengan memasukkan data baru ke tabel pembayaran
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES 
(10, '2024-05-24', 360000.00, 'Transfer Bank');

-- melihat hasil insert dan insert yang dilakukan rigger
-- truncate pembayaran
-- truncate log_pembayaran
SELECT * FROM pembayaran;
SELECT * FROM log_pembayaran;

-- soal 3
DELIMITER //

CREATE OR REPLACE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE harga_per_hari DECIMAL(10, 2);
    DECLARE jumlah_hari INT;

    -- Mendapatkan harga sewa per hari dari tabel mobil
    SELECT harga_sewa INTO harga_per_hari
    FROM mobil
    WHERE id_mobil = new.id_mobil;

    -- Menghitung jumlah hari sewa
    SET jumlah_hari = DATEDIFF(new.tanggal_selesai, new.tanggal_mulai);

    -- Menghitung total biaya
    SET new.total_biaya = harga_per_hari * jumlah_hari;
END //

DELIMITER ;

-- test trigger dengan menginputkan 1 data
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi) 
VALUES (2, 2, 9, '2024-05-25', '2024-05-28', 'Belum Selesai');

-- cek 
SELECT * FROM transaksi;

-- soal4
-- bikin tb log hapus
CREATE TABLE log_hapus_transaksi (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_pelanggan INT NOT NULL,
    id_mobil INT NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    total_biaya DECIMAL(10, 2) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);
-- cek tb log
SELECT * FROM log_hapus_transaksi;

-- buat trigger 
DELIMITER //

CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //

DELIMITER ;

-- cek tb transaksi id mana yang mau dihapus

SELECT * FROM transaksi; -- dapat id 11

-- hapus data tranksasi id 11
DELETE FROM transaksi WHERE id_transaksi = 1;

-- cek apakah trigger berjalan 
SELECT * FROM log_hapus_transaksi;



-- revisian eror
-- step 1
ALTER TABLE pembayaran
DROP FOREIGN KEY pembayaran_ibfk_1;

ALTER TABLE pembayaran
ADD CONSTRAINT pembayaran_ibfk_1 FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi) ON DELETE CASCADE;


DELETE FROM transaksi WHERE id_transaksi = 1;


SELECT * FROM pembayaran;