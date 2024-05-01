create database library;
use library;

create table petugas(
IdPetugas varchar(10) primary key,
Username varchar(15),
Password varchar(15),
Nama varchar(25)
);

INSERT INTO petugas (IdPetugas, Username, Password, Nama) VALUES
('PTG001', 'ptg1', 'pass123', 'Budi Santoso'),
('PTG002', 'ptg2', 'pass456', 'Ani Susanti'),
('PTG003', 'ptg3', 'pass789', 'Joko Wibowo'),
('PTG004', 'ptg4', 'pass1234', 'Siti Rahayu'),
('PTG005', 'ptg5', 'pass5678', 'Ahmad Yani'),
('PTG006', 'ptg6', 'pass9012', 'Dian Permata'),
('PTG007', 'ptg7', 'pass3456', 'Rina Wulandari'),
('PTG008', 'ptg8', 'pass7890', 'Eko Prabowo'),
('PTG009', 'ptg9', 'pass2345', 'Maya Sari'),
('PTG010', 'ptg10', 'pass6789', 'Bambang Sudirman');


create table buku(
Kode_Buku varchar(10) primary key,
Judul_Buku varchar(25),
Penggarang_Buku varchar(30),
Penerbit_Buku varchar(30),
Tahun_Buku varchar(10),
Jumlah_Buku varchar(5),
Status_Buku varchar(10),
Klasifikasi_Buku varchar(20)
);

