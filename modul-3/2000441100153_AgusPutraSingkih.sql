
CREATE DATABASE modul3;
USE modul3;
CREATE TABLE IF NOT EXISTS peminjaman (
kode_peminjaman VARCHAR(10) PRIMARY KEY,
IdAnggota VARCHAR(10),
IdPetugas VARCHAR(10),
TanggalPinjam DATE,
TanggalKembali DATE,
KodeBuku VARCHAR(10));

ALTER TABLE peminjaman
ADD CONSTRAINT FOREIGN KEY (KodeBuku) REFERENCES buku(KodeBuku);


ALTER TABLE peminjaman
ADD COLUMN KodeBuku VARCHAR(10);

CREATE TABLE petugas(
IdPetugas VARCHAR(10) PRIMARY KEY,
Username VARCHAR(10),
PASSWORD VARCHAR(10),
Nama VARCHAR(10));

CREATE TABLE IF NOT EXISTS buku(
KodeBuku VARCHAR(10) PRIMARY KEY,
JudulBuku VARCHAR (10),
PengarangBuku VARCHAR(10),
Penerbit_Buku VARCHAR(10),
TahunBuku VARCHAR(10),
JumlahBuku VARCHAR(10),
StatusBuku VARCHAR (10),
KlasifikasiBuku VARCHAR(10));

CREATE TABLE anggota(
IdAnggota VARCHAR(10) PRIMARY KEY,
NamaAnggota VARCHAR(20),
AngkatanAngota VARCHAR(6),
TempatLahirAnggota VARCHAR(20),
TanggalLahirAnggota DATE,
NoTelp INT(12),
JenisKelamin VARCHAR(15),
StatusPinjam VARCHAR(15));

CREATE TABLE pengembalian(
KodeKembali VARCHAR(10) PRIMARY KEY,
IdAnggota VARCHAR(10),
KodeBuku VARCHAR(10),
IdPetugas VARCHAR(10),
TanggalPinjam DATE,
TanggalKembali DATE,
Denda VARCHAR(15));

ALTER TABLE pengembalian
ADD CONSTRAINT FOREIGN KEY (IdAnggota) REFERENCES anggota(IdAnggota),
ADD CONSTRAINT FOREIGN (KodeBuku) REFERENCES buku(KodeBuku),
ADD CONSTRAINT FOREIGN KEY (IdPetugas) REFERENCES (idPetugas);

ALTER TABLE pengembalian 
ADD CONSTRAINT FOREIGN KEY (IdAnggota) REFERENCES anggota (IdAnggota);

ALTER TABLE pengembalian 
ADD CONSTRAINT FOREIGN KEY (IdPetugas) REFERENCES petugas (IdPetugas);

ALTER TABLE pengembalian
ADD CONSTRAINT FOREIGN KEY (KodeBuku) REFERENCES buku (KodeBuku);

INSERT INTO petugas (IdPetugas, Username, PASSWORD, Nama) VALUES
('P001', 'user1', 'pass1', 'John Doe'),
('P002', 'user2', 'pass2', 'Jane Smith'),
('P003', 'user3', 'pass3', 'Michael Johnson'),
('P004', 'user4', 'pass4', 'Emily Brown'),
('P005', 'user5', 'pass5', 'William Taylor'),
('P006', 'user6', 'pass6', 'Sarah Anderson'),
('P007', 'user7', 'pass7', 'David Martinez'),
('P008', 'user8', 'pass8', 'Jessica Garcia'),
('P009', 'user9', 'pass9', 'Daniel Rodriguez'),
('P010', 'user10', 'pass10', 'Ashley Hernandez');

INSERT INTO anggota (IdAnggota, NamaAnggota, AngkatanAngota, TempatLahirAnggota, TanggalLahirAnggota, NoTelp, JenisKelamin, StatusPinjam) VALUES
('A001', 'John Doe', '2020', 'Jakarta', '2000-01-01', 1234567890, 'Laki-laki', 'Aktif'),
('A002', 'Jane Smith', '2019', 'Bandung', '1999-02-02', 2345678901, 'Perempuan', 'Tidak Aktif'),
('A003', 'Michael Johnson', '2021', 'Surabaya', '2001-03-03', 3456789012, 'Laki-laki', 'Aktif'),
('A004', 'Emily Brown', '2020', 'Yogyakarta', '2000-04-04', 4567890123, 'Perempuan', 'Aktif'),
('A005', 'William Taylor', '2018', 'Semarang', '1998-05-05', 5678901234, 'Laki-laki', 'Tidak Aktif'),
('A006', 'Sarah Anderson', '2019', 'Malang', '1999-06-06', 6789012345, 'Perempuan', 'Aktif'),
('A007', 'David Martinez', '2021', 'Solo', '2001-07-07', 7890123456, 'Laki-laki', 'Aktif'),
('A008', 'Jessica Garcia', '2020', 'Denpasar', '2000-08-08', 8901234567, 'Perempuan', 'Tidak Aktif'),
('A009', 'Daniel Rodriguez', '2017', 'Bali', '1997-09-09', 9012345678, 'Laki-laki', 'Aktif'),
('A010', 'Ashley Hernandez', '2019', 'Medan', '1999-10-10', 1234567890, 'Perempuan', 'Aktif');

