CREATE DATABASE db_perpus;
USE db_perpus;
DROP DATABASE db_perpus;

CREATE TABLE tb_anggota (
    idAnggota VARCHAR (10) NOT NULL PRIMARY KEY,
    Nama_Anggota VARCHAR (20) NOT NULL,
    Angkatan_Anggota VARCHAR (6) NOT NULL,
    Tempat_Lahir_Anggota VARCHAR (20) NOT NULL,
    Tanggal_Lahir_Anggota DATE NOT NULL,
    No_Telp INT (12) NOT NULL,
    Jenis_Kelamin VARCHAR (15) NOT NULL,
    Status_Pinjam VARCHAR (15) NOT NULL
    );

INSERT INTO tb_anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES 
('1', 'Oxa', '22', 'Sidoarjo', '2004-01-07', 088217088262, 'Laki-Laki', 'Belum'),
('2', 'Naela', '22', 'Sidoarjo', '2003-06-29', 088217088262, 'Perempuan', 'Belum'),
('3', 'Amel', '22', 'Sampang', '2004-07-19', 088217088262, 'Perempuan', 'Sudah'),
('4', 'Roma', '22', 'Medan', '2003-02-14', 088217088262, 'Perempuan', 'Sudah'),
('5', 'Tesa', '22', 'Medan', '2003-03-20', 088217088262, 'Perempuan', 'Belum'),
('6', 'Dwi', '22', 'Lumajang', '2004-12-18', 088217088262, 'Perempuan', 'Belum'),
('7', 'Dela', '22', 'Sidoarjo', '2003-07-30', 088217088262, 'Perempuan', 'Sudah'),
('8', 'Ninis', '22', 'Sampang', '2004-05-27', 088217088262, 'Perempuan', 'Sudah'),
('9', 'Bintang', '22', 'Sidoarjo', '2003-06-28', 088217088262, 'Laki-laki', 'Belum'),
('10', 'Angga', '22', 'Bangkalan', '2004-07-02', 088217088262, 'Laki-laki', 'Belum'),
('11', 'Imam', '22', 'Bangkalan', '2003-09-29', 088217088262, 'Laki-Laki', 'Sudah'),
('12', 'Sulthon', '22', 'Sampang', '2004-11-11', 088217088262, 'Laki-Laki', 'Sudah'),
('13', 'Sipak', '22', 'Bojonegoro', '2003-01-24', 088217088262, 'Laki-Laki', 'Belum');

CREATE TABLE buku (
    Kode_Buku VARCHAR (10) NOT NULL PRIMARY KEY,
    Judul_Buku VARCHAR (25) NOT NULL,
    Pengarang_Buku VARCHAR (35) NOT NULL,
    Penerbit_Buku VARCHAR (30) NOT NULL,
    Tahun_Buku VARCHAR (10) NOT NULL,
    Jumlah_Buku VARCHAR (5) NOT NULL,
    Status_Buku VARCHAR (10) NOT NULL,
    Klasifikasi_Buku VARCHAR (20) NOT NULL
    );
    
    
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES 
('111', 'Tentang Kamu', 'Cotel', 'Nadia', '2019', '20', 'Ada', 'Fiksi'),
('222', 'Dilan 1990', 'Uliyah', 'Nafisa', '2017', '17', 'Habis', 'Cinta'),
('333', 'Pertaruhan', 'Dela', 'Yani', '2020', '27', 'Ada', 'Action'),
('444', 'Soekarno', 'Roma', 'Tesa', '2021', '30', 'Habis', 'Sejarah'),
('555', 'Cinta Yang Hilang', 'Ninis', 'Bintang', '2018', '25', 'Habis', 'Cinta'),
('666', 'Katarsis', 'Irfan', 'Cotel', '2023', '18', 'Ada', 'Fiksi'),
('777', 'Bj Habibie', 'Tesa', 'Roma', '2024', '15', 'Ada', 'Sejarah'),
('888', 'Bumi', 'Viko', 'Tesa', '2010', '9', 'Habis', 'Fiksi'),
('999', 'Terdidik', 'Sipak', 'Oxa', '2015', '19', 'Habis', 'Santai'),
('989', 'Koala Kumal', 'Sulton', 'Imam', '2017', '23', 'Ada', 'Fiksi'),
('889', 'Lawu', 'Naela', 'Oxa', '2019', '28', 'Habis', 'Sejarah'),
('787', 'Gila Dengan Cintanya', 'Oxa', 'Naela', '2020', '30', 'Ada', 'Cinta'),
('676', '10 November', 'Amel', 'Dwi', '2024', '15', 'Ada', 'Sejarah');

CREATE TABLE petugas (
	idPetugas VARCHAR (10) NOT NULL PRIMARY KEY,
    Username VARCHAR (15) NOT NULL,
    PASSWORD VARCHAR (15) NOT NULL,
    Nama VARCHAR (25) NOT NULL
    );
    
INSERT INTO petugas (idPetugas, Username, PASSWORD, Nama)
VALUES 
('71', 'Ernando', '123', 'Ernando Ari'),
('72', 'Nathan', '234', 'Nathan Joe A On'),
('73', 'Rizky', '345', 'Rizky Ridho'),
('74', 'Arhan', '456', 'Pratama Arhan'),
('75', 'Azizah', '567', 'Azizah'),
('76', 'Sananta', '678', 'Ramadhan Sananta'),
('77', 'Asep', '789', 'Asep Diamond'),
('78', 'Tesa', '891', 'Tesa Putri Hutagaol'),
('79', 'Roma', '912', 'Romauli Napitupulu'),
('80', 'Viko', '101', 'Viko Alfian P'),
('81', 'Izud', '102', 'M. Izuddin Arafat'),
('82', 'Naela', '103', 'Naela Nahdiah'),
('83', 'Oxa', '107', 'Oxa Indi Vixzio');

