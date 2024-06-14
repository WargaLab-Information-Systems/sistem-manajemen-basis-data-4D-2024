CREATE DATABASE db_modul4;
use db_modul4;


CREATE TABLE karyawan(
    id_karyawan INT(11) PRIMARY KEY,
    nama VARCHAR(100),
    posisi VARCHAR(50),
    id_atasan INT(11)
);

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) 
VALUES
(1, 'Andi', 'Manajer', NULL),
(2, 'Budi', 'Supervisor', 1),
(3, 'Cindy', 'Staff', 1),
(4, 'Dodi', 'Staff', 1),
(5, 'Eva', 'Supervisor', 1);

drop table karyawan;

SELECT bawahan.nama AS Karyawan, atasan.nama AS Atasan
FROM karyawan bawahan
RIGHT JOIN karyawan atasan ON bawahan.id_atasan = atasan.id_karyawan
ORDER BY atasan.id_karyawan;	


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
(10, 'Etika Profesi', 2, 'Genap'),
(11, 'Kalkulus', 4, 'Ganjil');


CREATE TABLE mahasiswa(
    id_mahasiswa INT(11) PRIMARY KEY,
    nama VARCHAR(100),
    jurusan VARCHAR(50),
    tanggal_masuk DATE
);

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) 
VALUES
(1, 'Ahmad', 'Teknik Mesin', '2000-09-01'),
(2, 'Budi', 'Sastra Inggris', '2001-04-10'),
(3, 'Cindy', 'Akuntansi', '2002-10-20'),
(4, 'Dewi', 'Hubungan Internasional', '2003-06-15'),
(5, 'Eko', 'Teknik Elektro', '2004-11-30'),
(6, 'Fajar', 'Kedokteran Hewan', '2005-02-25'),
(7, 'Gita', 'Ilmu Komunikasi', '2006-08-12'),
(8, 'Hani', 'Ekonomi Pembangunan', '2007-12-20'),
(9, 'Indra', 'Agribisnis', '2008-03-05'),
(10, 'Joko', 'Arsitektur Lanskap', '2009-11-15'),
(11, 'Kiki', 'Pendidikan Matematika', '2010-06-30');


CREATE TABLE nilai(
    id INT(11) PRIMARY KEY,
    id_mahasiswa INT(11),
    id_matakuliah INT(11),
    nilai VARCHAR(2),
    FOREIGN KEY(id_matakuliah) REFERENCES mata_kuliah(id_matakuliah),
    FOREIGN KEY(id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa)
);
drop table nilai;

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
(10, 10, 10, '70'),
(11, 11, 11, '80');

SELECT * FROM nilai;

DROP PROCEDURE rt2;

DELIMITER //

CREATE PROCEDURE rt2()
BEGIN
    SELECT m.nama AS Nama_Mahasiswa, mk.semester AS Semester, ROUND(AVG(CAST(n.nilai AS DECIMAL))) AS Rata_Rata_Nilai
    FROM mahasiswa m
    LEFT JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY m.nama, mk.semester;
END //

DELIMITER ;
CALL rt2()

