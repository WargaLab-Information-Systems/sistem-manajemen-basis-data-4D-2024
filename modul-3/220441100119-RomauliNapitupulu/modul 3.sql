CREATE DATABASE db_perpus;
USE db_perpus;
DROP DATABASE db_perpus;
CREATE TABLE tb_anggota (
    idAnggota VARCHAR(10) NOT NULL PRIMARY KEY,
    Nama_Anggota VARCHAR(20) NOT NULL,
    Angkatan_Anggota VARCHAR(6) NOT NULL,
    Tempat_Lahir_Anggota VARCHAR(20) NOT NULL,
    Tanggal_Lahir_Anggota DATE NOT NULL,
    No_Telp VARCHAR(12) NOT NULL,
    Jenis_Kelamin VARCHAR(15) NOT NULL,
    Status_Pinjam VARCHAR(15) NOT NULL
    
);

INSERT INTO tb_anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES 
('1', 'Daniel', '22', 'Porsea', '2003-06-04', 088291847647, 'L', 'Belum'),
('2', 'Jordan', '20', 'Balige', '2024-03-25', 088291847647, 'L', 'Belum'),
('3', 'Alex', '22', 'Toba', '2024-03-17', 088291847647, 'L', 'Sudah'),
('4', 'Refika', '20', 'Sumenep', '2024-03-09', 088291847647, 'Pr', 'Belum'),
('5', 'Erni Puti', '22', 'Lumajang', '2024-03-02', 088291847647, 'Pr', 'Belum'),
('6', 'Romauli', '21', 'Gresik', '2024-03-14', 088291847647, 'Pr', 'Belum'),
('7', 'Agnes', '22', 'Medan', '2024-03-29', 088291847647, 'Pr', 'Belum'),
('8', 'Hotman', '21', 'Medan', '2024-03-22', 088291847647, 'L', 'Sudah'),
('9', 'Benny', '22', 'Sampang', '2024-03-15', 088291847647, 'L', 'Belum'),
('10', 'Clara', '23', 'Medan', '2024-03-24', 088291847647, 'Pr', 'Sudah'),
('11', 'Ernando', '22', 'Surabaya', '2024-03-27', 088291847647, 'L', 'Sudah'),
('12', 'Marselino', '23', 'Sidoarjo', '2024-03-16', 088291847647, 'k', 'Sudah'),
('13', 'Rafael', '20', 'Sidoarjo', '2024-03-19', 088291847647, 'L', 'Belum');

CREATE TABLE buku (
    Kode_Buku VARCHAR(10) NOT NULL PRIMARY KEY,
    Judul_Buku VARCHAR(25) NOT NULL,
    Pengarang_Buku VARCHAR(35) NOT NULL,
    Penerbit_Buku VARCHAR(30) NOT NULL,
    Tahun_Buku VARCHAR(10) NOT NULL,
    Jumlah_Buku VARCHAR(5) NOT NULL,
    Status_Buku VARCHAR(10) NOT NULL,
    Klasifikasi_Buku VARCHAR(20) NOT NULL
);
    
    
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES 
    ('BK001', 'Percakapan Manusia', 'Kiki Boboho', 'Joko Simanjuntak', '2010', '50', 'Tersedia', 'Fiksi'),
    ('BK002', 'Petualangan Sherlock', 'Sir Arthur Conan Doyle', 'Tobing Sitorus', '1892', '20', 'Tersedia', 'Fiksi Detektif'),
    ('BK003', 'Membuat Kue Mudah', 'Baker Betty', 'Ricky Lumban Tobing', '2018', '30', 'Tersedia', 'Non-fiksi Masakan'),
    ('BK004', 'Dasar Fisika Modern', 'Prof. Stephen Hawking', 'Natalia Napitupulu', '2006', '15', 'Tersedia', 'Non-fiksi Ilmiah'),
    ('BK005', 'Sistem Operasi Praktik', 'Dr. Linus Torvalds', 'Siska Sitompul', '1995', '10', 'Dipinjam', 'Non-fiksi Teknologi'),
    ('BK006', 'Belajar Bahasa Inggris', 'John English', 'Andre Tampubolon', '2020', '40', 'Tersedia', 'Non-fiksi Bahasa'),
    ('BK007', 'Resep Makanan Indonesia', 'Chef Indo', 'Dewi Siahaan', '2015', '25', 'Tersedia', 'Non-fiksi Masakan'),
    ('BK008', 'Misteri Gunung', 'Maria Hart', 'Bram Manullang', '2008', '18', 'Tersedia', 'Fiksi Petualangan'),
    ('BK009', 'Pengantar Ekonomi', 'Dr. Adam Smith', 'Dona Sibarani', '2012', '35', 'Tersedia', 'Non-fiksi Ekonomi'),
    ('BK010', 'Dunia Binatang', 'Dr. Jane Goodall', 'Gina Lubis', '2003', '12', 'Tersedia', 'Non-fiksi Alam'),
    ('BK011', 'Sukses Pengusaha Muda', 'Andi Entrepreneur', 'Erick Pakpahan', '2019', '28', 'Tersedia', 'Non-fiksi Bisnis'),
    ('BK012', 'Trik Sulap', 'Master Magic', 'Rika Harahap', '2010', '22', 'Dipinjam', 'Non-fiksi Hiburan'),
    ('BK013', 'Perjalanan Penjelajah', 'Robinson Crusoe', 'Bambang Saragih', '1719', '5', 'Tersedia', 'Fiksi Petualangan');


