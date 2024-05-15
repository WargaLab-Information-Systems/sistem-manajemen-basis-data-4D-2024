CREATE database perpustakaan;
USE perpustakaan;

CREATE TABLE petugas (
		IdPetugas VARCHAR(10) NOT NULL PRIMARY KEY,
        Username VARCHAR(10) NOT NULL,
        Password VARCHAR(15) NOT NULL,
        Nama VARCHAR(25) NOT NULL
);
CREATE TABLE buku (
		Kode_Buku VARCHAR(10) NOT NULL PRIMARY KEY,
        Judul_Buku VARCHAR(40) NOT NULL,
        Pengarang_Buku VARCHAR(30) NOT NULL,
        Penerbit_Buku VARCHAR(30) NOT NULL,
        Tahun_Buku VARCHAR(10) NOT NULL,
        Jumlah_Buku VARCHAR(5) NOT NULL,
        Status_Buku VARCHAR(15) NOT NULL,
        Klasifikasi_Buku VARCHAR(20) NOT NULL
);
CREATE TABLE anggota (
		IdAnggota VARCHAR(10) NOT NULL PRIMARY KEY,
        Nama_Anggota VARCHAR(20) NOT NULL,
        Angkatan_Anggota VARCHAR(6) NOT NULL,
        Tempat_Lahir_Anggota VARCHAR(20) NOT NULL,
        Tanggal_Lahir_Anggota DATE NOT NULL,
        No_Telp INT(12) NOT NULL,
        Jenis_Kelamin VARCHAR(15) NOT NULL,
        Status_Pinjam VARCHAR(15) NOT NULL
);
CREATE TABLE peminjaman (
		Kode_Peminjaman VARCHAR(10) NOT NULL PRIMARY KEY,
        IdAnggota VARCHAR(10) NOT NULL,
        IdPetugas VARCHAR(10) NOT NULL,
        Tanggal_Pinjam DATE NOT NULL,
        Tanggal_Kembali DATE NOT NULL,
        Kode_Buku VARCHAR(10) NOT NULL,
        FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
        FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku),
        FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota)
);
CREATE TABLE pengembalian (
		Kode_Kembali VARCHAR(10) NOT NULL PRIMARY KEY,
        IdAnggota VARCHAR(10) NOT NULL,
        Kode_Buku VARCHAR(10) NOT NULL,
        IdPetugas VARCHAR(10) NOT NULL,
        Tgl_Pinjam DATE NOT NULL,
        Tgl_Kembali DATE NOT NULL,
        Denda VARCHAR(15) NOT NULL,
        FOREIGN KEY (IdPetugas) REFERENCES petugas(IdPetugas),
        FOREIGN KEY (Kode_Buku) REFERENCES buku(Kode_Buku),
        FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota)
);

