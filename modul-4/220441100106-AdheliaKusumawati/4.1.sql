create database db_karyawan;
use db_karyawan;

create table karyawan(
id_karyawan int (11) primary key,
nama varchar (100),
posisi varchar (50),
id_atasan int(11)
);

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'nadia aprilia', 'Manager', NULL),
(2, 'Jessica Jane ', 'Supervisor', 1),
(3, 'Michael Lee', 'Supervisor', 1),
(4, 'Emma Watson', 'Employee', 1),
(5, 'David Backam', 'Employee', 1);

DROP TABLE karyawan;
-- Gunakan self join pada tabel (karyawan) untuk mengaitkan karyawan dengan atasan mereka!
-- Gunakan right join untuk memastikan bahwa atasan yang tidak memiliki bawahan tetap ditampilkan dalam hasilnya!
SELECT k1.nama AS Karyawan, k2.nama AS Atasan
FROM karyawan k1
right JOIN karyawan k2 ON k1.id_atasan = k2.id_karyawan;


drop database db_karyawan;
