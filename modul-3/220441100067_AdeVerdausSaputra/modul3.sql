create database perpustakaan;
use perpustakaan;
drop database perpustakaan;

-- Tabel anggota
CREATE TABLE anggota (
  id_anggota varchar(10) PRIMARY KEY,
  nama_anggota varchar(20) NOT NULL,
  angkatan_anggota varchar (6),
  tempat_lahir_anggota varchar(20) NOT NULL,
  tanggal_lahir_anggota date NOT NULL,
  no_telepon int(12) NOT NULL,
  jenis_kelamin varchar(15) NOT NULL,
  status_pinjam varchar(15) NOT NULL
);

-- Tabel buku
CREATE TABLE buku (
  kode_buku varchar(10) PRIMARY KEY,
  judul_buku varchar(25) NOT NULL,
  pengarang_buku varchar(30) NOT NULL,
  penerbit_buku varchar(30) NOT NULL,
  tahun_buku varchar(10) NOT NULL,
  jumlah_buku int(5) NOT NULL,
  status_buku varchar(10) NOT NULL,
  klasifikasi_buku varchar(20) NOT NULL
);

-- Tabel peminjaman
CREATE TABLE peminjaman (
  kode_peminjaman varchar(10) PRIMARY KEY,
  id_anggota varchar(10) NOT NULL,
  id_petugas varchar(10) NOT NULL,
  tanggal_pinjam date NOT NULL,
  tanggal_kembali date,
  kode_buku varchar(10) NOT NULL
);

-- Tabel pengembalian
CREATE TABLE pengembalian (
  kode_kembali varchar(10) PRIMARY KEY,
  id_anggota varchar (10),
  kode_buku varchar(10) NOT NULL,
  id_petugas varchar(10) NOT NULL,
  tanggal_pinjam date not null,
  tanggal_kembali date NOT NULL,
  denda varchar(15) DEFAULT '0'
);

-- Tabel petugas
CREATE TABLE petugas (
  id_petugas varchar(10) PRIMARY KEY,
  username varchar(15) NOT NULL,
  password varchar(15) NOT NULL,
  nama varchar(25) NOT NULL
);

-- Relasi antar tabel
ALTER TABLE peminjaman
  ADD FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota);

ALTER TABLE peminjaman
  ADD FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

ALTER TABLE peminjaman
  ADD FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas);

ALTER TABLE pengembalian
  ADD FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

ALTER TABLE pengembalian
  ADD FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas);

ALTER TABLE pengembalian
  ADD FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota);

-- isi data
INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telepon, jenis_kelamin, status_pinjam) 
VALUES 
('A001', 'John Doe', '2018', 'Jakarta', '1995-08-10', 1234567890, 'Laki-laki', 'Aktif'),
('A002', 'Jane Smith', '2019', 'Bandung', '1998-03-15', 0987654321, 'Perempuan', 'Aktif'),
('A003', 'Michael Johnson', '2020', 'Surabaya', '2000-12-20', 1357924680, 'Laki-laki', 'Tidak Aktif'),
('A004', 'Emma Lee', '2017', 'Medan', '1996-07-05', 2468013579, 'Perempuan', 'Aktif'),
('A005', 'Daniel Brown', '2021', 'Yogyakarta', '2002-10-25', 9876543210, 'Laki-laki', 'Aktif'),
('A006', 'Olivia Garcia', '2016', 'Semarang', '1995-01-30', 1029384756, 'Perempuan', 'Tidak Aktif'),
('A007', 'William Martinez', '2019', 'Bali', '1997-04-12', 5678901234, 'Laki-laki', 'Aktif'),
('A008', 'Sophia Hernandez', '2020', 'Makassar', '2001-09-18', 3141592653, 'Perempuan', 'Aktif'),
('A009', 'Alexander Wilson', '2018', 'Palembang', '1999-06-28', 9876543210, 'Laki-laki', 'Aktif'),
('A010', 'Isabella Taylor', '2017', 'Manado', '1996-11-15', 1234509876, 'Perempuan', 'Tidak Aktif');

