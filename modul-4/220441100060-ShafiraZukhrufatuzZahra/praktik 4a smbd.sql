CREATE DATABASE db_modul4;
USE db_modul4;

CREATE TABLE karyawan (
  id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(255) NOT NULL,
  posisi VARCHAR(255) NOT NULL,
  id_atasan INT,
  FOREIGN KEY (id_atasan) REFERENCES karyawan(id_karyawan)
);
DESC karyawan;
INSERT INTO karyawan (nama, posisi, id_atasan) VALUES
	('Budi', 'Manager', NULL),
	('Ani', 'Manager', NULL),
    ('Cici', 'Programmer', 1),
    ('Dini', 'Programmer', 1),
    ('Edi', 'Programmer', NULL);
SELECT * FROM karyawan;
drop table karyawan;

-- SOAL
SELECT
  k1.nama AS karyawan,
  k2.nama AS atasan
FROM karyawan k1
INNER JOIN karyawan k2 ON k1.id_atasan = k2.id_karyawan
ORDER BY k2.id_karyawan;

--  MENGHILANGKAN NULL MENGGUNAKAN INNER