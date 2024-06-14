create database db_perpus;
use db_perpus;


create table buku (
	Kode_Buku varchar(10) primary key,
    Judul_Buku varchar (25),
    Pengarang_Buku varchar (30),
    Penerbit_Buku varchar (30),
    Tahun_Buku varchar (10),
    Jumlah_buku varchar (5),
    Status_Buku varchar (10),
    Klasifikasi_Buku varchar (20)
    );

create table anggota (
	IdAnggota varchar (10) primary key,
    Nama_Anggota varchar (20),
    Angkatan_Anggota varchar (6),
    Tempat_Lahir_Anggota varchar (20),
    tanggal_Lahir_Anggota date,
    no_telp int (12),
    jenis_Kelamin varchar (15),
    Status_Pinjam varchar (15)
	);

create table petugas (
	IdPetugas varchar (10) primary key,
    Username varchar (15),
    Password varchar (15),
    Nama varchar (25)
);

create table peminjaman (
	Kode_Peminjaman varchar (10) primary key,
    IdAnggota varchar (10),
    foreign key (IdAnggota) references anggota (IdAnggota),
    IdPetugas varchar (10),
    foreign key (IdPetugas) references petugas (IdPetugas),
    tanggal_Pinjam date,
    tanggal_Kembali date,
    Kode_Buku varchar (10),
    foreign key (Kode_Buku) references buku (Kode_Buku)
    );
    
create table pengembalian (
	Kode_Kembali varchar (10) primary key,
    IdAnggota varchar (10),
    foreign key (IdAnggota) references anggota (IdAnggota),
    Kode_Buku varchar (10),
    foreign key (Kode_Buku) references buku (Kode_Buku),
    IdPetugas varchar (10),
    foreign key (IdPetugas) references petugas (IdPetugas),
    Tgl_Pinjam date,
    Tgl_Kembali date,
    Denda varchar (15)
	);
    
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_buku, Status_Buku, Klasifikasi_Buku)
VALUES
('BK001', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '100', 'Tersedia', 'Fiksi'),
('BK002', 'Ayat-Ayat Cinta', 'Habiburrahman El-Shirazy', 'Republika', '2004', '75', 'Tersedia', 'Romantis'),
('BK003', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '50', 'Tersedia', 'Fiksi Sejarah'),
('BK004', 'Dilan: Dia Adalah Dilanku', 'Pidi Baiq', 'Penerbit PT Pastel Books', '2014', '60', 'Tersedia', 'Remaja'),
('BK005', 'Tentang Kamu', 'Tere Liye', 'Gramedia Pustaka Utama', '2006', '55', 'Tersedia', 'Romantis'),
('BK006', 'Hujan', 'Tere Liye', 'Gramedia Pustaka Utama', '2011', '45', 'Tersedia', 'Fiksi'),
('BK007', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2009', '70', 'Tersedia', 'Fiksi Romantis'),
('BK008', 'Aroma Karsa', 'Dee Lestari', 'Bentang Pustaka', '2008', '80', 'Tersedia', 'Fiksi'),
('BK009', 'Pulang', 'Tere Liye', 'Gramedia Pustaka Utama', '2014', '65', 'Tersedia', 'Fiksi'),
('BK010', 'Mata yang Enak Dipandang', 'Ahmad Tohari', 'Gramedia Pustaka Utama', '2011', '40', 'Tersedia', 'Fiksi');

INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, tanggal_Lahir_Anggota, no_telp, jenis_Kelamin, Status_Pinjam)
VALUES
('A001', 'Ahmad', '2020', 'Jakarta', '2000-01-10', '0812345', 'Laki-laki', 'Tidak Meminjam'),
('A002', 'Budi', '2019', 'Bandung', '1999-05-15', '08234567', 'Laki-laki', 'Meminjam'),
('A003', 'Citra', '2021', 'Surabaya', '2001-09-20', '0834567', 'Perempuan', 'Tidak Meminjam'),
('A004', 'Dewi', '2018', 'Yogyakarta', '1998-12-25', '0845678', 'Perempuan', 'Meminjam'),
('A005', 'Eka', '2020', 'Semarang', '2000-03-30', '0856789', 'Laki-laki', 'Meminjam'),
('A006', 'Fani', '2019', 'Solo', '1999-07-05', '08678901', 'Perempuan', 'Tidak Meminjam'),
('A007', 'Gita', '2021', 'Malang', '2001-11-10', '0878901', 'Perempuan', 'Meminjam'),
('A008', 'Hadi', '2018', 'Denpasar', '1998-01-15', '08890123', 'Laki-laki', 'Tidak Meminjam'),
('A009', 'Indah', '2020', 'Makassar', '2000-05-20', '08901234', 'Perempuan', 'Meminjam'),
('A010', 'Joko', '2019', 'Pekanbaru', '1999-09-25', '0901234', 'Laki-laki', 'Tidak Meminjam');

