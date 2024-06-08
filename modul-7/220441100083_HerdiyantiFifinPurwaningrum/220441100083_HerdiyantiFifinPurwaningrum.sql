CREATE DATABASE db_sewamobil;
USE db_sewamobil;
-- DROP DATABASE db_sewamobil;

CREATE TABLE mobil(
	id_mobil INT NOT NULL PRIMARY KEY auto_increment,
    merk VARCHAR(50),
    model VARCHAR(50),
	tahun INT,
	warna VARCHAR(20),
    harga_sewa DECIMAL(10,2),
    status_mobil ENUM('Tersedia','Tidak Tersedia')
);
INSERT INTO mobil VALUES
    (1, 'Toyota', 'Avanza', 2019, 'Hitam', 300000.00, 'Tersedia'),
    (2, 'Honda', 'Jazz', 2020, 'Putih', 350000.00, 'Tidak Tersedia'),
    (3, 'Suzuki', 'Ertiga', 2018, 'Merah', 320000.00, 'Tersedia'),
    (4, 'Mitsubishi', 'Xpander', 2021, 'Abu-abu', 380000.00, 'Tersedia'),
    (5, 'Nissan', 'Livina', 2017, 'Biru', 290000.00, 'Tersedia'),
    (6, 'Ford', 'Fiesta', 2019, 'Silver', 330000.00, 'Tidak Tersedia');


CREATE TABLE perawatan(
	id_perawatan INT NOT NULL PRIMARY KEY auto_increment,
    id_mobil INT,
    tanggal DATE,
    deskripsi TEXT,
    biaya DECIMAL(10,2),
    FOREIGN KEY (id_mobil) REFERENCES mobil (id_mobil)
);
INSERT INTO perawatan VALUES
    (1, 1, '2023-05-10', 'Ganti oli dan filter', 150000.00),
    (2, 3, '2023-07-20', 'Perbaikan AC', 300000.00),
    (3, 2, '2024-04-05', 'Perawatan rutin', 200000.00),
    (4, 4, '2024-02-15', 'Ganti ban baru', 100000.00),
    (5, 5, '2023-10-20', 'Service mesin', 250000.00);

CREATE TABLE pelanggan(
	id_pelanggan INT NOT NULL PRIMARY KEY auto_increment,
    nama VARCHAR(100),
    alamat TEXT,
	no_telepon VARCHAR(15),
	email VARCHAR(50)
);
INSERT INTO pelanggan VALUES
    (1, 'John Doe', 'Jl. Raya No. 123', '08123456789', 'john.doe@example.com'),
    (2, 'Jane Smith', 'Jl. Cendana No. 45', '08234567890', 'jane.smith@example.com'),
    (3, 'Michael Brown', 'Jl. Mawar No. 8', '08345678901', 'michael.brown@example.com'),
    (4, 'Emily Wilson', 'Jl. Melati No. 15', '08456789012', 'emily.wilson@example.com'),
    (5, 'David Taylor', 'Jl. Anggrek No. 20', '08567890123', 'david.taylor@example.com');

CREATE TABLE pegawai(
	id_pegawai INT NOT NULL PRIMARY KEY auto_increment,
    nama VARCHAR(100),
    jabatan VARCHAR(50),
	no_telepon VARCHAR(15),
	email VARCHAR(50)
);
INSERT INTO pegawai VALUES
    (1, 'Michael Johnson', 'Manajer', '08765432109', 'michael.johnson@example.com'),
    (2, 'Emily Davis', 'Admin', '08654321098', 'emily.davis@example.com'),
    (3, 'Daniel Martinez', 'Customer Service', '08543210987', 'daniel.martinez@example.com'),
    (4, 'Jessica Clark', 'Marketing', '08432109876', 'jessica.clark@example.com'),
    (5, 'Matthew Anderson', 'Teknisi', '08321098765', 'matthew.anderson@example.com');

CREATE TABLE transaksi(
	id_transaksi INT NOT NULL PRIMARY KEY auto_increment,
    id_pelanggan INT,
    id_mobil INT,
    id_pegawai INT,
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    total_biaya DECIMAL(10,2),
    status_transaksi ENUM('Selesai','Belum Selesai'),
	FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan),
	FOREIGN KEY (id_mobil) REFERENCES mobil (id_mobil),
    FOREIGN KEY (id_pegawai) REFERENCES pegawai (id_pegawai)
);
INSERT INTO transaksi VALUES
    (1, 1, 1, 2, '2024-05-10', '2024-05-15', 1500000.00, 'Selesai'),
    (2, 2, 3, 2, '2024-06-01', '2024-06-05', 1400000.00, 'Selesai'),
    (3, 3, 4, 2, '2024-05-20', '2024-05-25', 1750000.00, 'Selesai'),
    (4, 4, 2, 3, '2024-06-10', '2024-06-15', 1300000.00, 'Belum Selesai'),
    (5, 5, 5, 3, '2024-05-15', '2024-05-20', 1800000.00, 'Selesai');

CREATE TABLE pembayaran(
	id_pembayaran INT NOT NULL PRIMARY KEY auto_increment,
    id_transaksi INT,
    tanggal_pembayaran DATE,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran VARCHAR(50),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi)
);
INSERT INTO pembayaran VALUES
    (1, 1, '2024-05-15', 1500000.00, 'Transfer Bank'),
    (2, 2, '2024-06-01', 1400000.00, 'Kartu Kredit'),
    (3, 3, '2024-05-25', 1750000.00, 'Tunai'),
    (4, 4, '2024-06-12', 1300000.00, 'Transfer Bank'),
    (5, 5, '2024-05-20', 1800000.00, 'Kartu Debit');


