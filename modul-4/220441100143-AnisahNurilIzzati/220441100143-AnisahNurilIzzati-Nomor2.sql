CREATE DATABASE universitas;
USE universitas;
CREATE TABLE mata_kuliah (
	id_matakuliah INT PRIMARY KEY,
    nama_mata_kuliah VARCHAR(100),
    SKS INT,
    semester VARCHAR(20)
);

CREATE TABLE mahasiswa (
	id_mahasiswa INT PRIMARY KEY,
    nama VARCHAR(100),
    jurusan VARCHAR(100),
    tanggal_masuk DATE 
);

CREATE TABLE nilai (
	id INT PRIMARY KEY ,
    id_mahasiswa INT ,
    id_matakuliah INT,
    nilai VARCHAR(2),
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah)
);

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, SKS, semester) VALUES
(1, 'Algoritma Pemrograman', 4, 'Ganjil'),
(2, 'Logika Engineering', 3, 'Ganjil'),
(3, 'Sistem Manajemen Basis Data', 4, 'Genap'),
(4, 'Pemrograman Visual', 4, 'Genap'),
(5, 'Pengantar Teknologi Informasi dan Komunikasi', 3, 'Ganjil'),
(6, 'Riset Operasi', 3, 'Genap'),
(7, 'Pemrograman Web', 4, 'Ganjil'),
(8, 'Pemrograman Objek', 4, 'Genap'),
(9, 'Rekayasa Perangkat Lunak', 3, 'Ganjil'),
(10, 'Manajemen Proyek TI', 3, 'Genap');

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
(1, 'Pipin', 'Teknik Informatika', '2022-08-15'),
(2, 'Putri', 'Sistem Informasi', '2020-08-17'),
(3, 'Nadia', 'Teknik Informatika', '2022-08-20'),
(4, 'Hasnah', 'Sistem Informasi', '2022-08-22'),
(5, 'Adhelia', 'Teknik Informatika', '2022-08-25'),
(6, 'Anisa', 'Sistem Informasi', '2022-08-28'),
(7, 'Icha', 'Teknik Informatika', '2022-08-01'),
(8, 'Salwa', 'Sistem Informasi', '2022-08-03'),
(9, 'Faradisil', 'Teknik Informatika', '2022-08-05'),
(10, 'Syahda', 'Sistem Informasi', '2022-08-08');

INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 1, 1, '90'),
(2, 2, NULL, NULL),
(3, 3, 3, '75'),
(4, 4, 4, '85'),
(5, 5, 5, '80'),
(6, 6, 6, '90'),
(7, 7, 7, '86'),
(8, 8, 8, '88'),
(9, 9, 9, '92'),
(10, 10, 10, '95');

-- soal 2 
DELIMITER //
CREATE PROCEDURE nilai_rata_rata(
OUT namaMhs VARCHAR(100),
OUT smt VARCHAR(10),
OUT ratarata FLOAT)
BEGIN
    SELECT mahasiswa.nama, mata_kuliah.semester, ROUND(AVG(CAST(nilai AS DECIMAL)),0) AS rata_rata_nilai
    FROM mahasiswa
    JOIN nilai ON mahasiswa.id_mahasiswa = nilai.id_mahasiswa
    LEFT JOIN mata_kuliah ON nilai.id_matakuliah = mata_kuliah.id_matakuliah
    GROUP BY mahasiswa.nama, mata_kuliah.semester
    ORDER BY mahasiswa.id_mahasiswa;
END //
DELIMITER ;

CALL nilai_rata_rata (@namaMhs, @smt, @ratarata);