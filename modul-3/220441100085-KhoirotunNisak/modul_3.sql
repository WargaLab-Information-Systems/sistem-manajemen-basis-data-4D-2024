CREATE DATABASE perpusprak
USE perpusprak

CREATE TABLE petugas (
idPetugas VARCHAR (10) NOT NULL PRIMARY KEY,
 Username VARCHAR (15) NOT NULL, 
 Passsword VARCHAR (15) NOT NULL, 
 Nama VARCHAR (25) NOT NULL)
 
 INSERT INTO petugas(idPetugas, Username, Passsword, Nama)
 VALUES ('01', 'bunga', '11', 'Bunga Ramadanti'),
 ('02', 'zila', '22', 'Zila Rahmat'),
 ('03', 'mila', '33', 'Mila damaya'),
 ('04', 'zahra', '22', 'Zahhra Rahmat'),
 ('05', 'mideh', '33', 'Mideh damaya'),
 ('06', 'pilau', '22', 'Pilau Rahmat'),
 ('07', 'Kilat', '33', 'Kilat damaya'),
 ('08', 'Yila', '22', 'Yila Rahmat'),
 ('09', 'gila', '33', 'Gila damaya'),
 ('10', 'qila', '22', 'Qila Rahmat')
 
 
 CREATE TABLE anggota (
    idAnggota VARCHAR (10) NOT NULL PRIMARY KEY,
    Nama_Anggota VARCHAR (20) NOT NULL,
    Angkatan_Anggota VARCHAR (6) NOT NULL,
    Tempat_Lahir_Anggota VARCHAR (20) NOT NULL,
    Tanggal_Lahir_Anggota DATE NOT NULL,
    No_Telp VARCHAR(12) NOT NULL,
    Jenis_Kelamin VARCHAR (15) NOT NULL,
    Status_Pinjam VARCHAR (15) NOT NULL
    )
    
   INSERT INTO anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES 
('1', 'Budi Santoso', '2018', 'Surabaya', '1998-05-10', '08123456789', 'Laki-laki', 'Tidak'),
('2', 'Anita Putri', '2019', 'Jakarta', '1997-08-15', '08234567890', 'Perempuan', 'Ya'),
('3', 'Cahya Wijaya', '2020', 'Bandung', '1999-12-20', '08345678901', 'Laki-laki', 'Tidak'),
('4', 'Dewi Susanti', '2021', 'Yogyakarta', '2000-02-25', '08456789012', 'Perempuan', 'Ya'),
('5', 'Eko Prasetyo', '2018', 'Surabaya', '1998-03-05', '08567890123', 'Laki-laki', 'Tidak'),
('6', 'Fitri Indah', '2019', 'Medan', '1997-06-12', '08678901234', 'Perempuan', 'Ya'),
('7', 'Gita Sari', '2020', 'Semarang', '1999-09-17', '08789012345', 'Perempuan', 'Tidak'),
('8', 'Hadi Nugroho', '2021' , 'Bandung', '2000-11-22', '08890123456', 'Laki-laki', 'Ya'),
('9', 'Intan Permata', '2018', 'Yogyakarta', '1998-04-07', '08901234567', 'Perempuan', 'Tidak'),
('10', 'Joko Wibowo', '2019', 'Surabaya', '1997-07-30', '09012345678', 'Laki-laki', 'Ya')

    DROP TABLE anggota
