CREATE DATABASE db_modul4;

USE db_modul4;

CREATE TABLE petugas (
  IdPetugas VARCHAR(10) PRIMARY KEY,
  Username VARCHAR(15) NOT NULL,
  PASSWORD VARCHAR(15) NOT NULL,
  Nama VARCHAR(25) NOT NULL
);

DROP TABLE petugas;

INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama) VALUES
  ('PETUGAS01', 'user_petugas1', 'password123', 'Petugas Satu'),
  ('PETUGAS02', 'user_petugas2', 'password456', 'Petugas Dua'),
  ('PETUGAS03', 'user_petugas3', 'password789', 'Petugas Tiga'),
  ('PETUGAS04', 'user_petugas4', 'password012', 'Petugas Empat'),
  ('PETUGAS05', 'user_petugas5', 'password345', 'Petugas Lima'),
  ('PETUGAS06', 'user_petugas6', 'password678', 'Petugas Enam'),
  ('PETUGAS07', 'user_petugas7', 'password901', 'Petugas Tujuh'),
  ('PETUGAS08', 'user_petugas8', 'password234', 'Petugas Delapan'),
  ('PETUGAS09', 'user_petugas9', 'password567', 'Petugas Sembilan'),
  ('PETUGAS10', 'user_petugas10', 'password890', 'Petugas Sepuluh');
  
CREATE TABLE anggota (
  IdAnggota VARCHAR(10) PRIMARY KEY,
  Nama_Anggota VARCHAR(20) NOT NULL,
  Angkatan_Anggota VARCHAR(6) NOT NULL,
  Tempat_Lahir_Anggota VARCHAR(20) NOT NULL,
  Tanggal_Lahir_Anggota DATE NOT NULL,
  No_Telp INT(12),
  Jenis_Kelamin VARCHAR(15) NOT NULL,
  Status_Pinjam VARCHAR(15) NOT NULL
);

DROP TABLE anggota;

INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES
  ('ANGGOTA01', 'Anggota Satu', '2023', 'Surabaya', '2002-01-01', 08123456789, 'Laki-laki', 'Belum Meminjam'),
  ('ANGGOTA02', 'Anggota Dua', '2022', 'Malang', '2003-02-02', 08987654321, 'Perempuan', 'Belum Meminjam'),
  ('ANGGOTA03', 'Anggota Tiga', '2021', 'Sidoarjo', '2004-03-03', 08123456780, 'Laki-laki', 'Meminjam'),
  ('ANGGOTA04', 'Anggota Empat', '2020', 'Gresik', '2005-04-04', 08987654322, 'Perempuan', 'Meminjam'),
  ('ANGGOTA05', 'Anggota Lima', '2019', 'Lamongan', '2006-05-05', 08123456781, 'Laki-laki', 'Belum Meminjam'),
  ('ANGGOTA06', 'Anggota Enam', '2018', 'Mojokerto', '2007-06-06', 08987654323, 'Perempuan', 'Belum Meminjam'),
  ('ANGGOTA07', 'Anggota Tujuh', '2017', 'Jombang', '2008-07-07', 08123456782, 'Laki-laki', 'Meminjam'),
  ('ANGGOTA08', 'Anggota Delapan', '2016', 'Madiun', '2009-08-08', 08987654324, 'Perempuan', 'Belum Meminjam'),
  ('ANGGOTA09', 'Anggota Sembilan', '2015', 'Kediri', '2010-09-09', 08123456783, 'Laki-laki', 'Meminjam'),
  ('ANGGOTA10', 'Anggota Sepuluh', '2014', 'Blitar', '2011-10-10', 08987654325, 'Perempuan', 'Belum Meminjam');
  
CREATE TABLE buku (
  Kode_Buku VARCHAR(10) PRIMARY KEY,
  Judul_Buku VARCHAR(25) NOT NULL,
  Pengarang_Buku VARCHAR(20) NOT NULL,
  Penerbit_Buku VARCHAR(20) NOT NULL,
  Tahun_Buku VARCHAR(4) NOT NULL,
  Jumlah_Buku VARCHAR(5) NOT NULL,
  Status_Buku VARCHAR(10) NOT NULL,
  Klasifikasi_Buku VARCHAR(10) NOT NULL
);

