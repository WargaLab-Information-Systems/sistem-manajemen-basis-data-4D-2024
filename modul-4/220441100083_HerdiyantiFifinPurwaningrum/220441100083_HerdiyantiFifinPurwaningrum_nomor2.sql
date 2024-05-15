CREATE DATABASE db_kuliah;
USE db_kuliah;
DROP DATABASE db_kuliah;

CREATE TABLE mata_kuliah(
id_matakuliah INT(11) PRIMARY KEY,
nama_mata_kuliah VARCHAR(100),
sks INT(11),
semester VARCHAR(20)
);
select*from mata_kuliah;

CREATE TABLE mahasiswa(
id_mahasiswa INT(11) PRIMARY KEY,
nama VARCHAR(100),
jurusan VARCHAR(50),
tanggal_masuk DATE
);
select*from mahasiswa;

CREATE TABLE nilai(
id INT(11) PRIMARY KEY,
id_mahasiswa INT(11),
id_matakuliah INT(11),
nilai VARCHAR(2),
FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa),
FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah (id_matakuliah)
);
select*from nilai;

INSERT INTO mata_kuliah VALUES
(1, 'Kalkulus 1', 3, '1'),
(2, 'Algoritma dan Pemrograman', 3, '1'),
(3, 'Fisika Dasar', 3, '1'),
(4, 'Bahasa Indonesia', 3, '1'),
(5, 'Kimia Dasar', 3, '1'),
(6, 'Kalkulus 2', 3, '2'),
(7, 'Struktur Data dan Algoritma', 3, '2'),
(8, 'Fisika Mekanika', 3, '2'),
(9, 'Bahasa Inggris', 3, '2'),
(10, 'Kimia Analitik', 3, '2');

INSERT INTO mahasiswa VALUES
(1, 'Budi', 'Informatika', '2020-09-01'),
(2, 'Andi', 'Teknik Elektro', '2021-08-01'),
(3, 'Cici', 'Sistem Informasi', '2022-07-01'),
(4, 'Dini', 'Manajemen Informatika', '2023-06-01'),
(5, 'Evi', 'Akuntansi', '2020-09-01'),
(6, 'Fani', 'Teknik Industri', '2021-08-01'),
(7, 'Gani', 'Desain Grafis', '2022-07-01'),
(8, 'Hani', 'Ilmu Komunikasi', '2023-06-01'),
(9, 'Iki', 'Hukum', '2020-09-01'),
(10, 'Joni', 'Kedokteran', '2021-08-01');

INSERT INTO nilai VALUES
-- Data untuk Mahasiswa 1
(1, 1, 1, NULL),
(2, 1, 6, '80'),
-- Data untuk Mahasiswa 2
(3, 2, 2, '90'),
(4, 2, 7, '65'),
-- Data untuk Mahasiswa 3
(5, 3, 3, '78'),
(6, 3, 8, '92'),
-- Data untuk Mahasiswa 4
(7, 4, 4, '60'),
(8, 4, 9, '80'),
-- Data untuk Mahasiswa 5
(9, 5, 5, NULL),
(10, 5, 10, '55'),
-- Data untuk Mahasiswa 6
(11, 6, 6, '80'),
(12, 6, 1, '92'),
-- Data untuk Mahasiswa 7
(13, 7, 7, '62'),
(14, 7, 2, '80'),
-- Data untuk Mahasiswa 8
(15, 8, 8, '90'),
(16, 8, 7, '65'),
-- Data untuk Mahasiswa 9
(17, 9, 9, '85'),
(18, 9, 6, NULL),
-- Data untuk Mahasiswa 10
(19, 10, 10, '70'),
(20, 10, 1, '80');

select* from nilai;

-- DELIMITER //
-- CREATE PROCEDURE nilai_rata_rata()
-- BEGIN
--     SELECT mahasiswa.nama, mata_kuliah.semester, AVG(CAST(nilai AS DECIMAL)) AS rata_rata_nilai
--     FROM mahasiswa
--     JOIN nilai ON mahasiswa.id_mahasiswa = nilai.id_mahasiswa
--     LEFT JOIN mata_kuliah ON nilai.id_matakuliah = mata_kuliah.id_matakuliah
--     GROUP BY mahasiswa.nama, mata_kuliah.semester;
-- END //
-- DELIMITER ;

-- CALL nilai_rata_rata;
-- drop procedure nilai_rata_rata;

DELIMITER //

CREATE PROCEDURE nilai_rata_rata()
BEGIN
    SELECT mahasiswa.nama, mata_kuliah.semester, ROUND(AVG(CAST(nilai.nilai AS DECIMAL)), 0) AS rata_rata_nilai
    FROM mahasiswa
    JOIN nilai ON mahasiswa.id_mahasiswa = nilai.id_mahasiswa
    LEFT JOIN mata_kuliah ON nilai.id_matakuliah = mata_kuliah.id_matakuliah
    GROUP BY mahasiswa.nama, mata_kuliah.semester;
END //

DELIMITER ;
call nilai_rata_rata;