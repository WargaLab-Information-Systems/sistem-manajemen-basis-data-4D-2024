CREATE DATABASE db_karyawan;
USE db_karyawan;

CREATE TABLE karyawan (
	id_karyawan INT(11) PRIMARY KEY,
	nama VARCHAR(100),
	posisi VARCHAR(50),
	id_atasan INT(11),
    FOREIGN KEY (id_atasan) REFERENCES karyawan(id_karyawan)
);

INSERT INTO karyawan VALUES
(1, 'John Doe', 'Manager', NULL),
(2, 'Jane Smith', 'Senior Engineer', 1),
(3, 'Michael Johnson', 'CEO', NULL),
(4, 'Emily Brown', 'Junior Engineer', 1),
(5, 'David Wilson', 'Senior Manager', NULL),
(6, 'Sarah Lee', 'Junior Engineer', 2),
(7, 'Alice Johnson', 'HR Manager', 3),
(8, 'Robert Davis', 'Accountant', 5),
(9, 'Jennifer White', 'Sales Manager', 3),
(10, 'Daniel Taylor', 'Marketing Executive', 9);
select*from karyawan;

-- Gunakan self join pada tabel (karyawan) untuk mengaitkan karyawan dengan atasan 
-- mereka!
SELECT
	k1.nama AS karyawan,
	k2.nama AS atasan
FROM karyawan AS k1
INNER JOIN karyawan AS k2
ON k1.id_atasan = k2.id_karyawan;

-- Gunakan right join untuk memastikan bahwa atasan yang tidak memiliki bawahan
-- tetap ditampilkan dalam hasilnya!
SELECT 
    k1.nama AS karyawan,
    k2.nama AS atasan
FROM karyawan k1
RIGHT JOIN karyawan k2 
ON k1.id_atasan = k2.id_karyawan;


