CREATE DATABASE db_karyawan;
USE db_karyawan;

CREATE TABLE karyawan (
id_karyawan INT (11) PRIMARY KEY NOT NULL,
nama VARCHAR (100),
posisi VARCHAR (50),
id_atasan INT(11)
);
DESC karyawan;

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'John Doe', 'Analyst', NULL),
(2, 'Jane Smith', 'Supervisor', 1),
(3, 'Alice Johnson', 'Analyst', 2),
(4, 'Bob Brown', 'Analyst', 1),
(5, 'Charlie Davis', 'Supervisor', 1);
SELECT * FROM karyawan;
DROP TABLE karyawan;


SELECT k1.nama AS karyawan, 
       k2.nama AS atasan
FROM karyawan k1
INNER JOIN karyawan k2 ON k1.id_atasan = k2.id_karyawan
ORDER BY k2.id_karyawan;



