create database perpustakaan;
use perpustakaan;
 
CREATE TABLE anggota(
Id_Anggota VARCHAR (10) PRIMARY KEY,
Nama_Anggota VARCHAR (20),
Angkatan_Anggota VARCHAR (6),
Tempat_Lahir_Anggota VARCHAR (20),
Tanggal_Lahir_Anggota DATE, 
No_Telp INT (12),
Jenis_Kelamin VARCHAR (15),
Status_Pinjam VARCHAR(15)
);

INSERT INTO anggota (Id_Anggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) 
VALUES 
('A01', 'anang', '2018', 'Jakarta', '1995-03-15', 088765678987, 'Laki-laki', 'Tidak Meminjam'),
('A02', 'putri', '2019', 'Surabaya', '1997-08-22', 087654321453, 'Perempuan', 'Meminjam'),
('A03', 'Michael', '2017', 'Bandung', '1994-11-10', 087654565432, 'Laki-laki', 'Tidak Meminjam'),
('A04', 'Emma', '2020', 'Semarang', '1998-04-25', 082140665432, 'Perempuan', 'Meminjam'),
('A05', 'David', '2016', 'Yogyakarta', '1993-07-18', 089763534528, 'Laki-laki', 'Tidak Meminjam'),
('A06', 'Sarah', '2021', 'Medan', '1999-12-05', 0897654500980, 'Perempuan', 'Meminjam'),
('A07', 'Chris', '2015', 'Surabaya', '1992-05-30', 087980564100, 'Laki-laki', 'Tidak Meminjam'),
('A08', 'Amanda', '2022', 'Jakarta', '2000-10-12', 08654358764, 'Perempuan', 'Tidak Meminjam'),
('A09', 'Kevin', '2014', 'Bandung', '1991-01-28', 08976543212, 'Laki-laki', 'Tidak Meminjam'),
('A10', 'Linda', '2023', 'Semarang', '2001-08-09', 089765432123, 'Perempuan', 'Meminjam');

CREATE TABLE peminjaman(
 Kode_Peminjaman VARCHAR (10) PRIMARY KEY,
 Id_Anggota VARCHAR (10),
 Id_Petugas VARCHAR (10),
 Tanggal_Pinjam DATE,
 Tanggal_Kembali DATE,
 Kode_Buku VARCHAR (10),
 FOREIGN KEY (Id_Anggota) REFERENCES anggota (Id_Anggota),
 FOREIGN KEY (Id_Petugas) REFERENCES petugas (Id_Petugas),
 FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku)
);

-- Tabel Peminjaman
INSERT INTO peminjaman (Kode_Peminjaman, Id_Anggota, Id_Petugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) 
VALUES 
('PJ01', 'A01', 'P01', '2024-04-01', '2024-04-15', 'B01'),
('PJ02', 'A02', 'P02', '2024-04-03', '2024-04-17', 'B02'),
('PJ03', 'A03', 'P03', '2024-04-05', '2024-04-19', 'B03'),
('PJ04', 'A04', 'P04', '2024-04-07', '2024-04-21', 'B04'),
('PJ05', 'A05', 'P05', '2024-04-09', '2024-04-23', 'B05'),
('PJ06', 'A06', 'P06', '2024-04-11', '2024-04-25', 'B06'),
('PJ07', 'A07', 'P07', '2024-04-13', '2024-04-27', 'B07'),
('PJ08', 'A08', 'P08', '2024-04-15', '2024-04-29', 'B08'),
('PJ09', 'A09', 'P09', '2024-04-17', '2024-04-01', 'B09'),
('PJ10', 'A10', 'P10', '2024-04-19', '2024-04-03', 'B10');


CREATE TABLE buku(
Kode_Buku VARCHAR (10) PRIMARY KEY,
Judul_Buku VARCHAR (25),
Pengarang_Buku VARCHAR (30),
Penerbit_Buku VARCHAR (30),
Tahun_Buku VARCHAR (10),
Jumlah_Buku VARCHAR (5),
Status_Buku VARCHAR (10),
Klasifikasi_Buku VARCHAR (20)
);

