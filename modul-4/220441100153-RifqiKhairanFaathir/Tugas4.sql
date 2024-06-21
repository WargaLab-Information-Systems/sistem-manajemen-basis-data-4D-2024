--  SOAL NO 1 
create database kantor;
use kantor;

-- tambah tabel karyawan
CREATE TABLE karyawan (
  id_karyawan INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(50) NOT NULL,
  posisi VARCHAR(50) NOT NULL,
  id_atasan INT(11) DEFAULT NULL
);

-- tambah data tabel karyawan
INSERT INTO karyawan (nama, posisi, id_atasan) VALUES
('Budi', 'Manager', NULL),
('Andi', 'Supervisor', 1),
('Cici', 'Staf', 2),
('Dedi', 'Staf', 2),
('Eni', 'Staf', 1),
('Fani', 'Staf', 3),
('Gita', 'Staf', 3),
('Hadi', 'Staf', 4),
('Ika', 'Staf', 4),
('Joni', 'Staf', 5);

SELECT 
    k1.nama AS nama_karyawan,
    k1.posisi AS posisi_karyawan,
    k2.nama AS nama_atasan,
    k2.posisi AS posisi_atasan
FROM karyawan k2 RIGHT JOIN karyawan k1 ON k1.id_atasan = k2.id_karyawan
UNION
SELECT 
    NULL AS nama_karyawan,
    NULL AS posisi_karyawan,
    k3.nama AS nama_atasan,
    k3.posisi AS posisi_atasan
FROM karyawan k4 RIGHT JOIN karyawan k3 ON k3.id_karyawan = k4.id_atasan
WHERE k4.id_atasan IS NULL;


-- SOAL NO 2
create database db_mhs;
use db_mhs;

-- tambah tabel mahasiswa
CREATE TABLE mahasiswa (
  id_mahasiswa INT PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100) NOT NULL,
  jurusan VARCHAR(50) NOT NULL,
  tanggal_masuk DATE NOT NULL
);

-- tambah tabel mata_kuliah
CREATE TABLE mata_kuliah (
  id_matakuliah INT PRIMARY KEY AUTO_INCREMENT,
  nama_mata_kuliah VARCHAR(100) NOT NULL,
  sks INT NOT NULL,
  semester VARCHAR(20) NOT NULL
);

-- tambah tabel nilai
CREATE TABLE nilai (
  id_nilai INT PRIMARY KEY AUTO_INCREMENT,
  id_mahasiswa INT NOT NULL,
  id_matakuliah INT NOT NULL,
  nilai VARCHAR(2) NOT NULL,
  FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
  FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah)
);

-- tambah data tabel mahasiswa
INSERT INTO mahasiswa (nama, jurusan, tanggal_masuk) VALUES
('John Doe', 'Teknik Informatika', '2020-09-15'),
('Jane Smith', 'Sistem Informasi', '2020-08-20'),
('Alice Johnson', 'Teknik Elektro', '2020-07-10'),
('Bob Lee', 'Manajemen Bisnis', '2021-01-30'),
('Emily Wong', 'Ilmu Komunikasi', '2019-12-05'),
('Michael Chen', 'Teknik Kimia', '2020-03-18'),
('Sarah Brown', 'Teknik Mesin', '2020-11-25'),
('David Martinez', 'Akuntansi', '2020-06-12'),
('Linda Davis', 'Psikologi', '2021-02-28'),
('Chris Wilson', 'Hukum', '2019-10-03');

-- tambah data tabel mata_kuliah
INSERT INTO mata_kuliah (nama_mata_kuliah, sks, semester) VALUES
('Pemrograman Dasar', 3, '1'),
('Basis Data', 4, '2'),
('Pengantar Teknologi Informasi', 2, '1'),
('Manajemen Proyek', 3, '3'),
('Statistika', 3, '2'),
('Akuntansi Keuangan', 4, '2'),
('Fisika Dasar', 3, '1'),
('Pengantar Bisnis', 2, '1'),
('Bahasa Inggris', 2, '1'),
('Pengantar Psikologi', 3, '1');

-- tambah data tabel nilai
INSERT INTO nilai (id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 1, 'A'),
(1, 2, 'B+'),
(1, 6, 'A-'),
(2, 2, 'A'),
(2, 4, 'B'),
(3, 1, 'A'),
(3, 5, 'C'),
(4, 7, 'B+'),
(5, 9, 'A-'),
(6, 3, 'B'),
(7, 8, 'A'),
(8, 10, 'B'),
(9, 4, 'A-'),
(9, 6, 'B+'),
(10, 2, 'A'),
(10, 3, 'B'),
(10, 10, 'B-');

select * from mahasiswa;
select * from mata_kuliah;
select * from nilai;

DELIMITER //
CREATE PROCEDURE rata_rata_semester()
BEGIN
    SELECT m.nama AS mahasiswa, mk.semester,
           ROUND(AVG(CASE WHEN n.nilai = 'A' THEN 4.0
                          WHEN n.nilai = 'A-' THEN 3.7
                          WHEN n.nilai = 'B+' THEN 3.3
                          WHEN n.nilai = 'B' THEN 3.0
                          WHEN n.nilai = 'B-' THEN 2.7
                          ELSE NULL END), 1) AS rata_rata_nilai
    FROM mahasiswa m
    LEFT JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY m.nama, mk.semester;
END //
DELIMITER ;
CALL rata_rata_semester();