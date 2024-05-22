CREATE DATABASE db_modul3;
USE db_modul3;

CREATE TABLE anggota (
idAnggota VARCHAR(10) NOT NULL PRIMARY KEY,
Nama_Anggota VARCHAR(20) NOT NULL,
Angkatan_Anggota VARCHAR(6) NOT NULL,
Tempat_Lahir_Anggota VARCHAR(20) NOT NULL,
Tanggal_Lahir_Anggota DATE NOT NULL,
No_Telp VARCHAR(12) NOT NULL,
Jenis_Kelamin VARCHAR(15) NOT NULL,
Status_Pinjam VARCHAR(15) NOT NULL
);

INSERT INTO anggota (idAnggota, Nama_Anggota, Angkatan_Anggota, Tempat_Lahir_Anggota, Tanggal_Lahir_Anggota, No_Telp, Jenis_Kelamin , Status_Pinjam) VALUES
('01', 'Rifqi', '22', 'Surabaya', '2003-06-20', '088291847660', 'Laki-Laki', 'Sudah'),
('02', 'Dini', '22', 'Malang', '2003-09-15', '088291847661', 'Perempuan', 'Belum'),
('03', 'Fikri', '22', 'Surabaya', '2004-01-25', '088291847662', 'Laki-Laki', 'Sudah'),
('04', 'Maya', '22', 'Sidoarjo', '2002-11-10', '088291847663', 'Perempuan', 'Belum'),
('05', 'Reza', '22', 'Surabaya', '2003-07-05', '088291847664', 'Laki-Laki', 'Sudah'),
('06', 'Dewi', '22', 'Bangkalan', '2004-02-12', '088291847665', 'Perempuan', 'Belum'),
('07', 'Aji', '22', 'Surabaya', '2003-08-18', '088291847666', 'Laki-Laki', 'Sudah'),
('08', 'Rina', '22', 'Sidoarjo', '2002-12-08', '088291847667', 'Perempuan', 'Belum'),
('09', 'Dika', '22', 'Malang', '2004-03-14', '088291847668', 'Laki-Laki', 'Sudah'),
('10', 'Nadia', '22', 'Surabaya', '2003-10-30', '088291847669', 'Perempuan', 'Belum');



CREATE TABLE buku (
Kode_Buku VARCHAR(10) NOT NULL PRIMARY KEY,
Judul_Buku VARCHAR(25) NOT NULL,
Pengarang_Buku VARCHAR(35) NOT NULL,
Penerbit_Buku VARCHAR(30) NOT NULL,
Tahun_Buku VARCHAR(10) NOT NULL,
Jumlah_Buku VARCHAR(5) NOT NULL,
Status_Buku VARCHAR(10) NOT NULL,
Klasifikasi_Buku VARCHAR(20) NOT NULL
);

INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku) VALUES 
('115', 'The Hobbit', 'J.R.R. Tolkien', 'Penerbit K', '1937', '30', 'Ada', 'Fiksi'),
('116', 'The Alchemist', 'Paulo Coelho', 'Penerbit L', '1988', '25', 'Ada', 'Fiksi'),
('117', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Penerbit K', '1954', '20', 'Ada', 'Fiksi'),
('118', 'The Da Vinci Code', 'Dan Brown', 'Penerbit M', '2003', '35', 'Ada', 'Fiksi'),
('119', 'The Chronicles of Narnia', 'C.S. Lewis', 'Penerbit N', '1950', '40', 'Ada', 'Fiksi'),
('120', 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Penerbit O', '2005', '22', 'Ada', 'Fiksi'),
('121', 'The Hunger Games', 'Suzanne Collins', 'Penerbit P', '2008', '28', 'Ada', 'Fiksi'),
('122', 'The Road', 'Cormac McCarthy', 'Penerbit Q', '2006', '18', 'Ada', 'Fiksi'),
('123', 'The Silent Patient', 'Alex Michaelides', 'Penerbit R', '2019', '20', 'Ada', 'Fiksi'),
('124', 'The Secret', 'Rhonda Byrne', 'Penerbit S', '2006', '15', 'Ada', 'Non-Fiksi');

CREATE TABLE petugas (
	idPetugas VARCHAR(10) NOT NULL PRIMARY KEY,
    Username VARCHAR(15) NOT NULL,
    PASSWORD VARCHAR(15) NOT NULL,
    Nama VARCHAR(25) NOT NULL
);

INSERT INTO petugas (idPetugas, Username, PASSWORD, Nama) VALUES 
('101', 'Asnawi', '505', 'Asnawi Aja'),
('102', 'Gozel', '320', 'Gozel Roland'),
('103', 'Monci', '701', 'Monci Beatrix'),
('104', 'Monti', '287', 'Mountea'),
('105', 'Keran', '999', 'Keran Potter'),
('106', 'Guntur', '222', 'Guntur Abraham'),
('107', 'Cazil', '327', 'Cazil Voyage'),
('108', 'Rayie', '122', 'Rayie Yage'),
('109', 'Rio', '405', 'Alterio Alim'),
('110', 'Resdan', '389', 'Resdan Wade');

CREATE TABLE peminjaman (
Kode_Peminjaman VARCHAR(10) NOT NULL PRIMARY KEY,
idAnggota VARCHAR(10) NOT NULL,
idPetugas VARCHAR(10) NOT NULL,
Tanggal_Pinjam DATE NOT NULL,
Tanggal_Kembali DATE NOT NULL,
Kode_Buku VARCHAR(10) NOT NULL
);

INSERT INTO peminjaman (Kode_Peminjaman, idAnggota, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Kode_Buku) VALUES
('23','01','101','2024-05-08','2024-06-07','121'),
('24','02','102','2024-05-09','2024-06-08','118'),
('25','03','103','2024-05-10','2024-06-09','123'),
('26','04','104','2024-05-11','2024-06-10','119'),
('27','05','105','2024-05-12','2024-06-11','124'),
('28','06','106','2024-05-13','2024-06-12','120'),
('29','07','107','2024-05-14','2024-06-13','115'),
('30','08','108','2024-05-15','2024-06-14','116'),
('31','09','109','2024-05-16','2024-06-15','117'),
('32','10','110','2024-05-17','2024-06-16','122');

CREATE TABLE pengembalian (
Kode_Pengembalian VARCHAR(10) NOT NULL PRIMARY KEY,
idAnggota VARCHAR(10) NOT NULL,
Kode_Buku VARCHAR(10) NOT NULL,
idPetugas VARCHAR(10) NOT NULL,
Tanggal_Pinjam DATE NOT NULL,
Tanggal_Kembali DATE NOT NULL,
Denda VARCHAR(15) NOT NULL
);

INSERT INTO pengembalian (Kode_Pengembalian, idAnggota, Kode_Buku, idPetugas, Tanggal_Pinjam, Tanggal_Kembali, Denda) VALUES
('25', '01', '121', '101', '2024-05-18', '2024-06-17', '10000'),
('26', '02', '118', '102', '2024-05-19', '2024-06-18', '2000'),
('27', '03', '123', '103', '2024-05-20', '2024-06-19', '50000'),
('28', '04', '119', '104', '2024-05-21', '2024-06-20', '40000'),
('29', '05', '124', '105', '2024-05-22', '2024-06-21', '20000'),
('30', '06', '120', '106', '2024-05-23', '2024-06-22', '4000'),
('31', '07', '115', '107', '2024-05-24', '2024-06-23', '6000'),
('32', '08', '116', '108', '2024-05-25', '2024-06-24', '16000'),
('33', '09', '117', '109', '2024-05-26', '2024-06-25', '30000'),
('34', '10', '122', '110', '2024-05-27', '2024-06-26', '32000');

--soal nomer 1

DELIMITER //
CREATE PROCEDURE search_anggota(anggota_id VARCHAR(10) )
BEGIN
    SELECT * FROM anggota WHERE idAnggota = anggota_id;
END //
DELIMITER ;
CALL search_anggota('02');


---soal nomer 2
DELIMITER //

CREATE PROCEDURE search_pengembalian_buku(IN kode_bukuu VARCHAR(10))
BEGIN
    SELECT * FROM pengembalian WHERE Kode_Buku = kode_bukuu;
END //

DELIMITER ;
CALL search_pengembalian_buku('121');

---soal nomer 3
DELIMITER //

CREATE PROCEDURE search_anggota(
    IN angkatan_a VARCHAR(6),
    IN jenis_kelamin_a VARCHAR(15)
)
BEGIN
    SELECT * FROM anggota 
    WHERE Angkatan_Anggota = angkatan_a
    AND Jenis_Kelamin = jenis_kelamin_a;
END //

DELIMITER ;
CALL search_anggota('22', 'Laki-Laki');

--soal nomer 4
DELIMITER //

CREATE PROCEDURE search_buku(
    IN penerbit_p VARCHAR(30),
    IN pengarang_p VARCHAR(35),
    IN tahun_terbit_p VARCHAR(10)
)
BEGIN
    SELECT * FROM buku 
    WHERE Penerbit_Buku = penerbit_p
    AND Pengarang_Buku = pengarang_p 
    AND Tahun_Buku = tahun_terbit_p;
END //

DELIMITER ;
CALL search_buku('Penerbit K', 'J.R.R. Tolkien', '1954');

--soal nomer 5
DELIMITER //

CREATE PROCEDURE insert_buku(
    IN Kode_Buku_p VARCHAR(10),
    IN Judul_Buku_p VARCHAR(25),
    IN Pengarang_Buku_p VARCHAR(35),
    IN Penerbit_Buku_p VARCHAR(30),
    IN Tahun_Buku_p VARCHAR(10),
    IN Jumlah_Buku_p VARCHAR(5),
    IN Status_Buku_p VARCHAR(10),
    IN Klasifikasi_Buku_p VARCHAR(20)
)
BEGIN
    INSERT INTO buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
    VALUES (Kode_Buku_p, Judul_Buku_p, Pengarang_Buku_p, Penerbit_Buku_p, Tahun_Buku_p, Jumlah_Buku_p, Status_Buku_p, Klasifikasi_Buku_p);
END //

DELIMITER ;

CALL insert_buku('125', 'The Catcher in the Rye', 'J.D. Salinger', 'Penerbit T', '1951', '20', 'Ada', 'Fiksi');
SELECT*FROM buku;

--soal nomer 6
DELIMITER //

CREATE PROCEDURE hitung_jumlah_buku(
    OUT jumlah_buku INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_buku FROM buku;
END //

DELIMITER ;

CALL hitung_jumlah_buku(@jumlah_buku);
SELECT @jumlah_buku;

--soal nomer 7
DELIMITER //

CREATE PROCEDURE hitung_jumlah_anggota(
    INOUT angkatan VARCHAR(6),
    INOUT jenis_kelamin VARCHAR(15),
    OUT jumlah_anggota INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota 
    FROM anggota 
    WHERE Angkatan_Anggota = angkatan
    AND Jenis_Kelamin = jenis_kelamin;
END //

DELIMITER ;

SET @angkatan = '22';
SET @jenis_kelamin= 'Laki-Laki';
CALL hitung_jumlah_anggota(@angkatan, @jenis_kelamin, @jumlah_anggota);
SELECT @jumlah_anggota;


DROP PROCEDURE IF EXISTS  ;