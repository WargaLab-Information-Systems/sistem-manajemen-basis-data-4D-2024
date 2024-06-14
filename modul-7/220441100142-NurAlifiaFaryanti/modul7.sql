CREATE DATABASE  mobilrental2;
USE mobilrental2;
drop database mobilrental2;


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
('Ford', 'Fiesta', 2018, 'Merah', 270000, 'Dipinjam'),
('BMW', 'X5', 2020, 'Putih', 550000, 'Dipinjam'),
('Audi', 'A4', 2019, 'Hitam', 500000, 'Tersedia'),
('Mercedes', 'C-Class', 2017, 'Biru', 480000, 'Dipinjam'),
('Volkswagen', 'Golf', 2016, 'Silver', 310000, 'Tersedia'),
('Hyundai', 'i20', 2018, 'Kuning', 260000, 'Dipinjam'),
('Peugeot', '3008', 2019, 'Hijau', 420000, 'Tersedia'),
('Chevrolet', 'Captiva', 2017, 'Hitam', 400000, 'Dipinjam'),
('Subaru', 'Forester', 2020, 'Abu-Abu', 530000, 'Tersedia'),
('Jaguar', 'XF', 2019, 'Putih', 600000, 'Dipinjam');

SELECT * FROM mobil;


INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
('Agus Supriyadi', 'Jl. Cemara No. 21, Bandung', '082345678900', 'agus.supriyadi@gmail.com'),
('Maya Wulandari', 'Jl. Cendana No. 34, Bandung', '082345678901', 'maya.wulandari@gmail.com'),
('Bambang Sutrisno', 'Jl. Pinus No. 15, Bandung', '082345678902', 'bambang.sutrisno@gmail.com'),
('Lestari Putri', 'Jl. Akasia No. 8, Bandung', '082345678903', 'lestari.putri@gmail.com'),
('Yoga Pratama', 'Jl. Flamboyan No. 11, Bandung', '082345678904', 'yoga.pratama@gmail.com'),
('Sari Dewi', 'Jl. Merpati No. 22, Bandung', '082345678905', 'sari.dewi@gmail.com'),
('Rudi Hartono', 'Jl. Elang No. 9, Bandung', '082345678906', 'rudi.hartono@gmail.com'),
('Nina Kurnia', 'Jl. Rajawali No. 4, Bandung', '082345678907', 'nina.kurnia@gmail.com'),
('Yusuf Maulana', 'Jl. Garuda No. 13, Bandung', '082345678908', 'yusuf.maulana@gmail.com'),
('Linda Permata', 'Jl. Kenari No. 7, Bandung', '082345678909', 'linda.permata@gmail.com');

SELECT * FROM pelanggan;

INSERT INTO perawatan (id_mobil, tanggal, deskripsi, biaya) VALUES
(1, '2023-11-10', 'Ganti oli mesin', 170000.00),
(2, '2023-12-12', 'Servis AC', 320000.00),
(3, '2023-11-15', 'Ganti kampas rem', 470000.00),
(4, '2023-12-22', 'Tune-up mesin', 780000.00),
(5, '2023-12-30', 'Penggantian radiator', 1250000.00),
(6, '2023-11-20', 'Ganti aki', 620000.00),
(7, '2023-12-18', 'Ganti busi', 130000.00),
(8, '2023-12-25', 'Perbaikan sistem kelistrikan', 520000.00),
(9, '2023-11-27', 'Servis transmisi', 670000.00),
(10, '2023-12-29', 'Penggantian shockbreaker', 950000.00);

SELECT * FROM perawatan;



INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
('Bayu Kurniawan', 'Manager', '081234567801', 'bayu.kurniawan@gmail.com'),
('Rina Maulida', 'Admin', '081234567802', 'rina.maulida@gmail.com'),
('Fajar Nugraha', 'Mekanik', '081234567803', 'fajar.nugraha@gmail.com'),
('Citra Dewi', 'Customer Service', '081234567804', 'citra.dewi@gmail.com'),
('Hadi Saputra', 'Driver', '081234567805', 'hadi.saputra@gmail.com'),
('Laras Fitriani', 'Marketing', '081234567806', 'laras.fitriani@gmail.com'),
('Ilham Pratama', 'IT Support', '081234567807', 'ilham.pratama@gmail.com'),
('Siti Nurhaliza', 'HRD', '081234567808', 'siti.nurhaliza@gmail.com'),
('Aldo Ramadhan', 'Kasir', '081234567809', 'aldo.ramadhan@gmail.com'),
('Rina Permata', 'Kasir', '081234567810', 'rina.permata@gmail.com');

SELECT * FROM pegawai;

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


SELECT * FROM transaksi;
-- truncate transaksi
-- drop table pembayaran

INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(1, '2024-01-03', 510000.00, 'Transfer Bank'),
(2, '2024-02-06', 330000.00, 'Tunai'),
(3, '2024-03-09', 520000.00, 'QRis'),
(4, '2024-04-12', 440000.00, 'Transfer Bank'),
(5, '2024-05-15', 560000.00, 'Tunai'),
(6, '2024-06-18', 300000.00, 'QRis'),
(7, '2024-07-21', 630000.00, 'Transfer Bank'),
(8, '2024-08-24', 460000.00, 'Tunai'),
(9, '2024-09-27', 740000.00, 'QRis'),
(10, '2024-10-30', 370000.00, 'Transfer Bank');

SELECT * FROM pembayaran;


-- SOAL 1
DELIMITER //
CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi = 'Selesai' THEN -- mengecek apakah nilai kolom status_transaksi dari baris yang baru diperbarui (NEW.status_transaksi) adalah 'Selesa
        UPDATE mobil SET STATUS = 'Tersedia' WHERE id_mobil = NEW.id_mobil;
    END IF;
END //

DELIMITER ;

UPDATE transaksi SET status_transaksi = 'Selesai' WHERE id_transaksi = 1;
SELECT * FROM transaksi;
SELECT * FROM mobil;




-- SOAL 2
CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //


-- dibuat agar setiap kali ada data baru yang dimasukkan 
-- ke tabel pembayaran, data tersebut juga akan otomatis dimasukkan ke tabel log_pembayaran
CREATE TRIGGER after_insert_pembayaran
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
    INSERT INTO log_pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
    VALUES (NEW.id_pembayaran, NEW.id_transaksi, NEW.tanggal_pembayaran, NEW.jumlah_pembayaran, NEW.metode_pembayaran);
END //

DELIMITER ;
INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) 
VALUES (3, '2024-05-29', 510000.00, 'Tunai');
SELECT * FROM log_pembayaran;
select * from pembayaran;


-- NOMOR3--
DROP TRIGGER  before_insert_transaksi;
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
VALUES (10, 10, 10, '2024-05-25', '2024-05-31', 'Belum Selesai');
SELECT * FROM transaksi;





-- SOAL 4

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
DELIMITER //

CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //

DELIMITER ;

DELETE FROM transaksi WHERE id_transaksi = 13;
SELECT * FROM log_hapus_transaksi;
select * from transaksi;