CREATE TABLE petugas (
    idPetugas VARCHAR(10) NOT NULL PRIMARY KEY,
    Username VARCHAR(15) NOT NULL,
    PASSWORD VARCHAR(15) NOT NULL,
    Nama VARCHAR(25) NOT NULL
);
 
INSERT INTO petugas (idPetugas, Username, PASSWORD, Nama)
VALUES 
    ('14', 'anita', '123456', 'Anita Sari'),
    ('15', 'agus', '234567', 'Agus Prabowo'),
    ('16', 'dewi', '345678', 'Dewi Cahyani'),
    ('17', 'budi', '456789', 'Budi Susanto'),
    ('18', 'siti', '567890', 'Siti Rahayu'),
    ('19', 'joko', '678901', 'Joko Santoso'),
    ('20', 'putri', '789012', 'Putri Anggraini'),
    ('21', 'agus', '890123', 'Agus Wijaya'),
    ('22', 'nova', '901234', 'Nova Puspitasari'),
    ('23', 'rini', '012345', 'Rini Fitriani'),
    ('24', 'andi', '987654', 'Andi Hermawan'),
    ('25', 'lina', '876543', 'Lina Suryani'),
    ('26', 'eko', '765432', 'Eko Nugroho');


CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR(10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR(10) NOT NULL,
    FOREIGN KEY (idAnggota) REFERENCES tb_anggota (idAnggota),
    idPetugas VARCHAR(10) NOT NULL,
    FOREIGN KEY (idPetugas) REFERENCES petugas (idPetugas),
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Kode_Buku VARCHAR(10) NOT NULL,
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);

