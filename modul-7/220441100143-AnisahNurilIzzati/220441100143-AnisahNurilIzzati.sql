CREATE DATABASE penyewaan_mobil;
USE penyewaan_mobil;

CREATE TABLE mobil (
	id_mobil INT PRIMARY KEY AUTO_INCREMENT,
    merk VARCHAR(50),
    model VARCHAR(50),
    tahun INT,
    warna VARCHAR(20),
    harga_sewa DECIMAL(10,2),
    status_mobil ENUM ('Tersedia', 'Tidak Tersedia')
);
    
CREATE TABLE perawatan (
	id_perawatan INT PRIMARY KEY AUTO_INCREMENT,
    id_mobil INT,
    tanggal DATE,
    deskripsi TEXT,
    biaya DECIMAL(10,2),
    FOREIGN KEY(id_mobil) REFERENCES mobil(id_mobil)
);

CREATE TABLE pelanggan (
	id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    alamat TEXT,
    no_telepon VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE pegawai (
	id_pegawai INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100),
    jabatan VARCHAR(50),
    no_telepon VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE pembayaran (
	id_pembayaran INT PRIMARY KEY AUTO_INCREMENT,
    id_transaksi INT,
    tanggal_pembayaran DATE,
    jumlah_pembayaran DECIMAL(10,2),
    metode_pembayaran VARCHAR(50),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi)
);

CREATE TABLE transaksi (
	id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    id_pelanggan INT,
    id_mobil INT,
    id_pegawai INT,
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    total_biaya DECIMAL(10,2),
    status_transaksi ENUM ('Selesai', 'Belum Selesai'),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);
    
INSERT INTO mobil (merk, model, tahun, warna, harga_sewa, status_mobil) VALUES
('Toyota', 'Avanza', 2020, 'Putih', 500000.00, 'Tersedia'),
('Honda', 'Civic', 2019, 'Hitam', 750000.00, 'Tersedia'),
('Suzuki', 'Ertiga', 2021, 'Merah', 600000.00, 'Tidak Tersedia'),
('Mitsubishi', 'Pajero', 2018, 'Silver', 1000000.00, 'Tersedia'),
('Nissan', 'Alphard', 2017, 'Hitam', 450000.00, 'Tidak Tersedia');

INSERT INTO perawatan (id_mobil, tanggal, deskripsi, biaya) VALUES
(1, '2023-01-15', 'Ganti oli', 150000.00),
(2, '2023-02-20', 'Perbaikan rem', 300000.00),
(3, '2023-03-10', 'Penggantian ban', 400000.00),
(4, '2023-04-25', 'Servis AC', 200000.00),
(5, '2023-05-05', 'Tune up mesin', 350000.00);

INSERT INTO pelanggan (nama, alamat, no_telepon, email) VALUES
('Putri', 'Jl. Mawar No. 10', '081234567890', 'putri123@gmail.com'),
('Anisa', 'Jl. Melati No. 20', '081234567891', 'anisya@gmail.com'),
('Icha', 'Jl. Kenanga No. 30', '081234567892', 'icha76@gmail.com'),
('Nadia', 'Jl. Anggrek No. 40', '081234567893', 'nadiapuspit@gmail.com'),
('Pipin', 'Jl. Tulip No. 50', '081234567894', 'pipin22@gmail.com');

INSERT INTO pegawai (nama, jabatan, no_telepon, email) VALUES
('Sehun', 'Manager', '081234567895', 'sehun@gmail.com'),
('Suho', 'Sales', '081234567896', 'suho@gmail.com'),
('Baekhyun', 'Receptionist', '081234567897', 'bakehyun@gmail.com'),
('Kyungsoo', 'Assistant Manager', '081234567898', 'kyungsoo@gmail.com'),
('Chanyeol', 'Sales', '081234567899', 'chanyeol@gmail.com');

INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
(1, 1, 1, '2023-06-01', '2023-06-05', 2000000.00, 'Selesai'),
(2, 2, 2, '2023-06-10', '2023-06-15', 3750000.00, 'Selesai'),
(3, 3, 3, '2023-06-20', '2023-06-25', 3000000.00, 'Belum Selesai'),
(4, 4, 4, '2023-07-01', '2023-07-07', 7000000.00, 'Selesai'),
(5, 5, 5, '2023-07-10', '2023-07-15', 2250000.00, 'Belum Selesai');

INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(1, '2023-06-05', 2000000.00, 'Transfer Bank'),
(2, '2023-06-15', 3750000.00, 'Kartu Kredit'),
(3, '2023-06-25', 1500000.00, 'Tunai'),
(4, '2023-07-07', 7000000.00, 'Transfer Bank'),
(5, '2023-07-15', 2250000.00, 'Kartu Kredit');

-- soal 1
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

UPDATE transaksi
SET status_transaksi = 'Selesai'
WHERE id_transaksi = 3;

SELECT * FROM transaksi;
SELECT * FROM mobil;

-- soal 2
CREATE TABLE log_pembayaran (
	id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10,2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    timestamps TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_insert_pembayaran
AFTER INSERT ON pembayaran
FOR EACH ROW
BEGIN
    INSERT INTO log_pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
    VALUES (NEW.id_pembayaran, NEW.id_transaksi, NEW.tanggal_pembayaran, NEW.jumlah_pembayaran, NEW.metode_pembayaran);
END//
DELIMITER ;

INSERT INTO pembayaran (id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran)
VALUES (1, '2023-06-05', 2000000.00, 'Transfer Bank');

SELECT * FROM pembayaran;
SELECT * FROM log_pembayaran;

-- soal 3
DELIMITER //
CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE harga_sewa_per_hari DECIMAL(10, 2);
    DECLARE jumlah_hari INT;

    SELECT harga_sewa INTO harga_sewa_per_hari FROM mobil WHERE id_mobil = NEW.id_mobil;
    SET jumlah_hari = DATEDIFF(NEW.tanggal_selesai, NEW.tanggal_mulai);
    SET NEW.total_biaya = harga_sewa_per_hari * jumlah_hari;
END//
DELIMITER ;

INSERT INTO transaksi (id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi)
VALUES (2, 1, 3, '2023-06-09', '2023-06-11', 'Belum Selesai');

SELECT * FROM transaksi;


-- soal 4
CREATE TABLE log_hapus_transaksi (
	id_log INT PRIMARY KEY AUTO_INCREMENT,
    id_transaksi INT NOT NULL,
    id_pelanggan INT NOT NULL,
    id_mobil INT NOT NULL,
    tanggal_mulai DATE NOT NULL,
    tanggal_selesai DATE NOT NULL,
    total_biaya DECIMAL(10,2) NOT NULL,
    timestamps TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END//

DELIMITER ;

DELETE FROM transaksi
WHERE id_transaksi = 6;

SELECT * FROM transaksi;
SELECT * FROM log_hapus_transaksi;
