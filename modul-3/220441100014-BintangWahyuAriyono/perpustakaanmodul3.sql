create database perpustakaan;
use perpustakaan;

CREATE TABLE anggota (
    idAnggota VARCHAR (10) NOT NULL PRIMARY KEY,
    Nama_Anggota VARCHAR (20) NOT NULL,
    Angkatan_Anggota VARCHAR (6) NOT NULL,
    Tempat_Lahir_Anggota VARCHAR (20) NOT NULL,
    Tanggal_Lahir_Anggota DATE NOT NULL,
    No_Telp INT (12) NOT NULL,
    Jenis_Kelamin VARCHAR (15) NOT NULL,
    Status_Pinjam VARCHAR (15) NOT NULL
    );
    
CREATE TABLE buku (
    Kode_Buku VARCHAR (10) NOT NULL PRIMARY KEY,
    Judul_Buku VARCHAR (25) NOT NULL,
    Pengarang_Buku VARCHAR (35) NOT NULL,
    Penerbit_Buku VARCHAR (30) NOT NULL,
    Tahun_Buku VARCHAR (10) NOT NULL,
    Jumlah_Buku VARCHAR (5) NOT NULL,
    Status_Buku VARCHAR (10) NOT NULL,
    Klasifikasi_Buku VARCHAR (20) NOT NULL
    );

CREATE TABLE petugas (
    idPetugas VARCHAR (10) NOT NULL PRIMARY KEY,
    Username VARCHAR (15) NOT NULL,
    Password VARCHAR (15) NOT NULL,
    Nama VARCHAR (25) NOT NULL
    );
    
