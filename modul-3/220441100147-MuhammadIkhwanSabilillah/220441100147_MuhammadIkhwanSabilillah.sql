CREATE DATABASE library;
USE library;

CREATE TABLE petugas (
id_petugas INT(10) NOT NULL,
username VARCHAR (15) NOT NULL,
PASSWORD VARCHAR (15) NOT NULL,
nama_petugas VARCHAR (25) NOT NULL,
PRIMARY KEY (id_petugas));

CREATE TABLE buku (
kode_buku INT (10) NOT NULL,
judul_buku VARCHAR (25) NOT NULL,
pengarang_buku VARCHAR (30) NOT NULL,
penerbit_buku VARCHAR (30) NOT NULL,
tahun_buku VARCHAR (10) NOT NULL,
jumlah_buku VARCHAR (5) NOT NULL,
status_buku VARCHAR (10) NOT NULL,
klasifikasi_buku VARCHAR (20) NOT NULL,
PRIMARY KEY (kode_buku));

CREATE TABLE anggota (
id_anggota INT (10) NOT NULL,
nama_anggota VARCHAR (20) NOT NULL,
angkatan_anggota VARCHAR (6) NOT NULL,
tempat_lahir_anggota VARCHAR (20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT (12) NOT NULL,
jenis_kelamin VARCHAR (15) NOT NULL,
status_pinjam VARCHAR (15) NOT NULL,
PRIMARY KEY (id_anggota));

CREATE TABLE pengembalian (
kode_kembali INT (10) NOT NULL,
id_anggota INT (10) NOT NULL,
kode_buku INT (10) NOT NULL,
id_petugas INT (10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR (15) NOT NULL,
PRIMARY KEY (kode_kembali));

CREATE TABLE peminjaman (
kode_peminjaman INT (10) NOT NULL,
id_anggota INT (10) NOT NULL,
id_petugas INT (10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
kode_buku INT (10) NOT NULL, 
PRIMARY KEY (kode_peminjaman));

ALTER TABLE peminjaman
ADD CONSTRAINT anggota FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
ADD CONSTRAINT petugas FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
ADD CONSTRAINT kode FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

ALTER TABLE pengembalian
ADD CONSTRAINT fk_anggota FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
ADD CONSTRAINT fk_petugas FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas),
ADD CONSTRAINT fk_kode FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku);

INSERT INTO buku VALUES 
(101, 'Laskar Pelangi', 'Andrea Hirata', 'Bentang Pustaka', '2005', '100', 'tersedia', 'Fiksi'),
(102, 'Ayat-Ayat Cinta', 'Habiburrahman El Shirazy', 'Republika', '2004', '75', 'tersedia', 'Romance'),
(103, 'Bumi Manusia', 'Pramoedya Ananta Toer', 'Hasta Mitra', '1980', '50', 'tersedia', 'Fiksi Sejarah'),
(104, 'Perahu Kertas', 'Dee Lestari', 'Bentang Pustaka', '2002', '90', 'tersedia', 'Fiksi'),
(105, 'Garis Waktu', 'Fiersa Besari', 'MediaKita', '2017', '120', 'tersedia', 'Non-Fiksi'),
(106, '99 Cahaya di Langit Eropa', 'Hanum Salsabiela Rais', 'Falcon Publishing', '2011', '80', 'tersedia', 'Travelogue'),
(107, 'Laut Bercerita', 'Leila S. Chudori', 'Kepustakaan Populer Gramedia', '2019', '60', 'tersedia', 'Fiksi'),
(108, 'Sang Pemimpi', 'Andrea Hirata', 'Bentang Pustaka', '2006', '70', 'tersedia', 'Fiksi'),
(109, 'The Alchemist', 'Paulo Coelho', 'Bentang Pustaka', '1988', '100', 'tersedia', 'Fiksi'),
(110, 'Negeri 5 Menara', 'Ahmad Fuadi', 'Gramedia Pustaka Utama', '2009', '85', 'tersedia', 'Fiksi');

INSERT INTO petugas VALUES 
(201, 'panji', 'panji123', 'Panji Setiawan'),
(202, 'budi', 'budi123', 'Budi Sudarsono'),
(203, 'rudi', 'rudi123', 'Rudi Widodo'),
(204, 'didi', 'didi123', 'Didi Santoso'),
(205, 'andi', 'andi123', 'Andi Wibowo'),
(206, 'susi', 'susi123', 'Susi Rahayu'),
(207, 'rina', 'rina123', 'Rina Indah'),
(208, 'toni', 'toni123', 'Toni Surya'),
(209, 'ani', 'ani123', 'Ani Cahaya'),
(210, 'deni', 'deni123', 'Deni Pratama'); 

INSERT INTO anggota VALUES 
(301, 'Agus', '2018', 'Jakarta', '1999-03-15', 08123450, 'Laki-laki', 'Meminjam'),
(302, 'Budi', '2019', 'Bandung', '2000-05-20', 08123451, 'Laki-laki', 'Meminjam'),
(303, 'Citra', '2020', 'Surabaya', '2001-07-25', 08123456, 'Perempuan', 'Meminjam'),
(304, 'Dewi', '2021', 'Semarang', '2002-09-30', 08123457, 'Perempuan', 'Meminjam'),
(305, 'Eka', '2022', 'Yogyakarta', '2003-11-05', 08123458, 'Laki-laki', 'Meminjam'),
(306, 'Fani', '2018', 'Surakarta', '1999-01-10', 08123459, 'Perempuan', 'Meminjam'),
(307, 'Guntur', '2019', 'Palembang', '2000-02-15', 08123455, 'Laki-laki', 'Meminjam'),
(308, 'Hana', '2020', 'Manado', '2001-04-20', 08123454, 'Perempuan', 'Meminjam'),
(309, 'Indra', '2021', 'Makassar', '2002-06-25', 08123453, 'Laki-laki', 'Meminjam'),
(310, 'Joko', '2022', 'Medan', '2003-08-30', 08123452, 'Laki-laki', 'Meminjam');

INSERT INTO pengembalian (kode_kembali, id_anggota, id_petugas, tgl_pinjam, tgl_kembali, kode_buku, denda) VALUES 
(501, 301, 202, '2024-04-02', '2024-04-09', 101, 'tidak ada'),
(502, 301, 202, '2024-04-02', '2024-04-09', 102, 'tidak ada'),
(503, 301, 203, '2024-04-09', '2024-04-16', 103, 'tidak ada'),
(504, 301, 203, '2024-04-09', '2024-04-16', 104, 'tidak ada'),
(505, 301, 203, '2024-04-09', '2024-04-16', 105, 'tidak ada'),
(506, 301, 201, '2024-04-16', '2024-04-23', 106, 'tidak ada'),
(507, 301, 201, '2024-04-16', '2024-04-23', 107, 'tidak ada'),
(508, 302, 202, '2024-04-02', '2024-04-09', 101, 'tidak ada'),
(509, 302, 202, '2024-04-09', '2024-04-09', 102, 'tidak ada'),
(510, 302, 203, '2024-04-09', '2024-04-16', 103, 'tidak ada');
INSERT INTO pengembalian (kode_kembali, id_anggota, id_petugas, tgl_pinjam, tgl_kembali, kode_buku, denda) VALUES 
(511, 303, 202, '2024-04-02', '2024-04-09', 101, 'tidak ada'),
(512, 303, 202, '2024-04-02', '2024-04-09', 102, 'tidak ada'),
(513, 304, 202, '2024-04-02', '2024-04-09', 105, 'tidak ada'),
(514, 305, 202, '2024-04-02', '2024-04-09', 108, 'tidak ada'),
(515, 306, 202, '2024-04-02', '2024-04-09', 109, 'tidak ada'),
(516, 307, 203, '2024-04-02', '2024-04-09', 102, 'tidak ada'),
(517, 308, 202, '2024-04-02', '2024-04-09', 103, 'tidak ada'),
(518, 309, 201, '2024-04-16', '2024-04-23', 106, 'tidak ada'),
(519, 310, 201, '2024-04-02', '2024-04-09', 107, 'tidak ada');

INSERT INTO peminjaman VALUES 
(401, 301, 201, '2024-04-02', '2024-04-09', 101),
(402, 301, 201, '2024-04-02', '2024-04-09', 102),
(403, 301, 202, '2024-04-09', '2024-04-16', 103),
(404, 301, 202, '2024-04-09', '2024-04-16', 104),
(405, 301, 202, '2024-04-09', '2024-04-16', 105),
(406, 301, 203, '2024-04-16', '2024-04-23', 106),
(407, 301, 203, '2024-04-16', '2024-04-23', 107),
(408, 302, 201, '2024-04-02', '2024-04-09', 101),
(409, 302, 201, '2024-04-09', '2024-04-09', 102),
(410, 302, 202, '2024-04-09', '2024-04-16', 103);
INSERT INTO peminjaman VALUES 
(411, 303, 201, '2024-04-02', '2024-04-09', 101),
(412, 303, 201, '2024-04-02', '2024-04-09', 102),
(413, 304, 201, '2024-04-02', '2024-04-09', 105),
(414, 305, 201, '2024-04-02', '2024-04-09', 108),
(415, 306, 201, '2024-04-02', '2024-04-09', 109),
(416, 307, 201, '2024-04-02', '2024-04-09', 102),
(417, 308, 201, '2024-04-02', '2024-04-09', 103),
(418, 309, 203, '2024-04-16', '2024-04-23', 106),
(419, 310, 201, '2024-04-02', '2024-04-09', 107);



-- soal 1
DELIMITER //
CREATE PROCEDURE SearchBuku(
	IN KodeBuku int(10))
	BEGIN
		SELECT * FROM buku
        WHERE Kode_Buku = KodeBuku;
	END //
DELIMITER ;
CALL SearchBuku(102);
SELECT * FROM buku;
-- soal 2
delimiter //
CREATE PROCEDURE soal2(
IN nama varchar (100))
BEGIN
	SELECT * FROM anggota where nama_anggota = nama;
END //
delimiter ;
CALL soal2('eka');

-- soal 3
DELIMITER //
CREATE PROCEDURE status_klasifikasi_buku(
  IN statusBuku varchar(20),
  IN klasifikasiBuku VARCHAR(20)
)
BEGIN
  SELECT * FROM buku
  WHERE status_buku = statusBuku AND klasifikasi_buku = klasifikasiBuku;
END //
DELIMITER ;
CALL status_klasifikasi_buku('tersedia', 'fiksi');
select *from buku;

-- soal 4
DELIMITER //
CREATE PROCEDURE anggota_tglPinjam_kodeBuku(
  IN anggota VARCHAR(20),
  IN tglPinjam date,
  IN kodeBuku int(10)
)
BEGIN
  SELECT * FROM peminjaman a join anggota b on a.id_anggota = b.id_anggota
  WHERE nama_anggota = anggota
    AND tgl_pinjam = tglPinjam
    AND kode_buku = kodeBuku;
END //
DELIMITER ;
CALL anggota_tglPinjam_kodeBuku('agus', '2024-04-02',101);

-- soal 5
select *from petugas;
DELIMITER //
CREATE PROCEDURE petugas (
    IN idPetugas int (10) ,
    IN userPetugas VARCHAR(100),
    IN pw VARCHAR(100),
    IN namaPetugas VARCHAR(100)
)
BEGIN
    INSERT INTO petugas
    VALUES (idPetugas, userPetugas, pw,namaPetugas);
END //
DELIMITER ;
CALL petugas (212, "abc", "abc123", "abc kurniawan");
select *from petugas;

-- soal 6
DELIMITER //
CREATE PROCEDURE jumlahPinjam (
	OUT jumlah_pinjam INT
	)
BEGIN
	SELECT COUNT(*) INTO jumlah_pinjam FROM peminjaman; 
END//
DELIMITER ;

CALL jumlahPinjam (@jumlah_pinjam);
SELECT @jumlah_pinjam;
-- soal 7
DELIMITER //
CREATE PROCEDURE jumlahPeminjam(
    IN tanggalPinjam DATE,
    IN kodeBuku INT,
    OUT jumlahPeminjam INT
)
BEGIN
    SELECT COUNT(*) INTO jumlahPeminjam
    FROM peminjaman
    WHERE tgl_pinjam = tanggalPinjam AND kode_buku = kodeBuku;
END //
DELIMITER ;
SET @jumlahPeminjam := 0;
CALL jumlahPeminjam('2024-04-09', 104, @jumlahPeminjam);
SELECT @jumlahPeminjam AS 'Jumlah Peminjam pada Tanggal 2024-04-09 dan Kode Buku 104';
select *from peminjaman;


