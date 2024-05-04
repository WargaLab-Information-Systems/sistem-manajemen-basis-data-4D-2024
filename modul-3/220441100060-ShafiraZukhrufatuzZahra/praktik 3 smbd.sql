CREATE database db_modul3;
USE db_modul3;

CREATE TABLE petugas (
    IdPetugas VARCHAR(10) PRIMARY KEY,
    Username VARCHAR(15) NOT NULL,
    Password VARCHAR(15) NOT NULL,
    Nama VARCHAR(25) NOT NULL
);
DESC petugas;

INSERT INTO petugas (IdPetugas, Username, Password, Nama) VALUES
('P001', 'petugas1', 'petugas01', 'Budi'),
('P002', 'petugas2', 'petugas02', 'Andi'),
('P003', 'petugas3', 'petugas03', 'Cici'),
('P004', 'petugas4', 'petugas04', 'Dedi'),
('P005', 'petugas5', 'petugas05', 'Evi'),
('P006', 'petugas6', 'petugas06', 'Fani'),
('P007', 'petugas7', 'petugas07', 'Gani'),
('P008', 'petugas8', 'petugas08', 'Hani'),
('P009', 'petugas9', 'petugas09', 'Imi'),
('P010', 'petugas10', 'petugas10', 'Joni');
SELECT * FROM petugas;

CREATE TABLE buku (
    Kode_Buku VARCHAR(10) PRIMARY KEY,
    Judul_Buku VARCHAR(25) NOT NULL,
    Pengarang_Buku VARCHAR(30) NOT NULL,
    Penerbit_Buku VARCHAR(30) NOT NULL,
    Tahun_Buku VARCHAR(10) NOT NULL,
    Jumlah_Buku VARCHAR(5) NOT NULL,
    Status_Buku VARCHAR(10) NOT NULL,
    Klasifikasi_Buku VARCHAR(20) NOT NULL
);
DESC buku;
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES
('B001', 'The Firm', 'John Grisham', 'Gramedia', '2000', 5, 'Tersedia', 'Fiksi'),
('B002', 'The Alchemist', 'Paulo Coelho', 'Gramedia Pustaka Utama', '2004', 3, 'Dipinjam', 'Self-help'),
('B003', 'The Da Vinci Code', 'Dan Brown', 'Penerbit Mizan', '2003', 7, 'Tersedia', 'Misteri'),
('B004', 'Harry Potter', 'J.K. Rowling', 'Bloomsbury', '1997', 10, 'Tersedia', 'Fiksi'),
('B005', 'Fifty Shades of Grey', 'E.L. James', 'Vintage Books', '2011', 2, 'Dipinjam', 'Romance'),
('B006', 'The Kite Runner', 'Khaled Hosseini', 'Riverhead Books', '2003', 4, 'Tersedia', 'Fiksi'),
('B007', 'To Kill a Mockingbird', 'Harper Lee', 'HarperCollins', '1960', 8, 'Tersedia', 'Fiksi'),
('B008', 'Pride and Prejudice', 'Jane Austen', 'Penguin Classics', '1813', 6, 'Tersedia', 'Roman'),
('B009', 'Animal Farm', 'George Orwell', 'Secker & Warburg', '1945', 9, 'Tersedia', 'Fiksi'),
('B010', 'Crime and Punishment', 'Fyodor Dostoevsky', 'Everymans Library', '1866', 1, 'Dipinjam', 'Fiksi');
SELECT * FROM buku;

CREATE TABLE anggota(
    IdAnggota VARCHAR(10) PRIMARY KEY,
    Nama_Anggota VARCHAR(20) NOT NULL,
    Angkatan_Anggota VARCHAR(6) NOT NULL,
    Tempat_Lahir_Anggota VARCHAR(20) NOT NULL,
    Tanggal_Lahir_Anggota DATE NOT NULL,
    No_Telp VARCHAR(12) NOT NULL,
    Jenis_Kelamin VARCHAR(15) NOT NULL,
    Status_Pinjam VARCHAR(15) NOT NULL
);
DESC anggota;


INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) 
VALUES 
('A001', 'Ahmad Abdullah', '2017', 'Medan', '1996-08-28', 0852223334, 'Laki-laki', 'Aktif'),
('A002', 'Dewi Suryani', '2020', 'Surabaya', '1999-02-14', 0858887776, 'Perempuan', 'Tidak Aktif'),
('A003', 'Rudi Hermawan', '2019', 'Semarang', '1998-07-07', 0858889992, 'Laki-laki', 'Aktif'),
('A004', 'Siti Nurlela', '2018', 'Bandung', '1997-11-30', 0854443330, 'Perempuan', 'Aktif'),
('A005', 'Budi Santoso', '2021', 'Surabaya', '2000-04-18', 0854445558, 'Laki-laki', 'Tidak Aktif'),
('A006', 'Rina Sari', '2016', 'Jakarta', '1995-10-05', 0853334446, 'Perempuan', 'Aktif'),
('A007', 'Fauzi Akbar', '2020', 'Bandung', '1999-03-22', 0857776664, 'Laki-laki', 'Aktif'),
('A008', 'Diana Putri', '2017', 'Yogyakarta', '1996-12-15', 0855554442, 'Perempuan', 'Tidak Aktif'),
('A009', 'Anton Gunawan', '2019', 'Surabaya', '1998-06-10', 0855556660, 'Laki-laki', 'Aktif'),
('A010', 'Rina Fitriani', '2018', 'Medan', '1997-01-25', 0853334448, 'Perempuan', 'Aktif');
SELECT * FROM anggota;

CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10) NOT NULL,
    IdPetugas VARCHAR(10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Kode_Buku VARCHAR(10) NOT NULL,
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);
DESC peminjaman;

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) 
VALUES 
('PJ001', 'A001', 'P001', '2024-04-01', '2024-04-10', 'B001'),
('PJ002', 'A002', 'P002', '2024-04-02', '2024-04-11', 'B002'),
('PJ003', 'A003', 'P003', '2024-04-03', '2024-04-12', 'B003'),
('PJ004', 'A004', 'P004', '2024-04-04', '2024-04-13', 'B004'),
('PJ005', 'A005', 'P005', '2024-04-05', '2024-04-14', 'B005'),
('PJ006', 'A006', 'P006', '2024-04-06', '2024-04-15', 'B006'),
('PJ007', 'A007', 'P007', '2024-04-07', '2024-04-16', 'B007'),
('PJ008', 'A008', 'P008', '2024-04-08', '2024-04-17', 'B008'),
('PJ009', 'A009', 'P009', '2024-04-09', '2024-04-18', 'B009'),
('PJ010', 'A010', 'P010', '2024-04-10', '2024-04-19', 'B010');
SELECT * FROM peminjaman;

CREATE TABLE pengembalian (
    Kode_Kembali VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10) NOT NULL,
    Kode_Buku VARCHAR(10) NOT NULL,
    IdPetugas VARCHAR(10) NOT NULL,
    Tgl_Pinjam DATE NOT NULL,
    Tgl_Kembali DATE NOT NULL,
    Denda VARCHAR(15) NOT NULL,
    FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
    FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);
DESC pengembalian;

INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) 
VALUES 
('PK001', 'A001', 'B001', 'P001', '2024-04-01', '2024-04-10', '0'),
('PK002', 'A002', 'B002', 'P002', '2024-04-02', '2024-04-11', '0'),
('PK003', 'A003', 'B003', 'P003', '2024-04-03', '2024-04-12', '0'),
('PK004', 'A004', 'B004', 'P004', '2024-04-04', '2024-04-13', '0'),
('PK005', 'A005', 'B005', 'P005', '2024-04-05', '2024-04-14', '0'),
('PK006', 'A006', 'B006', 'P006', '2024-04-06', '2024-04-15', '0'),
('PK007', 'A007', 'B007', 'P007', '2024-04-07', '2024-04-16', '0'),
('PK008', 'A008', 'B008', 'P008', '2024-04-08', '2024-04-17', '0'),
('PK009', 'A009', 'B009', 'P009', '2024-04-09', '2024-04-18', '0'),
('PK010', 'A010', 'B010', 'P010', '2024-04-10', '2024-04-19', '0');
SELECT * FROM pengembalian;