-- 1. Buatlah sebuah trigger bernama after_update_transaksi yang akan memperbarui 
-- status mobil menjadi tersedia setiap kali status transaksi berubah menjadi selesai! (update dulu baru melakukan pengecekan)
DELIMITER //
CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi = 'Selesai' THEN
        UPDATE mobil SET status_mobil = 'Tersedia'
        WHERE id_mobil = NEW.id_mobil;
    END IF;
END//
DELIMITER ;
UPDATE transaksi SET status_transaksi = 'Selesai' WHERE id_transaksi = 4;

SELECT * FROM transaksi;
SELECT * FROM mobil;
-- drop trigger after_update_transaksi;

-- 2. Buatlah sebuah trigger bernama after_ insert_pembayaran yang akan mencatat 
-- log pembayaran ke dalam tabel log _pembayaran setiap kali ada pembayaran baru yang 
-- ditambahkan ke tabel pembayaran. Sebelum membuat trigger, buatlah terlebih dahulu tabel 
-- log _pembayaran yang akan digunakan untuk menyimpan log tersebut!Ketentuan tabel 
-- log_pembayaran :
-- • (id log) primary key dengan tipe data INT dan auto increment.
-- • (id _pembayaran) dengan tipe data INT, tidak boleh NULL.
-- • (id transaksi) dengan tipe data INT, tidak boleh NULL.
-- • (tanggal _pembayaran) dengan tipe data DATE, tidak boleh NULL.
-- • (jumlah pembayaran) dengan tipe data DECIMAL(10, 2), tidak boleh NULL. 
-- • ⁠(metode pembayaran) dengan tipe data VARCHAR(50), tidak boleh NULL.
-- • (timestamp) dengan tipe data TIMESTAMP dan default value CURRENT TIMESTAMP. (ditambahkan dulu ke tabel pembayaran lalu selanjutnya dieksekusi di trigger)
CREATE TABLE log_pembayaran(
	id_log INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10,2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
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
	VALUES (3, '2023-06-06', 3000000.00, 'Tunai');
    
SELECT * FROM pembayaran;
SELECT * FROM log_pembayaran;
-- drop trigger after_insert_pembayaran;

-- 3. Buatlah sebuah trigger bernama before_insert_transaksi yang akan menghitung total 
-- biaya sewa secara otomatis sebelum transaksi baru dimasukkan ke dalam tabel transaksi. 
-- Total biaya dihitung berdasarkan harga sewa per hari dari tabel mobil dikalikan dengan 
-- jumlah hari sewa (tanggal selesai - tanggal mulai). (menghitung total biayanya dulu baru bisa menambahkan data baru)
DELIMITER //
CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
	DECLARE harga_per_hari DECIMAL(10,2);
    DECLARE jumlah_hari INT;
    SELECT harga_sewa INTO harga_per_hari
    FROM mobil
    WHERE id_mobil = NEW.id_mobil;
    SET jumlah_hari = DATEDIFF(NEW.tanggal_selesai, NEW.tanggal_mulai);
    SET NEW.total_biaya = harga_per_hari * jumlah_hari;
END //
DELIMITER ;
INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi)
	VALUES (2, 1, 3, '2023-06-09', '2023-06-11', 'Belum Selesai');
SELECT * FROM transaksi;
drop trigger before_insert_transaksi;

    
-- 4. Buatlah sebuah trigger bernama after_delete_transaksi yang akan mencatat 
-- log setiap kali ada transaksi yang dihapus dari tabel transaksi. Log in harus mencatat
-- id _ transaksi, id pelanggan, id mobil, tanggal mulai, tanggal selesai, total biaya, 
-- dan timestamp penghapusan. Ketentuan tabel log_ hapus_transaksi:
-- • (id log) sebagai primary key dengan tipe data INT dan auto increment.
-- • (id transaksi) dengan tipe data INT, tidak boleh NULL.
-- • (id pelanggan) dengan tipe data INT, tidak boleh NULL.
-- • (id mobil) dengan tipe data INT, tidak boleh NULL.
-- • (tanggal _mulai) dengan tipe data DATE, tidak bolch NULL. 
-- • ⁠(tanggal selesai) dengan tipe data DATE, tidak bole NULL.
-- • (total biaya) dengan tipe data DECIMAL(10, 2), tidak boleh NULL.
-- • (timestamp) dengan tipe data TIMESTAMP dan default value CURRENT TIMESTAMP. (hapus dulu index yanga ada di tabel transaksi lalu yang ada di dalam trigger akan diekseskusi)
CREATE TABLE log_hapus_transaksi (
    id_log INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_transaksi INT NOT NULL,
    id_pelanggan INT NOT NULL,
    id_mobil INT NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    total_biaya DECIMAL(10,2) NOT NULL,
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
DELETE FROM transaksi
WHERE id_transaksi = 6;

-- DELETE FROM pembayaran WHERE id_transaksi = 5;

SELECT * FROM log_hapus_transaksi;
SELECT * FROM transaksi;
-- drop trigger after_delete_transaksi;