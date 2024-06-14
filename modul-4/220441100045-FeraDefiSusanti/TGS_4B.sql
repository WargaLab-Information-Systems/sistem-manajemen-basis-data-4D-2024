create database tg4b_kuliah;
use tg4b_kuliah;

CREATE TABLE mata_kuliah (
    id_matakuliah INT (11) PRIMARY KEY,
    nama_mata_kuliah VARCHAR(100),
    sks INT (11),
    semester VARCHAR (20));

CREATE TABLE nilai (
    id INT (11) PRIMARY KEY,
    id_mahasiswa INT (11),
    id_matakuliah INT (11),
    nilai VARCHAR (2),
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah));

CREATE TABLE mahasiswa (
    id_mahasiswa INT (11) PRIMARY KEY,
    nama VARCHAR(100),
    jurusan VARCHAR(50),
    tanggal_masuk DATE);
    
INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester) VALUES
(1, 'Pemrograman Dasar', 3, 'Ganjil'),
(2, 'Struktur Data', 3, 'Genap'),
(3, 'Basis Data', 3, 'Ganjil'),
(4, 'Algoritma', 3, 'Genap'),
(5, 'Sistem Operasi', 3, 'Genap');

INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B'),
(3, 1, 3, 'A'),
(4, 2, 1, 'C'),
(5, 2, 4, 'A'),
(6, 3, 3, 'A'),
(7, 4, 1, 'C'),
(8, 5, 1, 'A'),
(9, 4, 3, 'D'),
(10, 6, 4, 'B'); 

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
(1, 'Arya Wijaya', 'Informatika', '2022-09-01'),
(2, 'Bintang Pratama', 'Sitem Informasi', '2021-09-01'),
(3, 'Citra Ananda', 'Infromatika', '2022-09-01'),
(4, 'Dian Saputra', 'Sistem Informasi', '2021-09-01'),
(5, 'Eka Putri', 'Sistem Informasi', '2020-09-01'),
(6, 'Rina', 'Sitem Informasi', '2022-10-01');

select  * from nilai

DELIMITER //
CREATE PROCEDURE rata_rata()
BEGIN
    SELECT 
        m.nama AS nama_mahasiswa,
        s.semester,
        -- ROUND untuk membuat output nominal yg ditentukan
        ROUND(AVG(
            CASE 
                WHEN n.nilai = 'A' THEN 4.0
                WHEN n.nilai = 'B' THEN 3.0
                WHEN n.nilai = 'C' THEN 2.0
                WHEN n.nilai = 'D' THEN 1.0
                WHEN n.nilai = 'E' THEN 0.0
                ELSE NULL
            END
         ), 2) AS 'Rata-Rata Nilai'
    FROM mahasiswa m
    inner join niali n On m.id_mahasiswa = n.id_mahasiswa 
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY  m.nama, s.semester    -- mengelompokkan nama mahasiswa dan semester
    ORDER BY  m.nama, s.semester;     -- mengurutkan hasil nama mahasiswa dan semester secara alfabetis
END //
DELIMITER ;
call rata_rata();