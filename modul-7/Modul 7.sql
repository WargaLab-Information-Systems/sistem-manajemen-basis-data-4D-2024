CREATE DATABASE rental_mobil;
USE rental_mobil;
DROP DATABASE rental_mobil;

CREATE TABLE pegawai(
	id_pegawai INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (50) NOT NULL,
	jabatan VARCHAR (50) NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);
DESC pegawai;

INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
('John Doe', 'Manajer Proyek', '08123456789', 'john.doe@example.com'),
('Jane Smith', 'Analis Sistem', '08567891234', 'jane.smith@example.com'),
('Michael Johnson', 'Programmer', '08901234567', 'michael.johnson@example.com'),
('Emily Davis', 'Desainer UI/UX', '08123456789', 'emily.davis@example.com'),
('David Wilson', 'Pengembang Web', '08567891234', 'david.wilson@example.com'),
('Sarah Brown', 'QA Engineer', '08901234567', 'sarah.brown@example.com'),
('Robert Miller', 'Manajer Proyek', '08123456789', 'robert.miller@example.com'),
('Jennifer Garcia', 'Analisis Data', '08567891234', 'jennifer.garcia@example.com'),
('Matthew Martinez', 'Administrator Jaringan', '08901234567', 'matthew.martinez@example.com'),
('Lisa Taylor', 'Pengembang Web', '08123456789', 'lisa.taylor@example.com');


SELECT * FROM pegawai;

CREATE TABLE pelanggan (
	id_pelanggan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (100) NOT NULL,
	alamat TEXT NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);
DESC pelanggan;

INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
		('Rina Putri', 'Jl. Merdeka No. 1, Jakarta', '081234567890', 'rina.putri@example.com'),
		('Arif Budiman', 'Jl. Sudirman No. 10, Bandung', '081234567891', 'arif.budiman@example.com'),
		('Lina Sutrisno', 'Jl. Diponegoro No. 20, Surabaya', '081234567892', 'lina.sutrisno@example.com'),
		('Budi Setiawan', 'Jl. Ahmad Yani No. 30, Yogyakarta', '081234567893', 'budi.setiawan@example.com'),
		('Citra Kusuma', 'Jl. Kartini No. 40, Semarang', '081234567894', 'citra.kusuma@example.com'),
		('Dewi Anggraini', 'Jl. Gatot Subroto No. 50, Medan', '081234567895', 'dewi.anggraini@example.com'),
		('Eko Prasetyo', 'Jl. Sudirman No. 60, Palembang', '081234567896', 'eko.prasetyo@example.com'),
		('Fajar Maulana', 'Jl. Thamrin No. 70, Malang', '081234567897', 'fajar.maulana@example.com'),
		('Gina Wijaya', 'Jl. Imam Bonjol No. 80, Makassar', '081234567898', 'gina.wijaya@example.com'),
		('Hari Santoso', 'Jl. Juanda No. 90, Bali', '081234567899', 'hari.santoso@example.com');
SELECT * FROM pelanggan;

CREATE TABLE mobil (
	id_mobil INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	merk VARCHAR (50) NOT NULL,
	model VARCHAR (50) NOT NULL,
	tahun INT (11) NOT NULL,
	warna VARCHAR (20) NOT NULL,
	harga_sewa DECIMAL (10,2) NOT NULL,
	STATUS ENUM ('Dipinjam','Tersedia')
);
DESC mobil;

INSERT INTO mobil (merk, model, tahun, warna, harga_sewa, STATUS) VALUES
('Toyota', 'Avanza', 2018, 'Hitam', 250000, 'Dipinjam'),
('Honda', 'CR-V', 2020, 'Putih', 350000, 'Tersedia'),
('Suzuki', 'Ertiga', 2019, 'Silver', 270000, 'Tersedia'),
('Mitsubishi', 'Xpander', 2019, 'Merah', 300000, 'Tersedia'),
('Nissan', 'Livina', 2017, 'Biru', 230000, 'Dipinjam'),
('Daihatsu', 'Terios', 2016, 'Abu-abu', 220000, 'Tersedia'),
('Mazda', 'CX-5', 2021, 'Hitam', 400000, 'Tersedia'),
('Ford', 'Ecosport', 2019, 'Merah', 280000, 'Dipinjam'),
('Chevrolet', 'Spin', 2015, 'Putih', 200000, 'Tersedia'),
('Hyundai', 'Creta', 2020, 'Biru', 370000, 'Tersedia');

CREATE TABLE perawatan (
	id_perawatan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_mobil INT (11)NOT NULL ,
	tanggal DATE NOT NULL,
	deskripsi TEXT NOT NULL ,
	biaya DECIMAL (10,2) NOT NULL,
	FOREIGN KEY (id_mobil)REFERENCES mobil(id_mobil)
);
DESC perawatan;

