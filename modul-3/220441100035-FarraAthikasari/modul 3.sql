CREATE DATABASE peminjaman_buku;
USE peminjaman_buku;

CREATE TABLE petugas (
Id_Petugas VARCHAR (10) PRIMARY KEY NOT NULL,
Username VARCHAR (15),
Password VARCHAR (15),
Nama VARCHAR(25)
);
DESC petugas;

CREATE TABLE buku (
Kode_Buku VARCHAR (10) PRIMARY KEY NOT NULL,
Judul_Buku VARCHAR (25),
Pengarang_Buku VARCHAR (30),
Penerbit_Buku VARCHAR (30),
Tahun_Buku VARCHAR (10),
Jumlah_Buku VARCHAR (5),
Status_Buku VARCHAR (10),
Klasifikasi_Buku VARCHAR (20)
);
DESC buku;

CREATE TABLE anggota (
Id_Anggota VARCHAR (10) PRIMARY KEY NOT NULL,
Nama_Anggota VARCHAR (20),
Angkatan_Anggota VARCHAR (6),
Tempat_Lahir_Anggota VARCHAR(20), 
Tanggal_Lahir_Anggota DATE,
No_Telp INT (12),
Jenis_Kelamin VARCHAR (15),
Status_Pinjam VARCHAR (15)
);
DESC anggota;

CREATE TABLE peminjaman (
Kode_Peminjaman VARCHAR (10) PRIMARY KEY NOT NULL,
Id_Anggota VARCHAR (15),
Id_Petugas VARCHAR (15),
Tanggal_Pinjam DATE,
Tanggal_Kembali DATE,
Kode_Buku VARCHAR (10),
FOREIGN KEY (Id_Anggota) REFERENCES anggota (Id_Anggota),
FOREIGN KEY (Id_Petugas) REFERENCES petugas (Id_Petugas),
FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku)
);
DESC peminjaman;

CREATE TABLE pengembalian (
Kode_Kembali VARCHAR (10) PRIMARY KEY NOT NULL,
Id_Anggota VARCHAR (10),
Kode_Buku VARCHAR (10),
Id_Petugas VARCHAR(10),
Tgl_Pinjam DATE,
Tgl_Kembali DATE,
Denda VARCHAR (15),
FOREIGN KEY (Id_Anggota) REFERENCES anggota (Id_Anggota),
FOREIGN KEY (Kode_Buku) REFERENCES buku (Kode_Buku),
FOREIGN KEY (Id_Petugas) REFERENCES petugas (Id_Petugas)
);
DESC pengembalian;

