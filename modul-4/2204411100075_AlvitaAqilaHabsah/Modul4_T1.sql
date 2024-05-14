CREATE DATABASE pekerja;
USE pekerja;

CREATE TABLE IF NOT EXISTS karyawan (
    id_karyawan INT PRIMARY KEY,
    nama VARCHAR(100),
    posisi VARCHAR(50),
    id_atasan INT,
    FOREIGN KEY (id_atasan) REFERENCES karyawan(id_karyawan));

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'Jony Yugo', 'Manager', NULL),
(2, 'Lani Diana', 'Supervisor', 1),
(3, 'David Lion', 'Analyst', 2),
(4, 'Emily Juli', 'Staff', 2),
(5, 'Marchelio', 'Analyst', 2),
(6, 'Sarah Adam', 'Staff', 2);

SELECT * FROM karyawan

SELECT k1.nama AS 'Nama Karyawan', k2.nama AS 'Atasan'
FROM karyawan k1
LEFT JOIN karyawan k2 ON k1.id_atasan = k2.id_karyawan;

SELECT k1.nama AS 'Atasan', k2.nama AS 'Bawahan'
FROM karyawan k1
RIGHT JOIN karyawan k2 ON k1.id_karyawan = k2.id_atasan;
