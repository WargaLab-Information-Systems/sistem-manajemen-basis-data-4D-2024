CREATE DATABASE perpusprak
USE perpusprak

CREATE OR REPLACE TABLE petugas (
idPetugas VARCHAR (10) NOT NULL PRIMARY KEY,
 Username VARCHAR (15) NOT NULL, 
 Passsword VARCHAR (15) NOT NULL, 
 Nama VARCHAR (25) NOT NULL)
 
INSERT INTO petugas(idPetugas, Username, Passsword, Nama)
VALUES 
    (1, 'user1', 'pass1', 'John Doe'),
    (2, 'user2', 'pass2', 'Jane Smith'),
    (3, 'user3', 'pass3', 'Michael Johnson'),
    (4, 'user4', 'pass4', 'Emily Brown'),
    (5, 'user5', 'pass5', 'David Wilson'),
    (6, 'user6', 'pass6', 'Sarah Martinez'),
    (7, 'user7', 'pass7', 'Daniel Anderson'),
    (8, 'user8', 'pass8', 'Lisa Taylor'),
    (9, 'user9', 'pass9', 'Matthew Thomas'),
    (10, 'user10', 'pass10', 'Laura Garcia');

 
 
 CREATE OR REPLACE TABLE anggota (
    idAnggota VARCHAR (10) NOT NULL PRIMARY KEY,
    Nama_Anggota VARCHAR (20) NOT NULL,
    Angkatan_Anggota VARCHAR (6) NOT NULL,
    Tempat_Lahir_Anggota VARCHAR (20) NOT NULL,
    Tanggal_Lahir_Anggota DATE NOT NULL,
    No_Telp VARCHAR(12) NOT NULL,
    Jenis_Kelamin VARCHAR (15) NOT NULL,
    Status_Pinjam VARCHAR (15) NOT NULL
    )
    
INSERT INTO anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES 
    (1, 'John Doe', '2018', 'Jakarta', '2000-01-01', '08123456789', 'Laki-laki', 'Tidak Meminjam'),
    (2, 'Jane Smith', '2019', 'Bandung', '2001-02-02', '08234567890', 'Perempuan', 'Meminjam'),
    (3, 'Michael Johnson', '2020', 'Surabaya', '1999-03-03', '08345678901', 'Laki-laki', 'Tidak Meminjam'),
    (4, 'Emily Brown', '2021', 'Semarang', '1998-04-04', '08456789012', 'Perempuan', 'Meminjam'),
    (5, 'David Wilson', '2017', 'Yogyakarta', '1997-05-05', '08567890123', 'Laki-laki', 'Tidak Meminjam'),
    (6, 'Sarah Martinez', '2016', 'Malang', '1996-06-06', '08678901234', 'Perempuan', 'Meminjam'),
    (7, 'Daniel Anderson', '2015', 'Solo', '1995-07-07', '08789012345', 'Laki-laki', 'Tidak Meminjam'),
    (8, 'Lisa Taylor', '2014', 'Palembang', '1994-08-08', '08890123456', 'Perempuan', 'Meminjam'),
    (9, 'Matthew Thomas', '2013', 'Medan', '1993-09-09', '08901234567', 'Laki-laki', 'Tidak Meminjam'),
    (10, 'Laura Garcia', '2012', 'Padang', '1992-10-10', '08912345678', 'Perempuan', 'Meminjam');


