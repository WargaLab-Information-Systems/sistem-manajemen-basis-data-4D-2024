CREATE DATABASE library;
USE library;

CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10),
    IdPetugas VARCHAR(10),
    Tanggal_Pinjam DATE,
    Tanggal_Kembali DATE,
    Kode_Buku VARCHAR(10)
);
CREATE TABLE petugas (
    IdPetugas VARCHAR(10) PRIMARY KEY,
    Username VARCHAR(15),
    Password VARCHAR(15),
    Nama VARCHAR(25)
);
CREATE TABLE buku (
    Kode_Buku VARCHAR(10) PRIMARY KEY,
    Judul_Buku VARCHAR(25),
    Pengarang_Buku VARCHAR(30),
    Penerbit_Buku VARCHAR(30),
    Tahun_Buku VARCHAR(10),
    Jumlah_Buku VARCHAR(5),
    Status_Buku VARCHAR(10),
    Klasifikasi_Buku VARCHAR(20)
);
CREATE TABLE anggota (
    IdAnggota VARCHAR(10) PRIMARY KEY,
    Nama_Anggota VARCHAR(20),
    Angkatan_Anggota VARCHAR(6),
    Tempat_Lahir_Anggota VARCHAR(6),
    Tanggal_Lahir_Anggota DATE,
    No_Telp INT(12),
    Jenis_Kelamin VARCHAR(15),
    Status_Pinjam VARCHAR(15)
);

CREATE TABLE pengembalian (
    Kode_Kembali VARCHAR(10) PRIMARY KEY,
    IdAnggota VARCHAR(10),
    Kode_Buku VARCHAR(10),
    IdPetugas VARCHAR(10),
    Tgl_Pinjam DATE,
    Tgl_Kembali DATE,
    Denda VARCHAR(15)
);

ALTER TABLE peminjaman ADD CONSTRAINT fk_peminjaman_anggota FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE peminjaman ADD CONSTRAINT fk_peminjaman_petugas FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE peminjaman ADD CONSTRAINT fk_peminjaman_buku FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE pengembalian ADD CONSTRAINT fk_pengembalian_anggota FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE pengembalian ADD CONSTRAINT fk_pengembalian_buku FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE pengembalian ADD CONSTRAINT fk_pengembalian_petugas FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas) ON DELETE CASCADE ON UPDATE CASCADE;

-- Insert data
INSERT INTO petugas (IdPetugas, Username, Password, Nama) VALUES ('PTG001', 'john', 'password123', 'John Doe'), ('PTG002', 'jane', 'password456', 'Jane Smith'), ('PTG003', 'ahmad', 'password789', 'Ahmad Abdullah'), ('PTG004', 'siti', 'passwordabc', 'Siti Nur'), ('PTG005', 'budi', 'passworddef', 'Budi Santoso'), ('PTG006', 'lisa', 'passwordghi', 'Lisa Wijaya'), ('PTG007', 'agus', 'passwordjkl', 'Agus Setiawan'), ('PTG008', 'rina', 'passwordmno', 'Rina Susanti'), ('PTG009', 'david', 'passwordpqr', 'David Tan'), ('PTG010', 'sarah', 'passwordstu', 'Sarah Lim');
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES ('B001', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '5', 'Available', 'Fiksi'), ('B002', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '3', 'Available', 'Fiksi'), ('B003', 'Dilan 1990', 'Pidi Baiq', 'Pastel Books', '2014', '7', 'Available', 'Fiksi'), ('B004', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', '4', 'Available', 'Fiksi'), ('B005', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '6', 'Available', 'Fiksi'), ('B006', 'Laut Bercerita', 'Leila S. Chudori', 'Kepustakaan Populer Gramedia', '2012', '2', 'Available', 'Fiksi'), ('B007', 'Pulang', 'Tere Liye', 'Gramedia Pustaka Utama', '2015', '8', 'Available', 'Fiksi'), ('B008', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2009', '5', 'Available', 'Fiksi'), ('B009', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '4', 'Available', 'Fiksi'), ('B010', 'Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Gramedia Pustaka Utama', '1982', '3', 'Available', 'Fiksi');
INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES ('A001', 'Budi Santoso', '2019', 'Jakarta', '2000-01-01', '081234567890', 'Laki-laki', 'Aktif'), ('A002', 'Siti Nur', '2018', 'Bandung', '1999-02-02', '082345678901', 'Perempuan', 'Aktif'), ('A003', 'Ahmad Abdullah', '2017', 'Surabaya', '1998-03-03', '083456789012', 'Laki-laki', 'Aktif'), ('A004', 'Jane Smith', '2016', 'Medan', '1997-04-04', '084567890123', 'Perempuan', 'Aktif'), ('A005', 'John Doe', '2015', 'Semarang', '1996-05-05', '085678901234', 'Laki-laki', 'Aktif'), ('A006', 'Lisa Wijaya', '2014', 'Yogyakarta', '1995-06-06', '086789012345', 'Perempuan', 'Aktif'), ('A007', 'Agus Setiawan', '2013', 'Bali', '1994-07-07', '087890123456', 'Laki-laki', 'Aktif'), ('A008', 'Rina Susanti', '2012', 'Lombok', '1993-08-08', '088901234567', 'Perempuan', 'Aktif'), ('A009', 'David Tan', '2011', 'Kalimantan', '1992-09-09', '089012345678', 'Laki-laki', 'Aktif'), ('A010', 'Sarah Lim', '2010', 'Papua', '1991-10-10', '090123456789', 'Perempuan', 'Aktif');
INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES ('P001', 'A001', 'PTG001', '2022-01-01', '2022-01-08', 'B001'), ('P002', 'A002', 'PTG002', '2022-01-02', '2022-01-09', 'B002'), ('P003', 'A003', 'PTG003', '2022-01-03', '2022-01-10', 'B003'), ('P004', 'A004', 'PTG004', '2022-01-04', '2022-01-11', 'B004'), ('P005', 'A005', 'PTG005', '2022-01-05', '2022-01-12', 'B005'), ('P006', 'A006', 'PTG006', '2022-01-06', '2022-01-13', 'B006'), ('P007', 'A007', 'PTG007', '2022-01-07', '2022-01-14', 'B007'), ('P008', 'A008', 'PTG008', '2022-01-08', '2022-01-15', 'B008'), ('P009', 'A009', 'PTG009', '2022-01-09', '2022-01-16', 'B009'), ('P010', 'A010', 'PTG010', '2022-01-10', '2022-01-17', 'B010');
INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES ('K001', 'A001', 'B001', 'PTG001', '2022-01-01', '2022-01-08', '0'), ('K002', 'A002', 'B002', 'PTG002', '2022-01-02', '2022-01-09', '0'), ('K003', 'A003', 'B003', 'PTG003', '2022-01-03', '2022-01-10', '0'), ('K004', 'A004', 'B004', 'PTG004', '2022-01-04', '2022-01-11', '0'), ('K005', 'A005', 'B005', 'PTG005', '2022-01-05', '2022-01-12', '0'), ('K006', 'A006', 'B006', 'PTG006', '2022-01-06', '2022-01-13', '0'), ('K007', 'A007', 'B007', 'PTG007', '2022-01-07', '2022-01-14', '0'), ('K008', 'A008', 'B008', 'PTG008', '2022-01-08', '2022-01-15', '0'), ('K009', 'A009', 'B009', 'PTG009', '2022-01-09', '2022-01-16', '0'), ('K010', 'A010', 'B010', 'PTG010', '2022-01-10', '2022-01-17', '0');

