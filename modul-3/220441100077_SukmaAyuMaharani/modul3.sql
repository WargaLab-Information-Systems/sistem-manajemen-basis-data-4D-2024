// SUKMA AYU MAHARANI
// 220441100077
//SISTEM MANAJEMEN BASIS DATA - 4D


create database db_modul3;
use db_modul3;
create table petugas(
	IdPetugas varchar(10) primary key,
    Username varchar (15),
    Password varchar (15),
    Nama varchar(25));
INSERT INTO petugas (IdPetugas, Username, Password, Nama) VALUES
('101', 'user1', 'pass1', 'Hanang'),
('102', 'user2', 'pass2', 'Agus'),
('103', 'user3', 'pass3', 'Defri'),
('104', 'user4', 'pass4', 'Lilik'),
('105', 'user5', 'pass5', 'Nureni'),
('106', 'user6', 'pass6', 'Alda'),
('107', 'user7', 'pass7', 'Dewi'),
('108', 'user8', 'pass8', 'Serafina'),
('109', 'user9', 'pass9', 'Luna'),
('110', 'user10', 'pass10', 'Safira');

create table anggota(
	idAnggota varchar (10) primary key,
    nama_anggota varchar(20),
    angkatan_anggota varchar(6),
    tempat_lahir_anggota varchar(20),
    tanggal_lahir_anggota date,
    no_telp int(12),
    jenis_kelamin varchar(15),
    status_pinjam varchar(15));
    
INSERT INTO anggota (idAnggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) VALUES
('201', 'Ani', '2019', 'Jakarta', '2000-05-10', 1234567890, 'Perempuan', 'Belum Pinjam'),
('202', 'Budi', '2020', 'Bandung', '2001-08-15', 1234567891, 'Laki-laki', 'Belum Pinjam'),
('203', 'Citra', '2018', 'Surabaya', '1999-12-20', 1234567892, 'Perempuan', 'Sudah Pinjam'),
('204', 'Dewi', '2021', 'Yogyakarta', '2002-03-25', 1234567893, 'Perempuan', 'Belum Pinjam'),
('205', 'Eko', '2017', 'Semarang', '1998-06-30', 1234567894, 'Laki-laki', 'Sudah Pinjam'),
('206', 'Fani', '2022', 'Malang', '2003-09-05', 1234567895, 'Perempuan', 'Belum Pinjam'),
('207', 'Gita', '2016', 'Medan', '1997-11-10', 1234567896, 'Perempuan', 'Sudah Pinjam'),
('208', 'Hadi', '2023', 'Denpasar', '2004-02-15', 1234567897, 'Laki-laki', 'Belum Pinjam'),
('209', 'Indra', '2015', 'Makassar', '1996-04-20', 1234567898, 'Laki-laki', 'Sudah Pinjam'),
('210', 'Joko', '2024', 'Palembang', '2005-07-25', 1234567899, 'Laki-laki', 'Belum Pinjam');

create table buku (
	kode_buku varchar(10) primary key,
    judul_buku varchar(25),
    pengarang_buku varchar(30),
    penerbit_buku varchar(30),
    tahun_buku varchar(10),
    jumlah_buku varchar(5),
    status_buku varchar(10),
    klasifikasi_buku varchar(20));

INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES
('301', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '15', 'Tersedia', 'Novel'),
('302', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '10', 'Tersedia', 'Sastra'),
('303', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republish', '2004', '20', 'Tersedia', 'Romance'),
('304', 'Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Grafindo', '1982', '8', 'Tersedia', 'Sastra'),
('305', 'Supernova: Ksatria, Puteri, dan Bintang Jatuh', 'Dee Lestari', 'Bentang Pustaka', '2001', '12', 'Tidak', 'Fiksi Ilmiah'),
('306', 'Pulang', 'Tere Liye', 'Republika', '2015', '18', 'Tersedia', 'Fiksi Sejarah'),
('307', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '10', 'Tersedia', 'Novel'),
('308', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2009', '15', 'Tersedia', 'Romance'),
('309', 'Dilan: Dia Adalah Dilanku Tahun 1990', 'Pidi Baiq', 'Bukune', '2014', '20', 'Tersedia', 'Romance'),
('310', 'Jejak Langkah', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1985', '8', 'Tersedia', 'Sastra');

CREATE TABLE peminjaman (
	kode_peminjaman VARCHAR (10) primary key, 
    id_anggota VARCHAR (10), 
    id_petugas VARCHAR (10), 
	tanggal_pinjam DATE, 
    tanggal_kembali DATE, 
    kode_buku VARCHAR (10), 
	FOREIGN KEY(id_petugas) REFERENCES petugas(IdPetugas), 
    FOREIGN KEY(id_anggota) REFERENCES anggota(idAnggota),
	FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku));

INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) VALUES
('401', '201', '101', '2024-04-29', '2024-05-13', '301'),
('402', '202', '102', '2024-04-29', '2024-05-12', '302'),
('403', '203', '103', '2024-04-30', '2024-05-14', '303'),
('404', '204', '104', '2024-04-30', '2024-05-13', '304'),
('405', '205', '105', '2024-05-01', '2024-05-15', '305'),
('406', '206', '106', '2024-05-01', '2024-05-14', '306'),
('407', '207', '107', '2024-05-02', '2024-05-16', '307'),
('408', '208', '108', '2024-05-02', '2024-05-15', '308'),
('409', '209', '109', '2024-05-03', '2024-05-17', '309'),
('410', '210', '110', '2024-05-03', '2024-05-16', '310');
select*from peminjaman;


CREATE TABLE pengembalian(
	kode_kembali VARCHAR (10) primary key, 
    id_anggota VARCHAR (10), 
    id_petugas VARCHAR (10), 
	tanggal_pinjam DATE, 
    tanggal_kembali DATE, 
    kode_buku VARCHAR (10), 
    denda VARCHAR (15), 
	FOREIGN KEY(id_petugas) REFERENCES petugas(IdPetugas), 
    FOREIGN KEY(id_anggota) REFERENCES anggota(idAnggota), 
    FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku)
);

