create database library;
use library;

create table petugas(
id_petugas int (10) not null primary key,
username varchar(15) not null,
password varchar (15)not null,
nama varchar (25) not null
);
insert into petugas (id_petugas, username, password, nama) values
(101, 'user1', '11231', 'Jeni'),
(102, 'user2', '11232', 'Jeno'),
(103, 'user3', '11233', 'Jimin'),
(104, 'user4', '11234', 'Jiso'),
(105, 'user5', '11235', 'Rose'),
(106, 'user6', '11236', 'Lisa'),
(107, 'user7', '11237', 'Suga'),
(108, 'user8', '11238', 'Mark'),
(109, 'user9', '11239', 'Dita'),
(110, 'user10', '11230', 'Niki');
select * from petugas;

create table anggota(
id_anggota int (10) not null primary key,
nama_anggota varchar (20) not null,
angkatan_anggota varchar (6) not null,
tempat_lahir_anggota varchar (20) not null,
tanggal_lahir_anggota date not null,
no_telp int (12) not null,
jenis_kelamin varchar (15) not null,
status_pinjam varchar (15) not null
);
insert into anggota(id_anggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, 
	tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) values
(201, 'Dina Febrilina', '2022', 'Kudus', '2003-12-14', 123456781, 'Perempuan', 'Tidak Meminjam'),
(202, 'Faiq Maulana', '2021', 'Kudus', '2003-09-07', 123456782, 'Laki-laki', 'Tidak Meminjam'),
(203, 'Imam Bukhori', '2022', 'Bangkalan', '2004-04-19', 123456783, 'Laki-laki', 'Meminjam'),
(204, 'Elvida Indria', '2022', 'Lamongan', '2004-04-20', 123456784, 'Perempuan', 'Tidak Meminjam'),
(205, 'Elly Ernawati', '2022', 'Jombang', '2003-11-11', 123456785, 'Perempuan', 'Meminjam'),
(206, 'Syaiful Anam', '2022', 'Madiun', '2003-05-10', 123456786, 'Laki-laki', 'Meminjam'),
(207, 'Yudistira Girindra', '2022', 'Gresik', '2003-09-21', 123456787, 'Laki-laki', 'Tidak Meminjam'),
(208, 'Martha Mainolo', '2022', 'Jombang', '2003-09-13', 123456788, 'Perempuan', 'Tidak Meminjam'),
(209, 'Malikhatul Iftiyah', '2022', 'Jepara', '2004-04-14', 123456789, 'Perempuan', 'Meminjam'),
(210, 'Risalatul Hikmah', '2023', 'Jepara', '2005-06-27', 123456710, 'Perempuan', 'Tidak Meminjam');
select * from anggota;

create table buku(
kode_buku int (10) not null primary key,
judul_buku varchar (25) not null,
pengarang_buku varchar (30) not null,
penerbit_buku varchar (30) not null,
tahun_buku varchar (10) not null,
jumlah_buku varchar (5) not null,
status_buku varchar (10) not null,
klasifikasi_buku varchar (20) not null
);
insert into buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, 
	status_buku, klasifikasi_buku) values