DELIMITER //
-- 1. Buatlah sebuah prosedur dengan menggunakan parameter IN default
CREATE PROCEDURE GetAnggotaByStatus(IN status VARCHAR(15) 'Aktif')
BEGIN
    SELECT * FROM anggota WHERE Status_Pinjam = status;
END;
DELIMITER;
DELIMITER //
-- 2. Buatlah stored procedure untuk mengetahui data pada table buku berdasarkan pada salah satu field yaitu penerbit buku.
CREATE PROCEDURE GetBukuByPenerbit(IN penerbit VARCHAR(30))
BEGIN
    SELECT * FROM buku WHERE Penerbit_Buku = penerbit;
END;
DELIMITER;
DELIMITER //
-- 3. Buatlah stored procedure untuk mengetahui data pada table peminjaman berdasarkan dua field yaitu tanggal pinjam dan kode buku.
CREATE PROCEDURE GetPeminjamanByTanggalAndKode(IN tanggal DATE, IN kode VARCHAR(10))
BEGIN
    SELECT * FROM peminjaman WHERE Tanggal_Pinjam = tanggal AND Kode_Buku = kode;
END;
DELIMITER;
DELIMITER //
-- 4. Buatlah stored procedure untuk mengetahui data pada table anggota berdasarkan pada 3 field yaitu angkatan, tampat lahir dan jenis kelamin.
CREATE PROCEDURE GetAnggotaByAngkatanAndTempatLahirAndJenisKelamin(IN angkatan VARCHAR(6), IN tempatLahir VARCHAR(6), IN jenisKelamin VARCHAR(15))
BEGIN
    SELECT * FROM anggota WHERE Angkatan_Anggota = angkatan AND Tempat_Lahir_Anggota = tempatLahir AND Jenis_Kelamin = jenisKelamin;
END;
DELIMITER;
DELIMITER//
-- 5. Definisikan stored procedure untuk memasukkan data pada table anggota.
CREATE PROCEDURE InsertAnggota(IN idAnggota VARCHAR(10), IN namaAnggota VARCHAR(20), IN angkatanAnggota VARCHAR(6), IN tempatLahirAnggota VARCHAR(6), IN tanggalLahirAnggota DATE, IN noTelp INT(12), IN jenisKelamin VARCHAR(15), IN statusPinjam VARCHAR(15))
BEGIN
    INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
    VALUES (idAnggota, namaAnggota, angkatanAnggota, tempatLahirAnggota, tanggalLahirAnggota, noTelp, jenisKelamin, statusPinjam);
END;
DELIMITER;
DELIMITER //
-- 6. Definisikan stored procedure untuk mengetahui data jumlah anggota menggunakan parameter OUT.
CREATE PROCEDURE GetJumlahAnggota(OUT jumlahAnggota INT)
BEGIN
    SELECT COUNT(*) INTO jumlahAnggota FROM anggota;
END;
DELIMITER;
DELIMITER //
-- 7. Definisikan stored procedure untuk mengetahui data jumlah buku berdasarkan pengarang dan tahun terbitnya menggunakan parameter INOUT.
CREATE PROCEDURE GetJumlahBukuByPengarangAndTahun(INOUT pengarang VARCHAR(30), INOUT tahun VARCHAR(10), OUT jumlahBuku INT)
BEGIN
    SELECT COUNT(*) INTO jumlahBuku FROM buku WHERE Pengarang_Buku = pengarang AND Tahun_Buku = tahun;
END;
DELIMITER;
