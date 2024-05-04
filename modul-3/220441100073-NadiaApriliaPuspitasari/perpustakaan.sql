create database db_perpustakaan;
use db_perpustakaan;

create table petugas(
idpetugas varchar(10) primary key,
username varchar(15),
pasword varchar(15),
nama varchar(25));

INSERT INTO petugas (idpetugas, username, pasword, nama) VALUES 
('P01', 'krisna', 'password123', 'Krisna Saputra'),
('P02', 'ratna', 'abc123', 'Galih Ratna'),
('P03', 'bima', 'hmm123', 'Bima Hidayat'),
('P04', 'putri', 'pass456', 'Putri Winda'),
('P05', 'aldi', 'password789', 'Aldiansyah'),
('P06', 'rini', 'pass123', 'Rini Wulandari'),
('P07', 'hanipa', 'abcdef', 'Siti Nur Hanifa'),
('P08', 'dika', 'pass789', 'Dika Noryta'),
('P09', 'mayes', 'qwerty', 'Maya Dwi'),
('P10', 'intan', 'password', 'Intan Naestru');


create table buku(
kode_buku varchar(10) primary key,
judul_buku varchar(25),
pengarang_buku varchar(30),
penerbit_buku varchar(30),
tahun_buku varchar(10),
jumlah_buku varchar(5),
status_buku varchar(10),
klasifikasi_buku varchar(20)
);

INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) VALUES 
('B01', 'Dunia Senja', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1984', '4', 'dipinjam', 'Fiksi'),
('B02', 'Matahari', 'Tere Liye', 'Gramedia', '2010', '10', 'tersedia', 'Novel'),
('B03', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '10', 'tersedia', 'Drama'),
('B04', 'Cinta di Dalam Gelas', 'Andrea Hirata', 'Bentang Pustaka', '2011', '8', 'tersedia', 'Roman'),
('B05', 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '16', 'dipinjam', 'Romantis'),
('B06', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '9', 'dipinjam', 'Petualangan'),
('B07', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2009', '7', 'tersedia', 'Fiksi'),
('B08', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '5', 'dipinjam', 'Drama'),
('B09', 'Rindu', 'Tere Liye', 'Gramedia', '2014', '8', 'tersedia', 'Novel'),
('B10', 'Sang Pencerah', 'Emha Ainun Nadjib', 'Republika', '2009', '5', 'dipinjam', 'Biografi');


create table anggota(
idanggota varchar(10) primary key,
nama_anggota varchar(20),
angkatan_anggota varchar(6),
tempat_lahir_anggota varchar(20),
tanggal_lahir_anggota date,
no_telp int(2),
jenis_kelamin varchar(15),
status_pinjam varchar(15)
);

INSERT INTO anggota (idanggota, nama_anggota, angkatan_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) VALUES 
('A01', 'Nurul Fitriani', '2021', 'Jakarta', '2003-05-10', '0834567890', 'Perempuan', 'meminjam'),
('A02', 'Adinda', '2020', 'Surabaya', '2004-08-15', '0876543210', 'Perempuan', 'Tidak meminjam'),
('A03', 'Ristin Putri', '2022', 'Bandung', '2003-02-20', '0856667777', 'Perempuan', 'meminjam'),
('A04', 'Ahmad Fauzi', '2019', 'Nganjuk', '2004-11-25', '0834445555', 'Laki-laki', 'meminjam'),
('A05', 'Defika', '2023', 'Semarang', '2003-09-30', '0878889999', 'Perempuan', 'Tidak meminjam'),
('A06', 'Alfado Daffa', '2022', 'Yogyakarta', '2003-04-05', '0812223333', 'Laki-laki', 'meminjam'),
('A07', 'Sindy Wahyu', '2020', 'Nganjuk', '2003-12-12', '0845556666', 'Perempuan', 'meminjam'),
('A08', 'Yusuffa', '2021', 'Pontianak', '2003-07-15', '0823334444', 'Laki-laki', 'Tidak meminjam'),
('A09', 'Refli', '2023', 'Makassar', '2003-03-22', '0867778888', 'Laki-laki', 'meminjam'),
('A10', 'Restansa Satya', '2019', 'Malang', '2003-06-18', '0889990000', 'Perempuan', 'meminjam');


create table peminjaman(
kode_peminjaman varchar(10) primary key,
idanggota varchar(10),
idpetugas varchar(10),
tanggal_pinjam date,
tanggal_kembali date,
kode_buku varchar(10),
FOREIGN KEY (idanggota) REFERENCES anggota(idanggota),
FOREIGN KEY (idpetugas) REFERENCES petugas(idpetugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);

INSERT INTO peminjaman (kode_peminjaman, idanggota, idpetugas, tanggal_pinjam, tanggal_kembali, kode_buku) VALUES 
('PJM01', 'A01', 'P01', '2023-02-15', '2023-03-30', 'B01'),
('PJM02', 'A02', 'P02', '2024-01-20', '2024-02-05', 'B02'),
('PJM03', 'A03', 'P03', '2024-03-25', '2024-04-10', 'B03'),
('PJM04', 'A04', 'P04', '2024-02-01', '2024-02-16', 'B04'),
('PJM05', 'A05', 'P05', '2023-01-05', '2023-01-20', 'B05'),
('PJM06', 'A06', 'P06', '2024-04-10', '2024-04-25', 'B06'),
('PJM07', 'A07', 'P07', '2024-01-15', '2024-01-30', 'B07'),
('PJM08', 'A08', 'P08', '2024-01-20', '2024-02-04', 'B08'),
('PJM09', 'A09', 'P09', '2024-03-25', '2024-04-09', 'B09'),
('PJM10', 'A10', 'P10', '2023-03-30', '2023-04-14', 'B10');



create table pengembalian(
kode_kembali varchar(10) primary key,
idanggota varchar(10),
kode_buku varchar(10),
idpetugas varchar(10),
tgl_pinjam date,
tgl_kembali date,
denda varchar(15),
FOREIGN KEY (idanggota) REFERENCES anggota(idanggota),
FOREIGN KEY (idpetugas) REFERENCES petugas(idpetugas),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku)
);

INSERT INTO pengembalian (kode_kembali, idanggota, kode_buku, idpetugas, tgl_pinjam, tgl_kembali, denda) VALUES 
('PK001', 'A01', 'B01', 'P01', '2023-02-15', '2023-03-23', '0'),
('PK002', 'A02', 'B02', 'P02', '2024-01-20', '2024-02-01', '0'),
('PK003', 'A03', 'B03', 'P03', '2024-03-25', '2024-04-10', '0'),
('PK004', 'A04', 'B04', 'P04', '2024-02-01', '2024-02-17', '1000'),
('PK005', 'A05', 'B05', 'P05', '2023-01-05', '2023-01-24', '4000'),
('PK006', 'A06', 'B06', 'P06', '2024-04-10', '2024-04-19', '0'),
('PK007', 'A07', 'B07', 'P07', '2024-01-15', '2024-01-30', '0'),
('PK008', 'A08', 'B08', 'P08', '2024-01-20', '2024-02-04', '0'),
('PK009', 'A09', 'B09', 'P09', '2024-03-25', '2024-04-01', '0'),
('PK010', 'A10', 'B10', 'P10', '2023-03-30', '2023-04-10', '0');

-- 1. Buatlah sebuah prosedur dengan menggunakan parameter IN default
DELIMITER //
CREATE PROCEDURE anggota(IN nama VARCHAR(100))
BEGIN
SELECT * FROM anggota
WHERE nama = nama_anggota;
END //

DELIMITER ;
CALL anggota('Defika');

-- 2. Buatlah stored procedure untuk mengetahui data pada table buku berdasarkan pada salah satu field yaitu penerbit buku.

DELIMITER //
CREATE PROCEDURE buku(IN penerbit VARCHAR(20))
BEGIN
    SELECT * FROM buku 
    WHERE penerbit = penerbit_buku;
END //
DELIMITER ;

CALL buku('gramedia');
drop procedure nama_penerbit;


-- 3. Buatlah stored procedure untuk mengetahui data pada table peminjaman berdasarkan dua field yaitu tanggal pinjam dan kode buku.
DELIMITER //

CREATE PROCEDURE pinjam (
IN tglpinjam DATE,
IN idbuku VARCHAR(10))
BEGIN
    SELECT * FROM peminjaman 
    WHERE  tglpinjam = tanggal_pinjam 
    AND idbuku = kode_buku;
END //
DELIMITER ;
call pinjam('2024-04-10', 'b06');

-- 4.Buatlah stored procedure untuk mengetahui data pada table anggota berdasarkan pada 3 field yaitu angkatan, tampat lahir dan jenis kelamin.
DELIMITER //

CREATE PROCEDURE informasi_anggota(
IN angkatan varchar(6),
IN tempat_lahir VARCHAR(55),
IN gender varchar(15))
BEGIN
    SELECT * FROM anggota 
    WHERE angkatan = angkatan_anggota
    AND tempat_lahir = tempat_lahir_anggota 
    AND gender = jenis_kelamin;
END //

DELIMITER ;
call informasi_anggota('2022', 'bandung', 'perempuan');

-- 5. Definisikan stored procedure untuk memasukkan data pada table anggota.
DELIMITER //
CREATE PROCEDURE input_anggota(
	in id varchar(10),
    in nama varchar (20),
    in angkatan varchar(6),
    in tempat_lahir varchar (20),
    in tgllahir varchar (20),
    in no_hp int (12),
    in gender varchar (15),
    in statuss varchar (15))
begin
	insert into anggota values (id, nama, angkatan, tempat_lahir, tgllahir, no_hp, gender, statuss);
end //
DELIMITER ;
drop procedure input_anggota;
call input_anggota('A12', 'rahayu imama', '2022','nganjuk','2003-08-11', 0897654386, 'perempuan', 'tidak meminjam');
select *from anggota;

-- 6. Definisikan stored procedure untuk mengetahui data jumlah anggota menggunakan parameter OUT.
DELIMITER //
CREATE PROCEDURE Countanggota(
	OUT Jumlahanggota INT (10))
    BEGIN
		SELECT COUNT(idanggota) INTO Jumlahanggota FROM anggota;
	END //
DELIMITER ;
    
CALL Countanggota(@Jumlahanggota);
SELECT @Jumlahanggota;

-- 7. Definisikan stored procedure untuk mengetahui data jumlah buku berdasarkan pengarang dan tahun terbitnya menggunakan parameter INOUT.
DELIMITER //

CREATE PROCEDURE jumlahbuku (
    IN penulis VARCHAR(25),
    IN tahunterbit varchar(10),
    OUT totalbuku INT
)
BEGIN
    SELECT COUNT(kode_buku) INTO totalbuku 
    FROM buku 
    WHERE penulis = pengarang_buku AND tahunterbit = tahun_buku;
END //
DELIMITER ;
drop procedure jumlahbuku;
CALL jumlahbuku('Tere Liye', '2010', @totalbuku);
SELECT @totalbuku;