INSERT INTO anggota (IdAnggota, NamaAnggota, AngkatanAngota, TempatLahirAnggota, TanggalLahirAnggota, NoTelp, JenisKelamin, StatusPinjam) VALUES
('A001', 'John Doe', '2020', 'Jakarta', '2000-01-01', 1234567890, 'Laki-laki', 'Aktif'),
('A002', 'Jane Smith', '2019', 'Bandung', '1999-02-02', 2345678901, 'Perempuan', 'Tidak Aktif'),
('A003', 'Michael Johnson', '2021', 'Surabaya', '2001-03-03', 3456789012, 'Laki-laki', 'Aktif'),
('A004', 'Emily Brown', '2020', 'Yogyakarta', '2000-04-04', 4567890123, 'Perempuan', 'Aktif'),
('A005', 'William Taylor', '2018', 'Semarang', '1998-05-05', 5678901234, 'Laki-laki', 'Tidak Aktif'),
('A006', 'Sarah Anderson', '2019', 'Malang', '1999-06-06', 6789012345, 'Perempuan', 'Aktif'),
('A007', 'David Martinez', '2021', 'Solo', '2001-07-07', 7890123456, 'Laki-laki', 'Aktif'),
('A008', 'Jessica Garcia', '2020', 'Denpasar', '2000-08-08', 8901234567, 'Perempuan', 'Tidak Aktif'),
('A009', 'Daniel Rodriguez', '2017', 'Bali', '1997-09-09', 9012345678, 'Laki-laki', 'Aktif'),
('A010', 'Ashley Hernandez', '2019', 'Medan', '1999-10-10', 1234567890, 'Perempuan', 'Aktif');


INSERT INTO pengembalian (KodeKembali, IdAnggota, KodeBuku, IdPetugas, TanggalPinjam, TanggalKembali, Denda) VALUES
('PK001', 'A001', 'B001', 'P001', '2024-04-20', '2024-04-25', '0'),
('PK002', 'A002', 'B002', 'P002', '2024-04-21', '2024-04-26', '0'),
('PK003', 'A003', 'B003', 'P003', '2024-04-22', '2024-04-27', '0'),
('PK004', 'A004', 'B004', 'P004', '2024-04-23', '2024-04-28', '0'),
('PK005', 'A005', 'B005', 'P005', '2024-04-24', '2024-04-29', '0'),
('PK006', 'A006', 'B006', 'P006', '2024-04-25', '2024-04-30', '0'),
('PK007', 'A007', 'B007', 'P007', '2024-04-26', '2024-05-01', '0'),
('PK008', 'A008', 'B008', 'P008', '2024-04-27', '2024-05-02', '0'),
('PK009', 'A009', 'B009', 'P009', '2024-04-28', '2024-05-03', '0'),
('PK010', 'A010', 'B010', 'P010', '2024-04-29', '2024-05-04', '0');

INSERT INTO buku (KodeBuku, JudulBuku, PengarangBuku, Penerbit_Buku, TahunBuku, JumlahBuku, StatusBuku, KlasifikasiBuku) VALUES
('B001', 'Buku 1', 'Pengarang 1', 'Penerbit 1', '2022', '10', 'Tersedia', 'Klasifikasi 1'),
('B002', 'Buku 2', 'Pengarang 2', 'Penerbit 2', '2023', '15', 'Tersedia', 'Klasifikasi 2'),
('B003', 'Buku 3', 'Pengarang 3', 'Penerbit 3', '2021', '20', 'Tersedia', 'Klasifikasi 3'),
('B004', 'Buku 4', 'Pengarang 4', 'Penerbit 4', '2024', '12', 'Tersedia', 'Klasifikasi 4'),
('B005', 'Buku 5', 'Pengarang 5', 'Penerbit 5', '2020', '8', 'Tersedia', 'Klasifikasi 5'),
('B006', 'Buku 6', 'Pengarang 6', 'Penerbit 6', '2019', '25', 'Tersedia', 'Klasifikasi 6'),
('B007', 'Buku 7', 'Pengarang 7', 'Penerbit 7', '2018', '18', 'Tersedia', 'Klasifikasi 7'),
('B008', 'Buku 8', 'Pengarang 8', 'Penerbit 8', '2017', '30', 'Tersedia', 'Klasifikasi 8'),
('B009', 'Buku 9', 'Pengarang 9', 'Penerbit 9', '2016', '5', 'Tersedia', 'Klasifikasi 9'),
('B010', 'Buku 10', 'Pengarang 10', 'Penerbit 10', '2015', '22', 'Tersedia', 'Klasifikasi 10');



