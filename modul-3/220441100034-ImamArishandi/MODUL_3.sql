create database db_perpus;
use db_perpus;

CREATE TABLE tb_anggota (
	idAnggota VARCHAR (10) NOT NULL PRIMARY KEY,
    Nama_Anggota VARCHAR (20) NOT NULL,
    Angkatan_Anggota VARCHAR (6) NOT NULL,
    Tempat_Lahir_Anggota VARCHAR (20) NOT NULL,
    Tanggal_Lahir_Anggota DATE NOT NULL,
    No_Telp INT (12) NOT NULL,
    Jenis_Kelamin VARCHAR (15) NOT NULL,
    Status_Pinjam VARCHAR (15) NOT NULL
    );

INSERT INTO tb_anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam)
VALUES 
('1', 'Angga Jalasena Saputra', '22', 'Pamekasan', '2003-06-04', 088291847647, 'Laki-Laki', 'Belum'),
('2', 'Della Ayu Vernandah', '22', 'Sidoarjo', '2024-03-25', 088291847647, 'Perempuan', 'Sudah'),
('3', 'Amelia Zalfa Sahira', '22', 'Sampang', '2024-03-17', 088291847647, 'Perempuan', 'Sudah'),
('4', 'Imam Arishandi Irfanto', '22', 'Sumenep', '2024-03-09', 088291847647, 'Laki-Laki', 'Belum'),
('5', 'Dwi Nurjannah', '22', 'Lumajang', '2024-03-02', 088291847647, 'Perempuan', 'Belum'),
('6', 'Viko Alfian P', '22', 'Gresik', '2024-03-14', 088291847647, 'Laki-Laki', 'Belum'),
('7', 'Tesa Putri Hutagaol', '22', 'Medan', '2024-03-29', 088291847647, 'Perempuan', 'Sudah'),
('8', 'Bintang Wahyu Ariyono', '22', 'Sidoarjo', '2024-03-22', 088291847647, 'Laki-Laki', 'Belum'),
('9', 'Khoirotun Nisak', '22', 'Sampang', '2024-03-15', 088291847647, 'Perempuan', 'Belum'),
('10', 'Romauli Napitupulu', '22', 'Medan', '2024-03-24', 088291847647, 'Perempuan', 'Sudah'),
('11', 'M. Irfan Faruq Zain', '22', 'Surabaya', '2024-03-27', 088291847647, 'Laki-Laki', 'Sudah'),
('12', 'Naela Nahdiah', '22', 'Sidoarjo', '2024-03-16', 088291847647, 'Perempuan', 'Sudah'),
('13', 'Oxa Indi Vixzio', '22', 'Sidoarjo', '2024-03-19', 088291847647, 'Laki-Laki', 'Belum');

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
    
    
INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
VALUES 
('123', 'Harry Potter Thomas', 'imam', 'angga', '2019', '20', 'Ada', 'Fiksi'),
('234', 'Pejuang Sejati', 'angga', 'imam', '2017', '17', 'Habis', 'Cinta'),
('345', 'The Raid', 'dwi', 'amel', '2020', '27', 'Ada', 'Action'),
('456', 'Malinkundang', 'amel', 'dwi', '2021', '30', 'Habis', 'Sejarah'),
('567', 'Cinta Sejata', 'ninis', 'irfan', '2018', '25', 'Habis', 'Cinta'),
('678', 'Lain Waktu Kembali', 'irfan', 'ninis', '2023', '18', 'Ada', 'Fiksi'),
('789', 'Harga Diri Sejati', 'tesa', 'roma', '2024', '15', 'Ada', 'Sejarah'),
('891', 'Hari Terkutuk', 'roma', 'tesa', '2010', '9', 'Habis', 'Fiksi'),
('912', 'Menari Di Hari Ini', 'fiko', 'izud', '2015', '19', 'Habis', 'Santai'),
('101', 'Biarkan Saja Dia Mati', 'izud', 'fiko', '2017', '23', 'Ada', 'Fiksi'),
('102', 'Nenek Tercinta', 'naela', 'oxa', '2019', '28', 'Habis', 'Sejarah'),
('103', 'Gila Dengan Cintanya', 'oxa', 'naela', '2020', '30', 'Ada', 'Cinta'),
('104', 'Hirarki manusia yang lemah', 'sifa', 'sulthon', '2024', '15', 'Ada', 'Sejarah');

CREATE TABLE petugas (
	idPetugas VARCHAR (10) NOT NULL PRIMARY KEY,
    Username VARCHAR (15) NOT NULL,
    Password VARCHAR (15) NOT NULL,
    Nama VARCHAR (25) NOT NULL
    );
    
INSERT INTO petugas (idPetugas, Username, Password, Nama)
VALUES 
('1', 'Imam', '123', 'Imam Arishandi Irfanto'),
('2', 'Dwi', '234', 'Dwi Nurjannah'),
('3', 'Amel', '345', 'Amelia Zalfa Sahira'),
('4', 'Bintang', '456', 'Bintang Wahyu Ariyono'),
('5', 'Angga', '567', 'Angga Jalasena Saputra'),
('6', 'Irfan', '678', 'M Irfan Faruq Zain'),
('7', 'Ninis', '789', 'Khoirotun Nisak'),
('8', 'Tesa', '891', 'Tesa Putri Hutagaol'),
('9', 'Roma', '912', 'Romauli Napitupulu'),
('10', 'Viko', '101', 'Viko Alfian P'),
('11', 'Izud', '102', 'M. Izuddin Arafat'),
('12', 'Sifa', '103', 'Sifa Saputra'),
('13', 'Oxa', '104', 'Oxa Indi Vixzio');