INSERT INTO pengembalian (kode_kembali, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku, denda) VALUES
('501', '201', '101', '2024-04-29', '2024-05-13', '301', '0'),
('502', '202', '102', '2024-04-29', '2024-05-12', '302', '0'),
('503', '203', '103', '2024-04-30', '2024-05-14', '303', '0'),
('504', '204', '104', '2024-04-30', '2024-05-13', '304', '0'),
('505', '205', '105', '2024-05-01', '2024-05-15', '305', '0'),
('506', '206', '106', '2024-05-01', '2024-05-14', '306', '0'),
('507', '207', '107', '2024-05-02', '2024-05-16', '307', '0'),
('508', '208', '108', '2024-05-02', '2024-05-15', '308', '0'),
('509', '209', '109', '2024-05-03', '2024-05-17', '309', '0'),
('510', '210', '110', '2024-05-03', '2024-05-16', '310', '0');

DELIMITER //
CREATE PROCEDURE input_buku(
	kode_buku varchar (10),
    judul_buku varchar(25),
    pengarang_buku varchar (30),
    in penerbit_buku varchar(30),
    in tahun_buku varchar (10),
    in jumlah_buku varchar (5),
    in status_buku varchar(10),
    in klasifikasi_buku varchar(20))
	
BEGIN
	INSERT INTO buku values(kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku);
END //
DELIMITER ;
call input_buku
(311, 'Laut Bercerita', 'Leilia', 'Gramedia', '2020-03-20', '5', 'Tersedia', 'Sastra');
select * from buku;

DELIMITER //

CREATE PROCEDURE cari_anggota_berdasarkan_nama(
    IN nama_anggota_in VARCHAR(20)
)
BEGIN
    SELECT *
    FROM anggota
    WHERE nama_anggota LIKE concat('%', nama_anggota_in '%');
END //
DELIMITER ;

SELECT * FROM anggota where nama_anggota LIKE '%cit%';
call cari_anggota_berdasarkan_nama
	('tra');

drop procedure cari_anggota_berdasarkan_nama;

DELIMITER //

CREATE PROCEDURE cari_buku_berdasarkan_status_dan_klasifikasi(
    IN status_buku_in VARCHAR(10),
    IN klasifikasi_buku_in VARCHAR(20)
)
BEGIN
    SELECT *
    FROM buku
    WHERE status_buku = status_buku_in AND klasifikasi_buku = klasifikasi_buku_in;
END //

DELIMITER ;

call cari_buku_berdasarkan_status_dan_klasifikasi 
('Tersedia', 'Novel');

DELIMITER //

CREATE PROCEDURE tampilkan_data_peminjaman(
    IN id_anggota_param VARCHAR(10),
    IN tanggal_pinjam_param DATE,
    IN kode_buku_param VARCHAR(10)
)
BEGIN
    SELECT * FROM peminjaman 
    WHERE id_anggota = id_anggota_param 
    AND tanggal_pinjam = tanggal_pinjam_param 
    AND kode_buku = kode_buku_param;
END //

DELIMITER ;

CALL tampilkan_data_peminjaman('201', '2024-04-29', '301');

DELIMITER //

CREATE PROCEDURE tambah_petugas(
    IN id_petugas_perpus VARCHAR(10),
    IN username_perpus VARCHAR(15),
    IN password_perpus VARCHAR(15),
    IN nama_perpus VARCHAR(25)
)
BEGIN
    INSERT INTO petugas (IdPetugas, Username, Password, Nama) 
    VALUES (id_petugas_perpus, username_perpus, password_perpus, nama_perpus);
END //

DELIMITER ;
CALL tambah_petugas('111', 'user11', 'pass11', 'Soleh');
select * from petugas;

DELIMITER //

CREATE PROCEDURE hitung_jumlah_peminjam(
    OUT jumlah_peminjam INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_peminjam FROM peminjaman;
END //

DELIMITER ;
call hitung_jumlah_peminjam (@jumlah);
select @jumlah AS 'Jumlah Buku';

DELIMITER //
CREATE PROCEDURE hitung_jumlah_peminjam_berdasarkan_tanggal_dan_buku(
    INOUT tanggal_pinjam_param DATE,
    IN kode_buku_param VARCHAR(10),
    OUT jumlah_peminjam INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_peminjam 
    FROM peminjaman 
    WHERE tanggal_pinjam = tanggal_pinjam_param AND kode_buku = kode_buku_param;
END //

DELIMITER ;

SET @tanggal_pinjam = '2024-04-29';
SET @kode_buku = '301';
CALL hitung_jumlah_peminjam_berdasarkan_tanggal_dan_buku(@tanggal_pinjam, @kode_buku, @jumlah);
SELECT @jumlah AS jumlah_peminjam;




