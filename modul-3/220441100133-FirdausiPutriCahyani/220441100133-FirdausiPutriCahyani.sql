CREATE DATABASE db_perpustakaan;
USE db_perpustakaan;

CREATE TABLE petugas (
    idPetugas VARCHAR (10) PRIMARY KEY,
    Username VARCHAR (15),
    Password_ VARCHAR (15),
    Nama VARCHAR (25)
);

CREATE TABLE anggota (
    idAnggota VARCHAR (10) PRIMARY KEY,
    Nama_Anggota VARCHAR (20),
    Angkatan_Anggota VARCHAR (6),
    Tempat_Lahir_Anggota VARCHAR (20),
    Tanggal_Lahir_Anggota DATE,
    No_Telp INT (12),
    Jenis_Kelamin VARCHAR (15),
    Status_Pinjam VARCHAR (15)
);

CREATE TABLE buku (
    Kode_Buku VARCHAR (10) PRIMARY KEY,
    Judul_Buku VARCHAR (25),
    Pengarang_Buku VARCHAR (30),
    Penerbit_Buku VARCHAR (30),
    Tahun_Buku VARCHAR (10),
    Jumlah_Buku VARCHAR (5),
    Status_Buku VARCHAR (15),
    Klasifikasi_Buku VARCHAR (20)
);

ALTER TABLE buku MODIFY COLUMN Status_Buku VARCHAR (30);

CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR (10) PRIMARY KEY,
    idAnggota VARCHAR (10),
    idPetugas VARCHAR (10),
    Tanggal_Pinjam DATE,
    Tanggal_Kembali DATE,
    Kode_Buku VARCHAR (10),
    FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota),
    FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);

CREATE TABLE pengembalian (
    Kode_Kembali VARCHAR (10) PRIMARY KEY,
    idAnggota VARCHAR (10),
    Kode_Buku VARCHAR (10),
    idPetugas VARCHAR (10),
    Tgl_Pinjam DATE,
    Tgl_Kembali DATE,
    Denda VARCHAR (15),
    FOREIGN KEY (idAnggota) REFERENCES anggota(idAnggota),
    FOREIGN KEY (idPetugas) REFERENCES petugas(idPetugas),
    FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku)
);

INSERT INTO petugas (idPetugas, Username, Password_, Nama)
VALUES
('PTG001', 'user1', 'pass123', 'Budi Santoso'),
('PTG002', 'user2', 'pass456', 'Siti Rahayu'),
('PTG003', 'user3', 'pass789', 'Joko Susanto'),
('PTG004', 'user4', 'passabc', 'Dewi Lestari'),
('PTG005', 'user5', 'passdef', 'Ahmad Fauzi'),
('PTG006', 'user6', 'passghi', 'Rina Wijaya'),
('PTG007', 'user7', 'passjkl', 'Hadi Pranoto'),
('PTG008', 'user8', 'passmno', 'Lina Fitriani'),
('PTG009', 'user9', 'passpqr', 'Eko Nugroho'),
('PTG010', 'user10', 'passtuv', 'Sinta Mega');