CREATE TABLE peminjaman (
	Kode_Peminjaman VARCHAR (10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR (10) NOT NULL,
    idPetugas VARCHAR (10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Kode_Buku VARCHAR (10) NOT NULL
    );
    
INSERT INTO peminjaman (Kode_Peminjaman, idAnggota, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku)
VALUES
('1','1','13','2024-04-12','2024-05-22','912'),
('2','2','12','2024-04-11','2024-05-21','123'),
('3','3','11','2024-04-13','2024-05-23','789'),
('4','4','10','2024-04-14','2024-05-24','234'),
('5','5','9','2024-04-15','2024-05-25','678'),
('6','6','8','2024-04-16','2024-05-26','345'),
('7','7','7','2024-04-17','2024-05-27','456'),
('8','8','6','2024-04-18','2024-05-28','104'),
('9','9','5','2024-04-19','2024-05-29','102'),
('10','10','4','2024-04-20','2024-05-30','567'),
('11','11','3','2024-04-21','2024-05-31','891'),
('12','12','2','2024-04-22','2024-06-01','103');

CREATE TABLE pengembalian (
	Kode_Pengembalian VARCHAR (10) NOT NULL PRIMARY KEY,
    idAnggota VARCHAR (10) NOT NULL,
    Kode_Buku VARCHAR (10) NOT NULL,
    idPetugas VARCHAR (10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Denda VARCHAR (15) NOT NULL
    );
    
INSERT INTO pengembalian (Kode_Pengembalian, idAnggota, Kode_Buku, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Denda)
VALUES
('1','1','912','13','2024-04-12','2024-05-23','10000'),
('2','2','123','12','2024-04-11','2024-05-21','0'),
('3','3','789','11','2024-04-13','2024-05-25','20000'),
('4','4','234','10','2024-04-14','2024-05-25','10000'),
('5','5','678','9','2024-04-15','2024-05-25','0'),
('6','6','345','8','2024-04-16','2024-05-26','0'),
('7','7','456','7','2024-04-17','2024-06-01','50000'),
('8','8','104','6','2024-04-18','2024-05-28','0'),
('9','9','102','5','2024-04-19','2024-05-30','10000'),
('10','10','567','4','2024-04-20','2024-05-30','0'),
('11','11','891','3','2024-04-21','2024-05-31','0'),
('12','12','103','2','2024-04-22','2024-06-02','10000');

-1- 
DELIMITER //
CREATE PROCEDURE search_anggota()
BEGIN
    SELECT * FROM tb_anggota;
END //
DELIMITER ;

CALL search_anggota();

-2- 
DELIMITER //
CREATE PROCEDURE search_penerbit_buku(IN PenerbitBuku VARCHAR(30))
	BEGIN
		SELECT * FROM buku
		WHERE Penerbit_Buku = PenerbitBuku;
	END //
DELIMITER ;

CALL search_penerbit_buku('imam');

-3-
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

CALL search_tgl_pinjam('2024-04-12','912');

-4-
DELIMITER //
CREATE PROCEDURE search_angkatan_anggota(
	IN Angkatan VARCHAR (6),
    IN TempatLahir VARCHAR (20),
    IN JenisKelamin VARCHAR (15))
	BEGIN
		SELECT * FROM tb_anggota
        WHERE Angkatan_Anggota = Angkatan 
        AND Tempat_Lahir_Anggota = TempatLahir
        AND Jenis_Kelamin = JenisKelamin;
	END //
DELIMITER ; 

CALL search_angkatan_anggota('22','Sumenep','Laki-laki');

-5-
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
		INSERT INTO tb_anggota VALUES (idAnggota,Nama_Anggota,Angkatan_Anggota,Tempat_Lahir_Anggota,Tanggal_Lahir_Anggota,No_Telp,Jenis_Kelamin,Status_Pinjam);
	END //
DELIMITER ;

CALL input_anggota('14', 'Akhmad Sulthon Rabbani', '22', 'Sumenep', '2003-08-04', 088291847647, 'Laki-Laki', 'Sudah');
SELECT * FROM tb_anggota;

-6-
DELIMITER //
CREATE PROCEDURE get_jumlah_anggota(
    OUT jumlah_anggota INT)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota FROM tb_anggota;
END //
DELIMITER ;
 
CALL get_jumlah_anggota(@total_anggota);
SELECT @total_anggota AS TotalAnggota;

-7-
 DELIMITER //
CREATE PROCEDURE jumlah_buku(
	IN NamaPengarang VARCHAR (35),
    INOUT tahunTerbit VARCHAR (10),
    OUT totalBuku INT)
	BEGIN
		SELECT SUM(Jumlah_Buku) INTO totalBuku
		FROM buku
		WHERE Pengarang_Buku = NamaPengarang 
        AND Tahun_Buku = tahunTerbit;
		
		SET tahunTerbit = tahunTerbit + 1;
	END //
DELIMITER ; 

SET @tahunTerbit = '2019';
CALL jumlah_buku('imam', @tahunTerbit , @totalBuku);
SELECT @totalBuku AS TotalBuku;