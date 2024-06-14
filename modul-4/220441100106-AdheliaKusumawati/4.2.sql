create database kuliah;
use kuliah;

CREATE TABLE mata_kuliah (
  id_matakuliah INT (11) PRIMARY KEY,
  nama_mata_kuliah VARCHAR(100),
  sks INT (11),
  semester VARCHAR(20)
);

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester) VALUES
(1, 'Matematika Dasar', 3, 'Ganjil'),
(2, 'Fisika Dasar', 4, 'Ganjil'),
(3, 'Kimia Dasar', 3, 'Ganjil'),
(4, 'Pemrograman Dasar', 3, 'Genap'),
(5, 'Pengantar Ilmu Komputer', 2, 'Ganjil'),
(6, 'Bahasa Inggris', 2, 'Ganjil'),
(7, 'Statistika Dasar', 3, 'Genap'),
(8, 'Aljabar Linear', 3, 'Genap'),
(9, 'Pemrograman Lanjut', 4, 'Genap'),
(10, 'Basis Data', 3, 'Genap');

CREATE TABLE mahasiswa (
  id_mahasiswa INT(11) PRIMARY KEY,
  nama VARCHAR(100),
  jurusan VARCHAR(50),
  tanggal_masuk DATE
);

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
(11, 'Andrew New', 'Teknik Informatika', '2023-09-01'),
(12, 'Jeff Smith', 'Manajemen', '2023-09-01'),
(13, 'Michael Johnson', 'Psikologi', '2023-09-01'),
(14, 'Emily Watson', 'Teknik Elektro', '2023-09-01'),
(15, 'Daniel Wilson', 'Akuntansi', '2023-09-01'),
(16, 'Sarah Taylor', 'Teknik Sipil', '2023-09-01'),
(17, 'David Martinez', 'Ilmu Komunikasi', '2023-09-01'),
(18, 'Jessica Lee', 'Hukum', '2023-09-01'),
(19, 'Kevin Rodriguez', 'Kedokteran', '2023-09-01'),
(20, 'Amanda Garcia', 'Desain Grafis', '2023-09-01');

CREATE TABLE nilai (
  id INT(11) PRIMARY KEY,
  id_mahasiswa INT(11),
  id_matakuliah INT(11),
  nilai VARCHAR(2),
  FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa),
  FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah (id_matakuliah)
);
DROP TABLE NILAI;
INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES
(21, 11, 1, '90'),
(22, 12, 2, '70'),
(23, 13, 4, '78'),
(24, 14, 3, '98'),
(25, 15, 5, '86'),
(26, 11, 2, '79'),
(27, 12, 3, '77'),
(28, 13, 4, '88'),
(29, 14, 5, '89'),
(30, 15, 6, '81');

DROP TABLE mata_kuliah;
drop table nilai;
-- Gunakan inner join antara tabel (mahasiswa) dan tabel (nilai) berdasarkan id_mahasiswa!
-- Gunakan left join antara hasil inner join sebelumnya dan tabel (mata_kuliah) berdasarkan id_matakuliah!
-- Rata-rata nilai harus dihitung berdasarkan nilai yang ada di tabel (nilai)!
DELIMITER //
CREATE PROCEDURE Calculate()
BEGIN
    SELECT m.nama AS Nama_Mahasiswa, mk.semester AS Semester, (AVG(CAST(n.nilai AS double))) AS Rata_Rata_Nilai
    FROM mahasiswa m
	JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY m.nama, mk.semester;
END //
DELIMITER ;
CALL Calculate();
DROP PROCEDURE Calculate;