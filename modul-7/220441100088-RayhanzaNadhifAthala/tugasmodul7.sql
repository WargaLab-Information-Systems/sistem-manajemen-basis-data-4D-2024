create database modul7;
use modul7;

CREATE TABLE Pelanggan (
	ID_Pelanggan INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    Nama VARCHAR(100),
    Alamat TEXT,
    No_Telepon VARCHAR(15),
    Email VARCHAR(50)
);

CREATE TABLE Pegawai (
	ID_Pegawai INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Nama VARCHAR(100),
    Jabatan VARCHAR(50),
    No_Telepon VARCHAR(15),
    Email VARCHAR(50)
);

CREATE TABLE Mobil (
	ID_Mobil INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    Merk VARCHAR(50),
    Model VARCHAR(50),
    Tahun INT(11),
    Warna VARCHAR(20),
    Harga_Sewa DECIMAL(10.2),
    Status ENUM("Tersedia", "Tidak Tersedia")
);

CREATE TABLE Perawatan (
	ID_Perawatan INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_Mobil INT(11),
    Tanggal DATE,
    Deskripsi TEXT,
    Biaya DECIMAL,
    FOREIGN KEY (ID_Mobil) REFERENCES Mobil (ID_Mobil)
);

CREATE TABLE Transaksi (
	ID_Transaksi INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_Pelanggan INT(11),
    ID_Mobil INT(11),
    ID_Pegawai INT(11),
    Tanggal_Mulai DATE,
    Tanggal_Selesai DATE,
    Total_Biaya DECIMAL(10.2),
    Status_Transaksi ENUM("Selesai", "Belum Selesai"),
    FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan (ID_Pelanggan),
    FOREIGN KEY (ID_Mobil) REFERENCES Mobil (ID_Mobil),
    FOREIGN KEY (ID_Pegawai) REFERENCES Pegawai (ID_Pegawai)
);

CREATE TABLE Pembayaran (
	ID_Pembayaran INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ID_Transaksi INT(11),
    Tanggal_Pembayaran DATE,
    Jumlah_Pembayaran DECIMAL(10.2),
    Metode_Pembayaran VARCHAR(50),
    FOREIGN KEY (ID_Transaksi) REFERENCES Transaksi (ID_Transaksi)
);

INSERT INTO Pelanggan (Nama, Alamat, No_Telepon, Email) VALUES
('Ahmad Abdullah', 'Jalan Merdeka No. 1, Jakarta', '081234567890', 'ahmad.abdullah@contoh.com'),
('Dewi Lestari', 'Jalan Gajah Mada No. 2, Surabaya', '085678901234', 'dewi.lestari@contoh.com'),
('Eko Wijaya', 'Jalan Asia Afrika No. 3, Bandung', '089012345678', 'eko.wijaya@contoh.com'),
('Fitriani Putri', 'Jalan Diponegoro No. 4, Yogyakarta', '087654321098', 'fitriani.putri@contoh.com'),
('Hendra Gunawan', 'Jalan Pahlawan No. 5, Semarang', '081111222333', 'hendra.gunawan@contoh.com'),
('Ratna Sari', 'Jalan Sudirman No. 6, Medan', '082222333444', 'ratna.sari@contoh.com'),
('Irfan Maulana', 'Jalan Ahmad Yani No. 7, Makassar', '083333444555', 'irfan.maulana@contoh.com');

INSERT INTO Pegawai (Nama, Jabatan, No_Telepon, Email) VALUES
('Andi Wijaya', 'Manajer', '081234567890', 'andi.wijaya@contoh.com'),
('Lia Indah', 'Asisten Manajer', '085678901234', 'lia.indah@contoh.com'),
('Rudi Setiawan', 'Supervisor', '089012345678', 'rudi.setiawan@contoh.com'),
('Siska Ramadhani', 'Koordinator', '087654321098', 'siska.ramadhani@contoh.com'),
('Agus Surya', 'Staf', '081111222333', 'agus.surya@contoh.com'),
('Dina Fatimah', 'Staf', '082222333444', 'dina.fatimah@contoh.com'),
('Bambang Susanto', 'Staf', '083333444555', 'bambang.susanto@contoh.com');

