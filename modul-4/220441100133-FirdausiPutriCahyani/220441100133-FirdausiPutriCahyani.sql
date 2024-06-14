-- Nomor 1
CREATE DATABASE karyawan;
USE karyawan;

CREATE TABLE Karyawan(
	id_karyawan INT(11) PRIMARY KEY,
	nama VARCHAR(100),
	posisi VARCHAR(50),
	id_atasan INT(11)
);

INSERT INTO Karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(1, 'Budi', 'Manager', NULL),
(2, 'Siti', 'Supervisor', 1),
(3, 'Dewi', 'Staff', 2),
(4, 'Putra', 'Staff', 2),
(5, 'Lina', 'Supervisor', 1);

INSERT INTO Karyawan (id_karyawan, nama, posisi, id_atasan) VALUES
(7, NULL, 'Supervisor', 3);

SELECT k1.nama AS Karyawan, k2.nama AS Atasan
FROM Karyawan k1
RIGHT JOIN Karyawan k2 ON k1.id_atasan = k2.id_karyawan
ORDER BY k2.nama;


-- Silahkan tampilkan daftar karyawan beserta nama atasan mereka. Jika seorang
-- karyawan tidak memiliki atasan, tetap tampilkan namanya tetapi kolom atasan langsung
-- diisi dengan nilai NULL. Namun, pastikan untuk tetap menampilkan atasan yang tidak
-- memiliki bawahan.

-- Ketentuan!
-- Gunakan self join pada tabel (karyawan) untuk mengaitkan karyawan dengan atasan mereka!
-- Gunakan right join untuk memastikan bahwa atasan yang tidak memiliki bawahan
-- tetap ditampilkan dalam hasilnya!

SELECT k1.nama AS Karyawan, k2.nama AS Atasan
FROM Karyawan k1
RIGHT JOIN Karyawan k2 ON k1.id_atasan = k2.id_karyawan
UNION ALL
SELECT k1.nama AS Karyawan, k2.nama AS Atasan
FROM Karyawan k1
LEFT JOIN Karyawan k2 ON k1.id_atasan = k2.id_karyawan 
ORDER BY Atasan, Karyawan;

-- Nomor 2
CREATE DATABASE kuliah;
USE kuliah;

CREATE TABLE mata_kuliah(
id_matakuliah INT(11) PRIMARY KEY,
nama_mata_kuliah VARCHAR(100),
sks INT(11),
semester VARCHAR(20)
);

CREATE TABLE mahasiswa(
id_mahasiswa INT(11) PRIMARY KEY,
nama VARCHAR(100),
jurusan VARCHAR(50),
tanggal_masuk DATE
);

CREATE TABLE nilai(
id INT(11) PRIMARY KEY,
id_mahasiswa INT(11),
id_matakuliah INT(11),
nilai VARCHAR(2),
FOREIGN KEY(id_matakuliah) REFERENCES mata_kuliah(id_matakuliah),
FOREIGN KEY(id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa)
);

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester) VALUES
(1, 'Matematika Dasar', 3, 'Ganjil'),
(2, 'Bahasa Inggris', 2, 'Genap'),
(3, 'Fisika Dasar', 3, 'Ganjil'),
(4, 'Kimia Dasar', 3, 'Genap'),
(5, 'Sejarah Indonesia', 2, 'Ganjil'),
(6, 'Pemrograman Dasar', 4, 'Genap'),
(7, 'Ekonomi Makro', 3, 'Ganjil'),
(8, 'Statistika', 3, 'Genap'),
(9, 'Akuntansi Dasar', 3, 'Ganjil'),
(10, 'Pengantar Bisnis', 2, 'Genap'),
(11, 'Kewarganegaraan', 3, 'Genap'),
(12, 'Pancasila', 2, 'Genap');

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
(1, 'Ahmad', 'Teknik Informatika', '2000-08-15'),
(2, 'Siti', 'Manajemen', '2001-03-25'),
(3, 'Budi', 'Akuntansi', '2002-11-10'),
(4, 'Dewi', 'Psikologi', '2003-05-03'),
(5, 'Rina', 'Teknik Sipil', '2004-09-20'),
(6, 'Fajar', 'Kedokteran', '2005-01-12'),
(7, 'Santi', 'Hukum', '2006-07-30'),
(8, 'Joko', 'Ekonomi', '2007-12-05'),
(9, 'Lina', 'Farmasi', '2008-02-18'),
(10, 'Andi', 'Arsitektur', '2009-10-09');

INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 2, 1, '80'),
(2, 2, 2, '85'),
(3, 3, 3, '75'),
(4, 4, 4, '70'),
(5, 5, 5, '65'),
(6, 5, 6, '90'),
(7, 9, 7, '80'),
(8, 8, 8, '85'),
(9, 9, 9, '75'),
(10, 10, 10, '70'),
(11, 11, NULL, NULL),
(12, 12, NULL, NULL);

-- membuat stored procedure yang menghasilkan rata-rata nilai dari setiap
-- mahasiswa untuk setiap semester yang mereka ambil. Procedure tersebut harus
-- mengembalikan nama mahasiswa, semester, dan rata-rata nilai. Pastikan untuk
-- menyertakan mahasiswa yang tidak mengambil mata kuliah pada semester tertentu
-- dalam hasilnya, dengan nilai rata-rata mereka dihitung sebagai NULL.
-- Ketentuan!
-- • Gunakan inner join antara tabel (mahasiswa) dan tabel (nilai) berdasarkan
-- id_mahasiswa!
-- • Gunakan left join antara hasil inner join sebelumnya dan tabel (mata_kuliah)
-- berdasarkan id_matakuliah!
-- • Rata-rata nilai harus dihitung berdasarkan nilai yang ada di tabel (nilai)!

DELIMITER //
CREATE PROCEDURE rata_rata_nilai(
	OUT nama_mhs VARCHAR (255),
    OUT sem VARCHAR (115),
	OUT rerata FLOAT (11)
)
BEGIN
    SELECT mhs.nama AS Nama_Mahasiswa, mk.semester AS Semester, AVG(CAST(n.nilai AS DECIMAL)) AS Rata_Rata_Nilai
    FROM mahasiswa mhs
    INNER JOIN nilai n ON mhs.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY mhs.nama, mk.semester;
END //
DELIMITER ;
CALL rata_rata_nilai(@nama_mhs, @sem, @rerata);

