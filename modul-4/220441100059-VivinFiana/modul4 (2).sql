create database mhs;
use mhs;
drop database mhs;

create table mahasiswa(
id_mahasiswa int (11) primary key not null,
nama varchar (110) not null,
jurusan varchar (50) not null,
tanggal_masuk date not null
);

insert into mahasiswa(id_mahasiswa, nama, jurusan, tanggal_masuk) values
(201, 'Jeno Marselio', 'Teknik Informatika', '2023-08-03'),
(202, 'Cika Lestari', 'Sistem Informasi', '2023-08-06'),
(203, 'Leon Anggara', 'Teknik Informatika', '2023-08-10'),
(204, 'Ahmad Dika', 'Teknik Informatika', '2023-08-05'),
(205, 'Bunga Citra', 'Sistem Informasi', '2023-08-08');

create table matakuliah(
id_matakuliah int (11) primary key not null,
nama_matakuliah varchar (100) not null,
sks int (11) not null,
semester varchar (20) not null
);

insert into matakuliah(id_matakuliah, nama_matakuliah, sks, semester) values
(301, 'Basis Data', 3, 'Genap'),
(302, 'Pemrograman Web', 3, 'Genap'),
(303, 'Algoritma Pemrograman', 4, 'Ganjil'),
(304, 'Matematika Diskrit', 4, 'Ganjil'),
(305, 'Dasar-Dasar Pemrograman', 3, 'Ganjil');

create table nilai(
id int (11) auto_increment primary key,
id_mahasiswa int (11) not null,
id_matakuliah int (11) not null,
nilai varchar (2)
);

insert into nilai(id, id_mahasiswa, id_matakuliah, nilai) values 
(401, 201, 301, '80'),
(402, 201, 302, '76'),
(403, 203, 302, '88'),
(404, 203, 301, '60'),
(405, 205, 305, '85');
drop table nilai;
select * from nilai;

-- no 2
DELIMITER //

CREATE PROCEDURE HitungRataRataNilai()
BEGIN
    SELECT m.nama AS 'Nama Mahasiswa', mk.semester, AVG(CAST(n.nilai AS DECIMAL(4, 2))) AS 'Rata-rata Nilai'
    FROM mahasiswa m
    CROSS JOIN matakuliah mk
    LEFT JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa AND mk.id_matakuliah = n.id_matakuliah
    GROUP BY m.nama, mk.semester;
END //

DELIMITER ;
call HitungRataRataNilai;
drop procedure HitungRataRataNilai;

DELIMITER //
CREATE PROCEDURE rata_rata()
BEGIN
    SELECT m.nama AS Nama_Mahasiswa, mk.semester AS Semester, ROUND(AVG(CAST(n.nilai AS DECIMAL))) AS Rata_Rata_Nilai
    FROM mahasiswa m
    INNER JOIN  nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN matakuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY m.nama, mk.semester
    ORDER BY m.nama, mk.semester;
END //
DELIMITER ;
DROP PROCEDURE rata_rata;
CALL rata_rata();