INSERT INTO Mobil (Merk, Model, Tahun, Warna, Harga_Sewa, Status) VALUES
('Toyota', 'Avanza', 2022, 'Hitam', 250000, 'Tersedia'),
('Honda', 'CRV', 2021, 'Putih', 350000, 'Tersedia'),
('Suzuki', 'Ertiga', 2023, 'Silver', 280000, 'Tersedia'),
('Mitsubishi', 'Xpander', 2020, 'Biru', 300000, 'Tersedia'),
('Daihatsu', 'Terios', 2022, 'Merah', 270000, 'Tersedia'),
('Nissan', 'X-Trail', 2021, 'Hitam', 380000, 'Tersedia'),
('Mazda', 'CX-5', 2023, 'Abu-abu', 400000, 'Tersedia');

INSERT INTO Mobil (Merk, Model, Tahun, Warna, Harga_Sewa, Status) VALUES
('Wuling', 'AAlmaz', 2022, 'Hitam', 250000, 'Tidak Tersedia');

INSERT INTO Perawatan (ID_Mobil, Tanggal, Deskripsi, Biaya) VALUES
(1, '2024-05-01', 'Ganti Oli dan Filter', 150000),
(2, '2024-04-15', 'Service Rutin', 200000),
(3, '2024-04-20', 'Penggantian Kaca Depan', 1000000),
(4, '2024-05-10', 'Pengecekan Rem', 300000),
(5, '2024-04-25', 'Ganti Ban', 800000),
(6, '2024-05-05', 'Perbaikan Sistem AC', 500000),
(7, '2024-05-15', 'Pengecekan Mesin', 400000);

INSERT INTO Transaksi (ID_Pelanggan, ID_Mobil, ID_Pegawai, Tanggal_Mulai, Tanggal_Selesai, Total_Biaya, Status_Transaksi) VALUES
(1, 1, 1, '2024-05-01', '2024-05-05', 1000000, 'Selesai'),
(2, 2, 2, '2024-04-15', '2024-04-20', 1500000, 'Selesai'),
(3, 3, 3, '2024-04-20', '2024-04-25', 1200000, 'Selesai'),
(4, 4, 4, '2024-05-10', '2024-05-15', 800000, 'Belum Selesai'),
(5, 5, 5, '2024-04-25', '2024-05-01', 2000000, 'Selesai'),
(6, 6, 6, '2024-05-05', '2024-05-10', 1500000, 'Selesai'),
(7, 7, 7, '2024-05-15', '2024-05-20', 1800000, 'Belum Selesai');

INSERT INTO Transaksi (ID_Pelanggan, ID_Mobil, ID_Pegawai, Tanggal_Mulai, Tanggal_Selesai, Total_Biaya, Status_Transaksi) VALUES
(1, 8, 1, '2024-05-01', '2024-05-05', 1000000, 'Belum Selesai');
delete from Transaksi where ID_Transaksi = 8;
SET SQL_SAFE_UPDATES = 0;
INSERT INTO Pembayaran (ID_Transaksi, Tanggal_Pembayaran, Jumlah_Pembayaran, Metode_Pembayaran) VALUES
(1, '2024-05-05', 1000000, 'Transfer Bank'),
(2, '2024-04-20', 1500000, 'Kartu Kredit'),
(3, '2024-04-25', 1200000, 'Transfer Bank'),
(4, '2024-05-15', 800000, 'Tunai'),
(5, '2024-05-01', 2000000, 'Kartu Debit'),
(6, '2024-05-10', 1500000, 'Transfer Bank'),
(7, '2024-05-16', 1000000, 'Kartu Kredit');

update Mobil set STATUS="Tidak Tersedia" where 

-- Nomor 1
DELIMITER //
CREATE TRIGGER After_Update_Transaksi
AFTER UPDATE ON Transaksi
FOR EACH ROW
BEGIN
    IF NEW.Status_Transaksi = "Selesai" THEN
		UPDATE Mobil
        SET STATUS = "Tersedia"
        WHERE ID_Mobil = NEW.ID_Mobil;
	END IF;
END //
DELIMITER ;


UPDATE Transaksi SET Status_Transaksi = "Selesai" WHERE ID_Transaksi = 9;
SELECT * FROM Mobil;
select * from transaksi;