INSERT INTO peminjaman (kode_peminjaman, IdAnggota, IdPetugas, TanggalPinjam, TanggalKembali, KodeBuku) 
VALUES 
('PMJ0001', 'A001', 'P001', '2024-04-01', '2024-04-15', 'B001'),
('PMJ0002', 'A002', 'P002', '2024-04-02', '2024-04-16', 'B002'),
('PMJ0003', 'A003', 'P003', '2024-04-03', '2024-04-17', 'B003'),
('PMJ0004', 'A004', 'P004', '2024-04-04', '2024-04-18', 'B004'),
('PMJ0005', 'A005', 'P005', '2024-04-05', '2024-04-19', 'B005'),
('PMJ0006', 'A006', 'P006', '2024-04-06', '2024-04-20', 'B006'),
('PMJ0007', 'A007', 'P007', '2024-04-07', '2024-04-21', 'B007'),
('PMJ0008', 'A008', 'P008', '2024-04-08', '2024-04-22', 'B008'),
('PMJ0009', 'A009', 'P009', '2024-04-09', '2024-04-23', 'B009'),
('PMJ0010', 'A010', 'P010', '2024-04-10', '2024-04-24', 'B010');

DELIMITER //
CREATE PROCEDURE SearchAnggotaByjkl(
    IN p_JenisKelamin VARCHAR(10)
)
BEGIN
    SELECT * FROM anggota WHERE JenisKelamin = p_JenisKelamin;
END //

DELIMITER ;

CALL SearchAnggotaByjkl('Laki-laki');

DELIMITER//
CREATE PROCEDURE getBuku (IN 
	penerbit VARCHAR(20))
BEGIN 
SELECT * FROM buku WHERE Penerbit_Buku = penerbit;
END//
DELIMITER;
CALL getBuku ('Penerbit 1');

DELIMITER//
CREATE PROCEDURE getPeminjaman (IN tgl DATE, IN kb VARCHAR(5))
	BEGIN
		SELECT * FROM peminjaman 
		WHERE TanggalPinjam = tgl
		AND KodeBuku = kb;
	END//
CALL getPeminjaman('2024-04-01', 'B001');

DELIMITER//
CREATE PROCEDURE getanggota (IN akt VARCHAR(5), IN tl VARCHAR(20), 
				IN jk VARCHAR (10))
	BEGIN 
		SELECT * FROM anggota WHERE AngkatanAngota = akt
		AND TempatLahirAnggota = tl
		AND JenisKelamin = jk;
	END//
CALL getanggota ('2020', 'Jakarta', 'Laki-laki');

DELIMITER //
CREATE PROCEDURE inputAnggota (
IN IdAnggota VARCHAR(10),
IN NamaAnggota VARCHAR(20),
IN AngkatanAngota VARCHAR(6),
IN TempatLahirAnggota VARCHAR(20),
IN TanggalLahirAnggota DATE,
IN NoTelp INT(12),
IN JenisKelamin VARCHAR(15),
IN StatusPinjam VARCHAR(15))

BEGIN
	INSERT INTO anggota VALUES(
	IdAnggota, NamaAnggota, AngkatanAngota, TempatLahirAnggota, TanggalLahirAnggota, 
	NoTelp, JenisKelamin, StatusPinjam);
END//

CALL inputAnggota ('A011', 'Agus Putra Singkih', '2020', 'Bangkalan', 
'2000-07-07', '087755660522', 'Laki-laki', 'Aktif');

SELECT * FROM anggota;

DELIMITER//
CREATE PROCEDURE jumlahanggota(OUT jumlah_anggota INT(20))
	BEGIN
		SELECT COUNT(IdAnggota)
		INTO jumlah_anggota FROM anggota;
	END//
	CALL jumlahanggota(@jumlah_anggota);
	SELECT @jumlah_anggota

DELIMITER//
CREATE PROCEDURE jmlbuku (IN penulis VARCHAR(20),IN tahun VARCHAR(5), 
OUT total INT (20))
BEGIN
	SELECT COUNT(KodeBuku) INTO total FROM buku
	WHERE PengarangBuku=penulis AND TahunBuku=tahun;
END//

CALL jmlbuku('Agus', '2022', @total);
SELECT @total
2000441100153_AgusPutraSingkih.sql
Menampilkan 2000441100153_AgusPutraSingkih.sql.

SELECT * FROM anggota;