(301, 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '100', 'Tersedia', 'Fiksi'),
(302, 'Pengakuan Pariyem', 'Linus Suryadi', 'Lingkar Pena', '2016', '50', 'Tersedia', 'Fiksi'),
(303, 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '80', 'Tersedia', 'Fiksi'),
(304, 'Mata yang Enak Dipandang', 'Ahmad Tohari', 'Lingkar Pena', '1996', '75', 'Tersedia', 'Fiksi'),
(305, 'Ayat-Ayat Cinta', 'Habiburrahman El-Shirazy', 'Republika', '2004', '60', 'Tersedia', 'Romansa'),
(306, 'Cinta yang Diam', 'Dewi Lestari', 'Bentang Pustaka', '2002', '90', 'Tersedia', 'Romansa'),
(307, 'Pulang', 'Tere Liye', 'Republika', '2015', '75', 'Tersedia', 'Fiksi'),
(308, 'Lelaki Harimau', 'Eka Kurniawan', 'Gramedia Pustaka Utama', '2004', '110', 'Tersedia', 'Fiksi'),
(309, 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '95', 'Tersedia', 'Fiksi'),
(310, 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2009', '120', 'Tersedia', 'Romansa');
select * from buku;

create table peminjaman(
kode_peminjaman int (10) not null primary key,
id_anggota int (10) not null,
id_petugas int (10) not null,
kode_buku int (10) not null,
tanggal_pinjam date not null,
tanggal_kembali date not null,
foreign key (id_anggota) references anggota (id_anggota),
foreign key (id_petugas) references petugas (id_petugas),
foreign key (kode_buku) references buku (kode_buku)
);
insert into peminjaman (kode_peminjaman, id_anggota, id_petugas, kode_buku, 
	tanggal_pinjam, tanggal_kembali) values
(401, 201, 101, 301, '2024-01-01', '2024-01-08'),
(402, 202, 102, 302, '2024-01-09', '2024-01-16'),
(403, 203, 103, 303, '2024-01-17', '2024-01-24'),
(404, 204, 104, 304, '2024-01-25', '2024-02-01'),
(405, 205, 105, 305, '2024-02-02', '2024-02-08'),
(406, 206, 106, 306, '2024-02-09', '2024-02-16'),
(407, 207, 107, 307, '2024-02-17', '2024-02-24'),
(408, 208, 108, 308, '2024-02-25', '2024-03-04'),
(409, 209, 109, 309, '2024-03-05', '2024-03-12'),
(410, 210, 110, 310, '2024-03-13', '2024-03-20');
select * from peminjaman;

create table pengembalian(
kode_kembali int (10) not null primary key,
id_anggota int (10) not null,
id_petugas int (10) not null,
kode_buku int (10) not null,
tgl_pinjam date not null,
tgl_kembali date not null,
denda varchar (15) not null,
foreign key (id_anggota) references anggota (id_anggota),
foreign key (id_petugas) references petugas (id_petugas),
foreign key (kode_buku) references buku (kode_buku)
);
insert into pengembalian (kode_kembali, id_anggota, id_petugas, kode_buku, 
	tgl_pinjam, tgl_kembali, denda) values
(501, 201, 101, 301, '2024-01-02', '2024-01-09', '0'),
(502, 202, 102, 302, '2024-01-10', '2024-01-17', '0'),
(503, 203, 103, 303, '2024-01-18', '2024-01-26', '1000'),
(504, 204, 104, 304, '2024-01-26', '2024-02-04', '2000'),
(505, 205, 105, 305, '2024-02-03', '2024-02-10', '0'),
(506, 206, 106, 306, '2024-02-11', '2024-02-18', '0'),
(507, 207, 107, 307, '2024-02-19', '2024-02-21', '5000'),
(508, 208, 108, 308, '2024-02-17', '2024-03-05', '0'),
(509, 209, 109, 309, '2024-03-06', '2024-03-13', '0'),
(510, 210, 110, 310, '2024-03-14', '2024-03-21', '0');
select * from pengembalian;

--no 1
DELIMITER //
CREATE PROCEDURE Anggota(
    IN angkatan VARCHAR(6)
)
BEGIN
    SELECT * FROM anggota WHERE angkatan = angkatan_anggota;			
END //
DELIMITER ;
call  Anggota('2022');

--no 2
DELIMITER //
CREATE PROCEDURE cari_anggota(
    IN NamaAnggota VARCHAR(50)
)
BEGIN
    SELECT * FROM anggota WHERE NamaAnggota = nama_anggota;			
END //
DELIMITER ;
call  cari_anggota ('Martha Mainolo');

--no3
DELIMITER //
CREATE PROCEDURE data_buku(
    IN StatusBuku VARCHAR(10),
    IN klasifikasi VARCHAR (20)
)
BEGIN
    SELECT * FROM buku WHERE StatusBuku = status_buku and klasifikasi = klasifikasi_buku;			
END //
DELIMITER ;
call data_buku ('Tersedia', 'Romansa');

--no 4
DELIMITER //
CREATE PROCEDURE data_peminjaman(
    IN IdAnggota INT(10),
    IN tgl_pinjam DATE,
    IN KodeBuku INT (10)
)
BEGIN
    SELECT * FROM peminjaman 
    WHERE IdAnggota = id_anggota and tgl_pinjam = tanggal_pinjam and KodeBuku = kode_buku;			
END //
DELIMITER ;
call data_peminjaman ('204', '2024-01-25', '304');

--no 5
DELIMITER //
CREATE PROCEDURE input_petugas(
    IN id_petugas INT(10),
    IN username VARCHAR(15),
    IN password VARCHAR (15),
    IN nama VARCHAR (25)
)
BEGIN
    INSERT INTO petugas VALUES (id_petugas, username, password, nama);
END //
DELIMITER ;
call input_petugas ('111', 'user11', '112311', 'Yuwen');
select * from petugas;

--no 6
DELIMITER //
CREATE PROCEDURE jumlah_peminjam(
    OUT jumlah VARCHAR(10)
)
BEGIN
    SELECT COUNT(kode_buku) INTO jumlah FROM peminjaman;	
END //
DELIMITER ;
call jumlah_peminjam(@jumlah);
select @jumlah;
drop procedure jumlah_peminjam;

--no 7
DELIMITER //
CREATE PROCEDURE jumlah_peminjaman(
    IN tgl_pinjam DATE,
    IN KodeBuku INT,
    OUT jlh_peminjaman VARCHAR(10)

)
BEGIN
    SELECT COUNT(kode_peminjaman) INTO jlh_peminjaman
    FROM peminjaman 
    WHERE tanggal_pinjam = tgl_pinjam AND kode_buku = KodeBuku;
END //
DELIMITER ;
set @tanggal_pinjam = '2024-02-17';
set @kode_buku =  307;
call jumlah_peminjaman ('2024-02-17', 307, @jlh_peminjaman);
select @jlh_peminjaman, @tanggal_pinjam, @kode_buku;	
drop procedure jumlah_peminjaman;