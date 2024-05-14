CREATE DATABASE modul4;
USE modul4;
CREATE TABLE karyawan(
	id_karyawan INT PRIMARY KEY NOT NULL,
	nama_karyawan VARCHAR(100) NOT NULL,
	posisi VARCHAR (50) NOT NULL,
	id_atasan INT)

-- insert data dummy for bawahan
INSERT INTO karyawan (id_karyawan, nama_karyawan, posisi, id_atasan)
VALUES
    (1, 'Bambang', 'Staff', 2),
    (2, 'Wati', 'Staff', 3),
    (3, 'Agus', 'Staff', 5),
    (4, 'Yanti', 'Staff', 7),
    (5, 'Hendra', 'Staff', 8),
    (6, 'Rina', 'Staff', 10),
    (7, 'Dewi', 'Staff', 2),
    (8, 'Asep', 'Staff', 3),
    (9, 'Rita', 'Staff', 5),
    (10, 'Fajar', 'Staff', 7),
    (11, 'Sinta', 'Staff', 8),
    (12, 'Joko', 'Staff', 10),
    (13, 'Sari', 'Staff', 2),
    (14, 'Hadi', 'Staff', 3),
    (15, 'Rina', 'Staff', 5),
    (16, 'Dwi', 'Staff', 7),
    (17, 'Eko', 'Staff', 8),
    (18, 'Ratna', 'Staff', 10),
    (19, 'Budi', 'Staff', 2),
    (20, 'Ani', 'Staff', 3);
INSERT INTO karyawan (id_karyawan, nama_karyawan, posisi, id_atasan)
VALUES  
    (21, 'Dodi', 'Staff', NULL),
    (22, 'Lina', 'Staff', NULL),
    (23, 'Hani', 'Staff', NULL),
    (24, 'Fahmi', 'Staff', NULL),
    (25, 'Susi', 'Staff', NULL),
    (26, 'Toni', 'Staff', NULL),
    (27, 'Dina', 'Staff', NULL),
    (28, 'Ari', 'Staff', NULL),
    (29, 'Rizki', 'Staff', NULL),
    (30, 'Ira', 'Staff', NULL),
    (31, 'Taufik', 'Staff', NULL),
    (32, 'Eka', 'Staff', NULL),
    (33, 'Fitri', 'Staff', NULL),
    (34, 'Wawan', 'Staff', NULL),
    (35, 'Dewi', 'Staff', NULL),
    (36, 'Aji', 'Staff', NULL),
    (37, 'Rini', 'Staff', NULL),
    (38, 'Mira', 'Staff', NULL),
    (39, 'Andi', 'Staff', NULL),
    (40, 'Nina', 'Staff', NULL),
    (41, 'Fajar', 'Staff', NULL),
    (42, 'Dinda', 'Staff', NULL),
    (43, 'Feri', 'Staff', NULL),
    (44, 'Maya', 'Staff', NULL),
    (45, 'Dedi', 'Staff', NULL),
    (46, 'Yani', 'Staff', NULL),
    (47, 'Mila', 'Staff', NULL),
    (48, 'Ridwan', 'Staff', NULL),
    (49, 'Dina', 'Staff', NULL),
    (50, 'Yudi', 'Staff', NULL);

SELECT k1.nama_karyawan AS 'Karyawan',k1.id_karyawan AS 'id_karyawan', k2.nama_karyawan AS 'Atasan',k2.id_karyawan AS 'id_atasan'
FROM karyawan k1
RIGHT JOIN karyawan k2 ON  k2.id_karyawan = k1.id_atasan
ORDER BY k2.nama_karyawan ;

SELECT k1.nama_karyawan AS 'Karyawan', k2.nama_karyawan AS 'Atasan'
FROM karyawan k1
RIGHT JOIN karyawan k2 ON k2.id_karyawan = k1.id_atasan
ORDER BY k2.nama_karyawan ;


