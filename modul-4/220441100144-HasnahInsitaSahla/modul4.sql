
create database modul4;
use modul4;

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
(1, 'Gopal', 'Teknik Informatika', '2000-08-15'),
(2, 'Ying', 'Manajemen', '2001-03-25'),
(3, 'Yaya', 'Akuntansi', '2002-11-10'),
(4, 'Ochobot', 'Psikologi', '2003-05-03'),
(5, 'Adudu', 'Teknik Sipil', '2004-09-20'),
(6, 'Probe', 'Kedokteran', '2005-01-12'),
(7, 'Fang', 'Hukum', '2006-07-30'),
(8, 'Iwan', 'Ekonomi', '2007-12-05'),
(9, 'Boboiboy', 'Farmasi', '2008-02-18'),
(10, 'cekgupapa', 'Arsitektur', '2009-10-09');

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
(3, 3, null, null),
(4, 4, 4, '40'),
(5, 5, 5, '50'),
(6, 5, 6, '30'),
(7, 9, 7, '20'),
(8, 8, 8, '50'),
(9, 9, 9, '60'),
(10, 10, 10, '70')
;

drop table nilai;


DELIMITER //

DELIMITER //

CREATE OR REPLACE PROCEDURE RataRataNilai(
    OUT Nama_Mahasiswa VARCHAR(100),
    OUT Semester INT,
    OUT Rata_Rata_Nilai FLOAT
)
BEGIN
    SELECT 
        m.nama AS Nama_Mahasiswa, 
        mk.semester AS Semester, 
        AVG(n.nilai) AS Rata_Rata_Nilai
    FROM 
        mahasiswa m
    INNER JOIN 
        nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN 
        mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY 
        m.nama, mk.semester;

END //

DELIMITER ;
CALL RataRataNilai(@Nama_Mahasiswa, @Semester, @Rata_Rata_Nilai);
SELECT @Nama_Mahasiswa, @Semester, @Rata_Rata_Nilai;

drop procedure RataRataNilai;
drop database modul4;



create database kryawan;
use kryawan;

create table karyawan(
id_karyawan int(11) primary key,
nama varchar(100),
posisi varchar(50),
id_atasan int(11)
);

insert into karyawan (id_karyawan, nama, posisi, id_atasan) 
values
(1, 'leeminho', 'Manajer', null),
(2, 'jennie', 'Supervisor', 1),
(3, 'rose', 'Staff', 2),
(4, 'Jisso', 'Staff', null),
(5, 'Joy', 'Supervisor', 1),
(6, null, 'Supervisor', 3);
;


drop table karyawan;


SELECT k1.id_karyawan, k1.nama AS Karyawan, k2.nama AS Atasan
FROM karyawan k1
right join karyawan k2 ON k1.id_atasan = k2.id_karyawan
union
SELECT k1.id_karyawan, k1.nama AS Karyawan, k2.nama AS Atasan
FROM karyawan k1
left join karyawan k2 ON k1.id_atasan = k2.id_karyawan
ORDER BY Karyawan;


drop database kryawan;
