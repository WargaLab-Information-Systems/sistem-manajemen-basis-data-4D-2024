CREATE DATABASE perpustakaan;
USE perpustakaan
CREATE TABLE buku (
    kode_buku VARCHAR(10) PRIMARY KEY NOT NULL,
    judul_buku VARCHAR(25) NOT NULL,
    pengarang_buku VARCHAR(30) NOT NULL,
    penerbit_buku VARCHAR(30) NOT NULL,
    tahun_buku VARCHAR(10) NOT NULL,
    jumlah_buku VARCHAR(5) NOT NULL,
    status_buku VARCHAR(10) NOT NULL,
    klasifikasi_buku VARCHAR(20) NOT NULL
);
CREATE TABLE anggota (
	idAnggota VARCHAR (10)PRIMARY KEY NOT NULL,
	Nama_Anggota VARCHAR(20) NOT NULL,
	Angkatan_Anggota VARCHAR(6) NOT NULL,
	Tempat_lahir_anggota VARCHAR (20) NOT NULL,
	Tanggal_lahir_anggota DATE NOT NULL,
	No_Telp INT(12) NOT NULL,
	Jenis_Kelamin VARCHAR (15) NOT NULL,
	Status_Pinjam VARCHAR (15) NOT NULL
);
CREATE TABLE petugas (
	IdPetugas VARCHAR (10)PRIMARY KEY NOT NULL,
	Username VARCHAR (15) NOT NULL,
	PASSWORD VARCHAR (15) NOT NULL,
	Nama VARCHAR (25) NOT NULL
);
CREATE TABLE peminjaman (
	Kode_Peminjaman VARCHAR (10)PRIMARY KEY NOT NULL,
	IdAnggota VARCHAR(10) NOT NULL,
	IdPetugas VARCHAR (10) NOT NULL,
	Tanggal_Pinjam DATE NOT NULL,
	Tanggal_Kembali DATE NOT NULL,
	Kode_Buku VARCHAR (10) NOT NULL,
	FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
	FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
	FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);
CREATE TABLE pengembalian (
	Kode_Pengembalian VARCHAR (10)PRIMARY KEY NOT NULL,
	IdAnggota VARCHAR(10) NOT NULL,
	IdPetugas VARCHAR (10) NOT NULL,
	Tanggal_Pinjam DATE NOT NULL,
	Tanggal_Kembali DATE NOT NULL,
	Kode_Buku VARCHAR (10) NOT NULL,
	Denda VARCHAR (15) NOT NULL,
	FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
	FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
	FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);