INSERT INTO peminjaman (Kode_Peminjaman, idAnggota, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES
    ('PM001', '1', '14', '2024-04-01', '2024-04-08', 'BK001'),
    ('PM002', '2', '15', '2024-04-02', '2024-04-09', 'BK002'),
    ('PM003', '3', '16', '2024-04-03', '2024-04-10', 'BK003'),
    ('PM004', '4', '17', '2024-04-04', '2024-04-11', 'BK004'),
    ('PM005', '5', '18', '2024-04-05', '2024-04-12', 'BK005'),
    ('PM006', '6', '19', '2024-04-06', '2024-04-13', 'BK006'),
    ('PM007', '7', '20', '2024-04-07', '2024-04-14', 'BK007'),
    ('PM008', '8', '21', '2024-04-08', '2024-04-15', 'BK008'),
    ('PM009', '9', '22', '2024-04-09', '2024-04-16', 'BK009'),
    ('PM010', '10', '23', '2024-04-10', '2024-04-17', 'BK010'),
    ('PM011', '11', '24', '2024-04-11', '2024-04-18', 'BK011'),
    ('PM012', '12', '25', '2024-04-12', '2024-04-19', 'BK012'),
    ('PM013', '13', '26', '2024-04-13', '2024-04-20', 'BK013');


CREATE TABLE pengembalian (
    Kode_Pengembalian VARCHAR(10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR(10) NOT NULL,
    FOREIGN KEY (idAnggota) REFERENCES tb_anggota (idAnggota),
    Kode_Buku VARCHAR(10) NOT NULL,
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku),
    idPetugas VARCHAR(10) NOT NULL,
    FOREIGN KEY (idPetugas) REFERENCES petugas (idPetugas),
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Denda VARCHAR(15) NOT NULL
);

    
INSERT INTO pengembalian (Kode_Pengembalian, idAnggota, Kode_Buku, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Denda)
VALUES
    ('PG001', '1', 'BK001', '14', '2024-04-08', '2024-04-20', '5000'),
    ('PG002', '6', 'BK006', '19', '2024-04-13', '2024-04-20', '0'),
    ('PG003', '2', 'BK002', '15', '2024-04-09', '2024-04-18', '3000'),
    ('PG004', '7', 'BK007', '20', '2024-04-14', '2024-04-21', '0'),
    ('PG005', '3', 'BK003', '16', '2024-04-10', '2024-04-19', '4000'),
    ('PG006', '8', 'BK008', '21', '2024-04-15', '2024-04-22', '0'),
    ('PG007', '4', 'BK004', '17', '2024-04-11', '2024-04-21', '6000'),
    ('PG008', '9', 'BK009', '22', '2024-04-16', '2024-04-23', '0'),
    ('PG009', '5', 'BK005', '18', '2024-04-12', '2024-04-22', '7000'),
    ('PG010', '10', 'BK010', '23', '2024-04-17', '2024-04-24', '0'),
    ('PG011', '11', 'BK011', '24', '2024-04-18', '2024-04-25', '0'),
    ('PG012', '12', 'BK012', '25', '2024-04-19', '2024-04-26', '0'),
    ('PG013', '13', 'BK013', '26', '2024-04-20', '2024-04-27', '0');

SELECT * FROM tb_anggota;

-1- 
DELIMITER //
CREATE  PROCEDURE search_anggota(IN anggota_id VARCHAR (10))
BEGIN
    SELECT * FROM tb_anggota WHERE idAnggota = anggota_id;
END // 
DELIMITER ;

CALL search_anggota();

-2- 
DELIMITER //
CREATE PROCEDURE search_penerbit_buku(IN PenerbitBuku VARCHAR(30))
BEGIN
   SELECT * FROM buku
   WHERE Penerbit_Buku = PenerbitBuku;
END //
DELIMITER ;

CALL search_penerbit_buku('Tobing Sitorus');

-3-
DELIMITER //
CREATE OR REPLACE PROCEDURE search_tgl_pinjam( 
    IN TanggalPinjam DATE,
    IN KodeBuku VARCHAR (10))
BEGIN
    SELECT * FROM peminjaman
    WHERE Tanggal_Pinjam = TanggalPinjam 
    AND Kode_Buku = KodeBuku;
END //
DELIMITER ; 

CALL search_tgl_pinjam('2024-04-03','BK003');

-4-
DELIMITER //
CREATE PROCEDURE search_angkatan_anggota(
    IN Angkatan VARCHAR (6),
    IN TempatLahir VARCHAR (20),
    IN JenisKelamin VARCHAR (15))
BEGIN
    SELECT * FROM tb_anggota
     WHERE Angkatan_Anggota = Angkatan 
     AND Tempat_Lahir_Anggota = TempatLahir
     AND Jenis_Kelamin = JenisKelamin;
END //
DELIMITER ; 

CALL search_angkatan_anggota('22','Porsea','L');

-5-
DELIMITER //

CREATE OR REPLACE PROCEDURE input_anggota(
    idAnggota VARCHAR(10),
    Nama_Anggota VARCHAR( 20),
    Angkatan_Anggota VARCHAR(6),
    Tempat_Lahir_Anggota VARCHAR(20),
    Tanggal_Lahir_Anggota DATE,
    No_Telp INT(12),
    Jenis_Kelamin VARCHAR(15),
    Status_Pinjam VARCHAR(15))
BEGIN
    INSERT INTO tb_anggota VALUES (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam);
END //

DELIMITER ;

CALL input_anggota('15', 'oki', '23', 'sby', '2003-06-04', 088291847647, 'L', 'Sudah');
SELECT * FROM tb_anggota;


-6-
DELIMITER //
CREATE PROCEDURE get_jumlah_anggota(
    OUT jumlah_anggota INT)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota FROM tb_anggota;
END //
DELIMITER ;
 
CALL get_jumlah_anggota(@total_anggota);  
SELECT @total_anggota AS TotalAnggota;

-7-
DELIMITER //
CREATE OR REPLACE PROCEDURE jumlah_buku(
    IN NamaPengarang VARCHAR (35),
    INOUT tahunTerbit VARCHAR (10),
    OUT totalBuku INT
    
    )
BEGIN
    SELECT COUNT(*) INTO totalBuku
    FROM buku
    WHERE Pengarang_Buku = NamaPengarang 
    AND Tahun_Buku = tahunTerbit;
		
END //
DELIMITER ; 

SET @tahunTerbit = '2010';
CALL jumlah_buku('Kiki Boboho' , @totalBuku, @tahunTerbit);
SELECT @totalBuku AS totalbuku;
SELECT * FROM buku;