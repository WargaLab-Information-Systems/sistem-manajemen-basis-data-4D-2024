CREATE DATABASE modul_4;
USE modul_4;

-- NO 1 --
 CREATE TABLE karyawan(
	id_karyawan INT(11) PRIMARY KEY,
	nama VARCHAR(100),
	posisi VARCHAR(50),
	id_atasan INT(11)
);

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) 
VALUES
(1, 'Lukman Hakim', 'Manajer', NULL),
(2, 'Nana Putri', 'Supervisor', 1),
(3, 'Silvia', 'Staff', 2),
(4, 'Rizky Bagus', 'Staff', 2),
(5, 'Siti', 'Supervisor', 1),
(6, 'Bayu Suryo', 'Staff', 5),
(7, 'Syahrini', 'Staff', NULL),
(8, 'Farid Ahmad', 'Supervisor', 1),
(9, 'Agni', 'Staff', 8),
(10, 'Ayu Ningsih', 'Staff', 8);

SELECT k1.nama AS Karyawan, k2.nama AS Atasan
FROM karyawan k1
RIGHT JOIN karyawan k2 ON k1.id_atasan = k2.id_karyawan
ORDER BY k1.id_atasan;  

-- NO 2 --
CREATE TABLE mata_kuliah(
id_matakuliah INT(11) PRIMARY KEY,
nama_mata_kuliah VARCHAR(100),
sks INT(11),
semester VARCHAR(20)
);

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester)
VALUES
(1, 'Matematika Dasar', 3, 'Ganjil'),
(2, 'Bahasa Inggris', 2, 'Genap'),
(3, 'Fisika Dasar', 3, 'Ganjil'),
(4, 'Pemrograman Dasar', 4, 'Genap'),
(5, 'Kimia Dasar', 3, 'Ganjil'),
(6, 'Statistika', 3, 'Genap'),
(7, 'Akuntansi Dasar', 2, 'Ganjil'),
(8, 'Sejarah Indonesia', 2, 'Genap'),
(9, 'Pengantar Bisnis', 3, 'Ganjil'),
(10, 'Etika Profesi', 2, 'Genap');

CREATE TABLE mahasiswa(
id_mahasiswa INT(11) PRIMARY KEY,
nama VARCHAR(100),
jurusan VARCHAR(50),
tanggal_masuk DATE
);

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk)
VALUES
(1, 'Bayu', 'Teknik Mesin', '2000-09-01'),
(2, 'Busri', 'Sastra Inggris', '2001-04-10'),
(3, 'Cinta', 'Akuntansi', '2002-10-20'),
(4, 'Dewi', 'Hubungan Internasional', '2003-06-15'),
(5, 'Ekik', 'Teknik Elektro', '2004-11-30'),
(6, 'Fajar', 'Kedokteran Hewan', '2005-02-25'),
(7, 'Gitana', 'Ilmu Komunikasi', '2006-08-12'),
(8, 'Hanifa', 'Ekonomi Pembangunan', '2007-12-20'),
(9, 'Indra', 'Agribisnis', '2008-03-05'),
(10, 'Joki', 'Arsitektur Lanskap', '2009-11-15');


CREATE TABLE nilai(
id INT(11) PRIMARY KEY,
id_mahasiswa INT(11),
id_matakuliah INT(11),
nilai varchar(2),
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

DELIMITER //
CREATE PROCEDURE rataratanilai()
BEGIN
    SELECT m.nama AS Nama_Mahasiswa, mk.semester AS Semester, AVG(CAST(n.nilai AS double)) AS Rata_Rata_Nilai
    FROM mahasiswa m
    INNER JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY m.nama, mk.semester;
END //
DELIMITER ;
 select * from nilai;

CALL rataratanilai();
DROP DATABASE modul4;