INSERT INTO petugas (idPetugas, Username, Password, Nama) VALUES
('PTG001', 'sehun', 'sehun01', 'Oh Se-hun'),
('PTG002', 'baekhyun', 'baekhyun02', 'Baek Hyun'),
('PTG003', 'suho', 'suho03', 'Kim Junmyeon'),
('PTG004', 'kyungsoo', 'kyungso12', 'Do Kyungsoo'),
('PTG005', 'chen', 'chen07', 'Kim Jong-dae'),
('PTG006', 'lay', 'layzhang', 'Zhang Yixing'),
('PTG007', 'kai', 'kaiexo', 'Kim Jong In'),
('PTG008', 'xiumin', 'minseok08', 'Kim Minseok'),
('PTG009', 'chanyeol', 'chanyeolpark', 'Park Chanyeol'),
('PTG010', 'jake', 'jakesim', 'Sim Jaeyun');

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES
('B001', 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '8', 'Tersedia', 'Fiction'),
('B002', 'Ayat-Ayat Cinta', 'Habiburrahman El-Shirazy', 'Republika', '2004', '6', 'Tersedia', 'Romance'),
('B003', 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2008', '7', 'Tersedia', 'Fiction'),
('B004', 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '4', 'Tersedia', 'Historical Fiction'),
('B005', 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', '5', 'Tidak Tersedia', 'Fiction'),
('B006', '5 cm', 'Donny Dhirgantoro', 'Gagas Media', '2005', '3', 'Tersedia', 'Fiction'),
('B007', 'Tidak Ada New York Hari Ini', 'Gita Savitri Devi', 'Gramedia Pustaka Utama', '2021', '4', 'Tidak Tersedia', 'Fiction'),
('B008', 'Dilan: Dia Adalah Dilanku Tahun 1990', 'Pidi Baiq', 'Dar! Mizan', '2014', '5', 'Tersedia', 'Romance'),
('B009', 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '5', 'Tersedia', 'Fiction'),
('B010', 'Rindu', 'Tere Liye', 'Gramedia Pustaka Utama', '2011', '6', 'Tidak Tersedia', 'Romance');

INSERT INTO anggota (IdAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin, Status_Pinjam) VALUES
('A001', 'Anisah Nuril Izzati', '2022', 'Bangkalan', '2006-06-07', 815152958, 'Perempuan', 'Meminjam'),
('A002', 'Firdausi Putri', '2022', 'Gresik', '2004-01-23', 85645739, 'Perempuan', 'Meminjam'),
('A003', 'Herdiyanti Fifin', '2022', 'Gresik', '2004-06-22', 81335017, 'Perempuan', 'Meminjam'),
('A004', 'Anisyafaah', '2022', 'Bangkalan', '2004-04-08', 82141432, 'Perempuan', 'Meminjam'),
('A005', 'Nadia Aprilia', '2022', 'Nganjuk', '2004-04-02', 81235510, 'Perempuan', 'Meminjam'),
('A006', 'Adhelia Kusumawati', '2022', 'Gresik', '2004-04-11', 85335851, 'Perempuan', 'Meminjam'),
('A007', 'Hasnah Insita', '2022', 'Sidoarjo', '2003-01-01', 85755352, 'Perempuan', 'Meminjam'),
('A008', 'Salwa Salsabila', '2023', 'Tanjung Uban', '2006-05-03', 82334148, 'Perempuan', 'Meminjam'),
('A009', 'Syahda Tsurayya', '2022', 'Jombang', '2004-09-28', 85230305, 'Perempuan', 'Meminjam'),
('A010', 'Faradisil Jannah', '2022', 'Bangkalan', '2005-11-29', 82335050, 'Perempuan', 'Meminjam');

INSERT INTO peminjaman (Kode_Peminjaman, IdAnggota, IdPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('PJ001', 'A001', 'PTG001', '2024-04-15', '2024-04-30', 'B001'),
('PJ002', 'A002', 'PTG002', '2024-04-15', '2024-05-05', 'B002'),
('PJ003', 'A003', 'PTG003', '2024-04-18', '2024-05-10', 'B003'),
('PJ004', 'A004', 'PTG004', '2024-04-20', '2024-05-05', 'B004'),
('PJ005', 'A005', 'PTG005', '2024-04-22', '2024-05-03', 'B006'),
('PJ006', 'A006', 'PTG006', '2024-04-22', '2024-05-07', 'B007'),
('PJ007', 'A007', 'PTG007', '2024-04-25', '2024-05-10', 'B008'),
('PJ008', 'A008', 'PTG008', '2024-04-26', '2024-05-05', 'B001'),
('PJ009', 'A009', 'PTG009', '2024-04-27', '2024-05-03', 'B003'),
('PJ010', 'A010', 'PTG010', '2024-04-28', '2024-05-15', 'B002');

INSERT INTO pengembalian (Kode_Kembali, IdAnggota, Kode_Buku, IdPetugas, Tgl_Pinjam, Tgl_Kembali, Denda) VALUES
('PK001', 'A001', 'B001', 'PTG001', '2024-04-15', '2024-04-30', '0'),
('PK002', 'A002', 'B002', 'PTG002', '2024-04-15', '2024-04-30', '0'),
('PK003', 'A003', 'B003', 'PTG003', '2024-04-18', '2024-05-18', '16000'),
('PK004', 'A004', 'B004', 'PTG004', '2024-04-20', '2024-05-20', '30000'),
('PK005', 'A005', 'B006', 'PTG005', '2024-04-22', '2024-05-22', '38000'),
('PK006', 'A006', 'B007', 'PTG006', '2024-04-22', '2024-05-07', '0'),
('PK007', 'A007', 'B008', 'PTG007', '2024-04-25', '2024-05-25', '30000'),
('PK008', 'A008', 'B001', 'PTG008', '2024-04-26', '2024-05-05', '0'),
('PK009', 'A009', 'B003', 'PTG009', '2024-04-27', '2024-05-03', '0'),
('PK010', 'A010', 'B002', 'PTG010', '2024-04-28', '2024-05-12', '6000');


-- soal 1
DELIMITER //
CREATE PROCEDURE SearchBuku(
	IN KodeBuku VARCHAR(10))
	BEGIN
		SELECT * FROM buku
        WHERE Kode_Buku = KodeBuku;
	END //
DELIMITER ;

CALL SearchBuku('B001');
SELECT * FROM buku;


-- soal 2
DELIMITER //
CREATE PROCEDURE GetAnggotaByNama(
    IN namaAnggota VARCHAR(20))
	BEGIN
		SELECT * FROM anggota WHERE Nama_Anggota = namaAnggota;
	END //
DELIMITER ;

CALL GetAnggotaByNama('Anisah Nuril Izzati');
SELECT * FROM anggota;


-- soal 3
DELIMITER //
CREATE PROCEDURE GetBukuByStatusKlasifikasi(
	IN StatusBuku VARCHAR(15),
    IN KlasifikasiBuku VARCHAR(20))
    BEGIN
		SELECT * FROM buku
        WHERE  Status_Buku = StatusBuku
        AND  Klasifikasi_Buku = KlasifikasiBuku;
	END //
DELIMITER ;

CALL GetBukuByStatusKlasifikasi('Tidak Tersedia', 'Romance');
SELECT * FROM buku;


-- soal 4
DELIMITER //
CREATE PROCEDURE GetPeminjamByAnggotaTanggalKode(
	IN Id_Anggota VARCHAR(10),
    IN TanggalPinjam DATE,
    IN KodeBuku VARCHAR(10))
	BEGIN
		SELECT * FROM peminjaman
        WHERE IdAnggota = Id_Anggota
        AND Tanggal_Pinjam = TanggalPinjam
        AND Kode_Buku = KodeBuku;
	END //
DELIMITER ;

CALL GetPeminjamByAnggotaTanggalKode('A005', '2024-04-22', 'B006');


-- soal 5
DELIMITER //
CREATE PROCEDURE InsertPetugas(
	IN IdPetugas VARCHAR(10),
    IN Username VARCHAR(10),
    IN Password VARCHAR(15),
    IN Nama VARCHAR(25))
    BEGIN
		INSERT INTO petugas VALUES (IdPetugas, Username, Password, Nama);
	END //
DELIMITER ;

CALL InsertPetugas('PTG011', 'jay', 'jaypark33', 'Park Jongsung');
SELECT * FROM petugas;


-- soal 6
DELIMITER //
CREATE PROCEDURE CountPeminjam(
	OUT JumlahPeminjam INT (10))
    BEGIN
		SELECT COUNT(IdAnggota) INTO JumlahPeminjam FROM peminjaman;
	END //
DELIMITER ;
   
CALL CountPeminjam(@JumlahPeminjam);
SELECT @JumlahPeminjam AS Jumlah_Peminjam;


-- soal 7
DELIMITER //
CREATE PROCEDURE CountPeminjamByTanggalKode(
	IN TglPinjam DATE,
    IN KodeBuku VARCHAR(10),
    OUT JumlahPeminjam INT)
	BEGIN
		SELECT COUNT(Kode_Peminjaman) INTO JumlahPeminjam FROM peminjaman
        WHERE Tanggal_Pinjam = TglPinjam AND Kode_Buku = kodeBuku;
	END //
DELIMITER ;

CALL CountPeminjamByTanggalKode('2024-04-15', 'B001', @JumlahPeminjam);
SELECT @JumlahPeminjam AS Jumlah_Peminjam;