DROP TABLE buku;

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES
  ('BK001', 'Bumi', 'Tere Liye', 'Gramedia', '2017', '10', 'Tersedia', 'Fiksi'),
  ('BK002', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2008', '5', 'Dipinjam', 'Fiksi'),
  ('BK003', 'Dilan 1990', 'Pidi Baiq', 'Dapur Buku', '2014', '20', 'Tersedia', 'Fiksi'),
  ('BK004', 'Filosofi Kopi', 'Dewi Lestari', 'Gramedia Pustaka Utama', '2006', '15', 'Dipinjam', 'Fiksi'),
  ('BK005', 'Laskar Pelangi - Negeri Para Bedebah', 'Andrea Hirata', 'Bentang Pustaka', '2013', '10', 'Tersedia', 'Fiksi'),
  ('BK006', 'Orang-Orang Biasa', 'Andrea Hirata', 'Bentang Pustaka', '2011', '7', 'Dipinjam', 'Fiksi'),
  ('BK007', 'Anak Semua Bangsa', 'Pramoedya Ananta Toer', 'Lentera Pustaka', '2019', '12', 'Tersedia', 'Non-Fiksi'),
  ('BK008', 'Habis Gelap Terbitlah Terang', 'Tan Malaka', 'Yayasan Pustaka Marxis', '2012', '8', 'Dipinjam', 'Non-Fiksi'),
  ('BK009', 'Sejarah Indonesia Baru', 'George McTurnan Kahin', 'Yayasan Obor Indonesia', '2017', '15', 'Tersedia', 'Non-Fiksi'),
  ('BK010', 'Senyap', 'Eka Kurniawan', 'Gramedia Pustaka Utama', '2002', '20', 'Dipinjam', 'Fiksi');
  
CREATE TABLE peminjaman (
  Kode_Peminjaman VARCHAR(10) PRIMARY KEY,
  IdAnggota VARCHAR(10) NOT NULL,
  IdPetugas VARCHAR(10) NOT NULL,
  Kode_Buku VARCHAR(10) NOT NULL,
  Tanggal_Pinjam DATE NOT NULL,
  Tanggal_Kembali DATE NOT NULL
);

DROP TABLE peminjaman;

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Kode_Buku, Tanggal_Pinjam, Tanggal_Kembali) VALUES
  ('PINJAM01', 'ANGGOTA01', 'PETUGAS01', 'BK001', '2024-04-20', '2024-05-20'),
  ('PINJAM02', 'ANGGOTA02', 'PETUGAS02', 'BK002', '2024-04-21', '2024-05-21'),
  ('PINJAM03', 'ANGGOTA03', 'PETUGAS01', 'BK003', '2024-04-22', '2024-05-22'),
  ('PINJAM04', 'ANGGOTA04', 'PETUGAS02', 'BK004', '2024-04-23', '2024-05-23'),
  ('PINJAM05', 'ANGGOTA05', 'PETUGAS01', 'BK005', '2024-04-24', '2024-05-24'),
  ('PINJAM06', 'ANGGOTA01', 'PETUGAS02', 'BK006', '2024-04-25', '2024-05-25'),
  ('PINJAM07', 'ANGGOTA02', 'PETUGAS01', 'BK001', '2024-04-26', '2024-05-26'),
  ('PINJAM08', 'ANGGOTA03', 'PETUGAS02', 'BK007', '2024-04-27', '2024-05-27'),
  ('PINJAM09', 'ANGGOTA04', 'PETUGAS01', 'BK008', '2024-04-28', '2024-05-28'),
  ('PINJAM10', 'ANGGOTA05', 'PETUGAS02', 'BK009', '2024-04-29', '2024-05-29');

CREATE TABLE pengembalian (
  Kode_Peminjaman VARCHAR(10) PRIMARY KEY,
  IdAnggota VARCHAR(10) NOT NULL,
  IdPetugas VARCHAR(10) NOT NULL,
  Tanggal_Pinjam DATE NOT NULL,
  Tanggal_Kembali DATE NOT NULL,
  Kode_Buku VARCHAR(15) NOT NULL,
  Denda INT(11) NOT NULL
);

DROP TABLE pengembalian;

