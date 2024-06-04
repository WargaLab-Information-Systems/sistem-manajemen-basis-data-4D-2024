CREATE DATABASE  db_modul7;
USE db_modul7;

CREATE TABLE mobil (
	id_mobil INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	merk VARCHAR (50) NOT NULL,
	model VARCHAR (50) NOT NULL,
	tahun INT (11) NOT NULL,
	warna VARCHAR (20) NOT NULL,
	harga_sewa DECIMAL (10,2) NOT NULL,
	STATUS ENUM ('Dipinjam','Tersedia')
);
INSERT INTO mobil (merk, model, tahun, warna, harga_sewa, STATUS) VALUES
	('Ford', 'Ranger', 2019, 'Hitam', 520000, 'Tersedia'),
	('Jeep', 'Wrangler', 2020, 'Hijau', 600000, 'Dipinjam'), 
	('Subaru', 'Forester', 2018, 'Biru', 480000, 'Tersedia'),
	('Volkswagen', 'Tiguan', 2017, 'Putih', 460000, 'Dipinjam'), 
	('Peugeot', '3008', 2019, 'Merah', 500000, 'Tersedia'),
	('Renault', 'Koleos', 2018, 'Abu-Abu', 490000, 'Dipinjam'),
	('BMW', 'X5', 2020, 'Hitam', 700000, 'Tersedia'),
	('Audi', 'Q7', 2019, 'Silver', 680000, 'Dipinjam'), 
	('Mercedes-Benz', 'GLC', 2018, 'Putih', 650000, 'Tersedia'),
	('Lexus', 'RX', 2017, 'Biru', 620000, 'Dipinjam');
SELECT * FROM mobil;


CREATE TABLE perawatan (
	id_perawatan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_mobil INT (11)NOT NULL ,
	tanggal DATE NOT NULL,
	deskripsi TEXT NOT NULL ,
	biaya DECIMAL (10,2) NOT NULL,
	FOREIGN KEY (id_mobil)REFERENCES mobil(id_mobil)
);
INSERT INTO perawatan (id_mobil, tanggal, deskripsi, biaya) VALUES
	(1, '2024-01-12', 'Ganti aki', 350000.00),
	(2, '2024-02-18', 'Perbaikan power steering', 600000.00),
	(3, '2024-03-24', 'Ganti filter udara', 180000.00),
	(4, '2024-04-02', 'Perbaikan sistem kelistrikan', 750000.00),
	(5, '2024-05-16', 'Kalibrasi sensor', 200000.00),
	(6, '2024-05-21', 'Ganti kampas kopling', 400000.00),
	(7, '2024-04-25', 'Pengecekan emisi', 220000.00),
	(8, '2024-03-10', 'Perbaikan sistem injeksi', 900000.00),
	(9, '2024-02-05', 'Ganti wiper', 120000.00),
	(10, '2024-01-30', 'Servis karburator', 500000.00);
SELECT * FROM perawatan;


CREATE TABLE pelanggan (
	id_pelanggan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (100) NOT NULL,
	alamat TEXT NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);
INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
	('Nadia Permata', 'Jl. Cempaka No. 1, Jakarta', '081234567800', 'nadia.permata@gmail.com'),
	('Reza Ananda', 'Jl. Flamboyan No. 2, Jakarta', '081234567801', 'reza.ananda@gmail.com'),
	('Alya Khairunnisa', 'Jl. Teratai No. 3, Jakarta', '081234567802', 'alya.khairunnisa@gmail.com'),
	('Rian Pratama', 'Jl. Bougenville No. 4, Jakarta', '081234567803', 'rian.pratama@gmail.com'),
	('Dina Maharani', 'Jl. Alamanda No. 5, Jakarta', '081234567804', 'dina.maharani@gmail.com'),
	('Fikri Setiawan', 'Jl. Asoka No. 6, Jakarta', '081234567805', 'fikri.setiawan@gmail.com'),
	('Maya Salsabila', 'Jl. Bakung No. 7, Jakarta', '081234567806', 'maya.salsabila@gmail.com'),
	('Kevin Ramadhan', 'Jl. Camelia No. 8, Jakarta', '081234567807', 'kevin.ramadhan@gmail.com'),
	('Tiara Putri', 'Jl. Dahlia No. 9, Jakarta', '081234567808', 'tiara.putri@gmail.com'),
	('Rizky Febriansyah', 'Jl. Eboni No. 10, Jakarta', '081234567809', 'rizky.febriansyah@gmail.com');