CREATE TABLE peminjaman (
	Kode_Peminjaman VARCHAR (10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR (10) NOT NULL,
    idPetugas VARCHAR (10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Kode_Buku VARCHAR (10) NOT NULL
    );
    
INSERT INTO peminjaman (Kode_Peminjaman, idAnggota, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES
('1','1','71','2024-04-12','2024-05-22','111'),
('2','2','72','2024-04-11','2024-05-21','222'),
('3','3','73','2024-04-13','2024-05-23','333'),
('4','4','74','2024-04-14','2024-05-24','444'),
('5','5','75','2024-04-15','2024-05-25','555'),
('6','6','76','2024-04-16','2024-05-26','666'),
('7','7','77','2024-04-17','2024-05-27','777'),
('8','8','78','2024-04-18','2024-05-28','888'),
('9','9','79','2024-04-19','2024-05-29','999'),
('10','10','80','2024-04-20','2024-05-30','989'),
('11','11','81','2024-04-21','2024-05-31','889'),
('12','12','82','2024-04-22','2024-06-01','787');

CREATE TABLE pengembalian (
	Kode_Pengembalian VARCHAR (10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR (10) NOT NULL,
    Kode_Buku VARCHAR (10) NOT NULL,
    idPetugas VARCHAR (10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Denda VARCHAR (15) NOT NULL
    );
    
INSERT INTO pengembalian (Kode_Pengembalian, idAnggota, Kode_Buku, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Denda)
VALUES
('1','1','111','71','2024-04-12','2024-05-23','10000'),
('2','2','222','72','2024-04-11','2024-05-21','0'),
('3','3','333','73','2024-04-13','2024-05-25','20000'),
('4','4','444','74','2024-04-14','2024-05-25','10000'),
('5','5','555','75','2024-04-15','2024-05-25','0'),
('6','6','666','76','2024-04-16','2024-05-26','0'),
('7','7','777','77','2024-04-17','2024-06-01','50000'),
('8','8','888','78','2024-04-18','2024-05-28','0'),
('9','9','999','79','2024-04-19','2024-05-30','10000'),
('10','10','989','80','2024-04-20','2024-05-30','0'),
('11','11','889','81','2024-04-21','2024-05-31','0'),
('12','12','787','82','2024-04-22','2024-06-02','10000');

-1-
DELIMITER //
CREATE PROCEDURE getAnggota()
BEGIN
    SELECT * FROM tb_anggota;
END//
DELIMITER ;


DROP PROCEDURE getAnggota

-2-
DELIMITER //
CREATE PROCEDURE getAnggotaByNama(IN nama VARCHAR(20))
BEGIN
    SELECT * FROM tb_anggota WHERE Nama_Anggota = nama;
END//
DELIMITER ;

CALL getAnggotaByNama('Oxa');

-3-
DELIMITER //
CREATE PROCEDURE getBukuByStatusAndKlasifikasi(IN STATUS VARCHAR(10), IN klasifikasi VARCHAR(20))
BEGIN
    SELECT * FROM buku WHERE Status_Buku = STATUS AND Klasifikasi_Buku = klasifikasi;
END//
DELIMITER ;

CALL getBukuByStatusAndKlasifikasi('Ada', 'Sejarah');

-4-
DELIMITER //
CREATE PROCEDURE getPeminjamanByAnggotaAndTanggalPinjamAndKodeBuku(
	IN id_anggota VARCHAR(10),
	IN tanggal_pinjam DATE,
	IN kode_buku VARCHAR(10))
BEGIN
    SELECT * FROM peminjaman WHERE idAnggota = id_anggota AND Tanggal_Pinjam = tanggal_pinjam AND Kode_Buku = kode_buku;
END//
DELIMITER ;

CALL getPeminjamanByAnggotaAndTanggalPinjamAndKodeBuku('1', '2024-04-12', '912');

-5-
DELIMITER //
CREATE PROCEDURE insertPetugas(IN idPetugas VARCHAR(10), IN username VARCHAR(15), IN PASSWORD VARCHAR(15), IN nama VARCHAR(25))
BEGIN
    INSERT INTO petugas (idPetugas, Username, PASSWORD, Nama) VALUES (idPetugas, username, PASSWORD, nama);
END//
DELIMITER ;


CALL insertPetugas('84', 'Udin', '101', 'Udin');
SELECT * FROM petugas;

DELETE FROM petugas WHERE idPetugas = 84;




-6-
DELIMITER //
CREATE PROCEDURE getCountPeminjam(OUT COUNT INT)
BEGIN
    SELECT COUNT(*) INTO COUNT FROM peminjaman;
END//
DELIMITER ;

CALL getCountPeminjam(@count);
SELECT @count;

-7-
DELIMITER //
CREATE PROCEDURE getCountPeminjamByTanggalPinjamAndKodeBuku(INOUT COUNT INT, IN tanggal_pinjam DATE, IN kode_buku VARCHAR(10))
BEGIN
    SELECT COUNT(*) INTO COUNT FROM peminjaman WHERE Tanggal_Pinjam = tanggal_pinjam AND Kode_Buku = kode_buku;
END//
DELIMITER ;

SET @tanggal_pinjam = "2024-04-12";
SET @kode_buku = "912"
SET @count = 0;
CALL getCountPeminjamByTanggalPinjamAndKodeBuku(@count, '2024-04-12', '912');
SELECT @tanggal_pinjam, @tanggal_pinjam, @kode_buku ;