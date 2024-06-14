CREATE DATABASE db_modul4b;
USE db_modul4b;

CREATE TABLE mahasiswa (
	id_mahasiswa INT PRIMARY KEY AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    jurusan VARCHAR(50) NOT NULL,
    tanggal_masuk DATE
);
DESC mahasiswa;
INSERT INTO mahasiswa (nama, jurusan, tanggal_masuk) VALUES
	('Shafira Zahra', 'Sistem Informasi', '2022-07-07'),
    ('Reggina Nur', 'Agribisnis', '2022-08-10'),
    ('Farra Athika', 'Sistem Informasi', '2022-07-07'),
    ('Nurul Ira', 'Teknik Industri', '2022-07-07'),
    ('Widiya Ningsih', 'Teknik Informasi', '2022-07-07'),
    ('Selfi Ananda', 'Agroteknologi', '2022-08-10'),
    ('Lia Handayani', 'Ilmu Komunikasi', '2022-08-10'),
    ('Dwi Habibah', 'PBSI', '2022-08-10'),
    ('Akbar Dzul', 'Agribisnis', '2022-09-10'),
    ('Ketut Muhammad', 'Teknik Industri', '2022-07-07');
SELECT * FROM mahasiswa;
DROP table mahasiswa;

CREATE TABLE mata_kuliah(
	id_matakuliah INT PRIMARY KEY AUTO_INCREMENT,
    nama_mata_kuliah VARCHAR(100),
    sks INT,
    semester VARCHAR(20)
);
DESC mata_kuliah;
INSERT INTO mata_kuliah (nama_mata_kuliah, sks, semester) VALUES 
	('Pendidikan Agama Islam', 2, 'Ganjil'),
    ('Pancasila', 2, 'Ganjil'),
    ('Bahasa Inggris', 2, 'Genap'),
    ('Kewarganegaraan', 2, 'Genap'),
    ('Bahasa Indonesia', 2, 'Ganjil');
SELECT * FROM mata_kuliah;

CREATE TABLE nilai(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_mahasiswa INT,
    id_matakuliah INT,
    nilai VARCHAR(2),
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah)
);
DESC nilai;
INSERT INTO nilai (id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 1, NULL),
(1, 2, NULL),
(2, 4, '80'),
(2, 3, '70'),
(3, 2, '70'),
(3, 5, '80'),
(4, 3, '80'),
(4, 4, '70'),
(5, 1, '80'),
(5, 2, '90'),
(6, 1, '90'),
(6, 5, '60'),
(7, 3, '80'),
(7, 4, '90'),
(8, 1, '90'),
(8, 2, '89'),
(9, 3, '80'),
(9, 4, '71'),
(10, 2, '70'),
(10, 5, '80');
SELECT * FROM nilai;
drop table nilai;

-- SOAL 
DELIMITER //
CREATE PROCEDURE RataRataNilaiPerSemester()
BEGIN
  SELECT DISTINCT
    m.nama AS nama_mahasiswa,
    mk.semester,
    AVG(n.nilai) AS rata_rata_nilai
  FROM mahasiswa m
  INNER JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
  LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
  GROUP BY m.nama, mk.semester
  ORDER BY m.nama, mk.semester;
END //
DELIMITER ;
CALL RataRataNilaiPerSemester();

SELECT * FROM nilai;

