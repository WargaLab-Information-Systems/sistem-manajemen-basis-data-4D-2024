create database db_perpus;
use db_perpus;

drop database db_perpus;
CREATE TABLE IF NOT EXISTS petugas(
id_petugas INT (10) NOT NULL PRIMARY KEY,
username VARCHAR (15) NOT NULL,
pass VARCHAR (15) NOT NULL,
nama_petugas VARCHAR (15)
);

CREATE TABLE IF NOT EXISTS buku(
kode_buku INT(11) NOT NULL  PRIMARY KEY,
judul_buku VARCHAR(25) NOT NULL,
pengarang_buku VARCHAR(30) NOT NULL,
penerbit_buku VARCHAR(30) NOT NULL,
tahun_buku VARCHAR(10) NOT NULL, 
jumlah_buku VARCHAR(5) NOT NULL,
status_buku VARCHAR(10) NOT NULL,
klasifikasi_buku VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS anggota(
id_anggota INT(10) NOT NULL PRIMARY KEY,
nama_anggota VARCHAR(20) NOT NULL,
angkatan_anggota VARCHAR(6) NOT NULL,
tempat_lahir_anggota VARCHAR(20) NOT NULL,
tanggal_lahir_anggota DATE,
no_telp INT(12) NOT NULL,
jenis_kelamin VARCHAR(15) NOT NULL,
status_pinjam VARCHAR(15) NOT NULL
);

ALTER TABLE anggota MODIFY COLUMN no_telp VARCHAR (12);


CREATE TABLE IF NOT EXISTS pengembalian(
id_kembali INT(10) NOT NULL PRIMARY KEY,
id_anggota INT(10) NOT NULL,
kode_buku INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tgl_pinjam DATE,
tgl_kembali DATE,
denda VARCHAR(15) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);


CREATE TABLE IF NOT EXISTS peminjaman(
id_pinjam INT(10) NOT NULL PRIMARY KEY,
id_anggota INT(10) NOT NULL,
id_petugas INT(10) NOT NULL,
tanggal_pinjam DATE,
tanggal_kembali DATE,
kode_buku INT(10) NOT NULL,
FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

INSERT INTO petugas VALUES
(110, 'soleh00', 'sh110','soleh'),
(111, 'fitri01', 'f111','fitri'),
(112, 'baim02', 'b112','baim'),
(113, 'sulton03', 's113','sultonn'),
(114, 'andi04', 'a114','andi'),
(115, 'imam05', 'i115', 'imam'),
(116, 'star06', 'st116', 'star'),
(117, 'bayu07', 'by117', 'bayu'),
(118, 'roma08', 'rm118', 'roma'),
(119, 'alex09', 'al119', 'alex');


INSERT INTO buku VALUES
(210, 'Harry Potter', 'J.K. Rowling','Bloomsbury','1997', '7', 'baik', 'fiksi'),
(211, 'The Hunger Games', 'Suzzane Collins','Scholastic Cooperation','2008', '6', 'baik', 'fiksi'),
(212, 'Pride and Preajudice', 'Jane Austen','Whitehall','1813', '4', 'baik', 'fiksi'),
(213, 'The Hobbit', 'J.R.R. Tolkien','Allen & Unwin','1937', '7', 'baik', 'fiksi'),
(214, 'The Passage', 'Justin Cronin','Ballantine Books','2010', '15', 'baik', 'fiksi'),
(215, 'Bumi Manusia', 'Pramoedya Ananta Toer','Hasta Mitra','1980', '10', 'baik', 'fiksi'),
(216, 'Pulang', 'Tere Liye','Gramedia Pustaka Utama','2012', '10', 'baik ', 'fiksi'),
(217, 'Aroma Karsa', 'Dee Lestari','Bentang Pustaka','2021', '15', 'baik', 'fiksi'),
(218, 'Sang Pemimpi', 'Andrea Hirata','Bentang Pustaka','2006', '7', 'baik', 'fiksi'),
(219, 'Matahari', 'Tere Liye','Gramedia Pustaka Utama','2011', '11', 'baik', 'fiksi');

INSERT INTO anggota VALUES
(310, 'Revalina', '2022', 'Surabaya', '2004-06-19', '081334666249', 'perempuan', 'pinjam'),
(311, 'Dita', '2022', 'Nganjuk', '2003-05-23', '084582335617', 'perempuan', 'pinjam'),
(312, 'Dhea', '2022', 'Bojonegoro', '2004-10-16', '084429119444', 'perempuan', 'pinjam'),
(313, 'Mahesa', '2021', 'Malang', '2002-10-15', '082367789115', 'laki-laki', 'pinjam'),
(314, 'Jeremy', '2021', 'Blitar', '2002-11-15', '087311742299', 'laki-laki', 'pinjam'),
(315, 'Shaka', '2022', 'Pasuruan', '2002-12-08', '081670092366', 'laki-laki', 'pinjam'),
(316, 'Loli', '2022', 'Kediri', '2002-10-08', '082670092316', 'perempuan', 'pinjam'),
(317, 'Ninis', '2021', 'Lamongan', '2001-12-09', '081612092312', 'perempuan', 'pinjam'),
(318, 'Budi', '2022', 'Ponorogo', '2002-02-08', '082373092331', 'laki-laki', 'pinjam'),
(319, 'Somo', '2021', 'Bangkalan', '2002-03-05', '084675095367', 'laki-laki', 'pinjam');


INSERT INTO pengembalian VALUES
(410, 310, 211, 110, '2024-02-02', '2024-02-09', '0'),
(411, 313, 211, 113, '2024-02-16', '2024-02-23', '0'),
(412, 313, 216, 113, '2024-02-16', '2024-02-23', '0'),
(413, 314, 214, 114, '2024-02-13', '2024-02-20', '0'),
(414, 315, 216, 114, '2024-02-13', '2024-02-20', '0'),
(415, 314, 217, 114, '2024-02-17', '2024-02-25', '0'),
(416, 315, 216, 115, '2024-02-11', '2024-02-20', '0'),
(417, 315, 216, 114, '2024-02-20', '2024-02-23', '0'),
(418, 315, 216, 114, '2024-02-12', '2024-02-18', '0'),
(419, 315, 216, 114, '2024-02-15', '2024-02-20', '0');

INSERT INTO peminjaman VALUES
(510, 312, 111, '2024-02-13', '2024-02-20', 216),
(511, 311, 112, '2024-02-17', '2024-02-24', 217),
(512, 313, 112, '2024-02-17', '2024-02-24', 219),
(513, 313, 113, '2024-02-23', '2024-02-30', 210),
(514, 313, 111, '2024-02-24', '2024-03-01', 212),
(515, 313, 111, '2024-02-10', '2024-03-01', 215),
(516, 313, 111, '2024-02-20', '2024-03-10', 211),
(517, 313, 111, '2024-02-12', '2024-03-20', 216),
(518, 313, 111, '2024-02-21', '2024-03-12', 212),
(519, 313, 111, '2024-02-24', '2024-03-23', 217);

-- NO 1 --
DELIMITER //
	CREATE PROCEDURE get_buku(
		IN id_buku INT (100))
	BEGIN 
		SELECT * FROM buku WHERE kode_buku = id_buku;
	END //
DELIMITER ;

CALL get_buku (217);

-- NO 2 --
DELIMITER //
	CREATE PROCEDURE kembali(
		IN kode_kembali INT (100))
	BEGIN 
		SELECT * FROM pengembalian WHERE kode_kembali = id_kembali;
	END //
DELIMITER ;
CALL kembali(410);

-- NO 3 --
DELIMITER //
	CREATE PROCEDURE get_anggota (
		IN angkatan varchar (10), IN jenkel VARCHAR (15))
	BEGIN 
		SELECT * FROM anggota WHERE angkatan_anggota = angkatan AND jenis_kelamin = jenkel;
	END //
DELIMITER ;
CALL get_anggota('2022', 'laki-laki');

-- NO 4 --
DELIMITER //
	CREATE PROCEDURE buku (
	IN pengarang VARCHAR (20), 
	IN pnrbt VARCHAR (25),
	IN thn VARCHAR (10))
	BEGIN 
	SELECT * FROM buku WHERE pengarang_buku = pengarang
	AND penerbit_buku = pnrbt
	AND tahun_buku = thn ;
	END //
DELIMITER ;
CALL buku ('Andrea Hirata','Bentang Pustaka','2006' );

-- NO 5 --
DELIMITER //
	CREATE PROCEDURE insert_buku (
		IN kode INT(20) ,
		IN judul VARCHAR(200) ,
		IN pengarang VARCHAR(100),
		IN penerbit VARCHAR(100) ,
		IN tahun VARCHAR(20) , 
		IN jumlah VARCHAR(10) ,
		IN statusB VARCHAR(100) ,
		IN klasifikasi VARCHAR(100))
	BEGIN 
	INSERT INTO buku VALUES (kode, judul, pengarang, penerbit, tahun, jumlah, statusB, klasifikasi);
	END //
DELIMITER ;
drop procedure insert_buku;
CALL insert_buku (220, 'Bulan Terang', 'Babayo','Gramedia Pustaka Selatan','2023', '20', 'kurang baik', 'cerpen');
SELECT * FROM buku;

-- NO 6 --
DELIMITER //
	CREATE PROCEDURE jumlah_buku (
	OUT jml_buku INT)
	BEGIN 
	SELECT COUNT(*) INTO jml_buku FROM buku;
	END //
DELIMITER  ;
CALL jumlah_buku (@jml_buku);
SELECT @jml_buku;

-- NO 7 --
DELIMITER //
CREATE PROCEDURE GetJumlahAnggotaByAngkatanJenisKelamin(
    IN p_angkatan VARCHAR(6),
    IN p_jenis_kelamin VARCHAR(15),
    INOUT p_jumlahAnggota INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_jumlahAnggota
    FROM anggota
    WHERE angkatan_anggota = p_angkatan AND jenis_kelamin = p_jenis_kelamin;
END //
DELIMITER ;

SET @angkatan='2022';
SET @jenkel = 'perempuan';
CALL GetJumlahAnggotaByAngkatanJenisKelamin(@angkatan, @nama, @jumlahAnggota);
SELECT @angkatan,@jenkel,@jumlahAnggota AS Jumlah_Anggota;