INSERT INTO anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES
('A001', 'Anita', '2020', 'Jakarta', '1999-05-15', 1234567890, 'Perempuan', 'Meminjam'),
('A002', 'Bambang', '2019', 'Bandung', '1998-08-20', 0987654321, 'Laki-laki', 'Meminjam'),
('A003', 'Citra', '2021', 'Surabaya', '2000-02-10', 1122334455, 'Perempuan', 'Meminjam'),
('A004', 'Dedi', '2022', 'Semarang', '2001-11-25', 5544332211, 'Laki-laki', 'Meminjam'),
('A005', 'Eka', '2023', 'Yogyakarta', '2002-04-30', 9988776655, 'Perempuan', 'Meminjam'),
('A006', 'Fajar', '2020', 'Bekasi', '2000-07-20', 1122334455, 'Laki-laki', 'Meminjam'),
('A007', 'Gita', '2021', 'Surakarta', '2001-04-10', 9988776655, 'Perempuan', 'Meminjam'),
('A008', 'Hadi', '2022', 'Bandar Lampung', '2002-12-25', 5544332211, 'Laki-laki', 'Meminjam'),
('A009', 'Indah', '2023', 'Pontianak', '2003-09-30', 1234567890, 'Perempuan', 'Meminjam'),
('A010', 'Joko', '2024', 'Makassar', '2004-01-05', 0987654321, 'Laki-laki', 'Meminjam');

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES
('B001', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', 15, 'Tersedia', 'Novel'),
('B002', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', 10, 'Tersedia', 'Novel'),
('B003', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2008', 8, 'Tersedia', 'Novel'),
('B004', 'Tenggelamnya Kapal Van Der Wijck', 'Hamka', 'Pustaka Nasional Pte Ltd', '1938', 5, 'Tersedia', 'Novel'),
('B005', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', 12, 'Tersedia', 'Novel'),
('B006', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', 20, 'Tersedia', 'Novel'),
('B007', 'Ronggeng Dukuh Paruk', 'Ahmad Tohari', 'Grafiti Pers', '1982', 15, 'Tersedia', 'Novel'),
('B008', 'Sepotong Hati yang Baru', 'Tere Liye', 'Gramedia Pustaka Utama', '2013', 18, 'Tersedia', 'Novel'),
('B009', 'Bidadari-Bidadari Surga', 'Tere Liye', 'Gramedia Pustaka Utama', '2005', 25, 'Tersedia', 'Novel'),
('B010', 'Pulang', 'Tere Liye', 'Republika', '2015', 30, 'Tersedia', 'Novel');

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES
('B011', 'Hujan', 'Andrea Hirata', 'Bentang Pustaka', '2005', 15, 'Tidak Tersedia', 'Novel');

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES
('B012', 'Rembulan', 'Andrea Hirata', 'Bentang Pustaka', '2005', 15, 'Tidak Tersedia', 'Fiksi');


SELECT * FROM buku;


INSERT INTO peminjaman (Kode_Peminjaman, idAnggota, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES
('P001', 'A001', 'PTG001', '2024-04-15', '2024-04-25', 'B001'),
('P002', 'A002', 'PTG002', '2024-04-16', '2024-04-26', 'B002'),
('P003', 'A003', 'PTG003', '2024-04-17', '2024-04-27', 'B003'),
('P004', 'A004', 'PTG004', '2024-04-18', '2024-04-28', 'B004'),
('P005', 'A005', 'PTG005', '2024-04-19', '2024-04-29', 'B005'),
('P006', 'A006', 'PTG001', '2024-04-20', '2024-04-30', 'B006'),
('P007', 'A007', 'PTG002', '2024-04-21', '2024-05-01', 'B007'),
('P008', 'A008', 'PTG003', '2024-04-22', '2024-05-02', 'B008'),
('P009', 'A009', 'PTG004', '2024-04-23', '2024-05-03', 'B009'),
('P010', 'A010', 'PTG005', '2024-04-24', '2024-05-04', 'B010');

INSERT INTO pengembalian (Kode_Kembali, idAnggota, Kode_Buku, idPetugas, Tgl_Pinjam, Tgl_Kembali, Denda)
VALUES
('K001', 'A001', 'B001', 'PTG001', '2024-04-15', '2024-04-25', '0'),
('K002', 'A002', 'B002', 'PTG002', '2024-04-16', '2024-04-26', '0'),
('K003', 'A003', 'B003', 'PTG003', '2024-04-17', '2024-04-27', '0'),
('K004', 'A004', 'B004', 'PTG004', '2024-04-18', '2024-04-28', '0'),
('K005', 'A005', 'B001', 'PTG005', '2024-04-19', '2024-04-29', '0'),
('K006', 'A006', 'B002', 'PTG001', '2024-04-20', '2024-05-05', '5000'),
('K007', 'A007', 'B007', 'PTG002', '2024-04-21', '2024-05-01', '0'),
('K008', 'A008', 'B008', 'PTG003', '2024-04-22', '2024-05-04', '2000'),
('K009', 'A009', 'B009', 'PTG004', '2024-04-23', '2024-05-03', '0'),
('K010', 'A010', 'B010', 'PTG005', '2024-04-24', '2024-05-04', '0');


-- nomor 1 
DELIMITER //
CREATE PROCEDURE cek_status (
    IN id_anggota VARCHAR(10)
)
BEGIN
    SELECT Status_Pinjam
    FROM anggota
    WHERE idAnggota = id_anggota;
END //
DELIMITER ;

CALL cek_status('A005');

-- nomor 2
DELIMITER //
CREATE PROCEDURE cari_anggota (
    IN nama VARCHAR(20))
BEGIN
    SELECT * FROM anggota WHERE Nama_Anggota = nama;
END //
DELIMITER ;

CALL cari_anggota ('Anita');

-- nomor 3
DELIMITER //
CREATE PROCEDURE cari_buku (
    IN status_buku VARCHAR(30),
    IN klasifikasi VARCHAR(20)
)
BEGIN
    SELECT * FROM buku WHERE Status_Buku = status_buku AND Klasifikasi_Buku = klasifikasi;
END //
DELIMITER ;

CALL cari_buku ('Tidak Tersedia', 'Novel');
SELECT * FROM buku;

-- nomor 4
DELIMITER //
CREATE PROCEDURE cari_peminjam (
    IN id_anggota VARCHAR(10),
    IN tgl_pinjam DATE,
    IN kode_buku VARCHAR(10)
)
BEGIN
    SELECT * FROM peminjaman WHERE idAnggota = id_anggota AND Tanggal_Pinjam = tgl_pinjam AND Kode_Buku = kode_buku;
END //
DELIMITER ;

CALL cari_peminjam ('A001','2024-04-15','B001');

-- nomor 5
DELIMITER //
CREATE PROCEDURE tambah_petugas (
    IN idPetugas_baru VARCHAR(10),
    IN Username_baru VARCHAR(15),
    IN Password_baru VARCHAR(15),
    IN Nama_baru VARCHAR(25)
)
BEGIN
    INSERT INTO petugas (idPetugas, Username, Password_, Nama)
    VALUES (idPetugas_baru, Username_baru, Password_baru, Nama_baru);
END //
DELIMITER ;

CALL tambah_petugas ('PTG012', 'user11', 'pass111', 'Putri Cahyani');
SELECT * FROM petugas;

-- nomor 6
DELIMITER //
CREATE PROCEDURE jumlah_peminjam (
    OUT jml_peminjam INT
)
BEGIN
    SELECT COUNT(*) INTO jml_peminjam FROM peminjaman;
END //
DELIMITER ;

CALL jumlah_peminjam(@jml_peminjam);
SELECT @jml_peminjam;
SELECT * FROM peminjaman;

-- nomor 7
DELIMITER //
CREATE PROCEDURE jumlah_peminjaman (
    IN tanggal_pinjam_anggota DATE,
    IN kode_buku VARCHAR(10),
    OUT jumlah INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah FROM peminjaman WHERE Tanggal_Pinjam = tanggal_pinjam_anggota AND Kode_Buku = kode_buku;
END //
DELIMITER ;

CALL jumlah_peminjaman('2024-04-15', 'B001', @jumlah);
SELECT @jumlah;