INSERT INTO buku (Kode_Buku, Judul_Buku, Penggarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES
('BK001', 'Alam Bambu', 'Ananda Guritno', 'Bumi Pustaka', '2010', '20', 'Tersedia', 'Sains'),
('BK002', 'Hujan Bulan Juni', 'Sapardi Djoko Damono', 'Gramedia Pustaka Utama', '2001', '15', 'Tersedia', 'Fiksi'),
('BK003', 'Bulan Tak Bermadu', 'Ahmad Tohari', 'Bentang Pustaka', '1998', '12', 'Tersedia', 'Fiksi'),
('BK004', 'Manusia Setengah Salmon', 'Raditya Dika', 'Gagas Media', '2012', '18', 'Tersedia', 'Fiksi Komedi'),
('BK005', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '25', 'Tersedia', 'Fiksi'),
('BK006', 'Ayat-ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '22', 'Tersedia', 'Fiksi Romantis'),
('BK007', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', '19', 'Tersedia', 'Fiksi'),
('BK008', 'Tere Liye', 'Hafizah Noor', 'Mizan Pustaka', '2001', '30', 'Tersedia', 'Fiksi'),
('BK009', 'Supernova', 'Dee Lestari', 'Bentang Pustaka', '2004', '14', 'Tersedia', 'Fiksi'),
('BK010', '5cm', 'Donny Dhirgantoro', 'Grasindo', '2011', '16', 'Tersedia', 'Fiksi');


create table anggota(
IdAnggota varchar(10) primary key,
Nama_Anggota varchar(20),
Angkatan_Anggota varchar(6),
Tempat_Lahir_Anggota varchar(20),
Tanggal_Lahir_Anggota date,
No_Telp int(12),
Jenis_Kelamin varchar(15),
Status_Pinjam varchar(15)
);

INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES
('AGT001', 'Agus Setiawan', '2018', 'Jakarta', '1995-02-15', '0812345678', 'Laki-Laki', 'Aktif'),
('AGT002', 'Siti Rahma', '2017', 'Bandung', '1996-08-20', '0823456789', 'Perempuan', 'Aktif'),
('AGT003', 'Bambang Wijaya', '2019', 'Surabaya', '1994-04-10', '0834567890', 'Laki-Laki', 'Aktif'),
('AGT004', 'Dewi Lestari', '2016', 'Yogyakarta', '1997-11-05', '0845678901', 'Perempuan', 'tidak aktif'),
('AGT005', 'Eko Pratama', '2020', 'Malang', '1993-06-30', '0856789012', 'Laki-Laki', 'Aktif'),
('AGT006', 'Fitri Indah', '2019', 'Medan', '1998-03-25', '0867890123', 'Perempuan', 'Aktif'),
('AGT007', 'Galih Putra', '2017', 'Semarang', '1996-09-15', '0878901234', 'Laki-Laki', 'tidak aktif'),
('AGT008', 'Hasanah Hidayah', '2018', 'Surabaya', '1995-04-12', '0889012345', 'Perempuan', 'Aktif'),
('AGT009', 'Irfan Pratama', '2021', 'Bandung', '1992-12-20', '0890123456', 'Laki-Laki', 'Aktif'),
('AGT010', 'Joko Suryono', '2019', 'Jakarta', '1994-08-08', '0891234567', 'Laki-Laki', 'tidak aktif');


create table peminjaman(
Kode_Peminjaman varchar(10) primary key,
IdAnggota varchar(10),
IdPetugas varchar(10),
Tanggal_Pinjam date,
Tanggal_Kembali date,
Kode_Buku varchar(10),
foreign key(IdPetugas) references petugas(IdPetugas),
foreign key(IdAnggota) references anggota(IdAnggota),
foreign key(Kode_Buku) references buku(Kode_Buku)
);

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('PIN001', 'AGT001', 'PTG001', '2024-04-25', '2024-05-02', 'BK001'),
('PIN002', 'AGT002', 'PTG002', '2024-04-26', '2024-05-03', 'BK002'),
('PIN003', 'AGT003', 'PTG003', '2024-04-27', '2024-05-04', 'BK003'),
('PIN004', 'AGT004', 'PTG004', '2024-04-28', '2024-05-05', 'BK004'),
('PIN005', 'AGT005', 'PTG005', '2024-04-29', '2024-05-06', 'BK005'),
('PIN006', 'AGT006', 'PTG006', '2024-04-30', '2024-05-07', 'BK006'),
('PIN007', 'AGT007', 'PTG007', '2024-05-01', '2024-05-08', 'BK007'),
('PIN008', 'AGT008', 'PTG008', '2024-05-02', '2024-05-09', 'BK008'),
('PIN009', 'AGT009', 'PTG009', '2024-05-03', '2024-05-10', 'BK009'),
('PIN010', 'AGT010', 'PTG010', '2024-05-04', '2024-05-11', 'BK010');


create table pengembalaian(
Kode_Kembali varchar(10) primary key,
IdAnggota varchar(10),
Kode_Buku varchar(10),
IdPetugas varchar(10),
Tgl_Pinjam date,
Tgl_Kembali date,
Denda varchar(15),
foreign key(IdPetugas) references petugas(IdPetugas),
foreign key(IdAnggota) references anggota(IdAnggota),
foreign key(Kode_Buku) references buku(Kode_Buku)
);

INSERT INTO pengembalaian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
('KMB001', 'AGT001', 'BK001', 'PTG001', '2024-04-25', '2024-05-02', 'Rp 0'),
('KMB002', 'AGT002', 'BK002', 'PTG002', '2024-04-26', '2024-05-03', 'Rp 10000'),
('KMB003', 'AGT003', 'BK003', 'PTG003', '2024-04-27', '2024-05-04', 'Rp 5000'),
('KMB004', 'AGT004', 'BK004', 'PTG004', '2024-04-28', '2024-05-05', 'Rp 7500'),
('KMB005', 'AGT005', 'BK005', 'PTG005', '2024-04-29', '2024-05-06', 'Rp 0'),
('KMB006', 'AGT006', 'BK006', 'PTG006', '2024-04-30', '2024-05-07', 'Rp 20000'),
('KMB007', 'AGT007', 'BK007', 'PTG007', '2024-05-01', '2024-05-08', 'Rp 0'),
('KMB008', 'AGT008', 'BK008', 'PTG008', '2024-05-02', '2024-05-09', 'Rp 0'),
('KMB009', 'AGT009', 'BK009', 'PTG009', '2024-05-03', '2024-05-10', 'Rp 30000'),
('KMB010', 'AGT010', 'BK010', 'PTG010', '2024-05-04', '2024-05-11', 'Rp 15000');


-- drop database library;
-- -- jawaban 

-- 1. Buatlah sebuah prosedur dengan menggunakan parameter IN default
DELIMITER //
CREATE PROCEDURE statuspinjam(
IN statusPinjam VARCHAR(15))
BEGIN
    IF statusPinjam IS NULL THEN
        SET statusPinjam = 'tidak aktif';
    END IF;
    SELECT * FROM anggota WHERE Status_Pinjam = statusPinjam;
END//
DELIMITER ;
CALL statuspinjam('Aktif');


-- 2.Buatlah stored procedure untuk mengetahui data pada table buku berdasarkan pada salah satu field yaitu penerbit buku.
DELIMITER //

CREATE PROCEDURE bukupenerbit(IN penerbitName VARCHAR(30))
BEGIN
    SELECT * FROM buku WHERE Penerbit_Buku = penerbitName;
END//

DELIMITER ;

-- DROP PROCEDURE IF EXISTS GetBukuByPenerbit;
CALL bukupenerbit('Gramedia Pustaka Utama');


-- 3.Buatlah stored procedure 
-- untuk mengetahui data pada table peminjaman berdasarkan dua field yaitu tanggal pinjam dan kode buku
DELIMITER //
CREATE PROCEDURE peminjamandata(
    IN tanggalPinjam date,
    IN kodeBuku varchar(10)
)
BEGIN
    SELECT * FROM peminjaman WHERE Tanggal_Pinjam = tanggalPinjam AND Kode_Buku = kodeBuku;
END //
DELIMITER ;

CALL peminjamandata('2024-04-25', 'BK001');

-- 4.	Buatlah stored procedure untuk mengetahui 
-- data pada table anggota berdasarkan 3 field yaitu Angkatan, tempat lahir dan jenis kelamin.
DELIMITER //
CREATE PROCEDURE anggotadata(
    IN angkatan varchar(6),
    IN tempatLahir varchar(20),
    IN jenisKelamin varchar(15)
)
BEGIN
    SELECT * FROM anggota WHERE Angkatan_Anggota = angkatan AND Tempat_Lahir_Anggota = tempatLahir AND Jenis_Kelamin = jenisKelamin;
END //
DELIMITER ;

CALL anggotadata('2018', 'Jakarta','Laki-Laki');

-- 5.	Definisikan stored procedure untuk memasukkan data pada table anggota
DELIMITER //
CREATE PROCEDURE insertanggotaData(
    IN idAnggota varchar(10),
    IN namaAnggota varchar(20),
    IN angkatanAnggota varchar(6),
    IN tempatLahirAnggota varchar(20),
    IN tanggalLahirAnggota date,
    IN noTelp int(12),
    IN jenisKelamin varchar(15),
    IN statusPinjam varchar(15)
)
BEGIN
    INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
    VALUES (idAnggota, namaAnggota, angkatanAnggota, tempatLahirAnggota, tanggalLahirAnggota, noTelp, jenisKelamin, statusPinjam);
END //
DELIMITER ;

CALL insertanggotaData('AGT012', 'Sehun', '2023', 'Jakarta', '1997-05-20', 081234567890, 'Laki-Laki', 'tidak aktif');
select * from anggota;

-- 6.	Definisikan stored procedure untuk mengetahui data jumlah anggota menggunakan parameter OUT
DELIMITER //
CREATE PROCEDURE totalAnggota(
    OUT jumlahAnggota int
)
BEGIN
    SELECT COUNT(*) INTO jumlahAnggota FROM anggota;
END //
DELIMITER ;

-- DROP PROCEDURE IF EXISTS totalAnggota;
CALL totalAnggota(@total);
SELECT @total;


-- 7.	Definisikan stored procedure untuk mengetahui data jumlah buku 
-- berdasarkan pengarang dan tahun terbitnya menggunakan parameter INOUT.
DELIMITER //

CREATE PROCEDURE bukupenggarang(
    IN namaPengarang VARCHAR(30),
    IN tahunTerbit VARCHAR(10),
    OUT jumlahBuku INT
)
BEGIN
    SELECT Jumlah_Buku INTO jumlahBuku
    FROM buku
    WHERE Penggarang_Buku = namaPengarang AND Tahun_Buku = tahunTerbit;
END //

DELIMITER ;


DROP PROCEDURE IF EXISTS JumlahBukuByPengarangTahun;
CALL bukupenggarang('Raditya Dika', '2012', @totalBuku);
SELECT @totalBuku AS Total_Buku;


DELIMITER //
CREATE PROCEDURE anggot(
    IN angkatan varchar(6),
    IN tempatLahir varchar(20),
    IN jenisKelamin varchar(15)
)
BEGIN
    SELECT * FROM anggota WHERE Angkatan_Anggota = angkatan AND Tempat_Lahir_Anggota = tempatLahir AND Jenis_Kelamin = jenisKelamin
    and angkatan like '%2';
END //
DELIMITER ;

CALL anggotadata('2018', 'Jakarta','Laki-Laki');