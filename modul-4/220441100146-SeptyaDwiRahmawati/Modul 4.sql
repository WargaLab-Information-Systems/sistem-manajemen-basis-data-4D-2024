create database db_matkul1;
use db_matkul1;
drop database db_matkul1;
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
(1, 1, 1, '50'),
(2, 2, 2, '65'),
(3, 3, 3, '75'),
(4, 4, 4, '85'),
(5, 5, 5, '95');

DELIMITER //
CREATE PROCEDURE HitungRataRataNilai()
BEGIN
    SELECT 
        m.nama AS 'Nama Mahasiswa', 
        mk.semester, 
        AVG(CAST(n.nilai AS DECIMAL(4, 2))) AS 'Rata-rata Nilai'
    FROM 
        mahasiswa m
    CROSS JOIN 
        mata_kuliah mk
    LEFT JOIN 
        nilai n ON m.id_mahasiswa = n.id_mahasiswa AND mk.id_matakuliah = n.id_matakuliah
    GROUP BY 
        m.nama, mk.semester;
END //

CALL  HitungRataRataNilai();
drop procedure RataRataNilaiMahasiswa;
select*from mahasiswa;
drop table nilai;
drop table mahasiswa;


create database db_matkul2;
use db_matkul2;

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
(1, 1, 1, '50'),
(2, 2, 2, '65'),
(3, 3, 3, '75'),
(4, 4, 4, '85'),
(5, 5, 5, '95');

DELIMITER $$
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
CALL HitungRataRataNilai();