-- Tabel Buku
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) 
VALUES 
('B01', 'Harry Potter', 'J.K. Rowling', 'Gramedia', '1997', '5', 'Tersedia', 'Novel'),
('B02', 'Sangkuriang', 'Harper Lee', 'HarperCollins', '1960', '3', 'Tersedia', 'Dongeng'),
('B03', '5 cm', 'George Orwell', 'Penguin Books', '1949', '2', 'Dipinjam', 'Novel'),
('B04', '172 Days', 'F. Scott Fitzgerald', 'Gramedia', '1925', '4', 'Tersedia', 'Novel'),
('B05', 'Detektif Conan', 'Jane Austen', 'Thomas Egerton', '1813', '1', 'Tersedia', 'Komik'),
('B06', 'Divergent', 'J.D. Salinger', 'Little Company', '1951', '6', 'Tersedia', 'Fiksi'),
('B07', 'One Piece', 'George Orwell', 'Secker and Warburg', '1945', '3', 'Dipinjam', 'Komik'),
('B08', 'Mariposa', 'J.R.R. Tolkien', 'Gramedia', '1937', '2', 'Tersedia', 'Novel'),
('B09', 'Ir. Soekarno', 'Aldous Huxley', 'Chatto & Windus', '1932', '5', 'Tersedia', 'Biografi'),
('B10', 'Timun Mas', 'William Golding', 'Gramedia', '1954', '4', 'Tersedia', 'Dongeng');


CREATE TABLE petugas(
Id_Petugas VARCHAR (10)PRIMARY KEY,
Username VARCHAR (15),
Sandi VARCHAR (15),
Nama VARCHAR (25)
);

-- Tabel Petugas
INSERT INTO petugas (Id_Petugas, Username, Sandi, Nama) 
VALUES 
('P01', 'petugas1', 'password1', 'Jennifer laurence'),
('P02', 'petugas2', 'password2', 'Jane Nur'),
('P03', 'petugas3', 'password3', 'Edward Cullen'),
('P04', 'petugas4', 'password4', 'Taylor Swift'),
('P05', 'petugas5', 'password5', 'Adele'),
('P06', 'petugas6', 'password6', 'Olivia'),
('P07', 'petugas7', 'password7', 'John Legend'),
('P08', 'petugas8', 'password8', 'Rossa'),
('P09', 'petugas9', 'password9', 'Irene'),
('P10', 'petugas10', 'password10', 'Alan');


CREATE TABLE pengembalian(
Kode_Kembali VARCHAR (10)PRIMARY KEY,
Id_Anggota VARCHAR (10),
Kode_Buku VARCHAR (10),
Id_Petugas VARCHAR (10),
Tgl_Pinjam DATE,
Tgl_Kembali DATE,
Denda VARCHAR (15),
FOREIGN KEY (Id_Anggota) REFERENCES anggota (Id_Anggota),
FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku),
FOREIGN KEY (Id_Petugas) REFERENCES petugas (Id_Petugas)
);

