CREATE DATABASE TG4a_karyawan;
USE TG4a_karyawan;

-- Membuat tabel karyawan
CREATE TABLE karyawan (
    id_karyawan INT (11) PRIMARY KEY,
    nama VARCHAR(100),
    posisi VARCHAR(50),
    id_atasan INT(11),
    FOREIGN KEY (id_atasan) REFERENCES karyawan(id_karyawan)
);

-- Mengisi tabel karyawan dengan data
INSERT INTO karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'Agus', 'CEO', NULL),
(2, 'Budi', 'Manager', 1),
(3, 'Citra', 'Supervisor', 2),
(4, 'Dedi', 'kasir', 2),
(5, 'Eka', 'kasir', 2);
select * from karyawan;

-- 1: Self Join Mengaitkan Karyawan dengan Atasan Mereka
SELECT ky.id_karyawan, ky.nama as karyawan , ats.nama as atasan
FROM karyawan ky
LEFT JOIN karyawan ats
ON ky.id_atasan = ats.id_karyawan;

-- 2: Right Join Atasan Tidak punya Bawahan Tetap Ditampilkan 
SELECT  ats.nama as atasan, ky.id_karyawan, ky.nama as karyawan
FROM karyawan ky
JOIN karyawan ats
ON ky.id_atasan = ats.id_karyawan;
