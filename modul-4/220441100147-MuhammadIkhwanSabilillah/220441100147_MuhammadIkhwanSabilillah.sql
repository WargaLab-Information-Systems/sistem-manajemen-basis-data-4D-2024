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
    (5, 'Robert Brown', 'Staff', 3),
    (6, 'Sarah Wilson', 'Staff', 2),
    (7, 'David Martinez', 'Staff', 3),
    (8, 'Jennifer Taylor', 'Staff', 1),
    (9, 'Daniel Anderson', 'Staff', 1),
    (10, 'Jessica White', 'Staff', 1);

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



	CREATE DATABASE univmhs;
    USE univmhs;

    CREATE TABLE IF NOT EXISTS mata_kuliah (
        id_matakuliah INT(11) PRIMARY KEY,
        nama_mk VARCHAR(100),
        sks INT(11),
        semester VARCHAR(20)
    );

    CREATE TABLE IF NOT EXISTS mahasiswa (
        id_mahasiswa INT(11) PRIMARY KEY,
        nama VARCHAR(100),
        jurusan VARCHAR(50),
        tanggal_masuk DATE
    );

    CREATE TABLE IF NOT EXISTS nilai (
        id_nilai INT(11) PRIMARY KEY,
        id_mahasiswa INT(11),
        id_matakuliah INT(11),
        nilai VARCHAR(2),
        CONSTRAINT fk_mahasiswa FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
        CONSTRAINT fk_matakuliah FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah)
    );
INSERT INTO mata_kuliah (id_matakuliah, nama_mk, sks, semester) VALUES
(1, 'Algoritma Pemrograman', 4, 'semester 1'),
(2, 'Logika Engineering', 3, 'semester 2'),
(3, 'Sistem Manajemen Basis Data', 4, 'semester 3'),
(4, 'Pemrograman Visual', 4, 'semester 4'),
(5, 'Pengantar Teknologi Informasi dan Komunikasi', 3, 'semester 1'),
(6, 'Riset Operasi', 3, 'semester 2'),
(7, 'Pemrograman Web', 4, 'semester 3'),
(8, 'Pemrograman Objek', 4, 'semester 4'),
(9, 'Rekayasa Perangkat Lunak', 3, 'semester 1'),
(10, 'Manajemen Proyek TI', 3, 'semester 2');


    INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES 
    (1, 'Nasikh', 'Jurusan 1', '2022-01-01'), 
    (2, 'Ali', 'Jurusan 2', '2022-01-01'), 
    (3, 'andre', 'Jurusan 3', '2022-01-01'), 
    (4, 'sabil', 'Jurusan 4', '2022-01-01'), 
    (5, 'rizky', 'Jurusan 5', '2022-01-01'), 
    (6, 'mahmud', 'Jurusan 6', '2022-01-01'), 
    (7, 'ganjar', 'Jurusan 7', '2022-01-01'), 
    (8, 'muhammad', 'Jurusan 8', '2022-01-01'), 
    (9, 'dwi', 'Jurusan 9', '2022-01-01'), 
    (10, 'rosi', 'Jurusan 10', '2022-01-01'),
    (11, 'habib', 'Jurusan 3','2022-01-01'), 
    (12, 'anggun','Jurusan 2', '2022-01-01');
    
	INSERT INTO nilai (id_nilai, id_mahasiswa, id_matakuliah, nilai) VALUES
    (1, 1, 1, '80'),
    (2, 1, 2, '80'),
    (3, 2, 1, '85'),
    (4, 2, 2, '87'),
    (5, 3, 1, '86'),
    (6, 3, 2, '98'),
    (7, 4, 1, '86'),
    (8, 4, 2, '87'),
    (9, 5, 1, '87'),
    (10, 5, 2, '81');

     DELIMITER //
    CREATE PROCEDURE rataanilai(
        OUT p_nama_mahasiswa VARCHAR(100),
        OUT p_semester VARCHAR(20),
        OUT p_rata_nilai Float(5,2)
    )
    BEGIN
        SELECT
            m.nama AS nama_mahasiswa,
            mk.semester,
            AVG(n.nilai) AS rata_nilai
        FROM
            mahasiswa m
        LEFT JOIN
            nilai n ON m.id_mahasiswa = n.id_mahasiswa
        LEFT JOIN
            mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
        GROUP BY
            m.nama, mk.semester ;
    END //
    DELIMITER ;
    CALL rataanilai(@p_nama_mahasiswa, @p_semester, @p_rata_nilai);
