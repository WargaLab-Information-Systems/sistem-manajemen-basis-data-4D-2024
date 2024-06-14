CREATE DATABASE rental_mobil;
USE rental_mobil;

CREATE TABLE pelanggan (
	id_pelanggan INT(11) PRIMARY KEY AUTO_INCREMENT,
	nama VARCHAR(100),
	alamat TEXT,
    no_telepon VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE pegawai (
	id_pegawai INT(11) PRIMARY KEY AUTO_INCREMENT,
	nama VARCHAR(100),
	jabatan VARCHAR(50),
    no_telepon VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE mobil (
	id_mobil INT(11) PRIMARY KEY AUTO_INCREMENT,
	merk VARCHAR(50),
	model VARCHAR(50),
    tahun INT(11),
    warna VARCHAR(20),
    harga_sewa DECIMAL(10,2),
    status ENUM('Tersedia', 'Disewa', 'Perbaikan')
);

CREATE TABLE perawatan (
	id_perawatan INT(11) PRIMARY KEY AUTO_INCREMENT,
	id_mobil INT(11),
	tanggal DATE,
	deskripsi TEXT,
    biaya DECIMAL(10,2),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil)
);

CREATE TABLE transaksi (
	id_transaksi INT(11) PRIMARY KEY AUTO_INCREMENT,
	id_pelanggan INT(11),
	id_mobil INT(11),
	id_pegawai INT(11),
	tanggal_mulai DATE,
	tanggal_selesai DATE,
    total_biaya DECIMAL(10,2),
    status_transaksi ENUM('Pending', 'Selesai', 'Dibatalkan'),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);

CREATE TABLE pembayaran (
	id_pembayaran INT(11) PRIMARY KEY AUTO_INCREMENT,
	id_transaksi INT(11),
	tanggal_pembayaran DATE,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran VARCHAR(50),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi)
);

