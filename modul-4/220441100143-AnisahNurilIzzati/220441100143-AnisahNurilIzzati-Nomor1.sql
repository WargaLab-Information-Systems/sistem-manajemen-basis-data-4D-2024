CREATE DATABASE karyawan;
USE karyawan;

CREATE TABLE karyawan (
	id_karyawan INT PRIMARY KEY,
    nama VARCHAR(100),
    posisi VARCHAR (50),
    id_atasan INT);
    
INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan)
VALUES
    (1, 'John Doe', 'Manager', NULL),
    (2, 'Jane Smith', 'Supervisor', 1),
    (3, 'Michael Johnson', 'Supervisor', 1),
    (4, 'Emily Davis', 'Staff', 2),
    (5, 'Robert Brown', 'Staff', 3);

-- soal 1
SELECT
    k1.nama AS nama_karyawan,
    k2.nama AS nama_atasan
FROM
    karyawan k1
RIGHT JOIN
    karyawan k2 ON k1.id_atasan = k2.id_karyawan 
UNION ALL
SELECT
    k1.nama AS nama_karyawan,
    k2.nama AS nama_atasan
FROM
    karyawan k1
LEFT JOIN
    karyawan k2 ON k1.id_atasan = k2.id_karyawan 
ORDER BY nama_karyawan, nama_atasan;