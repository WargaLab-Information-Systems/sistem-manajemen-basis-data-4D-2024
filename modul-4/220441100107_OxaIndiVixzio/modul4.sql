CREATE DATABASE modul4;
USE modul4;
drop database modul4;

CREATE TABLE karyawan(
	id_karyawan INT(11) PRIMARY KEY,
	nama VARCHAR(100),
	posisi VARCHAR(50),
	id_atasan INT(11)
);

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) 
VALUES
(1, 'Stefano Lilipaly', 'Manajer', NULL),
(2, 'Ernando Ari', 'Supervisor', 1),
(3, 'Tom Haye', 'Staff', 2),
(4, 'Ivar Jenner', 'Staff', 2),
(5, 'Zahra Muzdalifah', 'Supervisor', 1),
(6, 'Jay Idzes', 'Staff', 5),
(7, 'Tante Tokyo', 'Staff', NULL),
(8, 'Nathan Joe Xa', 'Supervisor', 1),
(9, 'Justin Hubner', 'Staff', 8),
(10, 'Mbak Naila', 'Staff', 8);

CREATE TABLE mata_kuliah(
id_matakuliah INT(11) PRIMARY KEY,
nama_mata_kuliah VARCHAR(100),
sks INT(11),
semester VARCHAR(20)
);

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester)
VALUES
(1, 'Permesinan', 3, 'Ganjil'),
(2, 'Manajemen Keuangan Kantor', 2, 'Genap'),
(3, 'Desain Visual Dasar', 3, 'Ganjil'),
(4, 'BoreUp Mesin', 4, 'Genap'),
(5, 'Teknik Pengelasan Kapal Dasar', 3, 'Ganjil'),
(6, 'Statistika', 3, 'Genap'),
(7, 'PLN', 2, 'Ganjil'),
(8, 'Teknik Penggambaran Mesin', 2, 'Genap'),
(9, 'Dasar Batas Laut', 3, 'Ganjil'),
(10, 'Notaris', 2, 'Genap');

CREATE TABLE mahasiswa(
id_mahasiswa INT(11) PRIMARY KEY,
nama VARCHAR(100),
jurusan VARCHAR(50),
tanggal_masuk DATE
);

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk)
VALUES
(1, 'Oxa Indi', 'Teknik Mesin', '2000-09-01'),
(2, 'Naela Nahdiah', 'Manajemen', '2001-04-10'),
(3, 'Tesa Hutagaol', 'DKV', '2002-10-20'),
(4, 'Bintang Wahyu', 'TKR', '2003-06-15'),
(5, 'Imam Arisandi', 'Teknik Perkapalan', '2004-11-30'),
(6, 'Sulthon Abadi', 'Teknik Informatika', '2005-02-25'),
(7, 'Khoirotun Nisa', 'Teknik Elektro', '2006-08-12'),
(8, 'Roma Napitupilu', 'Teknik Industri', '2007-12-20'),
(9, 'Angga jalasena', 'Kelautan', '2008-03-05'),
(10, 'Irfan Faruq', 'Hukum', '2009-11-15');


CREATE TABLE nilai(
id INT(11) PRIMARY KEY,
id_mahasiswa INT(11),
id_matakuliah INT(11),
nilai VARCHAR(2),
FOREIGN KEY(id_matakuliah) REFERENCES mata_kuliah(id_matakuliah),
FOREIGN KEY(id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa)
);

INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai)
VALUES
(1, 2, 1, '20'),
(2, 2, 2, '30'),
(3, 3, 3, '40'),
(4, 4, 4, '40'),
(5, 5, 5, '50'),
(6, 5, 6, '30'),
(7, 9, 7, '20'),
(8, 8, 8, '50'),
(9, 9, 9, '60'),
(10, 10, 10, '70');

-- 1 --
SELECT k1.nama AS Karyawan, k2.nama AS Atasan
FROM karyawan k1
RIGHT JOIN karyawan k2 ON k1.id_atasan = k2.id_karyawan
ORDER BY k1.id_atasan ASC;

-- 2 --
DELIMITER //
CREATE PROCEDURE rataratanilai()
BEGIN
    SELECT m.nama AS Nama_Mahasiswa, mk.semester AS Semester, AVG(CAST(n.nilai AS DECIMAL)) AS Rata_Rata_Nilai
    FROM mahasiswa m
    INNER JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY m.nama, mk.semester;
END //
DELIMITER ;

CALL rataratanilai();

