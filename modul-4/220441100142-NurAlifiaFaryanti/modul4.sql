-- ----- SOAL 1 ----------

CREATE DATABASE pabrik;
USE pabrik;

CREATE TABLE karyawan (
    id_karyawan INT(11) PRIMARY KEY,
    nama VARCHAR(100),
    posisi VARCHAR(50),
    id_atasan INT(11)
);



INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'Budi Santoso', 'Manager', NULL),
(2, 'Siti Rahayu', 'Supervisor', 1),
(3, 'Ahmad Rizki', 'Analyst', 2),
(4, 'Dewi Anggraini', 'Analyst', 2),
(5, 'Tri Wijaya', 'Supervisor', 1),
(6, 'Ani Susanti', 'Analyst', 5),
(7, 'Dodi Suryadi', 'Analyst', 5),
(8, 'Rina Permata', 'Analyst', 5),
(9, 'Eko Pratama', 'Analyst', 1),
(10, 'Nina Utami', 'Analyst', 1);


-- a

SELECT karyawan.nama AS 'Nama Karyawan', atasan.nama AS 'Nama Atasan'
FROM karyawan AS karyawan
LEFT JOIN karyawan AS atasan ON karyawan.id_atasan = atasan.id_karyawan
ORDER BY atasan.nama;

-- b

SELECT karyawan.nama AS 'Nama Karyawan',atasan.nama AS 'Nama Atasan'
FROM karyawan
RIGHT JOIN karyawan AS atasan ON karyawan.id_atasan = atasan.id_karyawan;

-- --------------------------------------------------------------------------------------


-- ------ SOAL 2 ------------------------

create database kuliah;
use kuliah;

create table mata_kuliah(
	id_matakuliah int(11) primary key,
	nama_mata_kuliah varchar(100),
	sks int(11),
	semester varchar(20)
);

create table mahasiswa(
	id_mahasiswa int(11) primary key,
	nama varchar(100),
	jurusan varchar(50),
	tanggal_masuk date
);

create table nilai(
	id int(11) primary key,
	id_mahasiswa int(11),
	id_matakuliah int(11),
	nilai varchar(2),
	foreign key(id_matakuliah) references mata_kuliah(id_matakuliah),
	foreign key(id_mahasiswa) references mahasiswa(id_mahasiswa)
);


-- Data untuk tabel mata_kuliah
INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester) VALUES
(1, 'Matematika Dasar', 3, 'Ganjil'),
(2, 'Fisika Dasar', 4, 'Ganjil'),
(3, 'Bahasa Inggris', 2, 'Genap'),
(4, 'Algoritma dan Pemrograman', 3, 'Ganjil'),
(5, 'Dasar-dasar Pemrograman Web', 3, 'Genap'),
(6, 'Basis Data', 3, 'Ganjil'),
(7, 'Pemrograman Berorientasi Objek', 3, 'Genap'),
(8, 'Struktur Data', 3, 'Ganjil'),
(9, 'Kalkulus', 4, 'Genap'),
(10, 'Pemrograman Visual', 3, 'Ganjil');

-- Data untuk tabel mahasiswa
INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
(01, 'Alifia', 'Informatika', '2023-09-10'),
(02, 'Budi', 'Teknik Elektro', '2023-08-15'),
(03, 'Andini', 'Sistem Informasi', '2023-07-20'),
(04, 'Dedi', 'Teknik Komputer', '2023-09-05'),
(05, 'Eva', 'Informatika', '2023-08-30'),
(06, 'Fandi', 'Teknik Elektro', '2023-07-25'),
(07, 'Fiana', 'Sistem Informasi', '2023-09-01'),
(08, 'Hani', 'Teknik Komputer', '2023-08-20'),
(09, 'Indra', 'Informatika', '2023-07-15'),
(010, 'Vigo', 'Sistem Informasi', '2023-09-10');




-- Data untuk tabel nilai
INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES
(111, 01, 1, '80'),
(222, 02, 2, '70'),
(333, 03, 3, '80'),
(444, 04, 4, '95'),
(555, 05, 5, '80'),
(666, 06, 1, '85'),
(777, 07, 2, '95'),
(888, 08, 3, '90'),
(999, 09, 4, '85'),
(1000, 010, 5, '90'),
(10001, 011, 5, '90');


DELIMITER //

CREATE PROCEDURE HitungRataRataNilai()
BEGIN
    SELECT m.nama AS 'Nama Mahasiswa', mk.semester, AVG(CAST(n.nilai AS DECIMAL(4, 2))) AS 'Rata-rata Nilai'
    FROM mahasiswa m
    CROSS JOIN mata_kuliah mk
    LEFT JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa AND mk.id_matakuliah = n.id_matakuliah
    GROUP BY m.nama, mk.semester;
END //

DELIMITER ;
call HitungRataRataNilai;
drop procedure HitungRataRataNilai;





