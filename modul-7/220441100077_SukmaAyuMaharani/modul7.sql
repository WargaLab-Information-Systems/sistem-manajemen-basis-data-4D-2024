// SUKMA AYU MAHARANI
// 220441100077
//SISTEM MANAJEMEN BASIS DATA - 4D

create database db_mobil;
use db_mobil;



create table mobil(
	id_mobil int(11) primary key,
    merk varchar (50),
    model varchar (50),
    tahun int(11),
    warna varchar(20),
    harga_sewa decimal(10,2),
    status enum('Ada', 'Belum'));
    
create table pelanggan (
	id_pelanggan int(11) primary key,
    nama varchar(100),
    alamat text,
    no_telpon varchar(15),
    email varchar(50));
    
create table pegawai (
	id_pegawai int(11) primary key,
    nama varchar(100),
    jabatan varchar(50),
    no_telpon varchar(15),
    email varchar(50));
    
create table perawatan(
	id_perawatan int (11) primary key,
	tanggal date,
    deskripsi text,
    biaya decimal(10,2),
    id_mobil int(11),
	foreign key (id_mobil) references mobil(id_mobil)
);

CREATE TABLE transaksi (
    id_transaksi INT(11) PRIMARY KEY,
    tanggal_mulai DATE,
    tanggal_selesai DATE,
    total_biaya DECIMAL(10,2),
    status_transaksi ENUM('Selesai', 'Belum'),
    id_pelanggan INT(11),
    id_mobil INT(11),
    id_pegawai INT(11),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_mobil) REFERENCES mobil(id_mobil),
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
);

create table pembayaran (
	id_pembayaran int(11) primary key,
    tanggal_pembayaran date,
    jumlah_pembayaran decimal(10,2),
    metode_pembayaran varchar(50),
    id_transaksi int(11),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi));

INSERT INTO mobil (id_mobil, merk, model, tahun, warna, harga_sewa, status) VALUES
(1, 'Toyota', 'Avanza', 2020, 'Hitam', 500000.00, 'Ada'),
(2, 'Honda', 'Civic', 2019, 'Putih', 700000.00, 'Ada'),
(3, 'Suzuki', 'Ertiga', 2018, 'Merah', 450000.00, 'Ada'),
(4, 'Mitsubishi', 'Pajero', 2021, 'Silver', 1000000.00, 'Ada'),
(5, 'Nissan', 'Juke', 2017, 'Biru', 600000.00, 'Ada');


INSERT INTO pelanggan (id_pelanggan, nama, alamat, no_telpon, email) VALUES
(1, 'Budi Santoso', 'Jl. Merdeka No.1, Jakarta', '081234567890', 'budi@example.com'),
(2, 'Siti Aminah', 'Jl. Sudirman No.2, Bandung', '082345678901', 'siti@example.com'),
(3, 'Andi Wijaya', 'Jl. Gajah Mada No.3, Surabaya', '083456789012', 'andi@example.com'),
(4, 'Rina Sari', 'Jl. Gatot Subroto No.4, Medan', '084567890123', 'rina@example.com'),
(5, 'Eko Prasetyo', 'Jl. Diponegoro No.5, Yogyakarta', '085678901234', 'eko@example.com');

INSERT INTO pegawai (id_pegawai, nama, jabatan, no_telpon, email) VALUES
(1, 'Ali Akbar', 'Manager', '081234567891', 'ali@example.com'),
(2, 'Dewi Lestari', 'Admin', '082345678902', 'dewi@example.com'),
(3, 'Fajar Nugroho', 'Staff', '083456789013', 'fajar@example.com'),
(4, 'Gita Anggraini', 'Supervisor', '084567890124', 'gita@example.com'),
(5, 'Hendra Kusuma', 'Driver', '085678901235', 'hendra@example.com');

INSERT INTO perawatan (id_perawatan, tanggal, deskripsi, biaya, id_mobil) VALUES
(1, '2024-01-10', 'Ganti oli', 300000.00, 1),
(2, '2024-02-15', 'Servis mesin', 750000.00, 2),
(3, '2024-03-20', 'Ganti ban', 400000.00, 3),
(4, '2024-04-25', 'Perbaikan AC', 500000.00, 4),
(5, '2024-05-30', 'Pengecatan ulang', 1200000.00, 5);

INSERT INTO transaksi (id_transaksi, tanggal_mulai, tanggal_selesai, total_biaya, status_transaksi, id_pelanggan, id_mobil, id_pegawai) VALUES
(1, '2024-05-01', '2024-05-05', 2000000.00, 'Belum', 1, 1, 1),
(2, '2024-05-02', '2024-05-06', 2800000.00, 'Selesai', 2, 2, 2),
(3, '2024-05-03', '2024-05-07', 1800000.00, 'Selesai', 3, 3, 3),
(4, '2024-05-04', '2024-05-08', 4000000.00, 'Selesai', 4, 4, 4),
(5, '2024-05-05', '2024-05-09', 2400000.00, 'Belum', 5, 5, 5);

INSERT INTO pembayaran (id_pembayaran, tanggal_pembayaran, jumlah_pembayaran, metode_pembayaran, id_transaksi) VALUES
(1, '2024-05-01', 2000000.00, 'Transfer Bank', 1),
(2, '2024-05-03', 1400000.00, 'Kartu Kredit', 2),
(3, '2024-05-04', 1800000.00, 'Tunai', 3),
(4, '2024-05-05', 4000000.00, 'Transfer Bank', 4),
(5, '2024-05-07', 1200000.00, 'Kartu Kredit', 5);

-- Create the trigger
DELIMITER $$

CREATE TRIGGER after_update_transaksi
AFTER UPDATE ON transaksi
FOR EACH ROW
BEGIN
    IF NEW.status_transaksi = 'Selesai' THEN
        UPDATE mobil
        SET status = 'Ada'
        WHERE id_mobil = NEW.id_mobil;
    END IF;
END $$

DELIMITER ;

-- Perform the update to trigger the action
UPDATE transaksi
SET status_transaksi = 'Selesai'
WHERE id_transaksi = 1;

-- Verify the update
SELECT * FROM mobil;
select * from transaksi




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





    

    