INSERT INTO petugas (id_petugas, username, password, nama) 
VALUES 
('P001', 'john_doe', 'password123', 'John Doe'),
('P002', 'jane_smith', 'smithy456', 'Jane Smith'),
('P003', 'mike_j', 'mikepass', 'Michael Johnson'),
('P004', 'emma_l', 'emmapass', 'Emma Lee'),
('P005', 'dan_brown', 'danpass', 'Daniel Brown'),
('P006', 'olivia_g', 'oliviapass', 'Olivia Garcia'),
('P007', 'will_m', 'willpass', 'William Martinez'),
('P008', 'sophia_h', 'sophiapass', 'Sophia Hernandez'),
('P009', 'alex_w', 'alexpass', 'Alexander Wilson'),
('P010', 'izzy_t', 'izzypass', 'Isabella Taylor');

INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) 
VALUES 
('B001', 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Bloomsbury', '1997', 5, 'Available', 'Fantasy'),
('B002', 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', '1960', 3, 'Available', 'Fiction'),
('B003', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', '1925', 4, 'Available', 'Classic'),
('B004', '1984', 'George Orwell', 'Secker & Warburg', '1949', 6, 'Available', 'Dystopian'),
('B005', 'Pride and Prejudice', 'Jane Austen', 'T. Egerton, Whitehall', '1813', 2, 'Available', 'Romance'),
('B006', 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951', 3, 'Available', 'Coming-of-Age'),
('B007', 'To the Lighthouse', 'Virginia Woolf', 'The Hogarth Press', '1927', 4, 'Available', 'Modernist'),
('B008', 'Brave New World', 'Aldous Huxley', 'Chatto & Windus', '1932', 5, 'Available', 'Science Fiction'),
('B009', 'The Lord of the Rings', 'J.R.R. Tolkien', 'George Allen & Unwin', '1954', 7, 'Available', 'Fantasy'),
('B010', 'Moby-Dick', 'Herman Melville', 'Richard Bentley', '1851', 3, 'Available', 'Adventure');

INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) 
VALUES 
('P001', 'A001', 'P001', '2024-04-01', '2024-04-15', 'B001'),
('P002', 'A002', 'P002', '2024-04-02', '2024-04-16', 'B002'),
('P003', 'A003', 'P003', '2024-04-03', NULL, 'B003'),
('P004', 'A004', 'P004', '2024-04-04', NULL, 'B004'),
('P005', 'A005', 'P005', '2024-04-05', NULL, 'B005'),
('P006', 'A006', 'P006', '2024-04-06', '2024-04-20', 'B006'),
('P007', 'A007', 'P007', '2024-04-07', '2024-04-21', 'B007'),
('P008', 'A008', 'P008', '2024-04-08', '2024-04-22', 'B008'),
('P009', 'A009', 'P009', '2024-04-09', NULL, 'B009'),
('P010', 'A010', 'P010', '2024-04-10', NULL, 'B010');

INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tanggal_pinjam, tanggal_kembali, denda) 
VALUES 
('K001', 'A001', 'B001', 'P001', '2024-04-01', '2024-04-15', '0'),
('K002', 'A002', 'B002', 'P002', '2024-04-02', '2024-04-16', '0'),
('K003', 'A003', 'B003', 'P003', '2024-04-03', '2024-04-17', '50.000'),
('K004', 'A004', 'B004', 'P004', '2024-04-04', '2024-04-18', '0'),
('K005', 'A005', 'B005', 'P005', '2024-04-05', '2024-04-19', '0'),
('K006', 'A006', 'B006', 'P006', '2024-04-06', '2024-04-20', '100.000'),
('K007', 'A007', 'B007', 'P007', '2024-04-07', '2024-04-21', '0'),
('K008', 'A008', 'B008', 'P008', '2024-04-08', '2024-04-22', '0'),
('K009', 'A009', 'B009', 'P009', '2024-04-09', '2024-04-23', '0'),
('K010', 'A010', 'B010', 'P010', '2024-04-10', '2024-04-24', '0');

-- 1
DELIMITER //

CREATE PROCEDURE search_buku(
    IN kode_buku varchar (10)
)
BEGIN
    SELECT * from buku where kode_buku = kode_buku ;
END //

DELIMITER ;
drop procedure search_buku;

call search_buku(10);

-- 2
DELIMITER //

CREATE PROCEDURE search_pengembalian(
    IN kode_buku varchar (10)
)
BEGIN
    SELECT * FROM pengembalian WHERE kode_buku = kode_buku;
END //
DELIMITER ;
drop procedure search_pengembalian;
call search_pengembalian(10);

DELIMITER //

-- 3
DELIMITER //
CREATE PROCEDURE search_anggota(
    IN angkatan VARCHAR(6),
    IN jenis_kelamin VARCHAR(15)
)
BEGIN
    SELECT * FROM anggota WHERE angkatan_anggota = angkatan AND jenis_kelamin = jenis_kelamin;
END//
DELIMITER ;
drop procedure search_anggota;
call search_anggota(2018,'Perempuan');

-- 4
DELIMITER //
DELIMITER //
CREATE PROCEDURE search_buku (
    IN pengarang VARCHAR(30),
    IN penerbit VARCHAR(30),
    IN tahun_buku VARCHAR(10)
)
BEGIN
    SELECT * FROM buku WHERE pengarang_buku = pengarang AND penerbit_buku = penerbit AND tahun_buku = tahun_buku;
END//
DELIMITER ;

drop procedure search_buku;
call search_buku('J.K. Rowling','Bloomsbury','1997');

-- 5
DELIMITER //
CREATE PROCEDURE insert_buku(
    IN kode_buku VARCHAR(10),
    IN judul_buku VARCHAR(25),
    IN pengarang_buku VARCHAR(30),
    IN penerbit_buku_ VARCHAR(30),
    IN tahun_buku_ VARCHAR(10),
    IN jumlah_buku_ INT,
    IN status_buku_ VARCHAR(10),
    IN klasifikasi_buku_ VARCHAR(20)
)
BEGIN
    INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) 
    VALUES (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku);
END//
DELIMITER ;
drop procedure insert_buku;

CALL insert_buku('B011', 'Catatan Viki', 'Hermanto', 'Richardi', '2004', 3, 'Available', 'Action');

-- 6

DELIMITER //
CREATE PROCEDURE search_jumlah_buku(
    OUT jumlah_buku INT
)
BEGIN
    SELECT COUNT(judul_buku) INTO jumlah_buku FROM buku;
END//
DELIMITER ;

drop procedure search_jumlah_buku;

call search_jumlah_buku(@jumlah_buku);

select@jumlah_buku;

-- 7 

DELIMITER //
CREATE PROCEDURE hitung_anggota(
	
    IN angkatan VARCHAR(6),
    IN jenis_kelamin VARCHAR(15),
    OUT jumlah_anggota INT
)
BEGIN
    SELECT COUNT(id_anggota) INTO jumlah_anggota FROM anggota WHERE angkatan_anggota = angkatan AND jenis_kelamin = jenis_kelamin;
END//
DELIMITER ;

drop procedure hitung_anggota;

call hitung_anggota('2019','laki-laki',@jumlah_anggota);

select@jumlah_anggota;

DELIMITER //
CREATE PROCEDURE hitung_anggotaa(

    IN angkatan VARCHAR(6),
    IN jenis_kelamin VARCHAR(15),
    OUT jumlah_anggotaa INT
)
BEGIN
    SELECT COUNT(id_anggota), angkatan_anggota, jenis_kelamin INTO jumlah_anggotaa,angkatan, jenis_kelamin FROM anggota WHERE angkatan_anggota = angkatan AND jenis_kelamin = jenis_kelamin;
END//
DELIMITER ;
drop procedure hitung_anggotaa;
call hitung_anggota('2019','laki-laki',@jumlah_anggotaa);

select@jumlah_anggotaa, angkatan_anggota, jenis_kelamin from anggota;