CREATE OR REPLACE TABLE buku (
Kode_Buku VARCHAR (10) NOT NULL PRIMARY KEY,
Judul_Buku VARCHAR (25) NOT NULL,
Pengarang_Buku VARCHAR (30)NOT NULL,
Penerbit_Buku VARCHAR (30) NOT NULL,
Tahun_Buku VARCHAR (10) NOT NULL,
Jumlah_Buku VARCHAR (5) NOT NULL, 
Status_Buku VARCHAR (10)NOT NULL,
Klasifikasi_Buku VARCHAR (20) NOT NULL
)
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES 
    ('BK001', 'Percy Jackson & the Olympians: The Lightning Thief', 'Rick Riordan', 'Disney Hyperion', '2005', '5', 'Tersedia', 'Fiksi Fantasi'),
    ('BK002', 'To Kill a Mockingbird', 'Harper Lee', 'J. B. Lippincott & Co.', '1960', '3', 'Tersedia', 'Fiksi Klasik'),
    ('BK003', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '4', 'Tersedia', 'Fiksi Klasik'),
    ('BK004', 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', '1937', '6', 'Tersedia', 'Fiksi Fantasi'),
    ('BK005', 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Bloomsbury', '1997', '7', 'Tersedia', 'Fiksi Fantasi'),
    ('BK006', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons', '1925', '2', 'Tersedia', 'Fiksi Klasik'),
    ('BK007', '1984', 'George Orwell', 'Secker & Warburg', '1949', '5', 'Tersedia', 'Fiksi Ilmiah'),
    ('BK008', 'Brave New World', 'Aldous Huxley', 'Chatto & Windus', '1932', '3', 'Tersedia', 'Fiksi Ilmiah'),
    ('BK009', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', '1954', '4', 'Tersedia', 'Fiksi Fantasi'),
    ('BK010', 'Animal Farm', 'George Orwell', 'Secker & Warburg', '1945', '6', 'Tersedia', 'Fiksi Politik');



 CREATE OR REPLACE TABLE peminjaman (
 Kode_Peminjaman VARCHAR (10)NOT NULL PRIMARY KEY, 
 IdAnggota VARCHAR (10)NOT NULL,
 IdPetugas VARCHAR (10) NOT NULL,
 Tanggal_Pinjam DATE NOT NULL,
 Tanggal_Kembali DATE NOT NULL,
 Kode_Buku VARCHAR (10) NOT NULL
 )
INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES 
    ('PIN001', 1, 1, '2024-04-01', '2024-04-15', 'BK001'),
    ('PIN002', 2, 2, '2024-04-02', '2024-04-16', 'BK002'),
    ('PIN003', 3, 3, '2024-04-03', '2024-04-17', 'BK003'),
    ('PIN004', 4, 4, '2024-04-04', '2024-04-18', 'BK004'),
    ('PIN005', 5, 5, '2024-04-05', '2024-04-19', 'BK005'),
    ('PIN006', 6, 6, '2024-04-06', '2024-04-20', 'BK006'),
    ('PIN007', 7, 7, '2024-04-07', '2024-04-21', 'BK007'),
    ('PIN008', 8, 8, '2024-04-08', '2024-04-22', 'BK008'),
    ('PIN009', 9, 9, '2024-04-09', '2024-04-23', 'BK009'),
    ('PIN010', 10, 10, '2024-04-10', '2024-04-24', 'BK010');


CREATE OR REPLACE TABLE pengembalian (
    Kode_Pengembalian VARCHAR (10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR (10) NOT NULL,
    Kode_Buku VARCHAR (10) NOT NULL,
    idPetugas VARCHAR (10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Denda VARCHAR (15) NOT NULL
    )
INSERT INTO pengembalian (Kode_Pengembalian, idAnggota, Kode_Buku, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Denda)
VALUES 
    ('PGK001', 1, 'BK001', 1, '2024-04-01', '2024-04-15', 0),
    ('PGK002', 2, 'BK002', 2, '2024-04-02', '2024-04-16', 0),
    ('PGK003', 3, 'BK003', 3, '2024-04-03', '2024-04-17', 0),
    ('PGK004', 4, 'BK004', 4, '2024-04-04', '2024-04-18', 0),
    ('PGK005', 5, 'BK005', 5, '2024-04-05', '2024-04-19', 0),
    ('PGK006', 6, 'BK006', 6, '2024-04-06', '2024-04-20', 0),
    ('PGK007', 7, 'BK007', 7, '2024-04-07', '2024-04-21', 0),
    ('PGK008', 8, 'BK008', 8, '2024-04-08', '2024-04-22', 0),
    ('PGK009', 9, 'BK009', 9, '2024-04-09', '2024-04-23', 0),
    ('PGK010', 10, 'BK010', 10, '2024-04-10', '2024-04-24', 0);



DELIMITER //
CREATE PROCEDURE TampilBuku()
BEGIN
    SELECT *
    FROM buku;
END//
DELIMITER ;

CALL TampilBuku()

DELIMITER //
CREATE PROCEDURE GetPengembalianByKodeBuku(
    IN p_Kode_Buku VARCHAR(10))
BEGIN
    SELECT *
    FROM pengembalian
    WHERE Kode_Buku = p_Kode_Buku;
END//
DELIMITER ;

CALL GetPengembalianByKodeBuku('B001')



DELIMITER //
CREATE PROCEDURE GetAnggotaByAngkatanJenisKelamin(
    IN p_Angkatan VARCHAR(6),
    IN p_Jenis_Kelamin VARCHAR(15)
)
BEGIN
    SELECT *
    FROM anggota
    WHERE Angkatan_Anggota = p_Angkatan AND Jenis_Kelamin = p_Jenis_Kelamin;
END//
DELIMITER ;

CALL GetAnggotaByAngkatanJenisKelamin ('2018', 'Perempuan')

DELIMITER //
CREATE PROCEDURE GetBukuPPT(
	IN p_Pengarang VARCHAR (30),
	IN p_penerbit VARCHAR (30),
	IN p_thnterbit VARCHAR (10)
)
BEGIN 
	SELECT *
	FROM buku
	WHERE Pengarang_Buku = p_Pengarang
	AND Penerbit_Buku = p_penerbit
	AND Tahun_Buku = p_thnterbit;
END//
DELIMITER;
CALL GetBukuPPT ('Ahmad Basuki', 'Gramedia Pustaka Utama', '2010')


DELIMITER //
CREATE PROCEDURE input_buku (
    IN p_Kode_Buku VARCHAR(10),
    IN p_Judul_Buku VARCHAR(25),
    IN p_Pengarang_Buku VARCHAR(30),
    IN p_Penerbit_Buku VARCHAR(30),
    IN p_Tahun_Buku VARCHAR(10),
    IN p_Jumlah_Buku VARCHAR(5),
    IN p_Status_Buku VARCHAR(10),
    IN p_Klasifikasi_Buku VARCHAR(20)
)
BEGIN 
    INSERT INTO buku VALUES (p_Kode_Buku, p_Judul_Buku, p_Pengarang_Buku, p_Penerbit_Buku, p_Tahun_Buku, p_Jumlah_Buku, p_Status_Buku, p_Klasifikasi_Buku);
END //
DELIMITER ;

CALL input_buku('B0', 'Sejarah Indonesia', 'Ahmad Basuki', 'Gramedia Pustaka Utama', '2010', '100', 'Tersedia', 'Sejarah');
SELECT*FROM buku



DELIMITER //
CREATE PROCEDURE get_jumlah_buku(
    OUT jumlah_buku INT
)
BEGIN 
    SELECT COUNT(*) 
    INTO jumlah_buku 
    FROM buku;
END //
DELIMITER ;
CALL get_jumlah_buku(@jumlah);
SELECT @jumlah AS Jumlah_Buku;


DELIMITER //

CREATE PROCEDURE GetJumlahAnggotaByAngkatanJenisKelamin(
    IN p_Angkatan VARCHAR(6),
    IN p_Jenis_Kelamin VARCHAR(15),
    INOUT p_JumlahAnggota INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_JumlahAnggota
    FROM anggota
    WHERE Angkatan_Anggota = p_Angkatan AND Jenis_Kelamin = p_Jenis_Kelamin;
END //

DELIMITER ;
SET @jumlahAnggota = 0;
CALL GetJumlahAnggotaByAngkatanJenisKelamin('2018', 'Laki-laki', @jumlahAnggota);
SELECT @jumlahAnggota AS Jumlah_Anggota;
