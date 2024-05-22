CREATE DATABASE modul4soal2
USE modul4soal2

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
	tanggal_masuk DATE
)

CREATE TABLE nilai(
	id INT PRIMARY KEY NOT NULL,
	id_mahasiswa INT NOT NULL,
	id_matakuliah INT NOT NULL,
	nilai VARCHAR (2),
	FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
	FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah)
);
SELECT * FROM nilai

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester) VALUES
(1, 'Matematika Dasar', 3, 'Ganjil'),
(2, 'Bahasa Inggris', 2, 'Genap'),
(3, 'Pemrograman Dasar', 4, 'Ganjil'),
(4, 'Statistika', 3, 'Genap'),
(5, 'Basis Data', 3, 'Ganjil'),
(6, 'Struktur Data', 3, 'Genap'),
(7, 'Algoritma dan Pemrograman', 4, 'Ganjil'),
(8, 'Kalkulus', 3, 'Genap'),
(9, 'Pemrograman Web', 3, 'Ganjil'),
(10, 'Fisika Dasar', 3, 'Genap'),
(11, 'Logika Informatika', 2, 'Ganjil'),
(12, 'Sistem Operasi', 4, 'Genap'),
(13, 'Pengantar Teknologi Informasi', 2, 'Ganjil'),
(14, 'Komunikasi Data dan Jaringan', 3, 'Genap'),
(15, 'Pemrograman Berorientasi Objek', 4, 'Ganjil'),
(16, 'Analisis Algoritma', 3, 'Genap'),
(17, 'Manajemen Proyek Perangkat Lunak', 3, 'Ganjil'),
(18, 'Etika Profesi', 2, 'Genap'),
(19, 'Pemrograman Mobile', 3, 'Ganjil'),
(20, 'Keamanan Informasi', 3, 'Genap');
SELECT * FROM mata_kuliah

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
(1, 'Andi', 'Teknik Informatika', '2022-09-10'),
(2, 'Budi', 'Sistem Informasi', '2022-08-15'),
(3, 'Cindy', 'Teknik Informatika', '2023-01-20'),
(4, 'Dini', 'Manajemen Informatika', '2022-11-05'),
(5, 'Eva', 'Teknik Komputer', '2023-03-12'),
(6, 'Fahri', 'Sistem Informasi', '2023-02-28'),
(7, 'Gita', 'Teknik Informatika', '2022-10-17'),
(8, 'Hani', 'Manajemen Informatika', '2023-04-25'),
(9, 'Ivan', 'Teknik Komputer', '2022-12-08'),
(10, 'Joko', 'Sistem Informasi', '2023-05-30'),
(11, 'Karin', 'Teknik Informatika', '2022-07-03'),
(12, 'Lia', 'Manajemen Informatika', '2023-06-18'),
(13, 'Mira', 'Teknik Komputer', '2022-09-22'),
(14, 'Nina', 'Sistem Informasi', '2023-07-08'),
(15, 'Oky', 'Teknik Informatika', '2022-11-15'),
(16, 'Putri', 'Manajemen Informatika', '2023-08-20'),
(17, 'Rudi', 'Teknik Komputer', '2022-12-28'),
(18, 'Santi', 'Sistem Informasi', '2023-09-10'),
(19, 'Toni', 'Teknik Informatika', '2023-01-05'),
(20, 'Vina', 'Manajemen Informatika', '2023-10-25');

INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B+'),
(3, 1, 3, 'A'),
(4, 1, 4, 'B'),
(5, 1, 5, 'A'),
(6, 2, 1, 'A'),
(7, 2, 2, 'C+'),
(8, 2, 3, 'B'),
(9, 2, 4, 'B+'),
(10, 2, 5, 'A'),
(11, 3, 1, 'B+'),
(12, 3, 2, 'A'),
(13, 3, 3, 'A'),
(14, 3, 4, 'B'),
(15, 3, 5, 'B+'),
(16, 4, 1, 'C'),
(17, 4, 2, 'A'),
(18, 4, 3, 'B'),
(19, 4, 4, 'C+'),
(20, 4, 5, 'D');

DELETE FROM nilai

DELIMITER //

CREATE OR REPLACE PROCEDURE modul4soal2()
BEGIN
    SELECT 
        m.nama AS 'Nama Mahasiswa', 
        s.semester AS 'Semester', 
        AVG(
            CASE 
                WHEN nm.nilai = 'A' THEN 4
                WHEN nm.nilai = 'B+' THEN 3.5
                WHEN nm.nilai = 'B' THEN 3
                WHEN nm.nilai = 'C+' THEN 2.5
                WHEN nm.nilai = 'C' THEN 2
                WHEN nm.nilai = 'D+' THEN 1.5
                WHEN nm.nilai = 'D' THEN 1
                ELSE NULL
            END
        ) AS 'Rata-rata Nilai'
    FROM 
        mahasiswa m
    CROSS JOIN 
        (SELECT DISTINCT semester FROM mata_kuliah) s
    LEFT JOIN 
        (SELECT n.id_mahasiswa, mk.semester, n.nilai
         FROM nilai n 
         INNER JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah) nm 
        ON m.id_mahasiswa = nm.id_mahasiswa AND s.semester = nm.semester
    GROUP BY 
        m.id_mahasiswa, s.semester;
END //

DELIMITER ;

SELECT * FROM nilai WHERE id_mahasiswa=1

CALL modul4soal2()