CREATE TABLE buku (
Kode_Buku VARCHAR (10) NOT NULL PRIMARY KEY,
Judul_Buku VARCHAR (25) NOT NULL,
Pengarang_Buku VARCHAR (30)NOT NULL,
Penerbit_Buku VARCHAR (30) NOT NULL,
Tahun_Buku VARCHAR (10) NOT NULL,
Jumlah_Buku VARCHAR (5) NOT NULL, 
Status_Buku VARCHAR (10)NOT NULL,
Klasifikasi_Buku VARCHAR (20) NOT NULL
)
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES
('B001', 'Sejarah Indonesia', 'Ahmad Basuki', 'Gramedia Pustaka Utama', '2010', '100', 'Tersedia', 'Sejarah'),
('B002', 'Pendidikan Pemrograman', 'Dewi Wulandari', 'Erlangga', '2018', '50', 'Dipinjam', 'Pendidikan'),
('B003', 'Ekonomi Makro', 'Budi Santoso', 'Andi Offset', '2015', '75', 'Tersedia', 'Ekonomi'),
('B004', 'Biologi Dasar', 'Anita Putri', 'McGraw-Hill', '2019', '60', 'Dipinjam', 'Biologi'),
('B005', 'Matematika Diskrit', 'Cahya Wijaya', 'Pustaka Pelajar', '2020', '80', 'Tersedia', 'Matematika'),
('B006', 'Kamus Inggris-Indonesia', 'Dewi Susanti', 'Gramedia', '2017', '90', 'Tersedia', 'Bahasa'),
('B007', 'Fisika Modern', 'Eko Prasetyo', 'Erlangga', '2016', '55', 'Dipinjam', 'Fisika'),
('B008', 'Sosiologi Komunikasi', 'Fitri Indah', 'Rajawali Press', '2018', '70', 'Tersedia', 'Sosiologi'),
('B009', 'Seni Rupa Kontemporer', 'Gita Sari', 'Penerbit ITB', '2021', '65', 'Tersedia', 'Seni'),
('B010', 'Manajemen Strategi', 'Hadi Nugroho', 'Salemba Empat', '2019', '85', 'Dipinjam', 'Manajemen')


 CREATE TABLE peminjaman (
 Kode_Peminjaman VARCHAR (10)NOT NULL PRIMARY KEY, 
 IdAnggota VARCHAR (10)NOT NULL,
 IdPetugas VARCHAR (10) NOT NULL,
 Tanggal_Pinjam DATE NOT NULL,
 Tanggal_Kembali DATE NOT NULL,
 Kode_Buku VARCHAR (10) NOT NULL
 )
INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES 
('PM001', '1', '01', '2024-04-01', '2024-04-15', 'B001'),
('PM002', '2', '02', '2024-04-02', '2024-04-16', 'B002'),
('PM003', '3', '03', '2024-04-03', '2024-04-17', 'B003'),
('PM004', '4', '04', '2024-04-04', '2024-04-18', 'B004'),
('PM005', '5', '05', '2024-04-05', '2024-04-19', 'B005'),
('PM006', '6', '06', '2024-04-06', '2024-04-20', 'B006'),
('PM007', '7', '07', '2024-04-07', '2024-04-21', 'B007'),
('PM008', '8', '08', '2024-04-08', '2024-04-22', 'B008'),
('PM009', '9', '09', '2024-04-09', '2024-04-23', 'B009'),
('PM010', '10', '10', '2024-04-10', '2024-04-24', 'B010')


 
CREATE TABLE pengembalian (
	Kode_Pengembalian VARCHAR (10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR (10) NOT NULL,
    Kode_Buku VARCHAR (10) NOT NULL,
    idPetugas VARCHAR (10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Denda VARCHAR (15) NOT NULL
    )
INSERT INTO pengembalian (Kode_Pengembalian, idAnggota, Kode_Buku, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Denda)
VALUES 
('PG001', '1', 'B001', '01', '2024-04-01', '2024-04-15', '0'),
('PG002', '2', 'B002', '02', '2024-04-02', '2024-04-16', '0'),
('PG003', '3', 'B003', '03', '2024-04-03', '2024-04-17', '0'),
('PG004', '4', 'B004', '04', '2024-04-04', '2024-04-18', '0'),
('PG005', '5', 'B005', '05', '2024-04-05', '2024-04-19', '0'),
('PG006', '6', 'B006', '06', '2024-04-06', '2024-04-20', '0'),
('PG007', '7', 'B007', '07', '2024-04-07', '2024-04-21', '0'),
('PG008', '8', 'B008', '08', '2024-04-08', '2024-04-22', '0'),
('PG009', '9', 'B009', '09', '2024-04-09', '2024-04-23', '0'),
('PG010', '10', 'B010', '10', '2024-04-10', '2024-04-24', '0')



DELIMITER //
CREATE PROCEDURE TampilBuku(
IN p_buku VARCHAR (IN )
 )
BEGIN
    SELECT *
    FROM buku;
END//
DELIMITER ;

CALL TampilBuku()



DELIMITER //
CREATE PROCEDURE TampilBuku43(
    p_Judul VARCHAR(50)
)
BEGIN
    SELECT *
    FROM buku
    WHERE Judul_Buku LIKE CONCAT('_', p_Judul, '%');
END//
DELIMITER ;
CALL TampilBuku4('e')


DELIMITER //
CREATE PROCEDURE GetPengembalianByKodeBuku(
    IN p_Kode_Buku VARCHAR(10))
BEGIN
    SELECT *
    FROM pengembalian
    WHERE Kode_Buku = p_Kode_Buku;
END//
DELIMITER ;

CALL GetPengembalianByKodeBuku('B001')



DELIMITER //
CREATE PROCEDURE GetAnggotaByAngkatanJenisKelamin(
    IN p_Angkatan VARCHAR(6),
    IN p_Jenis_Kelamin VARCHAR(15)
)
BEGIN
    SELECT *
    FROM anggota
    WHERE Angkatan_Anggota = p_Angkatan AND Jenis_Kelamin = p_Jenis_Kelamin;
END//
DELIMITER ;

CALL GetAnggotaByAngkatanJenisKelamin ('2018', 'Laki-laki')

DELIMITER //
CREATE PROCEDURE GetBukuPPT(
	IN p_Pengarang VARCHAR (30),
	IN p_penerbit VARCHAR (30),
	IN p_thnterbit VARCHAR (10)
)
BEGIN 
	SELECT *
	FROM buku
	WHERE Pengarang_Buku = p_Pengarang
	AND Penerbit_Buku = p_penerbit
	AND Tahun_Buku = p_thnterbit;
END//
DELIMITER;
CALL GetBukuPPT ('Ahmad Basuki', 'Gramedia Pustaka Utama', '2010')


DELIMITER //
CREATE PROCEDURE input_buku (
    IN p_Kode_Buku VARCHAR(10),
    IN p_Judul_Buku VARCHAR(25),
    IN p_Pengarang_Buku VARCHAR(30),
    IN p_Penerbit_Buku VARCHAR(30),
    IN p_Tahun_Buku VARCHAR(10),
    IN p_Jumlah_Buku VARCHAR(5),
    IN p_Status_Buku VARCHAR(10),
    IN p_Klasifikasi_Buku VARCHAR(20)
)
BEGIN 
    INSERT INTO buku VALUES (p_Kode_Buku, p_Judul_Buku, p_Pengarang_Buku, p_Penerbit_Buku, p_Tahun_Buku, p_Jumlah_Buku, p_Status_Buku, p_Klasifikasi_Buku);
END //
DELIMITER ;

CALL input_buku('B022', 'Sejarah Indonesia', 'Ahmad Basuki', 'Gramedia Pustaka Utama', '2010', '100', 'Tersedia', 'Sejarah');
SELECT*FROM buku



DELIMITER //
CREATE PROCEDURE get_jumlah_buku(
    OUT jumlah_buku INT
)
BEGIN 
    SELECT COUNT(*) 
    INTO jumlah_buku 
    FROM buku;
END //
DELIMITER ;
CALL get_jumlah_buku(@jumlah);
SELECT @jumlah AS Jumlah_Buku;


DELIMITER //


CREATE PROCEDURE GetJumlahAnggotaByAngkatanJenisKelamin(
    IN p_Angkatan VARCHAR(6),
    IN p_Jenis_Kelamin VARCHAR(15),
    INOUT p_JumlahAnggota INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_JumlahAnggota
    FROM anggota
    WHERE Angkatan_Anggota = p_Angkatan AND Jenis_Kelamin = p_Jenis_Kelamin;
END //

DELIMITER ;
SET @P = 0;
CALL GetJumlahAnggotaByAngkatanJenisKelamin('2019', 'Laki-laki', @P);
SELECT @P AS Jumlah;
