CREATE DATABASE modul7;

CREATE TABLE mobil(
id_mobil INT(11),
merk VARCHAR (50),
model VARCHAR(50),
tahun INT(11),
warna VARCHAR(20),
harga_sewa DECIMAL(10,2),
STATUS ENUM('tersedia', 'belum tersedia'));

-- Insert data into mobil table
INSERT INTO mobil (id_mobil, merk, model, tahun, warna, harga_sewa, STATUS) VALUES
(1, 'Toyota', 'Avanza', 2020, 'Hitam', 500000.00, 'tersedia'),
(2, 'Honda', 'Civic', 2019, 'Putih', 750000.00, 'tersedia'),
(3, 'Suzuki', 'Ertiga', 2021, 'Merah', 600000.00, 'belum tersedia'),
(4, 'Mitsubishi', 'Xpander', 2018, 'Abu-abu', 650000.00, 'tersedia'),
(5, 'Nissan', 'Livina', 2017, 'Biru', 550000.00, 'belum tersedia');


CREATE TABLE perawatan (
id_perawatan INT(11),
id_mobil INT(11),
tanggal DATE,
deskripsi TEXT,
biaya DECIMAL (10,2),
FOREIGN KEY (id_mobil) REFERENCES mobil (id_mobil));

CREATE TABLE pelanggan (
id_pelanggan INT (11) PRIMARY KEY,
nama VARCHAR(100),
alamat TEXT,
no_telepon VARCHAR(15),
email VARCHAR (50));

-- Insert data into pelanggan table
INSERT INTO pelanggan (id_pelanggan, nama, alamat, no_telepon, email) VALUES
(1, 'Andi', 'Jl. Merpati No. 10, Jakarta', '081234567890', 'andi@example.com'),
(2, 'Budi', 'Jl. Kenari No. 15, Bandung', '081234567891', 'budi@example.com'),
(3, 'Cici', 'Jl. Melati No. 20, Surabaya', '081234567892', 'cici@example.com'),
(4, 'Dewi', 'Jl. Anggrek No. 25, Yogyakarta', '081234567893', 'dewi@example.com'),
(5, 'Eka', 'Jl. Mawar No. 30, Semarang', '081234567894', 'eka@example.com');


CREATE TABLE pegawai(
id_pegawai INT(11) PRIMARY KEY,
nama VARCHAR (100),
jabatan VARCHAR(50),
no_telepon VARCHAR(15),
email VARCHAR (50));

-- Insert data into pegawai table
INSERT INTO pegawai (id_pegawai, nama, jabatan, no_telepon, email) VALUES
(1, 'Rina', 'Manager', '081234567895', 'rina@example.com'),
(2, 'Sinta', 'Staff', '081234567896', 'sinta@example.com'),
(3, 'Bambang', 'Driver', '081234567897', 'bambang@example.com'),
(4, 'Lina', 'Admin', '081234567898', 'lina@example.com'),
(5, 'Yudi', 'Mechanic', '081234567899', 'yudi@example.com');


CREATE TABLE transaksi (
id_transaksi INT(11) PRIMARY KEY,
id_pelanggan INT(11),
id_mobil INT(11),
id_pegawai INT(11),
tanggal_mulai DATE,
tanggal_selesai DATE,
total_biaya DECIMAL (10,2),
status_transaksi ENUM('selesai', 'belum selesai'),
FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan),
FOREIGN KEY (id_mobil) REFERENCES mobil (id_mobil),
FOREIGN KEY (id_pegawai) REFERENCES pegawai (id_pegawai));

-- Insert data into transaksi table
INSERT INTO transaksi (id_transaksi, id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi) VALUES
(1, 1, 1, 1, '2023-05-01', '2023-05-05', 2500000.00, 'selesai'),
(2, 2, 2, 2, '2023-05-10', '2023-05-15', 3750000.00, 'selesai'),
(3, 3, 3, 3, '2023-05-20', '2023-05-25', 3000000.00, 'belum selesai'),
(4, 4, 4, 4, '2023-05-30', '2023-06-05', 4550000.00, 'belum selesai'),
(5, 5, 5, 5, '2023-06-10', '2023-06-15', 2750000.00, 'selesai');


CREATE TABLE pembayaran (
id_pembayaran INT PRIMARY KEY,
id_transaksi INT(11),
tanggal_pembayaran DATE,
jumlah_pembayaran DECIMAL (10,2),
metode_pembayaran VARCHAR(50),
FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi));

INSERT INTO pembayaran (id_pembayaran, id_transaksi, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran) VALUES
(1, 1, '2023-05-06', 2500000.00, 'Credit Card'),
(2, 2, '2023-05-16', 3750000.00, 'Debit Card'),
(3, 3, '2023-05-26', 3000000.00, 'Cash'),
(4, 4, '2023-06-06', 4550000.00, 'Bank Transfer'),
(5, 5, '2023-06-16', 2750000.00, 'E-Wallet');

-- soal 1

DELIMITER //

CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi = 'selesai' THEN
        UPDATE mobil
        SET STATUS = 'tersedia'
        WHERE id_mobil = NEW.id_mobil;
    END IF;
END //

DELIMITER ;

-- soal 2
CREATE TABLE log_pembayaran (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_transaksi INT NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran DECIMAL(10, 2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL,
    TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pembayaran) REFERENCES pembayaran (id_pembayaran),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi (id_transaksi)
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

-- soal 3
DELIMITER //

CREATE TRIGGER before_insert_transaksi
BEFORE INSERT ON transaksi
FOR EACH ROW
BEGIN
    DECLARE rental_days INT;
    DECLARE daily_rate DECIMAL(10,2);

    -- Calculate the number of rental days
    SET rental_days = DATEDIFF(NEW.tanggal_selesai, NEW.tanggal_mulai);

    -- Get the daily rental rate from the mobil table
    SELECT harga_sewa INTO daily_rate FROM mobil WHERE id_mobil = NEW.id_mobil;

    -- Calculate the total rental cost
    SET NEW.total_biaya = rental_days * daily_rate;
END //

DELIMITER ;

INSERT INTO transaksi (id_transaksi, id_pelanggan, id_mobil, id_pegawai, tanggal_mulai, tanggal_selesai, status_transaksi) VALUES
(8, 1, 2, 3, '2023-05-01', '2023-05-05', 'selesai');

-- soal 4

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


DELIMITER //

CREATE TRIGGER after_delete_transaksi
AFTER DELETE ON transaksi
FOR EACH ROW
BEGIN
    INSERT INTO log_hapus_transaksi (id_transaksi, id_pelanggan, id_mobil, tanggal_mulai, tanggal_selesai, total_biaya)
    VALUES (OLD.id_transaksi, OLD.id_pelanggan, OLD.id_mobil, OLD.tanggal_mulai, OLD.tanggal_selesai, OLD.total_biaya);
END //

DELIMITER ;

DELETE FROM transaksi WHERE id_transaksi = 6;