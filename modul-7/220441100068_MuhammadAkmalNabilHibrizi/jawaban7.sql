CREATE DATABASE db_renMobil;
USE db_renMobil;
DROP DATABASE db_renMobil;

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
	('Toyota', 'Avanza', 2021, 'Putih', 500000.00, 'Dipinjam'),
	('Honda', 'Civic', 2020, 'Hitam', 750000.00, 'Dipinjam'),
	('Suzuki', 'Ertiga', 2019, 'Merah', 600000.00, 'Tersedia'),
	('Mitsubishi', 'Xpander', 2022, 'Abu-abu', 700000.00, 'Tersedia'),
	('Daihatsu', 'Terios', 2021, 'Biru', 550000.00, 'Dipinjam'),
    ('Nissan', 'Grand Livina', 2020, 'Silver', 650000.00, 'Tersedia'),
	('Honda', 'HR-V', 2019, 'Putih', 800000.00, 'Dipinjam'),
	('Toyota', 'Innova', 2022, 'Hitam', 900000.00, 'Tersedia'),
	('Suzuki', 'XL7', 2021, 'Biru', 700000.00, 'Tersedia'),
	('Mitsubishi', 'Pajero Sport', 2020, 'Coklat', 1200000.00, 'Dipinjam');
    UPDATE mobil SET STATUS ='Dipinjam' WHERE id_mobil = 1;
    
CREATE TABLE pelanggan (
	id_pelanggan INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (100) NOT NULL,
	alamat TEXT NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);

INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
	('Ahmad Fauzi', 'Jl. Merdeka No. 45, Jakarta', '081234567890', 'ahmad.fauzi@gmail.com'),
	('Budi Hartono', 'Jl. Sudirman No. 10, Bandung', '081298765432', 'budi.hartono@gmail.com'),
	('Citra Lestari', 'Jl. Diponegoro No. 20, Surabaya', '081212345678', 'citra.lestari@gmail.com'),
	('Dewi Sartika', 'Jl. Gatot Subroto No. 15, Medan', '081276543210', 'dewi.sartika@gmail.com'),
	('Eko Prasetyo', 'Jl. Thamrin No. 5, Yogyakarta', '081234098765', 'eko.prasetyo@gmail.com'),
    ('Fani Rahayu', 'Jl. Dipatiukur No. 30, Bandung', '081234567891', 'fani.rahayu@gmail.com'),
	('Guntur Widodo', 'Jl. Ahmad Yani No. 25, Surabaya', '081298765433', 'guntur.widodo@gmail.com'),
	('Hani Susanti', 'Jl. Raden Saleh No. 35, Jakarta', '081212345679', 'hani.susanti@gmail.com'),
	('Indra Kusuma', 'Jl. Pahlawan No. 40, Semarang', '081276543211', 'indra.kusuma@gmail.com'),
	('Joko Purnomo', 'Jl. A. Yani No. 50, Malang', '081234098766', 'joko.purnomo@gmail.com');
    
CREATE TABLE pegawai(
	id_pegawai INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (50) NOT NULL,
	jabatan VARCHAR (50) NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);

INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
	('Andi Wijaya', 'Manager', '081234567890', 'andi.wijaya@gmail.com'),
	('Budi Santoso', 'Supervisor', '081298765432', 'budi.santoso@gmail.com'),
	('Citra Dewi', 'Staff', '081212345678', 'citra.dewi@gmail.com'),
	('Dedi Supriyadi', 'Clerk', '081276543210', 'dedi.supriyadi@gmail.com'),
	('Eka Putri', 'Administrator', '081234098765', 'eka.putri@gmail.com'),
	('Fajar Rahman', 'Manager', '081234567891', 'fajar.rahman@gmail.com'),
	('Gita Permata', 'Supervisor', '081298765433', 'gita.permata@gmail.com'),
	('Hari Santosa', 'Staff', '081212345679', 'hari.santosa@gmail.com'),
	('Indra Wijaya', 'Clerk', '081276543211', 'indra.wijaya@gmail.com'),
	('Joko Susilo', 'Administrator', '081234098766', 'joko.susilo@gmail.com');
    
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
	(1, 1, 1, '2024-05-10', '2024-05-13', 1500000.00, 'Selesai'),
	(2, 2, 2, '2024-05-11', '2024-05-15', 3000000.00, 'Belum Selesai'),
	(3, 3, 3, '2024-05-12', '2024-05-12', 600000.00, 'Selesai'),
	(4, 4, 4, '2024-05-13', '2024-05-15', 1400000.00, 'Belum Selesai'),
	(5, 5, 5, '2024-05-14', '2023-05-16', 1100000.00, 'Belum Selesai'),
	(6, 6, 6, '2024-05-15', '2023-05-20', 3250000.00, 'Selesai'),
	(7, 7, 7, '2024-05-16', '2023-05-19', 2400000.00, 'Belum Selesai'),
	(8, 8, 8, '2024-05-17', '2023-05-21', 3600000.00, 'Selesai'),
	(9, 9, 9, '2024-05-19', '2023-05-23', 2800000.00, 'Belum Selesai'),
	(10, 10, 10, '2024-05-22', '2023-05-24', 2400000.00, 'Belum Selesai');
    INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
	(11, 11, 11, '2024-05-10', '2024-05-13', 1500000.00, 'Selesai');
    
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
    (1, '2024-05-13', 1500000.00, 'Tunai'),
    (2, '2024-05-15', 1000000.00, 'Kartu Kredit'),
    (3, '2024-05-12', 600000.00, 'Transfer Bank'),
    (4, '2024-05-14', 700000.00, 'Tunai'),
    (5, '2024-05-17', 800000.00, 'Kartu Debit'),
    (6, '2024-05-20', 3250000.00, 'Transfer Bank'),
    (7, '2024-05-18', 2000000.00, 'Tunai'),
    (8, '2024-05-21', 3600000.00, 'Kartu Kredit'),
    (9, '2024-05-24', 2500000.00, 'Transfer Bank');
    -- (10, '2024-05-25', 2400000.00, 'Kartu Debit');
    
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

select * from after_update_transaksi;
-- DELIMITER //
-- CREATE PROCEDURE HapusTriggerTransaksi()
-- BEGIN
--     -- Periksa apakah trigger ada, jika ya maka hapus
--     DROP TRIGGER IF EXISTS after_update_transaksi;
-- END //
-- DELIMITER ;
CALL HapusTriggerTransaksi();


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
(9, '2024-06-26', 260000.00, 'Tunai');
SELECT * FROM pembayaran;
SELECT * FROM transaksi;
SELECT * FROM log_pembayaran;


-- NOMOR3--
 DELIMITER //
CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE harga_per_hari DECIMAL(10, 2);
    DECLARE jumlah_hari INT;

    SELECT harga_sewa INTO harga_per_hari
    FROM mobil
    WHERE id_mobil = new.id_mobil;

    SET jumlah_hari = DATEDIFF(new.tanggal_selesai, new.tanggal_mulai);

    
    SET new.total_biaya = harga_per_hari * jumlah_hari;
END //
DELIMITER ;
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi) 
VALUES (10, 10, 7, '2024-05-25', '2024-05-28', 'Belum Selesai');
SELECT * FROM transaksi;

-- DELIMITER //
-- CREATE PROCEDURE HapusTriggerIntens()
-- BEGIN
--     -- Periksa apakah trigger ada, jika ya maka hapus
--     DROP TRIGGER IF EXISTS before_insert_transaksi;
-- END //
-- DELIMITER ;
CALL HapusTriggerIntens();


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
SELECT * FROM transaksi; -- dapat id 11

-- hapus data tranksasi id 11
DELETE FROM transaksi WHERE id_transaksi = 12;

-- cek apakah trigger berjalan 
SELECT * FROM log_hapus_transaksi; 





	



    