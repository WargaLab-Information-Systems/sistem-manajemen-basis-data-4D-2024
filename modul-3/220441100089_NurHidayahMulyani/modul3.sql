CREATE DATABASE library;
USE library;

CREATE TABLE petugas(
	id_petugas VARCHAR (10) primary key,
    username VARCHAR (15), 
    pasword VARCHAR (15), 
	nama VARCHAR (25)
);

CREATE TABLE anggota(
	id_anggota VARCHAR (10) primary key, 
    nama_anggota VARCHAR (20), 
    angkatan_anggota VARCHAR (6), 
	tempat_lahir VARCHAR (20), 
    tanggal_lahir DATE, 
    no_tlp INT (12), 
    jenis_kelamin VARCHAR (15), 
    status_pinjam VARCHAR (15)
);

CREATE TABLE buku(
	kode_buku VARCHAR (10) primary key, 
    judul_buku VARCHAR (25), 
    pengarang_buku VARCHAR (30), 
    penerbit_buku VARCHAR (30),
	tahun_buku VARCHAR (5), 
    jumlah_buku VARCHAR (5), 
    status_buku VARCHAR (10), 
    klasifikasi_buku VARCHAR (20)
);

CREATE TABLE peminjaman (
	kode_peminjaman VARCHAR (10) primary key, 
    id_anggota VARCHAR (10), 
    id_petugas VARCHAR (10), 
	tanggal_pinjam DATE, 
    tanggal_kembali DATE, 
    kode_buku VARCHAR (10), 
	FOREIGN KEY(id_petugas) REFERENCES petugas(id_petugas), 
    FOREIGN KEY(id_anggota) REFERENCES anggota(id_anggota),
	FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku)
);

CREATE TABLE pengembalian(
	kode_kembali VARCHAR (10) primary key, 
    id_anggota VARCHAR (10), 
    id_petugas VARCHAR (10), 
	tanggal_pinjam DATE, 
    tanggal_kembali DATE, 
    kode_buku VARCHAR (10), 
    denda VARCHAR (15), 
	FOREIGN KEY(id_petugas) REFERENCES petugas(id_petugas), 
    FOREIGN KEY(id_anggota) REFERENCES anggota(id_anggota), 
    FOREIGN KEY(kode_buku) REFERENCES buku(kode_buku)
);

INSERT INTO petugas ( id_petugas, username, pasword, nama)
VALUES 
('PTGS01', 'petugas1', 'pasword1', 'vivin'),
('PTGS02', 'petugas2', 'pasword2', 'yani'),
('PTGS03', 'petugas3', 'pasword3', 'ria'),
('PTGS04', 'petugas4', 'pasword4', 'agustina'),
('PTGS05', 'petugas5', 'pasword5', 'maurel'),
('PTGS06', 'petugas6', 'pasword6', 'azura'),
('PTGS07', 'petugas7', 'pasword7', 'silvi'),
('PTGS08', 'petugas8', 'pasword8', 'nuha'),
('PTGS09', 'petugas9', 'pasword9', 'sukma'),
('PTGS10', 'petugas10', 'pasword10', 'tya');
SELECT * FROM petugas;

INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir, tanggal_lahir, no_tlp, jenis_kelamin, status_pinjam)
VALUES
('041', 'tina', '2019', 'malang', '2001-12-12', '012', 'perempuan', 'pinjam'),
('042', 'tata', '2020', 'jombang', '2003-10-19', '013', 'perempuan', 'pinjam'),
('043', 'dora', '2019', 'medan', '2002-12-12', '014', 'perempuan', 'pinjam'),
('044', 'abuy', '2020', 'sampang', '2001-03-30', '015', 'laki-laki', 'pinjam'),
('045', 'ila', '2019', 'jombang', '2002-01-18', '016', 'perempuan', 'pinjam'),
('046', 'imah', '2019', 'bangkalan', '2003-02-24', '017', 'perempuan', 'pinjam'),
('047', 'rudi', '2020', 'malang', '2003-05-13', '018', 'laki-laki', 'pinjam'),
('048', 'agus', '2019', 'jombang', '2001-09-12', '019', 'laki-laki', 'pinjam'),
('049', 'taufik', '2020', 'medan', '2002-06-09', '010', 'laki-laki', 'pinjam'),
('040', 'lisa', '2019', 'surabaya', '2003-01-12', '011', 'perempuan', 'pinjam');
SELECT * FROM anggota;

INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) 
VALUES
('A12', 'laskar pelangi', 'andrea hirata', 'Andhi Publisher', '1995', '10', 'tersedia', 'fantasi'),
('A13', 'promise', 'dwita sari', 'loveable', '2016', '15', 'tersedia', 'fiksi'),
('A14', 'negeri 5 menara', 'ahmad fuadi', 'pt. gramedia pustaka utama', '200', '10', 'tersedia', 'klasik'),
('A15', 'koala kumal', 'raditya dika', 'gagas media', '2015', '15', 'tersedia', 'fiksi'),
('A16', 'pantai dan kehidupannya', 'edy karsono', 'pt. indahjaya adipratama', '2003', '10', 'tersedia', 'klasik'),
('A17', 'motivasi bob sadino', 'ayu utami', 'best media', '2016', '20', 'tersedia', 'klasik'),
('A18', 'sang mimpi', 'andrea hirata', 'bintang pustaka', '2019', '8', 'tersedia', 'fantasi'),
('A19', 'dear nathan', 'erischa febrianti', 'best media', '2019', '9', 'tersedia', 'fantasi'),
('A21', 'sepatu dahlan', 'khrisna pabhicara', 'noura books', '2017', '10', 'tersedia', 'fiksi'),
('A22', 'cinta brontosaurus', 'raditya dika', 'gagas media', '2016', '5', 'tersedia', 'fiksi');
SELECT * FROM buku;

INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) 
VALUES 
('B01', '041', 'PTGS01', '2024-03-13', '2024-03-20', 'A12'),
('B02', '042', 'PTGS02', '2024-03-06', '2024-03-13', 'A13'),
('B03', '043', 'PTGS03', '2024-03-09', '2024-03-15', 'A14'),
('B04', '044', 'PTGS04', '2024-03-13', '2024-03-20', 'A15'),
('B05', '045', 'PTGS05', '2024-03-13', '2024-03-20', 'A16'),
('B06', '046', 'PTGS06', '2024-03-13', '2024-03-20', 'A17'),
('B07', '047', 'PTGS07', '2024-03-13', '2024-03-20', 'A18'),
('B08', '048', 'PTGS08', '2024-03-13', '2024-03-20', 'A19'),
('B09', '049', 'PTGS09', '2024-03-13', '2024-03-20', 'A21'),
('B10', '040', 'PTGS10', '2024-03-13', '2024-03-20', 'A22');
SELECT * FROM peminjaman;

INSERT INTO pengembalian (kode_kembali, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku, denda) 
VALUES 
('C01', '041', 'PTGS01', '2024-03-13', '2024-03-20', 'A12', '0'),
('C02', '042', 'PTGS02', '2024-03-06', '2024-03-13', 'A13', '0'),
('C03', '043', 'PTGS03', '2024-03-09', '2024-03-15', 'A14', '0'),
('C04', '044', 'PTGS04', '2024-03-13', '2024-03-20', 'A15', '0'),
('C05', '045', 'PTGS05', '2024-03-13', '2024-03-20', 'A16', '0'),
('C06', '046', 'PTGS06', '2024-03-13', '2024-03-20', 'A17', '0'),
('C07', '047', 'PTGS07', '2024-03-13', '2024-03-20', 'A18', '0'),
('C08', '048', 'PTGS08', '2024-03-13', '2024-03-20', 'A19', '0'),
('C09', '049', 'PTGS09', '2024-03-13', '2024-03-20', 'A21', '0'),
('C10', '040', 'PTGS10', '2024-03-13', '2024-03-20', 'A22', '0');
SELECT * FROM pengembalian;

drop table peminjaman;
drop table pengembalian;
drop table petugas;

DELIMITER //
CREATE PROCEDURE tambah_petugas(
    IN id_petugas VARCHAR(10),
    IN username VARCHAR(15),
    IN pasword VARCHAR(15),
    IN nama VARCHAR(24)
)
BEGIN
    INSERT INTO petugas VALUES (id_petugas, username, pasword, nama);