CREATE TABLE peminjaman (
    Kode_Peminjaman VARCHAR (10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR (10) NOT NULL,
    idPetugas VARCHAR (10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Kode_Buku VARCHAR (10) NOT NULL
    );
    
CREATE TABLE pengembalian (
	Kode_Pengembalian VARCHAR (10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR (10) NOT NULL,
    Kode_Buku VARCHAR (10) NOT NULL,
    idPetugas VARCHAR (10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Denda VARCHAR (15) NOT NULL
    );
    
INSERT INTO anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES 
('1', 'bambang', '22', 'indo', '2000-06-04', 012345678910, 'Lake', 'Belum'),
('2', 'sza', '22', 'nganjuk', '2024-03-25', 012345678910, 'bini', 'Belum'),
('3', 'boger', '23', 'sampang', '2024-03-17', 012345678910, 'lake', 'Sudah'),
('4', 'mahfud', '23', 'sumenep', '2024-03-09', 012345678910, 'Lake', 'Sudah'),
('5', 'davina karamoy', '22', 'lumajang', '2024-03-02', 012345678910, 'bini', 'Sudah'),
('6', 'bruno', '22', 'darjo', '2024-03-14', 012345678910, 'Lake', 'Sudah'),
('7', 'audrey', '22', 'jaksel', '2024-03-29', 012345678910, 'bini', 'Sudah'),
('8', 'Bintang', '22', 'darjo', '2024-03-22', 012345678910, 'lake', 'Belum'),
('9', 'ajijah', '22', 'jakbar', '2024-03-15', 012345678910, 'bini', 'Belum'),
('10', 'nashwa', '22', 'medan', '2024-03-24', 012345678910, 'bini', 'Belum');

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES 
('1', 'Sejarah MU', 'sir alek', 'red devil', '2024', '100', 'Ada', 'Sejarah'),
('2', 'Pejuang Neraka', 'angga', 'imam', '2024', '100', 'Habis', 'Action'),
('3', 'The Beatles', 'bintang', 'bintang', '1975', '2', 'Ada', 'Sejarah'),
('4', 'Dilan', 'iqbal', 'milea', '1995', '300', 'Habis', 'Cinta'),
('5', 'Cinta beda agama', 'tesairfan', 'tesairfan', '2024', '1', 'Habis', 'Cinta'),
('6', 'Bapak Kawin Lagi', 'oksa', 'oksa', '2023', '1', 'Ada', 'Fiksi'),
('7', 'Keluarga Penjudi', 'sulton', 'angga', '2024', '900', 'Ada', 'Sejarah'),
('8', 'Arema Pembawa Sial', 'yulisumpil', 'ninis', '2023', '900', 'Habis', 'Sejarah'),
('9', 'Messi Main di Persebaya', 'shin taek', 'paulo', '2024', '10', 'Habis', 'Sejarah'),
('10', 'kilas balik SZA', 'justin', 'bintang', '2024', '23', 'Ada', 'Sejarah');

INSERT INTO petugas (idPetugas, Username, Password, Nama)
VALUES 
('1', 'sulton', '000', 'Sulton Rabbani'),
('2', 'Akhmad', '111', 'Akhmad Sulton'),
('3', 'Viko Jelek', '222', 'Viko ganteng'),
('4', 'Bintang', '333', 'Bintang Wahyu Ariyono'),
('5', 'Angga', '444', 'Angga Jalsen'),
('6', 'Imam', '555', 'Imam Waketum'),
('7', 'Romli', '666', 'Romaulik'),
('8', 'Tesi', '777', 'Tesiiiiii'),
('9', 'oksa', '888', 'oksa indi'),
('10', 'Viko gtg', '999', 'Viko gtg bgt');

INSERT INTO peminjaman (Kode_Peminjaman, idAnggota, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES
('001','1','1','2000-00-01','2024-12-01','10'),
('002','2','10','2000-00-01','2024-12-02','2'),
('003','3','2','2000-00-01','2024-12-03','9'),
('004','4','3','2001-00-04','2024-12-04','3'),
('005','5','9','2001-00-05','2024-12-05','6'),
('006','6','8','2002-00-06','2024-12-06','4'),
('007','7','7','2002-00-07','2024-12-07','5'),
('008','8','6','2004-00-08','2024-12-08','1'),
('009','9','5','2004-00-09','2024-12-09','7'),
('010','10','4','2004-00-10','2024-12-10','8');

INSERT INTO pengembalian (Kode_Pengembalian, idAnggota, Kode_Buku, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Denda)
VALUES
('001','1','10','1','2000-00-01','2024-12-01','700000'),
('002','2','2','10','2000-00-01','2024-12-02','200000'),
('003','3','9','2','2000-00-01','2024-12-03','0'),
('004','4','3','3','2001-00-04','2024-12-04','900000'),
('005','5','6','9','2001-00-05','2024-12-05','0'),
('006','6','4','8','2002-00-06','2024-12-06','300000'),
('007','7','5','7','2002-00-07','2024-12-07','900000'),
('008','8','1','6','2004-00-08','2024-12-08','0'),
('009','9','7','5','2004-00-09','2024-12-09','100000'),
('010','10','8','4','2004-00-10','2024-12-10','1000');

1 
DELIMITER //
CREATE PROCEDURE search_anggota(IN namaAnggota VARCHAR (25))
BEGIN
    SELECT * FROM anggota
    where Nama_Anggota = namaAnggota;
END //
DELIMITER ;

CALL search_anggota('sza');

2 
DELIMITER //
CREATE PROCEDURE search_penerbit_buku(IN PenerbitBuku VARCHAR(30))
	BEGIN
		SELECT * FROM buku
		WHERE Penerbit_Buku = PenerbitBuku;
	END //
DELIMITER ;

CALL search_penerbit_buku('tesairfan');

3
DELIMITER //
CREATE PROCEDURE search_tgl_pinjam(
	IN TanggalPinjam DATE,
    IN KodeBuku VARCHAR (10))
	BEGIN
		SELECT * FROM peminjaman
        WHERE Tanggal_Pinjam = TanggalPinjam 
        AND Kode_Buku = KodeBuku;
	END //
DELIMITER ; 

CALL search_tgl_pinjam('2004-00-10','8');

4
DELIMITER //
CREATE PROCEDURE search_angkatan_anggota(
	IN Angkatan VARCHAR (6),
    IN TempatLahir VARCHAR (20),
    IN JenisKelamin VARCHAR (15))
	BEGIN
		SELECT * FROM anggota
        WHERE Angkatan_Anggota = Angkatan 
        AND Tempat_Lahir_Anggota = TempatLahir
        AND Jenis_Kelamin = JenisKelamin;
	END //
DELIMITER ; 

CALL search_angkatan_anggota('22','nganjuk','bini');

5
DELIMITER //
CREATE PROCEDURE input_anggota(
	idAnggota VARCHAR (10),
    Nama_Anggota VARCHAR (20),
    Angkatan_Anggota VARCHAR (6),
    Tempat_Lahir_Anggota VARCHAR (20),
    Tanggal_Lahir_Anggota DATE,
    No_Telp INT (12),
    Jenis_Kelamin VARCHAR (15),
    Status_Pinjam VARCHAR (15))
    BEGIN
INSERT INTO anggota VALUES (idAnggota,Nama_Anggota,Angkatan_Anggota,Tempat_Lahir_Anggota,Tanggal_Lahir_Anggota,No_Telp,Jenis_Kelamin,Status_Pinjam);
	END //
DELIMITER ;

CALL input_anggota('8', 'Bintang', '22', 'darjo', '2024-03-22', 012345678910, 'lake', 'Belum');
SELECT * FROM anggota;

6
DELIMITER //
CREATE PROCEDURE get_jumlah_anggota(
    OUT jumlah_anggota INT)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota FROM anggota;
END //
DELIMITER ;
 
CALL get_jumlah_anggota(@total_anggota);
SELECT @total_anggota AS TotalAnggota;

7
 DELIMITER //
CREATE PROCEDURE jumlah_buku(
	IN NamaPengarang VARCHAR (35),
    INOUT tahunTerbit VARCHAR (10),
    OUT totalBuku INT)
	BEGIN
		SELECT sum(Jumlah_Buku) INTO totalBuku
		FROM buku
		WHERE Pengarang_Buku = NamaPengarang 
        AND Tahun_Buku = tahunTerbit;
		
		SET tahunTerbit = tahunTerbit + 1;
	END //
DELIMITER ; 
SET @nama = 'tesairfan';
SET @tahunTerbit = '2024';
CALL jumlah_buku(@nama, @tahunTerbit , @totalBuku);
SELECT @nama,@tahunTerbit,@totalBuku AS TotalBuku;