SELECT * FROM pelanggan;


CREATE TABLE pegawai(
	id_pegawai INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (50) NOT NULL,
	jabatan VARCHAR (50) NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);
INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
	('Rizki', 'Manager', '081234567890', 'rizki@gmail.com'),
	('Maya', 'Admin', '082345678901', 'maya@gmail.com'),
	('Fajar', 'Mekanik', '083456789012', 'fajar@gmail.com'),
	('Vina', 'Customer Service', '084567890123', 'vina@gmail.com'),
	('Adit', 'Driver', '085678901234', 'adit@gmail.com'),
	('Santi', 'Marketing', '086789012345', 'santi@gmail.com'),
	('Yudi', 'IT Support', '087890123456', 'yudi@gmail.com'),
	('Rini', 'HRD', '088901234567', 'rini@gmail.com'),
	('Lutfi', 'Kasir', '089012345678', 'lutfi@gmail.com'),
	('Alya', 'Kasir', '081234567893', 'alya@gmail.com');
SELECT * FROM pegawai;


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



CREATE TABLE pembayaran (
	id_pembayaran INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_transaksi INT(11) NOT NULL,
	tanggal_pembayaran DATE NOT NULL,
	jumlah_pembayaran DECIMAL (10,2),
	metode_pembayaran VARCHAR (50),
	FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi)
);
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
-- 	(10, '2024-05-24', 360000.00, 'Transfer Bank')
SELECT * FROM pembayaran;

-- SOAL
-- NOMOR 1
DELIMITER //
CREATE TRIGGER after_update_transaksi
	AFTER UPDATE 
	ON transaksi
	FOR EACH ROW
BEGIN
	IF new.status_transaksi = 'Selesai' THEN
		UPDATE mobil SET STATUS = 'Tersedia' WHERE id_mobil=new.id_mobil;
	END IF;
END //
DELIMITER ;

UPDATE transaksi SET status_transaksi='Selesai' WHERE id_transaksi = 7;
-- cek 
SELECT * FROM transaksi;
SELECT * FROM mobil;



-- NOMOR 2
CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
SELECT * FROM pembayaran;
SELECT * FROM transaksi;

-- membuat triggernya
DELIMITER //
CREATE TRIGGER after_insert_pembayaran
	AFTER INSERT 
	ON pembayaran
	FOR EACH ROW
BEGIN 
	INSERT INTO log_pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
	VALUES (new.id_pembayaran, new.id_transaksi, new.tanggal_pembayaran, new.jumlah_pembayaran, new.metode_pembayaran);

END //
DELIMITER ;

-- try data baru
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES 
(07, '2024-05-25', 350000.00, 'Tunai');
SELECT * FROM pembayaran;
SELECT * FROM log_pembayaran;
SET SQL_SAFE_UPDATES = 0;

DELIMITER //

CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE harga_per_hari DECIMAL(10, 2);
    DECLARE jumlah_hari INT;

    -- Mendapatkan harga sewa per hari dari tabel mobil
    SELECT harga_sewa INTO harga_per_hari
    FROM mobil
    WHERE id_mobil = NEW.id_mobil;

    -- Menghitung jumlah hari sewa
    SET jumlah_hari = DATEDIFF(NEW.tanggal_selesai, NEW.tanggal_mulai);

    -- Menghitung total biaya
    SET NEW.total_biaya = harga_per_hari * jumlah_hari;
END //
DELIMITER ;



-- menginputkan 1 data
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi) 
VALUES (3, 3, 9, '2024-05-23', '2024-05-25', 'Selesai');
SELECT * FROM transaksi;
DROP TRIGGER before_insert_transaksi;


-- NOMOR 4
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
SELECT * FROM log_hapus_transaksi;

DELIMITER //
CREATE TRIGGER before_delete_transaksi
BEFORE DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //
DELIMITER ;

-- cek tb transaksi id mana yang mau dihapus
SELECT * FROM transaksi;

-- hapus data tranksasi id 5
DELETE FROM pembayaran WHERE id_transaksi = 12;
DELETE FROM transaksi WHERE id_transaksi = 12;

-- cek apakah trigger berjalan 
SELECT * FROM log_hapus_transaksi;