-- tabel log --
CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE log_hapus_transaksi (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_pelanggan INT NOT NULL,
    id_mobil INT NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    total_biaya DECIMAL(10, 2) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Mengisi tabel pelanggan dengan 5 data
INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
( 'Budi Santoso', 'Jl. Merdeka No. 1, Jakarta', '081234567890', 'budi.santoso@example.com'),
( 'Siti Aminah', 'Jl. Pahlawan No. 20, Jakarta', '081987654321', 'siti.aminah@example.com'),
( 'Ahmad Fauzi', 'Jl. Sudirman No. 5, Jakarta', '081234098765', 'ahmad.fauzi@example.com'),
( 'Dewi Lestari', 'Jl. Melati No. 10, Jakarta', '081998877665', 'dewi.lestari@example.com'),
( 'Rizky Hidayat', 'Jl. Anggrek No. 3, Jakarta', '081223344556', 'rizky.hidayat@example.com');

-- Mengisi tabel pegawai dengan 5 data
INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
( 'Agus Salim', 'Manager', '081332211445', 'agus.salim@example.com'),
( 'Indah Permata', 'Sales', '081345678901', 'indah.permata@example.com'),
( 'Joko Susilo', 'Technician', '081356789012', 'joko.susilo@example.com'),
( 'Rina Wijaya', 'Customer Service', '081367890123', 'rina.wijaya@example.com'),
( 'Andi Saputra', 'Driver', '081378901234', 'andi.saputra@example.com');

-- Mengisi tabel mobil dengan 5 data
INSERT INTO mobil ( merk, model, tahun, warna, harga_sewa, status) VALUES
('Toyota', 'Avanza', 2020, 'Hitam', 500000.00, 'Tersedia'),
('Honda', 'Civic', 2019, 'Putih', 750000.00, 'Disewa'),
('Suzuki', 'Ertiga', 2018, 'Merah', 450000.00, 'Disewa'),
('Mitsubishi', 'Pajero', 2021, 'Hitam', 1000000.00, 'Tersedia'),
('Nissan', 'X-Trail', 2020, 'Silver', 800000.00, 'Tersedia');

-- Mengisi tabel perawatan dengan 5 data
INSERT INTO perawatan (id_mobil, tanggal, deskripsi, biaya) VALUES
(3, '2023-01-15', 'Ganti oli dan filter', 150000.00),
(1, '2023-02-10', 'Servis rutin', 300000.00),
(2, '2023-03-20', 'Penggantian rem', 250000.00),
(4, '2023-04-05', 'Pengecekan mesin', 200000.00),
(5, '2023-05-22', 'Penggantian ban', 400000.00);

-- Mengisi tabel transaksi dengan 5 data
INSERT INTO transaksi (id_transaksi, id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
(1, 1, 1, 1, '2023-06-01', '2023-06-05', 2500000.00, 'Selesai'),
(2, 2, 2, 2, '2023-06-10', '2023-06-15', 3750000.00, 'Pending'),
(3, 3, 3, 3, '2023-06-20', '2023-06-25', 2250000.00, 'Pending'),
(4, 4, 4, 4, '2023-07-01', '2023-07-10', 10000000.00, 'Selesai'),
(5, 5, 5, 5, '2023-07-15', '2023-07-20', 4000000.00, 'Selesai');

-- Mengisi tabel pembayaran dengan 5 data
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(1, '2023-06-05', 2500000.00, 'Transfer Bank'),
(2, '2023-06-15', 3750000.00, 'Kartu Kredit'),
(3, '2023-06-25', 2250000.00, 'Transfer Bank'),
(4, '2023-07-10', 10000000.00, 'Kartu Kredit'),
(5, '2023-07-20', 4000000.00, 'Tunai');


-- TRIGGER --

-- 1. Buatlah sebuah trigger bernama after_update_transaksi yang akan memperbarui 
-- status mobil menjadi tersedia setiap kali status transaksi berubah menjadi selesai! 
DELIMITER //
CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi = 'Selesai' THEN
        UPDATE mobil
        SET status = 'Tersedia'
        WHERE id_mobil = NEW.id_mobil;
    END IF;
END //
DELIMITER ;

UPDATE transaksi
SET status_transaksi = 'Selesai'
WHERE id_transaksi = 3;

SELECT * FROM mobil;
SELECT * FROM transaksi;
DROP TRIGGER after_update_transaksi;

-- 2. Buatlah sebuah trigger bernama after_insert_pembayaran yang akan mencatat log 
-- pembayaran ke dalam tabel log_pembayaran setiap kali ada pembayaran baru yang 
-- ditambahkan ke tabel pembayaran. Sebelum membuat trigger, buatlah terlebih dahulu 
-- tabel log_pembayaran yang akan digunakan untuk menyimpan log tersebut! 
DELIMITER //
CREATE TRIGGER after_insert_pembayaran
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
    INSERT INTO log_pembayaran (
		id_pembayaran, 
		id_transaksi, 
		tanggal_pembayaran, 
		jumlah_pembayaran, 
		metode_pembayaran)
    VALUES (
		NEW.id_pembayaran, 
		NEW.id_transaksi, 
		NEW.tanggal_pembayaran, 
		NEW.jumlah_pembayaran, 
		NEW.metode_pembayaran);
END //
DELIMITER ;

INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
VALUES (5, '2024-05-30', 4000000.00, 'Tunai');

SELECT * FROM log_pembayaran;
SELECT * FROM pembayaran;

-- 3. Buatlah sebuah trigger bernama before_insert_transaksi yang akan menghitung total 
-- biaya sewa secara otomatis sebelum transaksi baru dimasukkan ke dalam tabel 
-- transaksi. Total biaya dihitung berdasarkan harga sewa per hari dari tabel mobil 
-- dikalikan dengan jumlah hari sewa (tanggal_selesai - tanggal_mulai). 
DELIMITER //
CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE harga_harian DECIMAL(10,2);
    DECLARE jumlah_hari INT;

    SELECT harga_sewa INTO harga_harian
    FROM mobil
    WHERE id_mobil = NEW.id_mobil;

    SET jumlah_hari = DATEDIFF(NEW.tanggal_selesai, NEW.tanggal_mulai);

    SET NEW.total_biaya = harga_harian * jumlah_hari;
END //
DELIMITER ;

INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi)
VALUES (2, 4, 3, '2024-06-01', '2024-06-10', 'Pending');

select * from mobil;
SELECT * FROM transaksi WHERE id_transaksi = 6;
SELECT * FROM transaksi;

-- 4. Buatlah sebuah trigger bernama after_delete_transaksi yang akan mencatat log setiap 
-- kali ada transaksi yang dihapus dari tabel transaksi. Log ini harus mencatat id_transaksi, 
-- id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya, dan timestamp 
-- penghapusan.
DELIMITER //
CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (
		id_transaksi, 
		id_pelanggan, 
		id_mobil, 
		tanggal_mulai, 
		tanggal_selesai, 
		total_biaya)
    VALUES (
		OLD.id_transaksi, 
		OLD.id_pelanggan, 
		OLD.id_mobil, 
		OLD.tanggal_mulai, 
		OLD.tanggal_selesai, 
		OLD.total_biaya);
END //
DELIMITER ;

DELETE FROM transaksi WHERE id_transaksi = 6;
SELECT * FROM log_hapus_transaksi;
SELECT * FROM transaksi;

DROP DATABASE rental_mobil;