INSERT INTO petugas (IdPetugas, Username, Password, Nama)
VALUES
('P001', 'admin1', 'admin123', 'Admin Satu'),
('P002', 'admin2', 'admin456', 'Admin Dua'),
('P003', 'admin3', 'admin789', 'Admin Tiga'),
('P004', 'petugas1', 'petugas123', 'Petugas Satu'),
('P005', 'petugas2', 'petugas456', 'Petugas Dua'),
('P006', 'petugas3', 'petugas789', 'Petugas Tiga'),
('P007', 'staff1', 'staff123', 'Staff Satu'),
('P008', 'staff2', 'staff456', 'Staff Dua'),
('P009', 'staff3', 'staff789', 'Staff Tiga'),
('P010', 'officer1', 'officer123', 'Officer Satu');

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, tanggal_Pinjam, tanggal_Kembali, Kode_Buku)
VALUES
('PJM001', 'A001', 'P001', '2024-04-01', '2024-04-10', 'BK001'),
('PJM002', 'A002', 'P002', '2024-04-02', '2024-04-12', 'BK002'),
('PJM003', 'A003', 'P003', '2024-04-03', '2024-04-15', 'BK003'),
('PJM004', 'A004', 'P004', '2024-04-04', '2024-04-14', 'BK004'),
('PJM005', 'A005', 'P005', '2024-04-05', '2024-04-16', 'BK005'),
('PJM006', 'A006', 'P006', '2024-04-06', '2024-04-18', 'BK006'),
('PJM007', 'A007', 'P007', '2024-04-07', '2024-04-19', 'BK007'),
('PJM008', 'A008', 'P008', '2024-04-08', '2024-04-20', 'BK008'),
('PJM009', 'A009', 'P009', '2024-04-09', '2024-04-21', 'BK009'),
('PJM010', 'A010', 'P010', '2024-04-10', '2024-04-22', 'BK010');

INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda)
VALUES
('KMB001', 'A001', 'BK001', 'P001', '2024-04-01', '2024-04-10', '0'),
('KMB002', 'A002', 'BK002', 'P002', '2024-04-02', '2024-04-12', '0'),
('KMB003', 'A003', 'BK003', 'P003', '2024-04-03', '2024-04-15', '0'),
('KMB004', 'A004', 'BK004', 'P004', '2024-04-04', '2024-04-14', '0'),
('KMB005', 'A005', 'BK005', 'P005', '2024-04-05', '2024-04-16', '0'),
('KMB006', 'A006', 'BK006', 'P006', '2024-04-06', '2024-04-18', '0'),
('KMB007', 'A007', 'BK007', 'P007', '2024-04-07', '2024-04-19', '0'),
('KMB008', 'A008', 'BK008', 'P008', '2024-04-08', '2024-04-20', '0'),
('KMB009', 'A009', 'BK009', 'P009', '2024-04-09', '2024-04-21', '0'),
('KMB010', 'A010', 'BK010', 'P010', '2024-04-10', '2024-04-22', '0');
select * from pengembalian;

DELIMITER //
CREATE PROCEDURE tambah_petugas(
    IN id_petugas VARCHAR(10),
    IN username VARCHAR(15),
    IN pasword VARCHAR(15),
    IN nama VARCHAR(24)
)
BEGIN
    INSERT INTO petugas VALUES (id_petugas, username, pasword, nama);
END //
DELIMITER ;
call tambah_petugas
	('PTGS12', 'petugas12', 'detail_pesananpasword12', 'ayuu');
select * from petugas;

DELIMITER //
CREATE PROCEDURE pengembalian_buku(
    IN Kode_Kembali_baru varchar (10)
)
BEGIN
    SELECT * FROM pengembalian WHERE Kode_Kembali = kode_Kembali_baru;
END //
DELIMITER ;
call pengembalian_buku('KMB002');


DELIMITER //
CREATE PROCEDURE data_anggota(
    IN angkatan_baru VARCHAR(6),
    IN jenis_kelamin_baru VARCHAR(15)
)
BEGIN
    SELECT * FROM anggota 
    WHERE Angkatan_Anggota = angkatan_baru AND jenis_Kelamin = jenis_kelamin_baru;
END //
DELIMITER ;
call data_anggota ('2020','perempuan');

DELIMITER //
CREATE PROCEDURE cari_buku (
    IN pengarang_input VARCHAR(30),
    IN penerbit_input VARCHAR(30),
    IN tahun_terbit_input VARCHAR(10)
)
BEGIN
    SELECT * FROM buku WHERE Pengarang_Buku = pengarang_input 
    AND Penerbit_Buku = penerbit_input AND Tahun_Buku = tahun_terbit_input;
END //
DELIMITER ;
call cari_buku('Tere Liye', 'Gramedia Pustaka Utama', '2009');

DELIMITER //
CREATE PROCEDURE tambah_buku(
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
call tambah_buku 
('BK014', 'Negri Para Bedebah', 'Tere Liye', 'Gramedia Pustaka Utama', '2007', '10', 'Tersedia', 'Fiksi');
select * from buku;

DELIMITER //
CREATE PROCEDURE hitung_jumlah_buku (
    OUT jumlah_buku INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_buku FROM buku;
END //
DELIMITER ;
call hitung_jumlah_buku (@jumlah);
select @jumlah AS 'Jumlah Buku';

DELIMITER //
CREATE PROCEDURE hitung_jumlah_anggota(
    IN angkatan_baru VARCHAR(6),
    IN jenis_kelamin_baru VARCHAR(15),
    OUT total_anggota INT
)
BEGIN
    SELECT COUNT(*) INTO total_anggota
    FROM anggota
    WHERE Angkatan_Anggota = angkatan_baru AND jenis_Kelamin = jenis_kelamin_baru;
END //
DELIMITER ;
CALL hitung_jumlah_anggota('2020', 'perempuan', @total_anggota);
SELECT @total_anggota AS total_anggota;
















