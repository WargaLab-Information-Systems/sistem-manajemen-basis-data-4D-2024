-- NO 1 -- 
CREATE DATABASE db_kantor;
use db_kantor;

CREATE TABLE karyawan (
  id_karyawan INT(11) NOT NULL PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  posisi VARCHAR(50) NOT NULL,
  id_atasan INT(11),
  FOREIGN KEY (id_atasan) REFERENCES karyawan(id_karyawan)
);

INSERT INTO karyawan (id_karyawan,nama, posisi, id_atasan) VALUES
(1,'Andi', 'CEO', NULL),
(2,'Budi', 'Manajer Keuangan', 1),
(3,'Cici', 'Karyawan Keuangan', 2),
(4,'Dedi', 'Karyawan Keuangan', 2),
(5,'Eka', 'Manager Proyek', 1);

SELECT k1.nama AS nama_karyawan, k2.nama AS nama_atasan
FROM karyawan k1
JOIN karyawan k2 ON k1.id_atasan = k2.id_karyawan;

-- NO 2 -- 
CREATE DATABASE db_kuliah;
USE db_kuliah;

CREATE TABLE mahasiswa (
  id_mahasiswa INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100) NOT NULL,
  jurusan VARCHAR(50) NOT NULL,
  tanggal_masuk DATE NOT NULL
);

INSERT INTO mahasiswa (nama, jurusan, tanggal_masuk) VALUES
('Budi', 'Teknik Informatika', '2020-09-01'),
('Eka', 'Teknik Elektro', '2021-09-01'),
('Cici', 'Teknik Mesin', '2022-09-01'),
('Dedi', 'Teknik Industri', '2020-09-01'),
('Andi', 'Sistem Informasi', '2021-09-01');

CREATE TABLE mata_kuliah (
  id_matakuliah INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama_mata_kuliah VARCHAR(100) NOT NULL,
  sks INT(11) NOT NULL,
  semester VARCHAR(20) NOT NULL
);

INSERT INTO mata_kuliah (nama_mata_kuliah, sks, semester) VALUES
('Pemrograman Dasar', 3, '1'),
('Kalkulus', 3, '1'),
('Fisika Dasar', 3, '1'),
('Algoritma dan Struktur Data', 3, '2'),
('Jaringan Komputer', 3, '2'),
('Basis Data', 3, '2'),
('Pemrograman Web', 3, '3'),
('Sistem Operasi', 3, '3'),
('Manajemen Proyek', 3, '3');


CREATE TABLE nilai (
  id_nilai INT(11) PRIMARY KEY AUTO_INCREMENT,
  id_mahasiswa INT(11) NOT NULL,
  id_matakuliah INT(11) NOT NULL,
  nilai VARCHAR(2) NOT NULL,
  FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
  FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah)
);

INSERT INTO nilai (id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 1, 'A'),
(1, 2, 'B'),
(1, 3, 'C'),
(1, 4, 'A'),
(1, 5, 'B'),
(1, 6, 'C'),
(1, 7, 'A'),
(1, 8, 'B'),
(1, 9, 'C'),
(2, 1, 'B'),
(2, 2, 'C'),
(2, 3, 'A'),
(2, 4, 'B'),
(2, 5, 'C'),
(2, 6, NULL),
(2, 7, 'B'),
(2, 8, 'C'),
(2, 9, 'A'),
(3, 1, 'C'),
(3, 2, 'B'),
(3, 3, 'A'),
(3, 4, 'C'),
(3, 5, 'B'),
(3, 6, 'A'),
(3, 7, 'C'),
(3, 8, 'B'),
(3, 9, 'A'),
(4, 1, 'A'),
(4, 2, 'B'),
(4, 3, 'C'),
(4, 4, 'A'),
(4, 5, 'B'),
(4, 6, NULL),
(4, 7, 'A'),
(4, 8, 'B'),
(4, 9, 'C'),
(5, 1, 'B'),
(5, 2, 'C'),
(5, 3, 'B'),
(5, 4, 'A'),
(5, 5, 'B'),
(5, 6, 'C'),
(5, 7, 'A'),
(5, 8, 'A'),
(5, 9, 'A');

SELECT * FROM nilai;

DELIMITER //
CREATE PROCEDURE nilai_rerata()
BEGIN
    DECLARE total_scores INT;
    DECLARE average_score FLOAT;

    SELECT m.nama AS nama_mahasiswa, mk.semester,
           COALESCE(ROUND(AVG(CASE WHEN n.nilai = 'A' THEN 4
                WHEN n.nilai = 'B' THEN 3
                WHEN n.nilai = 'C' THEN 2
                ELSE 0
           END), 1), 0.0) AS overall_average_score
    FROM mahasiswa m
    LEFT JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY m.nama, mk.semester;
END //
DELIMITER ;

call nilai_rerata();

-- n.nilai AS original_grade,-- 