create database db_karyawan;
use db_karyawan;

create table karyawan (
			id_karyawan int (11) primary key,
            nama varchar (100),
            posisi varchar (100),
            id_atasan int (11),
            FOREIGN KEY (id_atasan) REFERENCES karyawan (id_karyawan)
);
            
INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'John Doe', 'Manager', NULL),
(2, 'Jane Smith', 'Supervisor', 1),
(3, 'Michael Johnson', 'Staff', 2),
(4, 'Emily Brown', 'Staff', 2),
(5, 'David Lee', 'Staff', 2);

SELECT karyawan.nama AS 'Nama Karyawan', atasan.nama AS 'Nama Atasan'
FROM karyawan AS karyawan
LEFT JOIN karyawan AS atasan ON karyawan.id_atasan = atasan.id_karyawan
ORDER BY atasan.nama;

SELECT karyawan.nama AS 'Nama Karyawan',atasan.nama AS 'Nama Atasan'
FROM karyawan
RIGHT JOIN karyawan AS atasan ON karyawan.id_atasan = atasan.id_karyawan;