END //
DELIMITER ;
call tambah_petugas
	('PTGS11', 'petugas11', 'pasword11', 'ayu');
select * from petugas


DELIMITER //
CREATE PROCEDURE tampilkan_buku_berdasarkan_penerbit(IN nama_penerbit VARCHAR(30))
BEGIN
    SELECT * FROM buku WHERE penerbit_buku = nama_penerbit;
END //
DELIMITER ;
CALL tampilkan_buku_berdasarkan_penerbit('Andhi Publisher');

DELIMITER //
CREATE PROCEDURE buku_berdasarkan_deskripsi_kata(
    IN kata_deskripsi VARCHAR(50)
)
BEGIN
    SELECT * 
    FROM buku 
    WHERE penerbit_buku LIKE CONCAT('%', kata_deskripsi, '%');
END //
DELIMITER ;
CALL buku_berdasarkan_deskripsi_kata('Andhi');


DELIMITER //
CREATE PROCEDURE peminjaman_berdasarkan_tanggal_dan_buku(
    IN tanggal_pinjam_baru DATE,
    IN kode_buku_baru VARCHAR(10)
)
BEGIN
    SELECT * FROM peminjaman 
    WHERE tanggal_pinjam = tanggal_pinjam_baru
    AND kode_buku = kode_buku_baru;
END //
DELIMITER ;
CALL peminjaman_berdasarkan_tanggal_dan_buku('2024-03-13', 'A12');


DELIMITER //
CREATE PROCEDURE anggota_berdasarkan_kriteria(
    IN angkatan_baru VARCHAR(6),
    IN tempat_lahir_baru VARCHAR(20),
    IN jenis_kelamin_baru VARCHAR(15)
)
BEGIN
    SELECT * FROM anggota 
    WHERE angkatan_anggota = angkatan_baru
    AND tempat_lahir = tempat_lahir_baru
    AND jenis_kelamin = jenis_kelamin_baru;
END //
DELIMITER ;
CALL anggota_berdasarkan_kriteria('2019', 'malang', 'perempuan');


DELIMITER //
CREATE PROCEDURE tambah_anggota(
    IN id_anggota_baru VARCHAR(10),
    IN nama_anggota_baru VARCHAR(20),
    IN angkatan_anggota_baru VARCHAR(6),
    IN tempat_lahir_baru VARCHAR(20),
    IN tanggal_lahir_baru DATE,
    IN no_tlp_baru INT,
    IN jenis_kelamin_baru VARCHAR(15),
    IN status_pinjam_baru VARCHAR(15)
)
BEGIN
    INSERT INTO anggota (id_anggota, nama_anggota, angkatan_anggota, tempat_lahir, tanggal_lahir, no_tlp, jenis_kelamin, status_pinjam)
    VALUES (id_anggota_baru, nama_anggota_baru, angkatan_anggota_baru, tempat_lahir_baru, tanggal_lahir_baru, no_tlp_baru, jenis_kelamin_baru, status_pinjam_baru);
END //
DELIMITER ;
CALL tambah_anggota('050', 'ani', '2021', 'surabaya', '2004-04-20', 021, 'perempuan', 'pinjam');
select* from anggota;


DELIMITER //
CREATE PROCEDURE hitung_jumlah_anggota(
    OUT jumlah_anggota INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_anggota FROM anggota;
END //
DELIMITER ;
CALL hitung_jumlah_anggota(@jumlah_anggota);
SELECT @jumlah_anggota AS jumlah_anggota;


DELIMITER //
CREATE PROCEDURE hitung_jumlah_buku(
    IN pengarang_baru VARCHAR(30),
    IN tahun_terbit_baru VARCHAR(5),
    OUT total_buku INT
)
BEGIN
    SELECT COUNT(*) INTO total_buku
    FROM buku
    WHERE pengarang_buku = pengarang_baru AND tahun_buku = tahun_terbit_baru;
END //
DELIMITER ;
CALL hitung_jumlah_buku( 'raditya dika', '2016', @total_buku);
SELECT @total_buku AS total_buku;
select*from buku;






