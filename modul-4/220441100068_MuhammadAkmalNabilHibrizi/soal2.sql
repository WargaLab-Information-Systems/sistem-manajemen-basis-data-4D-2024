CREATE DATABASE db_kuliah;
USE db_kuliah;

drop database db_kuliah;

CREATE TABLE mata_kuliah (
    id_matakuliah INT PRIMARY KEY,
    nama_mata_kuliah VARCHAR(100),
    sks INT,
    semester VARCHAR (20));

CREATE TABLE mahasiswa (
    id_mahasiswa INT PRIMARY KEY,
    nama VARCHAR(100),
    jurusan VARCHAR(50),
    tanggal_masuk DATE);
    
CREATE TABLE nilai (
    id INT PRIMARY KEY,
    id_mahasiswa INT,
    id_matakuliah INT,
    nilai VARCHAR (2),
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah));


INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester) VALUES 
(1, 'Matematika Dasar', 3, 'Ganjil'),
(2, 'Pemrograman Dasar', 4, 'Ganjil'),
(3, 'Sistem Manajemen Basis Data', 3, 'Genap'),
(4, 'Algoritma Pemrograman', 4, 'Genap'),
(5, 'Pemrograman Web', 3, 'Ganjil');


INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES 
(1, 'Akmal', 'Teknik Informatika', '2022-09-01'),
(2, 'Nabil', 'Sistem Informasi', '2022-09-01'),
(3, 'Hibrizi', 'Teknik Informatika', '2022-09-01'),
(4, 'Dian', 'Sistem Informasi', '2022-09-01'),
(5, 'Eka', 'Teknik Informatika', '2022-09-01');

SELECT * FROM nilai;

DELETE FROM nilai WHERE id = 16;

INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES 
(1, 1, 1, 'A'),
(2, 1, 2, 'B'),
(3, 1, 3, 'A'),
(4, 2, 1, 'B+'),
(5, 2, 2, 'A'),
(6, 2, 3, 'B'),
(7, 3, 1, 'A-'),
(8, 3, 2, 'A'),
(9, 3, 3, 'B+'),
(10, 4, 1, 'B'),
(11, 4, 2, 'B'),
(12, 4, 3, 'B-'),
(13, 5, 1, 'A'),
(14, 5, 2, 'A-'),
(15, 5, 3, 'B');

DELIMITER //
CREATE PROCEDURE soal2()
BEGIN
    SELECT a.nama AS mahasiswa,
           b.semester,
           AVG(CASE WHEN c.nilai = 'A' THEN 4.0
                    WHEN c.nilai = 'A-' THEN 3.7
                    WHEN c.nilai = 'B+' THEN 3.3
                    WHEN c.nilai = 'B' THEN 3.0
                    WHEN c.nilai = 'B-' THEN 2.7
                    ELSE NULL 
                    END) AS rata_rata_nilai
    FROM mahasiswa a
    LEFT JOIN nilai c ON a.id_mahasiswa = c.id_mahasiswa
    LEFT JOIN mata_kuliah b ON c.id_matakuliah = b.id_matakuliah
    GROUP BY a.nama, b.semester;
END //
DELIMITER ;

SELECT * FROM nilai;
drop procedure soal2;
CALL soal2();