INSERT INTO pengembalian (Kode_Kembali, Id_Anggota, Kode_Buku, Id_Petugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES 
('PK01', 'A01', 'B01', 'P01', '2024-04-01', '2024-04-15', '0'),
('PK02', 'A02', 'B02', 'P02', '2024-04-03', '2024-04-18', 'Rp.2000'),
('PK03', 'A03', 'B03', 'P03', '2024-04-05', '2024-04-21', 'Rp.4000'),
('PK04', 'A04', 'B04', 'P04', '2024-04-07', '2024-04-21', '0'),
('PK05', 'A05', 'B05', 'P05', '2024-04-09', '2024-04-26', 'Rp.6000'),
('PK06', 'A06', 'B06', 'P06', '2024-04-11', '2024-04-29', 'Rp.8000'),
('PK07', 'A07', 'B07', 'P07', '2024-04-13', '2024-04-28', 'Rp.4000'),
('PK08', 'A08', 'B08', 'P08', '2024-04-15', '2024-04-31', 'Rp.40000'),
('PK09', 'A09', 'B09', 'P09', '2024-04-17', '2024-05-16', 'Rp.30000'),
('PK10', 'A10', 'B10', 'P10', '2024-04-19', '2024-05-13', 'Rp.20000');

select * from anggota;
select * from buku;
select * from petugas;
select * from peminjaman;
select * from pengembalian;


-- nomor satu Buatlah sebuah prosedur dengan menggunakan parameter IN default

DELIMITER //
CREATE PROCEDURE search_anggota(ID varchar(10))
BEGIN 
	SELECT * FROM anggota
    WHERE Id_Anggota = ID;
END //
DELIMITER ;

CALL search_anggota('A08');

-- nomor dua Buatlah stored procedure untuk mengetahui data pada table anggota berdasarkan pada salah satu field yaitu nama.

DELIMITER //
CREATE PROCEDURE show_nama_anggota(IN a_nama varchar(10))
BEGIN 
	SELECT * FROM anggota
    WHERE Nama_Anggota = a_nama;
END //
DELIMITER ;

call show_nama_anggota('emma');

-- nomor tiga Buatlah stored procedure untuk mengetahui data pada table buku berdasarkan dua field yaitu status dan klasifikasi buku.

DELIMITER //
CREATE PROCEDURE show_status_klasifikasi_buku(
IN b_status varchar(20),
in b_klasifiikasi varchar(20))
BEGIN 
	SELECT * FROM buku
    WHERE Status_Buku = b_status and Klasifikasi_Buku = b_klasifiikasi;
END //
DELIMITER ;

call show_status_klasifikasi_buku('Tersedia', 'Novel');
drop procedure show_status_klasifikasi_buku;

-- nomor empat Buatlah stored procedure untuk mengetahui data peminjam pada table peminjaman berdasarkan pada 3 field yaitu anggota, tanggal pinjam dan kode buku.

DELIMITER //
CREATE PROCEDURE Show_Peminjaman_Berdasarkan_Detail(
    IN p_IdAnggota VARCHAR(10),
    IN p_Tanggal_Pinjam DATE,
    IN p_Kode_Buku VARCHAR(10)
)
BEGIN
    SELECT * FROM peminjaman 
    WHERE Id_Anggota = p_IdAnggota 
    AND Tanggal_Pinjam = p_Tanggal_Pinjam 
    AND Kode_Buku = p_Kode_Buku;
END //
DELIMITER ;

call Show_Peminjaman_Berdasarkan_Detail('A01', '2024-04-01', 'B01');
drop procedure  Show_Peminjaman_Berdasarkan_Detail;

-- nomor lima Definisikan stored procedure untuk memasukkan data pada table petugas.

DELIMITER //
CREATE PROCEDURE input_petugas(
	IN p_IdPetugas varchar(15),
    IN p_username VARCHAR(15),
    IN p_sandi VARCHAR(15),
    IN p_nama VARCHAR(15)
)
BEGIN 
	INSERT INTO petugas
    VALUES (p_IdPetugas, p_username, p_sandi, p_nama);
END //
DELIMITER ;

CALL input_petugas ('P11', "PETUGAS11", "password11", "Cak Hudi");
select * from petugas;

-- nomor enam Definisikan stored procedure untuk mengetahui data jumlah peminjam menggunakan parameter OUT.

DELIMITER //
CREATE PROCEDURE show_jumlah_peminjaman(
	OUT JumlahPeminjam INT (10))
    BEGIN
		SELECT COUNT(Kode_Peminjaman) INTO JumlahPeminjam FROM peminjaman;
	END //
DELIMITER ;
    
CALL show_jumlah_peminjaman(@JumlahPeminjam);
SELECT @JumlahPeminjam;

-- nomor tujuh Definisikan stored procedure untuk mengetahui data jumlah peminjam berdasarkan tanggal pinjam dan kode buku menggunakan parameter INOUT.
DELIMITER //
CREATE PROCEDURE jumlahpeminjam (
    IN p_tanggal_peminjaman DATE,
    IN p_kode_buku VARCHAR(10),
    OUT totalpeminjam INT
)
BEGIN
    SELECT COUNT(Kode_Buku) INTO totalpeminjam 
    FROM peminjaman 
    WHERE Tanggal_Pinjam = p_tanggal_peminjaman AND Kode_Buku = p_kode_buku;
END //
DELIMITER ;

CALL jumlahpeminjam('2024-04-01', 'B01', @totalpeminjam);
SELECT @totalpeminjam;

DELIMITER ;
 