INSERT INTO pengembalian (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku, Denda) VALUES
  ('PINJAM01', 'ANGGOTA01', 'PETUGAS01', '2024-04-20', '2024-05-20', 'BK001', 0),
  ('PINJAM02', 'ANGGOTA02', 'PETUGAS02', '2024-04-21', '2024-05-21', 'BK002', 0),
  ('PINJAM03', 'ANGGOTA03', 'PETUGAS01', '2024-04-22', '2024-05-22', 'BK003', 0),
  ('PINJAM04', 'ANGGOTA04', 'PETUGAS02', '2024-04-23', '2024-05-23', 'BK004', 0),
  ('PINJAM05', 'ANGGOTA05', 'PETUGAS01', '2024-04-24', '2024-05-24', 'BK005', 0),
  ('PINJAM06', 'ANGGOTA01', 'PETUGAS02', '2024-04-25', '2024-05-25', 'BK006', 0),
  ('PINJAM07', 'ANGGOTA02', 'PETUGAS01', '2024-04-26', '2024-05-26', 'BK001', 0),
  ('PINJAM08', 'ANGGOTA03', 'PETUGAS02', '2024-04-27', '2024-05-27', 'BK007', 0),
  ('PINJAM09', 'ANGGOTA04', 'PETUGAS01', '2024-04-28', '2024-05-28', 'BK008', 0),
  ('PINJAM10', 'ANGGOTA05', 'PETUGAS02', '2024-04-29', '2024-05-29', 'BK009', 0);
  
DELIMITER //
CREATE PROCEDURE search_anggota()
BEGIN
    SELECT * FROM anggota;
END //
DELIMITER ;
CALL search_anggota();


DELIMITER //
CREATE PROCEDURE search_penerbit_buku(IN PenerbitBuku VARCHAR(30))
	BEGIN
		SELECT * FROM buku
		WHERE Penerbit_Buku = PenerbitBuku;
	END //
DELIMITER ;
CALL search_penerbit_buku('Gramedia');


DELIMITER //
CREATE PROCEDURE search_tgl_pinjam(
	IN TanggalPinjam DATE,
    	IN KodeBuku VARCHAR (10))
	BEGIN
		SELECT * FROM peminjaman
       		WHERE Tanggal_Pinjam = TanggalPinjam 
        	AND Kode_Buku = KodeBuku;
	END //
DELIMITER ; 
CALL search_tgl_pinjam('2024-04-20','BK001');

DELIMITER //
CREATE PROCEDURE search_angkatan_anggota(
	IN Angkatan VARCHAR (6),
    	IN TempatLahir VARCHAR (20),
    	IN JenisKelamin VARCHAR (15))
	BEGIN
		SELECT * FROM anggota
        WHERE Angkatan_Anggota = Angkatan 
       	AND Tempat_Lahir_Anggota = TempatLahir
     	AND Jenis_Kelamin = JenisKelamin;
	END //
DELIMITER ; 
CALL search_angkatan_anggota('2023','Surabaya','Laki-laki');

DELIMITER //
CREATE PROCEDURE input_anggota(
	IdAnggota VARCHAR (10),
    	Nama_Anggota VARCHAR (20),
    	Angkatan_Anggota VARCHAR (6),
    	Tempat_Lahir_Anggota VARCHAR (20),
    	Tanggal_Lahir_Anggota DATE,
    	No_Telp INT (12),
   	Jenis_Kelamin VARCHAR (15),
    	Status_Pinjam VARCHAR (15))
    	BEGIN
	INSERT INTO anggota VALUES (idAnggota,Nama_Anggota,Angkatan_Anggota,Tempat_Lahir_Anggota,Tanggal_Lahir_Anggota,No_Telp,Jenis_Kelamin,Status_Pinjam);
END //
DELIMITER ;
CALL input_anggota('14', 'Akhmad Sulthon Rabbani', '22', 'Sumenep', '2003-08-04', 088291847647, 'Laki-Laki', 'Sudah');

DELIMITER //
CREATE PROCEDURE get_jumlah_anggota(
    OUT jumlah_anggota INT)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota FROM tb_anggota;
END //
DELIMITER ;

CALL get_jumlah_anggota(@total_anggota);

SELECT @total_anggota AS TotalAnggota;

DELIMITER //
CREATE PROCEDURE jumlah_buku(
    IN NamaPengarang VARCHAR (35),
    INOUT tahunTerbit VARCHAR (10),
    OUT totalBuku INT)
	BEGIN
	SELECT SUM(Jumlah_Buku) INTO totalBuku
	FROM buku
	WHERE Pengarang_Buku = NamaPengarang 
        AND Tahun_Buku = tahunTerbit;
	SET tahunTerbit = tahunTerbit + 1;
	END //
DELIMITER ; 
SET @tahunTerbit = '2017';
CALL jumlah_buku('Tere Liye', @tahunTerbit , @totalBuku);

SELECT 'Tere Liye', @tahunTerbit , @totalBuku AS jumlah_buku;