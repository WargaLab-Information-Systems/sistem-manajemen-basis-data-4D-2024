CREATE DATABASE library;
USE library;

CREATE TABLE petugas (
    id_petugas varchar(10) PRIMARY KEY,
    Username varchar(15) NOT NULL,
    Password varchar(15) NOT NULL,
    Nama varchar(25) NOT NULL
);

CREATE TABLE buku (
    kode_buku varchar(10) PRIMARY KEY,
    Judul_Buku varchar(25) NOT NULL,
    Pengarang_Buku varchar(30) NOT NULL,
    Penerbit_Buku varchar(30) NOT NULL,
    Tahun_Buku varchar(10) NOT NULL,
    Jumlah_Buku varchar(5) NOT NULL,
    Klasifikasi_Buku varchar(20) NOT NULL,
    Status_Buku varchar(10) NOT NULL
);

CREATE TABLE anggota (
    id_anggota varchar(10) PRIMARY KEY,
    Angkatan_Anggota varchar(6) NOT NULL,
    Nama_Anggota varchar(20) NOT NULL,
    Tempat_Lahir_Anggota varchar(20) NOT NULL,
    Tanggal_LahirAnggota date NOT NULL,
    No_Telp varchar(12) NOT NULL,
    Jenis_Kelamin varchar(15) NOT NULL,
    Status_Pinjam varchar(15) NOT NULL
);

CREATE TABLE pengembalian (
    id_pengembalian varchar(10) PRIMARY KEY,
    id_anggota varchar(20) not null,
    kode_buku varchar(10) NOT NULL,
    id_petugas varchar(10) not null,
    TanggalPinjam date NOT NULL,
    TanggalKembali date NOT NULL,
    Denda varchar(15) NOT NULL,
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
    FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

CREATE TABLE peminjaman (
    kode_peminjaman varchar(10) PRIMARY KEY,
    id_petugas varchar(10) NOT NULL,
    kode_buku varchar(10) NOT NULL,
    Tanggal_Pinjam date NOT NULL,
    Tanggal_Kembali date NOT NULL,
    id_anggota varchar(10) NOT NULL,
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
    FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota)
);

INSERT INTO petugas (id_petugas, Username, Password, Nama)
VALUES
('P001', 'haji', 'rahasia', 'Budi'),
('P002', 'maste', 'cuma', 'Anisa'),
('P003', 'watashi', 'passw', 'Nadhif'),
('P004', 'shiwa', 'word', 'Akmal'),
('P005', 'atik', 'untuk', 'Birrur'),
('P006', 'kiyowa', 'tugas', 'Fiqi'),
('P007', 'shito', 'smbd', 'Juan'),
('P008', 'akbar', 'praktikum', 'Dani'),
('P009', 'faisal', 'semester', 'Reyhan'),
('P010', 'dokoni', 'empat', 'Sigma');

