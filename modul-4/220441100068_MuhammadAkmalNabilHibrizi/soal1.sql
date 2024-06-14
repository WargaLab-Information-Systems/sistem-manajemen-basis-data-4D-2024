CREATE DATABASE db_kerja;
USE db_kerja;

CREATE TABLE karyawan (
    id_karyawan INT PRIMARY KEY,
    nama VARCHAR(100),
    posisi VARCHAR(50),
    id_atasan INT,
    FOREIGN KEY (id_atasan) REFERENCES karyawan(id_karyawan));

INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'Akmal Nabil', 'Manager', NULL),
(2, 'Yala Diana', 'Supervisor', 1),
(3, 'David Lion', 'Analyst', 2),
(4, 'Emily Juli', 'Staff', 2),
(5, 'Marchelio', 'Analyst', 2),
(6, 'Sarah Adam', 'Staff', 2);

SELECT * FROM karyawan;

SELECT a.nama AS 'Karyawan', b.nama AS 'Atasan'
FROM karyawan a
LEFT JOIN karyawan b ON a.id_atasan = b.id_karyawan;

SELECT a.nama AS 'Atasan', b.nama AS 'Karyawan'
FROM karyawan a
RIGHT JOIN karyawan b ON a.id_karyawan = b.id_atasan;
