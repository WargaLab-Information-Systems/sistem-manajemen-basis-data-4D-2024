create database kryawan;
use kryawan;
drop database kryawan;
create table karyawan(
id_karyawan int(11) primary key,
nama varchar(100),
posisi varchar(50),
id_atasan int(11)
);

insert into karyawan (id_karyawan, nama, posisi, id_atasan) 
values
(1, 'hubner', 'Manajer', null),
(2, 'ivar', 'Supervisor', 1),
(3, 'cinta', 'Staff', 2),
(4, 'salma', 'Staff', 2),
(5, 'rosi', 'Supervisor', 1),
(6, 'irma', 'Staff', 5),
(7, 'rafi', 'Staff', null),
(8, 'andrre', 'Supervisor', 1),
(9, 'ratu', 'Staff', 8),
(10, 'Gita', 'Staff', 8);

create table mata_kuliah(
id_matakuliah int(11) primary key,
nama_mata_kuliah varchar(100),
sks int(11),
semester varchar(20)
);

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester)
VALUES
(1, 'Matematika Dasar', 3, 'Ganjil'),
(2, 'Bahasa Inggris', 2, 'Genap'),
(3, 'Fisika Dasar', 3, 'Ganjil'),
(4, 'Pemrograman Dasar', 4, 'Genap'),
(5, 'Kimia Dasar', 3, 'Ganjil'),
(6, 'Statistika', 3, 'Genap'),
(7, 'Akuntansi Dasar', 2, 'Ganjil'),
(8, 'Sejarah Indonesia', 2, 'Genap'),
(9, 'Pengantar Bisnis', 3, 'Ganjil'),
(10, 'Etika Profesi', 2, 'Genap');

create table mahasiswa(
id_mahasiswa int(11) primary key,
nama varchar(100),
jurusan varchar(50),
tanggal_masuk date
);

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk)
VALUES
(1, 'adi', 'Teknik Informatika', '2000-08-15'),
(2, 'sherin', 'Manajemen', '2001-03-25'),
(3, 'dwi', 'Akuntansi', '2002-11-10'),
(4, 'avrina', 'Psikologi', '2003-05-03'),
(5, 'ferdi', 'Teknik Sipil', '2004-09-20'),
(6, 'aziza', 'Kedokteran', '2005-01-12'),
(7, 'arhan', 'Hukum', '2006-07-30'),
(8, 'witan', 'Ekonomi', '2007-12-05'),
(9, 'ernando', 'Farmasi', '2008-02-18'),
(10, 'marselino', 'Arsitektur', '2009-10-09');

create table nilai(
id int(11) primary key,
id_mahasiswa int(11),
id_matakuliah int(11),
nilai varchar(2),
foreign key(id_matakuliah) references mata_kuliah(id_matakuliah),
foreign key(id_mahasiswa) references mahasiswa(id_mahasiswa)
);

INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai)
VALUES
(1, 2, 1, '20'),
(2, 2, 2, '30'),
(3, 3, 3, '40'),
(4, 4, 4, '40'),
(5, 5, 5, '50'),
(6, 5, 6, '30'),
(7, 9, 7, '20'),
(8, 8, 8, '50'),
(9, 9, 9, '60'),
(10, 10, 10, '70');

drop table nilai;

-- 1 --
SELECT k1.nama AS Karyawan, k2.nama AS Atasan
FROM karyawan k1
right JOIN karyawan k2 ON k1.id_atasan = k2.id_karyawan
ORDER BY k1.id_atasan ASC;

-- 2 --
DELIMITER //

CREATE PROCEDURE CalculateAverageGrades()
BEGIN
    SELECT m.nama AS Nama_Mahasiswa, mk.semester AS Semester, AVG(CAST(n.nilai AS DECIMAL)) AS Rata_Rata_Nilai
    FROM mahasiswa m
    INNER JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY m.nama, mk.semester;
END //

DELIMITER ;
CALL CalculateAverageGrades();
drop database modul4;