INSERT INTO perawatan (id_mobil, tanggal, deskripsi, biaya) VALUES
(1, '2024-05-15', 'Ganti Oli dan Filter', 300000),
(2, '2024-05-20', 'Pengecekan Mesin', 250000),
(3, '2024-05-25', 'Penggantian Kanvas Rem', 500000),
(4, '2024-05-10', 'Pengisian AC', 400000),
(5, '2024-05-18', 'Ganti Oli dan Tune Up', 350000),
(6, '2024-05-22', 'Pemeriksaan Ban', 200000),
(7, '2024-05-28', 'Penggantian Wiper', 150000),
(8, '2024-05-05', 'Ganti Oli dan Filter', 300000),
(9, '2024-05-08', 'Pengecekan Mesin', 250000),
(10, '2024-05-30', 'Penggantian Lampu', 200000);

SELECT * FROM perawatan;

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
DESC transaksi;

INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
(1, 1, 1, '2024-05-01', '2024-05-10', 2500000, 'Selesai'),
(2, 3, 2, '2024-05-03', '2024-05-08', 2000000, 'Selesai'),
(3, 5, 4, '2024-05-05', '2024-05-15', 3000000, 'Selesai'),
(4, 2, 6, '2024-05-07', '2024-05-12', 2700000, 'Selesai'),
(5, 4, 8, '2024-05-09', '2024-05-14', 2800000, 'Selesai'),
(6, 6, 10, '2024-05-12', '2024-05-20', 2400000, 'Selesai'),
(7, 8, 3, '2024-05-15', '2024-05-22', 2600000, 'Selesai'),
(8, 10, 5, '2024-05-17', '2024-05-25', 3200000, 'Selesai'),
(9, 9, 7, '2024-05-20', '2024-05-28', 2900000, 'Selesai'),
(10, 7, 9, '2024-05-25', '2024-06-01', 3100000, 'Selesai');

SELECT * FROM transaksi;

CREATE TABLE pembayaran (
	id_pembayaran INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	id_transaksi INT(11) NOT NULL,
	tanggal_pembayaran DATE NOT NULL,
	jumlah_pembayaran DECIMAL (10,2),
	metode_pembayaran VARCHAR (50),
	FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi)
);
DESC pembayaran;
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(1, '2024-05-10', 2500000, 'Transfer Bank'),
(2, '2024-05-08', 2000000, 'Tunai'),
(3, '2024-05-15', 3000000, 'Kartu Kredit'),
(4, '2024-05-12', 2700000, 'Transfer Bank'),
(5, '2024-05-14', 2800000, 'Tunai'),
(6, '2024-05-20', 2400000, 'Kartu Debit'),
(7, '2024-05-22', 2600000, 'Tunai'),
(8, '2024-05-25', 3200000, 'Transfer Bank'),
(9, '2024-05-28', 2900000, 'Kartu Kredit'),
(10, '2024-06-01', 3100000, 'Tunai');

SELECT * FROM pembayaran;

-- NOMOR1--
DELIMITER //
CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi = 'Selesai' THEN
        UPDATE mobil
        SET STATUS = 'Tersedia'
        WHERE id_mobil = NEW.id_mobil;
    END IF;
END //
DELIMITER ;
UPDATE transaksi SET status_transaksi='Selesai' WHERE id_transaksi = 1;
SELECT * FROM transaksi;
SELECT * FROM mobil;


-- NOMOR2-- 
CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESC log_pembayaran;
SELECT * FROM pembayaran;
SELECT * FROM transaksi;

DELIMITER //
CREATE TRIGGER after_insert_pembayaran
	AFTER INSERT 
	ON pembayaran
	FOR EACH ROW
BEGIN 
	-- select * from log_pembayaran
	INSERT INTO log_pembayaran (id_pembayaran,id_transaksi,tanggal_pembayaran,jumlah_pembayaran,metode_pembayaran)
	VALUES (new.id_pembayaran,new.id_transaksi,new.tanggal_pembayaran,new.jumlah_pembayaran,new.metode_pembayaran);
END //
DELIMITER ;
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES 
(10, '2024-05-24', 240000.00, 'Kartu Debit');
SELECT * FROM pembayaran;
SELECT * FROM log_pembayaran;


-- NOMOR3--
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
    WHERE id_mobil = new.id_mobil;

    -- Menghitung jumlah hari sewa
    SET jumlah_hari = DATEDIFF(new.tanggal_selesai, new.tanggal_mulai);

    -- Menghitung total biaya
    SET new.total_biaya = harga_per_hari * jumlah_hari;
END //
DELIMITER ;
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi) 
VALUES (10, 10, 7, '2024-05-25', '2024-05-28', 'Belum Selesai');
SELECT * FROM transaksi;

-- NOMOR4--
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
DESC log_hapus_transaksi;
SELECT * FROM log_hapus_transaksi;
DELIMITER //
CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //
DELIMITER ;
SELECT * FROM transaksi; 
DELETE FROM transaksi WHERE id_transaksi = 11;

-- cek apakah trigger berjalan 
SELECT * FROM log_hapus_transaksi;