-- memasukkan data dummy tabel buku
INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES
('BK001', 'Dilan', 'Pidi Baiq', 'Pastel Books', '2014', '25', 'Tersedia', 'Romantis'),
('BK002', '5 cm', 'Donny Dhirgantoro', 'Grasindo', '2005', '30', 'Tersedia', 'Fiksi'),
('BK003', 'Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Gramedia Pustaka Utama', '1982', '20', 'Tersedia', 'Sejarah'),
('BK004', 'Cinta Brontosaurus', 'Raditya Dika', 'Gagas Media', '2005', '40', 'Tersedia', 'Komedi'),
('BK005', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '35', 'Tersedia', 'Fiksi'),
('BK006', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2009', '45', 'Tersedia', 'Fiksi'),
('BK007', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '30', 'Tersedia', 'Romantis'),
('BK008', 'Tenggelamnya Kapal Van Der Wijck', 'Hamka', 'Pustaka Panjimas', '1938', '15', 'Tersedia', 'Sejarah'),
('BK009', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '50', 'Tersedia', 'Fiksi'),
('BK010', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '20', 'Tersedia', 'Sejarah');
SELECT * FROM buku

-- memasukkan data dummy tabel anggota
INSERT INTO anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_lahir_anggota, Tanggal_lahir_anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES
('A001', 'Budi Santoso', '2019', 'Jakarta', '2000-05-15', '08123456789', 'Laki-laki', 'Tidak Meminjam'),
('A002', 'Anita Dewi', '2020', 'Bandung', '2001-08-20', '08234567890', 'Perempuan', 'Tidak Meminjam'),
('A003', 'Cahya Putra', '2021', 'Surabaya', '2002-02-10', '08345678901', 'Laki-laki', 'Meminjam'),
('A004', 'Dewi Lestari', '2018', 'Yogyakarta', '1999-11-25', '08456789012', 'Perempuan', 'Meminjam'),
('A005', 'Eko Prasetyo', '2017', 'Medan', '1998-04-30', '08567890123', 'Laki-laki', 'Tidak Meminjam'),
('A006', 'Putri Anindya', '2022', 'Semarang', '2003-03-10', '08678901234', 'Perempuan', 'Tidak Meminjam'),
('A007', 'Rudi Hermawan', '2023', 'Bali', '2004-07-20', '08789012345', 'Laki-laki', 'Meminjam'),
('A008', 'Siti Fatimah', '2020', 'Makassar', '2001-09-15', '08890123456', 'Perempuan', 'Tidak Meminjam'),
('A009', 'Ahmad Rifai', '2021', 'Palembang', '2002-05-25', '08901234567', 'Laki-laki', 'Meminjam'),
('A010', 'Lina Susanti', '2019', 'Padang', '2000-11-30', '09012345678', 'Perempuan', 'Tidak Meminjam'),
('A011', 'Dewi Kartini', '2018', 'Pontianak', '1999-02-14', '09123456789', 'Perempuan', 'Tidak Meminjam'),
('A012', 'Fajar Prasetya', '2017', 'Manado', '1998-08-05', '09234567890', 'Laki-laki', 'Meminjam'),
('A013', 'Bunga Citra', '2016', 'Balikpapan', '1997-04-20', '09345678901', 'Perempuan', 'Meminjam'),
('A014', 'Joko Susilo', '2015', 'Samarinda', '1996-10-15', '09456789012', 'Laki-laki', 'Tidak Meminjam'),
('A015', 'Sari Wulandari', '2014', 'Bandar Lampung', '1995-12-25', '09567890123', 'Perempuan', 'Tidak Meminjam');
SELECT * FROM anggota

-- memasukkan data dummy petugas
INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama) VALUES
('P001', 'petugas1', 'petugas123', 'Budi Setiawan'),
('P002', 'petugas2', 'petugas456', 'Anita Dewi'),
('P003', 'petugas3', 'petugas789', 'Cahya Prasetyo'),
('P004', 'petugas4', 'petugas000', 'Dewi Lestari'),
('P005', 'petugas5', 'petugas999', 'Eko Suryanto'),
('P006', 'petugas6', 'petugas111', 'Fajar Pratama'),
('P007', 'petugas7', 'petugas222', 'Gita Wulandari'),
('P008', 'petugas8', 'petugas333', 'Hadi Nugroho'),
('P009', 'petugas9', 'petugas444', 'Ika Sari'),
('P010', 'petugas10', 'petugas555', 'Joko Santoso');
SELECT * FROM petugas

-- memasukkan data dummy peminjaman
INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('PJ001', 'A001', 'P001', '2024-04-01', '2024-04-15', 'BK001'),
('PJ002', 'A002', 'P002', '2024-04-02', '2024-04-16', 'BK002'),
('PJ003', 'A003', 'P003', '2024-04-03', '2024-04-17', 'BK003'),
('PJ004', 'A004', 'P004', '2024-04-04', '2024-04-18', 'BK004'),
('PJ005', 'A005', 'P005', '2024-04-05', '2024-04-19', 'BK005'),
('PJ006', 'A006', 'P006', '2024-04-06', '2024-04-20', 'BK001'),
('PJ007', 'A007', 'P007', '2024-04-07', '2024-04-21', 'BK002'),
('PJ008', 'A008', 'P008', '2024-04-08', '2024-04-22', 'BK003'),
('PJ009', 'A009', 'P009', '2024-04-09', '2024-04-23', 'BK004'),
('PJ010', 'A010', 'P010', '2024-04-10', '2024-04-24', 'BK005');

-- memasukkan data dummy tabel peminjaman 
INSERT INTO pengembalian (Kode_Pengembalian, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku, Denda) VALUES
('PB001', 'A001', 'P001', '2024-04-15', '2024-04-25', 'BK001', '0'),
('PB002', 'A002', 'P002', '2024-04-16', '2024-04-26', 'BK002', '0'),
('PB003', 'A003', 'P003', '2024-04-17', '2024-04-27', 'BK003', '0'),
('PB004', 'A004', 'P004', '2024-04-18', '2024-04-28', 'BK004', '0'),
('PB005', 'A005', 'P005', '2024-04-19', '2024-04-29', 'BK005', '0'),
('PB006', 'A006', 'P006', '2024-04-20', '2024-04-30', 'BK001', '0'),
('PB007', 'A007', 'P007', '2024-04-21', '2024-05-01', 'BK002', '0'),
('PB008', 'A008', 'P008', '2024-04-22', '2024-05-02', 'BK003', '0'),
('PB009', 'A009', 'P009', '2024-04-23', '2024-05-03', 'BK004', '0'),
('PB010', 'A010', 'P010', '2024-04-24', '2024-05-04', 'BK005', '0');

