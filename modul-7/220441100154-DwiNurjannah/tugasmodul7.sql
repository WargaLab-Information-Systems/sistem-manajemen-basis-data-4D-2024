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
	('Ali Ahmad', 'Manager', '081234567890', 'ali.ahmad@example.com'),
	('Budi Santoso', 'Supervisor', '081234567891', 'budi.santoso@example.com'),
	('Citra Wulandari', 'Staf', '081234567892', 'citra.wulandari@example.com'),
	('Dewi Kusuma', 'Administrasi', '081234567893', 'dewi.kusuma@example.com'),
	('Eko Prasetyo', 'IT Support', '081234567894', 'eko.prasetyo@example.com'),
	('Fajar Nugroho', 'Sales', '081234567895', 'fajar.nugroho@example.com'),
	('Gita Sari', 'HRD', '081234567896', 'gita.sari@example.com'),
	('Hendra Saputra', 'Keuangan', '081234567897', 'hendra.saputra@example.com'),
	('Ika Wijaya', 'Pemasaran', '081234567898', 'ika.wijaya@example.com'),
	('Joko Supriyadi', 'Direktur', '081234567899', 'joko.supriyadi@example.com');

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
	('Siti Aisyah', 'Jl. Merdeka No. 10, Jakarta', '081234567800', 'siti.aisyah@example.com'),
	('Rudi Hartono', 'Jl. Kebon Jeruk No. 15, Jakarta', '081234567801', 'rudi.hartono@example.com'),
	('Nina Kurnia', 'Jl. Diponegoro No. 5, Bandung', '081234567802', 'nina.kurnia@example.com'),
	('Agus Salim', 'Jl. Kartini No. 20, Surabaya', '081234567803', 'agus.salim@example.com'),
	('Wati Lestari', 'Jl. Sudirman No. 25, Medan', '081234567804', 'wati.lestari@example.com'),
	('Bambang Sutrisno', 'Jl. Ahmad Yani No. 30, Semarang', '081234567805', 'bambang.sutrisno@example.com'),
	('Cici Rahmawati', 'Jl. Gatot Subroto No. 35, Palembang', '081234567806', 'cici.rahmawati@example.com'),
	('Dodi Firmansyah', 'Jl. Thamrin No. 40, Makassar', '081234567807', 'dodi.firmansyah@example.com'),
	('Eka Suryani', 'Jl. Hasanuddin No. 45, Yogyakarta', '081234567808', 'eka.suryani@example.com'),
	('Fajar Pratama', 'Jl. RA Kartini No. 50, Denpasar', '081234567809', 'fajar.pratama@example.com');

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
SELECT * FROM mobil;

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
	(1, '2023-01-15', 'Ganti oli dan pemeriksaan rutin', 300000.00),
	(2, '2023-02-20', 'Penggantian ban dan balancing', 1500000.00),
	(3, '2023-03-10', 'Perbaikan rem dan pengecekan mesin', 500000.00),
	(4, '2023-04-05', 'Servis berkala dan penggantian filter udara', 700000.00),
	(5, '2023-05-25', 'Penggantian aki dan pemeriksaan listrik', 1200000.00),
    (6, '2023-06-10', 'Ganti oli dan tune-up mesin', 400000.00),
	(7, '2023-06-20', 'Penggantian kampas rem dan servis rem', 800000.00),
	(8, '2023-07-05', 'Pemeriksaan rutin dan penggantian kampas kopling', 600000.00),
	(9, '2023-07-15', 'Penggantian shockbreaker dan penyetelan suspensi', 900000.00),
	(10, '2023-08-01', 'Pemeriksaan sistem pendingin dan penggantian radiator', 750000.00);
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
UPDATE transaksi SET status_transaksi='Selesai' WHERE id_transaksi = 2;
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
VALUES (1, 1, 1,  '2024-05-10', '2024-05-13', 'Belum Selesai');
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
SELECT * FROM transaksi; -- dapat id 11

-- hapus data tranksasi id 11
DELETE FROM transaksi WHERE id_transaksi = 13;

-- cek apakah trigger berjalan 
SELECT * FROM log_hapus_transaksi; 

