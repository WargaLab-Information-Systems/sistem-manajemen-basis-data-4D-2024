CREATE DATABASE modul4;
USE modul4;

drop database modul4;
CREATE TABLE karyawan(
	id_karyawan INT PRIMARY KEY NOT NULL,
	nama_karyawan VARCHAR(100) NOT NULL,
	posisi VARCHAR (50) NOT NULL,
	id_atasan INT );

INSERT INTO karyawan (id_karyawan, nama_karyawan, posisi, id_atasan)
VALUES
    (1, 'Bambang', 'Staff', 2),
    (2, 'Wati', 'Staff', 3),
    (3, 'Agus', 'Staff', 5),
    (4, 'Yanti', 'Staff', 7),
    (5, 'Hendra', 'Staff', 8),
    (6, 'Rina', 'Staff', 10),
    (7, 'Dewi', 'Staff', 2),
    (8, 'Asep', 'Staff', 3),
    (9, 'Rita', 'Staff', 5),
    (10, 'Fajar', 'Staff', 7),
    (11, 'Sinta', 'Staff', 8),
    (12, 'Joko', 'Staff', 10),
    (13, 'Sari', 'Staff', 2),
    (14, 'Hadi', 'Staff', 3),
    (15, 'Rina', 'Staff', 5),
    (16, 'Dwi', 'Staff', 7),
    (17, 'Eko', 'Staff', 8),
    (18, 'Ratna', 'Staff', 10),
    (19, 'Budi', 'Staff', 2),
    (20, 'Ani', 'Staff', 3);
INSERT INTO karyawan (id_karyawan, nama_karyawan, posisi, id_atasan) VALUES 
(1, 'Andi', 'Manager', NULL),
(2, 'Budi', 'Supervisor', 1),
(3, 'Cici', 'Staf', 2),
(4, 'Doni', 'Supervisor', 1),
(5, 'Eva', 'Staf', 2),
(6, 'Feri', 'Staf', 4),
(7, 'Gita', 'Staf', 4),
(8, 'Hani', 'Staf', 3),
(9, 'Indra', 'Staf', 2),
(10, 'Joko', 'Supervisor', 1);

-- SELECT k1.nama_karyawan AS 'Karyawan',k1.id_karyawan AS 'id_karyawan', k2.nama_karyawan AS 'Atasan',k2.id_karyawan AS 'id_atasan'
-- FROM karyawan k1
-- RIGHT JOIN karyawan k2 ON  k2.id_karyawan = k1.id_atasan
-- ORDER BY k2.nama_karyawan ASC;

SELECT k1.nama_karyawan AS 'Karyawan', k2.nama_karyawan AS 'Atasan'
FROM karyawan k1
RIGHT JOIN karyawan k2 ON k2.id_karyawan = k1.id_atasan
ORDER BY k2.nama_karyawan ;


CREATE DATABASE modul4_2;
USE modul4_2;
drop database modul4_2;

CREATE TABLE mata_kuliah(
	id_matakuliah INT PRIMARY KEY NOT NULL,
	nama_mata_kuliah VARCHAR (100) NOT NULL,
	sks INT NOT NULL,
	semester VARCHAR (20)NOT NULL
);


CREATE TABLE mahasiswa (
	id_mahasiswa INT PRIMARY KEY NOT NULL,
	nama VARCHAR (100) NOT NULL,
	jurusan VARCHAR (50) NOT NULL,
	tanggal_masuk DATE NOT NULL
);

CREATE TABLE nilai(
	id INT PRIMARY KEY NOT NULL,
	id_mahasiswa INT NOT NULL,
	id_matakuliah INT NOT NULL,
	nilai VARCHAR (2),
	FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
	FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah)
);

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester) VALUES
(1, 'Matematika Dasar', 3, 'Ganjil'),
(2, 'Fisika Dasar', 4, 'Ganjil'),
(3, 'Kimia Dasar', 3, 'Ganjil'),
(4, 'Bahasa Inggris', 2, 'Ganjil'),
(5, 'Pemrograman Dasar', 3, 'Genap'),
(6, 'Algoritma dan Struktur Data', 4, 'Genap'),
(7, 'Basis Data', 3, 'Genap'),
(8, 'Kalkulus', 3, 'Ganjil'),
(9, 'Pemrograman Web', 3, 'Genap'),
(10, 'Bahasa Indonesia', 2, 'Ganjil');

SELECT * FROM mata_kuliah;
SELECT * FROM mahasiswa;

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
(1, 'Ani', 'Teknik Informatika', '2022-09-01'),
(2, 'Budi', 'Sistem Informasi', '2022-09-01'),
(3, 'Cici', 'Teknik Elektro', '2022-09-01'),
(4, 'Doni', 'Manajemen Informatika', '2022-09-01'),
(5, 'Eva', 'Ilmu Komputer', '2022-09-01'),
(6, 'Feri', 'Teknik Komputer', '2022-09-01'),
(7, 'Gita', 'Teknik Telekomunikasi', '2022-09-01'),
(8, 'Hani', 'Teknik Industri', '2022-09-01'),
(9, 'Indra', 'Teknik Sipil', '2022-09-01'),
(10, 'Joko', 'Manajemen Bisnis', '2022-09-01');


INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B+'),
(3, 2, 3, 'A'),
(4, 2, 4, 'C'),
(5, 5, 5, 'B'),
(6, 6, 1, 'C+'),
(7, 7, 2, 'A'),
(8, 8, 3, 'B'),
(9, 9, 4, 'A'),
(10, 10, 5, 'B');


DELETE FROM nilai

DELIMITER //

CREATE PROCEDURE modul4_2()
BEGIN
    SELECT distinct m.nama AS 'Nama Mahasiswa', mk.semester AS 'Semester', 
        AVG(
            CASE 
                WHEN n.nilai = 'A' THEN 4
                WHEN n.nilai = 'B+' THEN 3.5
                WHEN n.nilai = 'B' THEN 3
                WHEN n.nilai = 'C+' THEN 2.5
                WHEN n.nilai = 'C' THEN 2
                ELSE NULL
            END
        ) AS 'Rata-rata Nilai'
    FROM mahasiswa m
    CROSS JOIN (SELECT DISTINCT semester FROM mata_kuliah) mk
    inner JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mkuliah ON n.id_matakuliah = mkuliah.id_matakuliah AND mk.semester = mkuliah.semester
    GROUP BY m.id_mahasiswa, mk.semester;
END //

DELIMITER ;
select * from nilai;
drop procedure modul4_2;
CALL modul4_2()