SELECT * FROM pengembalian

-- soal 1
DELIMITER //

CREATE PROCEDURE GetAnggotaByAngkatan(
    angkatanAnggota VARCHAR(4) 
)
BEGIN
    SELECT * FROM anggota WHERE Angkatan_Anggota = angkatanAnggota;
END//

DELIMITER ;

CALL GetAnggotaByAngkatan(2020)

-- soal 2
DELIMITER //

CREATE PROCEDURE GetAnggotaByName(
    IN namaAnggota VARCHAR(50)
)
BEGIN
    SELECT * FROM anggota WHERE Nama_Anggota = namaAnggota;
END//

DELIMITER ;

SELECT * FROM anggota
CALL GetAnggotaByName('Budi Santoso')

-- soal 3
DELIMITER //

CREATE PROCEDURE GetBukuByStatusAndKlasifikasi(
    IN statusBuku VARCHAR(10),
    IN klasifikasiBuku VARCHAR(20)
)
BEGIN
    SELECT * FROM buku WHERE status_buku = statusBuku AND klasifikasi_buku = klasifikasiBuku;
END//

DELIMITER ;

CALL GetBukuByStatusAndKlasifikasi('tersedia','fiksi')

-- soal4
DELIMITER //

CREATE PROCEDURE GetPeminjamanData(
    IN anggotaId VARCHAR(10),
    IN tanggalPinjam DATE,
    IN kodeBuku VARCHAR(10)
)
BEGIN
    SELECT * FROM peminjaman 
    WHERE IdAnggota = anggotaId 
    AND Tanggal_Pinjam = tanggalPinjam 
    AND Kode_Buku = kodeBuku;
END//

DELIMITER ;
SELECT * FROM peminjaman
CALL GetPeminjamanData('A001','2024-04-01','BK001')

-- soal 5
DELIMITER //

CREATE PROCEDURE InsertPetugasData(
    IN idPetugas VARCHAR(10),
    IN username VARCHAR(15),
    IN passw VARCHAR(15),
    IN nama VARCHAR(25)
)
BEGIN
    INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama) VALUES (idPetugas, username, passw, nama);
END//

DELIMITER ;
SELECT * FROM petugas
CALL InsertPetugasData('P011','petugas11','petugas11pw','Martin Hara')

-- soal 6
DELIMITER //

CREATE PROCEDURE CountPeminjam(
    OUT jumlahPeminjam INT
)
BEGIN
    SELECT COUNT(kode_peminjaman) INTO jumlahPeminjam FROM peminjaman;
END//

DELIMITER ;

SELECT * FROM peminjaman

CALL CountPeminjam(@
jumlahPeminjam);
SELECT @jumlahPeminjam AS 'Jumlah Peminjam';

-- soal 7
DELIMITER //

CREATE PROCEDURE CountPeminjamByDateAndBook(
    IN tanggalPinjam DATE,
    IN kodeBuku VARCHAR(10),
    OUT jumlahPeminjam INT
)
BEGIN
    SELECT COUNT(*), INTO jumlahPeminjam FROM peminjaman WHERE Tanggal_Pinjam = tanggalPinjam AND Kode_Buku = kodeBuku;
END//

DELIMITER ;

SELECT * FROM peminjaman

CALL CountPeminjamByDateAndBook('2024-04-01', 'BK001', @jumlahPeminjam);
SELECT @jumlahPeminjam AS 'Jumlah Peminjam';

DELIMITER //

CREATE PROCEDURE test3(
    IN tanggalPinjam DATE,
    IN kodeBuku VARCHAR(10),
    OUT jumlahPeminjam INT
)
BEGIN
    SELECT COUNT(*),tanggal_Pinjam,Kode_Buku INTO jumlahPeminjam,tanggalPinjam,kodeBuku FROM peminjaman WHERE Tanggal_Pinjam = tanggalPinjam AND Kode_Buku = kodeBuku;
END//

DELIMITER ;

SELECT * FROM peminjaman

CALL test3('2024-04-02', 'BK002', @jumlahPeminjam);
SELECT @jumlahPeminjam AS 'Jumlah Peminjam',Tanggal_Pinjam,Kode_Buku FROM peminjaman

