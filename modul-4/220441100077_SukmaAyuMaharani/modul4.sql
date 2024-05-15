// SUKMA AYU MAHARANI
// 220441100077
//SISTEM MANAJEMEN BASIS DATA - 4D

CREATE DATABASE db_kar;
USE db_kar;

CREATE TABLE karyawan (
    id_karyawan INT(11) PRIMARY KEY,
    nama VARCHAR(100),
    posisi VARCHAR(50),
    id_atasan INT(11),
    FOREIGN KEY (id_atasan) REFERENCES karyawan (id_karyawan)
);

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES 
(1, 'Lilik', 'Manajer', NULL),
(2, 'Alda', 'Supervisor', 1),
(3, 'Hanang', 'Supervisor', 1),
(4, 'Agus', 'Staff', 2),
(5, 'Dewi', 'Staff', 3);
select * from karyawan;
SELECT karyawan.nama AS 'Nama Karyawan',atasan.nama AS 'Nama Atasan'
FROM karyawan
RIGHT JOIN karyawan AS atasan ON karyawan.id_atasan = atasan.id_karyawan;


create database db_matkul;
use db_matkul;

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


INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester)
VALUES
(1, 'Pemvis', 3, 'Ganjil'),
(2, 'SMBD', 2, 'Genap'),
(3, 'MPIT', 3, 'Ganjil'),
(4, 'Alpro', 4, 'Genap'),
(5, 'Data mining', 3, 'Ganjil');


INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk)
VALUES
(1, 'Citra', 'Teknik Informatika', '2022-08-15'),
(2, 'Mustika', 'Teknik Mesin', '2020-03-25'),
(3, 'Dito', 'Sistem Informasi', '2022-08-10'),
(4, 'Brian', 'Teknik Industri', '2022-08-03'),
(5, 'Susi', 'Sistem Informasi', '2022-08-20');


INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai)
VALUES
(1, 2, 1, '50'),
(2, 2, 2, '65'),
(3, 3, 3, '75'),
(4, 4, 4, '85'),
(5, 5, 5, '95');

DELIMITER $$
CREATE PROCEDURE RataRataNilaiMahasiswa()
BEGIN
    SELECT 
        mhs.nama AS Nama_Mahasiswa, 
        mk.semester AS Semester, 
        ROUND(AVG(CAST(n.nilai AS UNSIGNED))) AS RataRataNilai 
    FROM 
        mahasiswa mhs
    LEFT JOIN 
        nilai n ON mhs.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN 
        mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY 
        mhs.nama, mk.semester 
    ORDER BY 
        mhs.nama, mk.semester;
END$$
DELIMITER ;
CALL RataRataNilaiMahasiswa();
select*from mahasiswa;
drop table nilai;
drop table mahasiswa;