INSERT INTO anggota (id_anggota, Angkatan_Anggota, Nama_Anggota, Tempat_Lahir_Anggota, Tanggal_LahirAnggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES
('R001', '2022', 'Rayhanza', 'Bangkalan', '2000-01-01', '08155456789', 'Laki-Laki', 'Belum Dikembalikan'),
('R002', '2021', 'Syafa', 'Malang', '2001-08-12', '082474567890', 'Perempuan', 'Belum Dikembalikan'),
('R003', '2020', 'Ramadhani', 'Surabaya', '2000-12-23', '082835678901', 'Laki-laki', 'Belum Dikembalikan'),
('R004', '2021', 'Athala', 'Gresik', '2001-04-04', '081136789012', 'Laki-laki', 'Sedang Dipinjam'),
('R005', '2023', 'Faathir', 'Gresik', '2003-05-05', '08523790123', 'Laki-laki', 'Sedang Dipinjam'),
('R006', '2023', 'Rijaal', 'Mojokerto', '2003-06-06', '08456901234', 'Laki-laki', 'Sedang Dipinjam'),
('R007', '2022', 'Nabila', 'Jombang', '2002-07-07', '08789596345', 'Perempuan', 'Dikembalikan'),
('R008', '2021', 'Nanda', 'Lamongan', '2001-08-08', '0889015553456', 'Laki-laki', 'Dikembalikan'),
('R009', '2022', 'Pratama', 'Sampang', '2002-09-09', '08901555567', 'Laki-Laki', 'Dikembalikan'),
('R010', '2021', 'Fani', 'Blitar', '2001-10-10', '09012345968', 'Perempuan', 'Dikembalikan');


INSERT INTO buku (kode_buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Klasifikasi_Buku, Status_Buku) 
VALUES 
('MB001', 'Spider-Man: Into the Spider-Verse', 'Penulis1', 'Penerbit1', '2018', '10', 'Komik', 'Tersedia'),
('MB002', 'Avengers: Endgame', 'Penulis2', 'Penerbit2', '2019', '15', 'Film', 'Tersedia'),
('MB003', 'Iron Man: Extremis', 'Penulis3', 'Penerbit3', '2006', '5', 'Komik', 'Tersedia'),
('MB004', 'Black Panther', 'Penulis4', 'Penerbit4', '2018', '8', 'Komik', 'Tersedia'),
('MB005', 'Thor: Ragnarok', 'Penulis5', 'Penerbit5', '2017', '12', 'Film', 'Tersedia'),
('MB006', 'Guardians of the Galaxy', 'Penulis6', 'Penerbit6', '2014', '7', 'Komik', 'Tersedia'),
('MB007', 'Captain America: The Winter Soldier', 'Penulis7', 'Penerbit7', '2014', '9', 'Film', 'Tersedia'),
('MB008', 'Doctor Strange: The Oath', 'Penulis8', 'Penerbit8', '2006', '6', 'Komik', 'Tersedia'),
('MB009', 'The Avengers', 'Penulis9', 'Penerbit9', '2012', '10', 'Film', 'Tersedia'),
('MB010', 'X-Men: Days of Future Past', 'Penulis10', 'Penerbit10', '2014', '11', 'Komik', 'Tersedia');


INSERT INTO peminjaman (kode_peminjaman, id_petugas, kode_buku, Tanggal_Pinjam, Tanggal_Kembali, id_anggota) 
VALUES 
('1', 'P001', 'MB001', '2024-04-01', '2024-04-15', 'R001'),
('2', 'P002', 'MB002', '2024-04-02', '2024-04-16', 'R002'),
('3', 'P003', 'MB003', '2024-04-03', '2024-04-17', 'R003'),
('4', 'P004', 'MB004', '2024-04-04', '2024-04-18', 'R004'),
('5', 'P005', 'MB005', '2024-04-05', '2024-04-19', 'R005'),
('6', 'P006', 'MB006', '2024-04-06', '2024-04-20', 'R006'),
('7', 'P007', 'MB007', '2024-04-07', '2024-04-21', 'R007'),
('8', 'P008', 'MB008', '2024-04-08', '2024-04-22', 'R008'),
('9', 'P009', 'MB009', '2024-04-09', '2024-04-23', 'R009'),
('10', 'P010', 'MB010', '2024-04-10', '2024-04-24', 'R010');

INSERT INTO pengembalian (id_pengembalian, id_anggota, kode_buku, id_petugas, TanggalPinjam, TanggalKembali, Denda) 
VALUES 
('1', 'R001', 'MB001', 'P001', '2024-04-01', '2024-04-16', '1000'),
('2', 'R002', 'MB002', 'P002', '2024-04-02', '2024-04-16', '0'),
('3', 'R003', 'MB003', 'P003', '2024-04-03', '2024-04-17', '0'),
('4', 'R004', 'MB004', 'P004', '2024-04-04', '2024-04-20', '2000'),
('5', 'R005', 'MB005', 'P005', '2024-04-05', '2024-04-18', '0'),
('6', 'R006', 'MB006', 'P006', '2024-04-06', '2024-04-19', '0'),
('7', 'R007', 'MB007', 'P007', '2024-04-07', '2024-04-21', '0'),
('8', 'R008', 'MB008', 'P008', '2024-04-08', '2024-04-23', '1000'),
('9', 'R009', 'MB009', 'P009', '2024-04-09', '2024-04-23', '0'),
('10', 'R010', 'MB010', 'P010', '2024-04-10', '2024-04-26', '2000');

select * from petugas;
select * from buku;
select * from anggota;
select * from peminjaman;
select * from pengembalian;
UPDATE buku set Pengarang_Buku = 'Kevin Feige'
where kode_buku = 'MB002';


DELIMITER //
CREATE PROCEDURE soalnomor1(IN nama VARCHAR(20))
BEGIN
    SELECT *
    FROM Petugas
    WHERE username LIKE CONCAT('%', nama, '%');
END //
DELIMITER ;

call soalnomor1("doko");

DELIMITER //
CREATE PROCEDURE soalnomor2(IN nama VARCHAR(20))
BEGIN
    SELECT *
    FROM anggota
    WHERE Nama_Anggota LIKE CONCAT('%', nama, '%');
END //
DELIMITER ;

call soalnomor2("Ray");

-- Buatlah stored procedure untuk mengetahui data pada table buku berdasarkan dua field yaitu status dan klasifikasi buku.
DELIMITER //
CREATE PROCEDURE soalnomor3(
    IN status VARCHAR(10),
    IN classification VARCHAR(20)
)
BEGIN
    SELECT *
    FROM buku
    WHERE Status_Buku = status AND Klasifikasi_Buku = classification;
END //
DELIMITER ;

CALL soalnomor3('Tersedia', 'Komik');	
select * from buku;

-- Buatlah stored procedure untuk mengetahui data peminjam pada table peminjaman berdasarkan pada 3 field yaitu anggota, tanggal pinjam dan kode buku.
DELIMITER //
CREATE PROCEDURE soalnomor4(
    IN anggota_id varchar(10),
    IN tanggal_pinjam date,
    IN buku_kode varchar(10)
)
BEGIN
    SELECT *
    FROM peminjaman
    WHERE id_anggota = anggota_id
    AND Tanggal_Pinjam = tanggal_pinjam
    AND kode_buku = buku_kode;
END //
DELIMITER ;

CALL soalnomor4('R002', '2024-04-02', 'MB002');

-- Definisikan stored procedure untuk memasukkan data pada table petugas.
DELIMiTER //
CREATE PROCEDURE soalnomor5(
	IN id_petugas VARCHAR(10),
    IN username VARCHAR(15),
    IN password VARCHAR(15),
    IN nama VARCHAR(25) 
)
BEGIN
	INSERT INTO petugas VALUES (id_petugas, username, password, nama)
    ;
END //
DELIMITER ;

select * from petugas;

call soalnomor5('P012', 'konnichiwa','mining','Arya')

-- buatlah stored procedure untuk mengetahui data jumlah peminjam menggunakan parameter OUT
DELIMITER //
CREATE PROCEDURE soalnomor6(
    OUT totalpeminjam INT
)
BEGIN
    SELECT COUNT(id_anggota) INTO totalpeminjam FROM peminjaman;
END//
DELIMITER ;

call soalnomor6(@totalpeminjam);
SELECT @totalpeminjam AS Total_peminjaman;

DELETE from peminjaman WHERE kode_peminjaman = 10;

select * from peminjaman;

-- buatlah stored procedure untuk mengetahui data jumlah peminjam berdasarkan tanggal pinjam dan kode buku menggunakan parameter OUT
DELIMITER //
CREATE PROCEDURE soalnomor7(
    IN tgl_pinjam DATE,
    IN buku_kode VARCHAR(10),
    OUT jml_peminjam INT
)
BEGIN
    SELECT COUNT(*) INTO jml_peminjam
    FROM peminjaman
    WHERE Tanggal_Pinjam = tgl_pinjam
    AND kode_buku = buku_kode;
END //
DELIMITER ;
CALL soalnomor7('2024-04-02', 'MB002', @jumlah);
SELECT @jumlah AS Jumlah_Peminjam;