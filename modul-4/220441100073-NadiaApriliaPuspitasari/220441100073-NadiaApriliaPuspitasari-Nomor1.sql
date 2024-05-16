create database db_karyawan;
use db_karyawan;
-- drop database db_karyawan;
create table karyawan(
id_karyawan int(11) primary key,
nama varchar(100),
posisi varchar(50),
id_atasan int(11));

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'Faza', 'Atasan', NULL),
(2, 'Putri', 'Atasan', 1),
(3, 'Maya', 'Karyawan', 2),
(4, 'Rania', 'Karyawan', 3),
(5, 'Hasnah', 'Karyawan', 4);

drop table karyawan;
-- soal 1
SELECT karyawan.nama AS 'Nama Karyawan',atasan.nama AS 'Nama Atasan'
FROM karyawan
RIGHT JOIN karyawan AS atasan ON karyawan.id_atasan = atasan.id_karyawan;

select * from karyawan;