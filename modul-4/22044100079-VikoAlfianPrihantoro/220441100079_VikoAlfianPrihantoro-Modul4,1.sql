CREATE DATABASE db_modul41;

USE db_modul41;

 CREATE TABLE karyawan(
	id_karyawan INT(11) PRIMARY KEY,
	nama VARCHAR(100),
	posisi VARCHAR(50),
	id_atasan INT(11)
);

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'Budi Setiawan', 'Manajer', NULL),
(2, 'Ani Lestari', 'Supervisor', 1),
(3, 'Cici Wijaya', 'Programmer', 2),
(4, 'Dinda Sari', 'Designer', 2),
(5, 'Eko Susanto', 'Tester', 3),
(6, 'Fani Rahmawati', 'Sales', 1),
(7, 'Gita Kusuma', 'Marketing', 1),
(8, 'Hendra Pratama', 'HRD', NULL),
(9, 'Ika Sari', 'Admin', 8),
(10, 'Joko Widodo', 'Direktur', NULL);

-- 4.1 
SELECT
    k1.id_karyawan AS id_karyawan,
    k1.nama AS nama_karyawan,
    k2.nama AS nama_atasan
FROM karyawan k1
RIGHT JOIN karyawan k2 ON k1.id_atasan = k2.id_karyawan;

CREATE DATABASE db_modul42;

USE db_modul42;

CREATE TABLE mata_kuliah(
id_matakuliah INT(11) PRIMARY KEY,
nama_mata_kuliah VARCHAR(100),
sks INT(11),
semester VARCHAR(20)
);

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester) VALUES
(1, 'Pemrograman Dasar', 3, 'Genap'),
(2, 'Kalkulus', 4, 'Ganjil'),
(3, 'Fisika Dasar', 3, 'Genap'),
(4, 'Kimia Dasar', 3, 'Ganjil'),
(5, 'Algoritma dan Struktur Data', 3, 'Genap'),
(6, 'Basis Data', 3, 'Ganjil'),
(7, 'Jaringan Komputer', 3, 'Genap'),
(8, 'Sistem Operasi', 3, 'Ganjil'),
(9, 'Bahasa Inggris', 3, 'Setiap Semester'),
(10, 'Pancasila', 2, 'Setiap Semester');


CREATE TABLE mahasiswa(
id_mahasiswa INT(11) PRIMARY KEY,
nama VARCHAR(100),
jurusan VARCHAR(50),
tanggal_masuk DATE
);

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
(1, 'Budi Setiawan', 'Teknik Informatika', '2023-10-01'),
(2, 'Ani Lestari', 'Sistem Informasi', '2023-10-01'),
(3, 'Cici Wijaya', 'Teknik Elektro', '2023-10-01'),
(4, 'Dinda Sari', 'Manajemen', '2023-10-01'),
(5, 'Eko Susanto', 'Akuntansi', '2024-02-15'),
(6, 'Fani Rahmawati', 'Ilmu Komunikasi', '2024-02-15'),
(7, 'Gita Kusuma', 'Desain Grafis', '2024-02-15'),
(8, 'Hendra Pratama', 'Teknik Industri', '2024-02-15'),
(9, 'Ika Sari', 'Pendidikan', '2024-06-01'),
(10, 'Joko Widodo', 'Hukum', '2024-06-01');


CREATE TABLE nilai(
id INT(11) PRIMARY KEY,
id_mahasiswa INT(11),
id_matakuliah INT(11),
nilai VARCHAR(2),
FOREIGN KEY(id_matakuliah) REFERENCES mata_kuliah(id_matakuliah),
FOREIGN KEY(id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa)
);

INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B'),
(3, 2, 1, 'C'),
(4, 2, 3, 'A'),
(5, 3, 1, 'B'),
(6, 3, 4, 'C'),
(7, 4, 2, 'A'),
(8, 4, 5, 'B'),
(9, 5, 3, 'C'),
(10, 5, 6, 'A');

-- 4.2 
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
DROP PROCEDURE ;
DROP DATABASE modul4;