INSERT INTO petugas (Id_Petugas, Username, Password, Nama) VALUES
('PT001', 'user1', 'pass1', 'John Doe'),
('PT002', 'user2', 'pass2', 'Jane Smith'),
('PT003', 'user3', 'pass3', 'Alice Johnson'),
('PT004', 'user4', 'pass4', 'Bob Brown'),
('PT005', 'user5', 'pass5', 'Charlie Wilson'),
('PT006', 'user6', 'pass6', 'David Lee'),
('PT007', 'user7', 'pass7', 'Eva Garcia'),
('PT008', 'user8', 'pass8', 'Fiona Chen'),
('PT009', 'user9', 'pass9', 'George Wang'),
('PT010', 'user10', 'pass10', 'Helen Kim');
SELECT * FROM petugas;

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku,
Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES
('KB001', 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Scholastic', '1997', '5', 'Available', 'Fiction'),
('KB002', 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', '1960', '3', 'Available', 'Fiction'),
('KB003', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons', '1925', '2', 'Available', 'Fiction'),
('KB004', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', '4', 'Available', 'Fiction'),
('KB005', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', '3', 'Available', 'Fiction'),
('KB006', '1984', 'George Orwell', 'Secker and Warburg', '1949', '2', 'Available', 'Fiction'),
('KB007', 'The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', '1937', '4', 'Available', 'Fantasy'),
('KB008', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Allen & Unwin', '1954', '3', 'Available', 'Fantasy'),
('KB009', 'The Chronicles of Narnia', 'C.S. Lewis', 'Geoffrey Bles', '1950', '3', 'Available', 'Fantasy'),
('KB010', 'The Hunger Games', 'Suzanne Collins', 'Scholastic Corporation', '2008', '5', 'Available', 'Young Adult');
SELECT * FROM buku;

INSERT INTO anggota (Id_Anggota, Nama_Anggota, Angkatan_Anggota,
Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES
('A001', 'John Doe', '2018', 'Jakarta', '1995-05-15', '081234567890', 'Laki-laki', 'Tidak Meminjam'),
('A002', 'Jane Smith', '2019', 'Surabaya', '1996-08-20', '082345678901', 'Perempuan', 'Tidak Meminjam'),
('A003', 'Alice Johnson', '2020', 'Bandung', '1997-03-10', '083456789012', 'Perempuan', 'Meminjam'),
('A004', 'Bob Brown', '2017', 'Yogyakarta', '1994-11-25', '084567890123', 'Laki-laki', 'Tidak Meminjam'),
('A005', 'Charlie Wilson', '2016', 'Medan', '1993-02-28', '085678901234', 'Laki-laki', 'Meminjam'),
('A006', 'David Lee', '2021', 'Semarang', '1998-09-05', '086789012345', 'Laki-laki', 'Tidak Meminjam'),
('A007', 'Eva Garcia', '2015', 'Makassar', '1992-06-17', '087890123456', 'Perempuan', 'Meminjam'),
('A008', 'Fiona Chen', '2014', 'Palembang', '1991-12-30', '088901234567', 'Perempuan', 'Tidak Meminjam'),
('A009', 'George Wang', '2022', 'Batam', '1999-04-22', '089012345678', 'Laki-laki', 'Meminjam'),
('A010', 'Helen Kim', '2013', 'Balikpapan', '1990-07-08', '090123456789', 'Perempuan', 'Tidak Meminjam');
SELECT * FROM anggota;

INSERT INTO peminjaman (Kode_Peminjaman, Id_Anggota, Id_Petugas, Tanggal_Pinjam,
Tanggal_Kembali, Kode_Buku) VALUES
('P001', 'A001', 'PT001', '2024-04-25', '2024-05-10', 'KB001'),
('P002', 'A002', 'PT002', '2024-04-26', '2024-05-11', 'KB002'),
('P003', 'A003', 'PT003', '2024-04-27', '2024-05-12', 'KB003'),
('P004', 'A004', 'PT004', '2024-04-28', '2024-05-13', 'KB004'),
('P005', 'A005', 'PT005', '2024-04-29', '2024-05-14', 'KB005'),
('P006', 'A006', 'PT006', '2024-04-30', '2024-05-15', 'KB006'),
('P007', 'A007', 'PT007', '2024-05-01', '2024-05-16', 'KB007'),
('P008', 'A008', 'PT008', '2024-05-02', '2024-05-17', 'KB008'),
('P009', 'A009', 'PT009', '2024-05-03', '2024-05-18', 'KB009'),
('P010', 'A010', 'PT010', '2024-05-04', '2024-05-19', 'KB010');
SELECT * FROM peminjaman;

INSERT INTO pengembalian (Kode_Kembali, Id_Anggota, Kode_Buku, Id_Petugas,
Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
('K001', 'A001', 'KB001', 'PT001', '2024-04-25', '2024-05-10', '0'),
('K002', 'A002', 'KB002', 'PT002', '2024-04-26', '2024-05-11', '0'),
('K003', 'A003', 'KB003', 'PT003', '2024-04-27', '2024-05-12', '0'),
('K004', 'A004', 'KB004', 'PT004', '2024-04-28', '2024-05-13', '0'),
('K005', 'A005', 'KB005', 'PT005', '2024-04-29', '2024-05-14', '0'),
('K006', 'A006', 'KB006', 'PT006', '2024-04-30', '2024-05-15', '0'),
('K007', 'A007', 'KB007', 'PT007', '2024-05-01', '2024-05-16', '0'),
('K008', 'A008', 'KB008', 'PT008', '2024-05-02', '2024-05-17', '0'),
('K009', 'A009', 'KB009', 'PT009', '2024-05-03', '2024-05-18', '0'),
('K010', 'A010', 'KB010', 'PT010', '2024-05-04', '2024-05-19', '0');
SELECT * FROM pengembalian;

-- NOMOR 1
DELIMITER //
CREATE PROCEDURE tambah_petugas(
    IN Id_Petugas VARCHAR(10),
    IN Username VARCHAR(15),
    IN Password VARCHAR(15),
    IN Nama VARCHAR(24)
)
BEGIN
    INSERT INTO petugas VALUES (Id_Petugas, Username, Password, Nama);
END //
DELIMITER ;
CALL tambah_petugas ('PT011', 'user11', 'pass11', 'Meylinda');    
SELECT * FROM petugas;


-- NOMOR 2
DELIMITER //
CREATE PROCEDURE Pengembalian_Buku(
    IN Kode_Kembali_baru varchar (10)
)
BEGIN
    SELECT * FROM pengembalian WHERE Kode_Kembali = Kode_Kembali_baru;
END //
DELIMITER ;
CALL Pengembalian_Buku('K002');


-- NOMOR 3
DELIMITER //
CREATE PROCEDURE Data_Anggota(
    IN Angkatan_Baru VARCHAR(6),
    IN Jenis_Kelamin_Baru VARCHAR(15)
)
BEGIN
    SELECT * FROM anggota 
    WHERE Angkatan_Anggota = Angkatan_baru AND Jenis_Kelamin = Jenis_Kelamin_Baru;
END //
DELIMITER ;
CALL Data_Anggota ('2017','Laki-laki');


-- NOMOR 4
DELIMITER //
CREATE PROCEDURE Cari_Buku (
    IN Pengarang_Input VARCHAR(30),
    IN Penerbit_Input VARCHAR(30),
    IN Tahun_Terbit_Input VARCHAR(10)
)
BEGIN
    SELECT * FROM buku WHERE Pengarang_Buku = Pengarang_Input 
    AND Penerbit_Buku = Penerbit_Input AND Tahun_Buku = Tahun_Terbit_Input;
END //
DELIMITER ;
CALL Cari_Buku('Harper Lee', 'J.B. Lippincott & Co.', '1960');


-- NOMOR 5
DELIMITER //
CREATE PROCEDURE Tambah_Buku(
    IN Kode_Buku varchar(10),
    IN Judul_Buku varchar(25),
    IN Pengarang_Buku varchar(30),
    IN Penerbit_Buku varchar(30),
    IN Tahun_Buku varchar(10),
    IN Jumlah_buku varchar(5),
    IN Status_Buku varchar(10),
    IN Klasifikasi_Buku varchar(20)
)
BEGIN
    INSERT INTO buku VALUES (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_buku, Status_Buku, Klasifikasi_Buku);
END //
DELIMITER ;
CALL Tambah_Buku ('KB011', 'Negri Para Bedebah', 'Tere Liye', 'Gramedia Pustaka Utama', '2007', '10', 'Tersedia', 'Fiction');
SELECT * FROM buku;


-- NOMOR 6
DELIMITER //
CREATE PROCEDURE hitung_jumlah_buku (
    OUT jumlah_buku INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_buku FROM buku;
END //
DELIMITER ;
CALL hitung_jumlah_buku (@jumlah);
SELECT @jumlah AS 'Jumlah Buku';


-- NOMOR 7
DELIMITER //
SET @nama = 'Farra';
SET @angkatan = '2020';
SET @jeniskelamin = 'Perempuan';
CALL jumlahanggota (@nama, @angkatan, @jeniskelamin 
CREATE PROCEDURE hitung_jumlah_anggota(
    IN Angkatan_Baru VARCHAR(6),
    IN Jenis_Kelamin_Baru VARCHAR(15),
    OUT Total_Anggota INT
)
BEGIN
    SELECT COUNT(*) INTO Total_Anggota
    FROM anggota
    WHERE Angkatan_Anggota = Angkatan_Baru AND Jenis_Kelamin = Jenis_Kelamin_Baru;
END //
DELIMITER ;
SET @angkatan='2020';
SET @jenkel = 'perempuan';
CALL hitung_jumlah_anggota(@angkatan, @nama, @Total_Anggota);
SELECT @angkatan,@jenkel,@Total_Anggota;