-- nomor2
CREATE TABLE Log_Pembayaran (
	ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    ID_Pembayaran INT NOT NULL,
    ID_Transaksi INT NOT NULL,
    Tanggal_Pembayaran DATE NOT NULL,
    Jumlah_Pembayaran DECIMAL(10, 2) NOT NULL,
    Metode_Pembayaran VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER After_Insert_Pembayaran
AFTER INSERT ON Pembayaran
FOR EACH ROW
BEGIN
	INSERT INTO Log_Pembayaran (ID_Pembayaran, ID_Transaksi, Tanggal_Pembayaran, Jumlah_Pembayaran, Metode_Pembayaran)
    VALUES (NEW.ID_Pembayaran, NEW.ID_Transaksi, NEW.Tanggal_Pembayaran, NEW.Jumlah_Pembayaran, NEW.Metode_Pembayaran);
END //
DELIMITER ;

INSERT INTO Pembayaran (ID_Transaksi, Tanggal_Pembayaran, Jumlah_Pembayaran, Metode_Pembayaran)
VALUES (5, '2024-05-09', 1280000.00, 'Tunai');
SELECT * FROM Pembayaran;
SELECT * FROM Log_Pembayaran;


select * from Transaksi;
select * from mobil;



-- nomor 3
DELIMITER //
CREATE TRIGGER Before_Insert_Transaksi
BEFORE INSERT ON Transaksi
FOR EACH ROW
BEGIN
	DECLARE Harga_Per_Hari DECIMAL(10,2);
    DECLARE Jumlah_Hari INT;
    SELECT Harga_Sewa INTO Harga_Per_Hari
    FROM Mobil
    WHERE ID_Mobil = ID_Mobil;
    SET Jumlah_Hari = DATEDIFF(NEW.Tanggal_Selesai, NEW.Tanggal_Mulai);
    SET NEW.Total_Biaya = Harga_Per_Hari * Jumlah_Hari;
END //
DELIMITER ;

INSERT INTO Transaksi (ID_Pelanggan, ID_Mobil, ID_Pegawai, Tanggal_Mulai, Tanggal_Selesai, Status_Transaksi) 
VALUES (9, 6, 1, '2024-06-06', '2024-06-08', 'Selesai');
INSERT INTO Transaksi (ID_Pelanggan, ID_Mobil, ID_Pegawai, Tanggal_Mulai, Tanggal_Selesai, Status_Transaksi) 
VALUES (4, 1, 3, '2024-06-15', '2024-06-21', 'Selesai');
SELECT * FROM Transaksi;
SELECT * FROM Mobil;
;
INSERT INTO Transaksi (ID_Pelanggan, ID_Mobil, ID_Pegawai, Tanggal_Mulai, Tanggal_Selesai, Status_Transaksi) 
VALUES (7, 6, 1, '2024-06-06', '2024-06-08', 'Selesai');
INSERT INTO Transaksi (ID_Pelanggan, ID_Mobil, ID_Pegawai, Tanggal_Mulai, Tanggal_Selesai, Status_Transaksi) 
VALUES (4, 2, 3, '2024-06-15', '2024-06-17', 'Selesai');
SELECT * FROM Transaksi;
select * from mobil;


-- Nomor 4
CREATE TABLE Log_Hapus_Transaksi (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    ID_Transaksi INT NOT NULL,
    ID_Pelanggan INT NOT NULL,
    ID_Mobil INT NOT NULL,
    Tanggal_Mulai DATE NOT NULL,
    Tanggal_Selesai DATE NOT NULL,
    Total_Biaya DECIMAL(10, 2) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER After_Delete_Transaksi
AFTER DELETE ON Transaksi
FOR EACH ROW
BEGIN
    INSERT INTO Log_Hapus_Transaksi (ID_Transaksi, ID_Pelanggan, ID_Mobil, Tanggal_Mulai, Tanggal_Selesai, Total_Biaya)
    VALUES (OLD.ID_Transaksi, OLD.ID_Pelanggan, OLD.ID_Mobil, OLD.Tanggal_Mulai, OLD.Tanggal_Selesai, OLD.Total_Biaya);
END //
DELIMITER ;

DELETE FROM Transaksi WHERE ID_Transaksi = 9;
SELECT * FROM Transaksi;
SELECT * FROM Log_Hapus_Transaksi;