-- SOAL PRAKTIKUM
-- NOMOR 1
DELIMITER //
CREATE PROCEDURE search_anggota(IN id VARCHAR(5))
BEGIN 
	SELECT * FROM anggota
    WHERE IdAnggota = id;
END //
DELIMITER ;
CALL search_anggota('A005');

-- NOMOR 2
DELIMITER //
CREATE PROCEDURE sp_CariBukuBerdasarkanPenerbit
	(IN namaPenerbit VARCHAR(50))
BEGIN
    SELECT *
    FROM Buku
    WHERE Penerbit_Buku = namaPenerbit;
END //
DELIMITER ;
CALL sp_CariBukuBerdasarkanPenerbit('Bloomsbury'); 
DROP PROCEDURE sp_CariBukuBerdasarkanPenerbit;

-- NOMOR 3
DELIMITER //
CREATE PROCEDURE sp_PeminjamanTanggalPinjamKodeBuku
	(IN tanggalPinjam DATE, kodeBuku VARCHAR(10))
BEGIN
    SELECT *
    FROM Peminjaman
    WHERE Tanggal_Pinjam = tanggalPinjam
          AND Kode_Buku = kodeBuku;
END //
DELIMITER ;
CALL sp_PeminjamanTanggalPinjamKodeBuku('2024-04-01', 'B001');

-- NOMOR 4
DELIMITER //
CREATE PROCEDURE sp_CariAnggotaAngkatanTempatJenisKelamin
	(IN angkatan INT, tempatLahir VARCHAR(50), jenisKelamin VARCHAR(10))
BEGIN
	SELECT *
    FROM anggota
    WHERE Angkatan_Anggota = angkatan
          AND Tempat_Lahir_Anggota = tempatLahir
          AND Jenis_Kelamin = jenisKelamin;
END //
DELIMITER ;
CALL sp_CariAnggotaAngkatanTempatJenisKelamin('2018', 'Bandung', 'Perempuan');

--  NOMOR 5
DELIMITER //
CREATE PROCEDURE sp_TambahAnggota(
	IN IdAnggota VARCHAR(10),
	IN namaAnggota VARCHAR(50), 
    IN angkatan VARCHAR(6),
    IN tempatLahir VARCHAR(50), 
    IN tanggalLahir DATE, 
    IN noTelpAnggota VARCHAR(20),
    IN jenisKelamin VARCHAR(10),
    IN statusPinjam VARCHAR(10))
BEGIN
    INSERT INTO anggota
    VALUES (IdAnggota, namaAnggota, angkatan, tempatLahir,
    tanggalLahir, noTelpAnggota, jenisKelamin, statusPinjam);
END //
DELIMITER ;
CALL sp_TambahAnggota('A011', 'Shafira', '2022', 'Gresik', '2004-11-16', 0856664441, 'Perempuan', 'Aktif');
SELECT * FROM anggota;

-- NOMOR 6
DELIMITER //
CREATE PROCEDURE usp_HitungJumlahAnggota(
	OUT jumlahAnggota INT)
BEGIN
    SELECT COUNT(*) 
    INTO jumlahAnggota
    FROM anggota;
END //
DELIMITER ; 
CALL usp_HitungJumlahAnggota(@jumlahAnggota);
SELECT @jumlahAnggota;

-- NOMOR 7
DELIMITER //
CREATE PROCEDURE data_jmlBuku(
	IN pengarang VARCHAR(50),
    IN tahun INT(5),
    OUT jumlah INT(3))
BEGIN
	SELECT COUNT(*)
    INTO jumlah
    FROM buku WHERE Pengarang_Buku = pengarang
    AND Tahun_Buku = tahun;
END //
DELIMITER ; 
SET @pengarang = 'Paulo Coelho';
SET @tahun = '2004';
CALL data_jmlBuku (@pengarang, @tahun, @jumlah);
SELECT @pengarang, @tahun, @jumlah;
