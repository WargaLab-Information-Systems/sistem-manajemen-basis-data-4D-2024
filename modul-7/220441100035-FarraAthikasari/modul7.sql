CREATE DATABASE rentalmobil2;
USE rentalmobil2;
-- DROP DATABASE rental_mobil2;

CREATE TABLE pegawai(
	id_pegawai INT (11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
	nama VARCHAR (50) NOT NULL,
	jabatan VARCHAR (50) NOT NULL,
	no_telepon VARCHAR (15)NOT NULL,
	email VARCHAR (50) NOT NULL 
);
DESC pegawai;

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
-- trigger yg diaktifkan setelah data baru dimasukkan
DELIMITER //
CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
	-- memeriksa
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
    -- kombinasi dari 2 tipe data
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESC log_pembayaran;
SELECT * FROM pembayaran;
SELECT * FROM transaksi;

-- trigger yg diaktifkan setelah data baru dimasukkan
DELIMITER //
CREATE TRIGGER after_insert_pembayaran
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN 
	-- mencatat info pembayaran ke log_pembayaran
	INSERT INTO log_pembayaran (id_pembayaran,id_transaksi,tanggal_pembayaran,jumlah_pembayaran,metode_pembayaran)
	VALUES (new.id_pembayaran,new.id_transaksi,new.tanggal_pembayaran,new.jumlah_pembayaran,new.metode_pembayaran);
END //
DELIMITER ;
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES 
(4, '2024-05-24', 240000.00, 'Kartu Debit');
SELECT * FROM pembayaran;
SELECT * FROM log_pembayaran;


-- NOMOR3
-- trigger yg diaktifkan sebelum data baru dimasukkan 
 DELIMITER //
CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE harga_per_hari DECIMAL(10, 2);
    DECLARE jumlah_hari INT;

    -- Mengambil niLai harga sewa dari tabel mobil
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
VALUES (4, 4, 4, '2024-05-13', '2024-05-15', 'Belum Selesai');
SELECT * FROM transaksi;
SELECT * FROM mobil;


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

-- trigger yg diaktifkan setelah data dihapus
DELIMITER //
CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
	-- menyimpan info transaksi yg dihapus
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //
DELIMITER ;
SELECT * FROM transaksi; 

DELETE FROM pembayaran WHERE id_transaksi = 1;
-- hapus data tranksasi id..
DELETE FROM transaksi WHERE id_transaksi = 1;

-- cek apakah trigger berjalan 
SELECT * FROM log_hapus_transaksi; 