CREATE DATABASE penilaian;
USE penilaian;

CREATE TABLE mahasiswa(
	id_mahasiswa INT NOT NULL PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jurusan VARCHAR(50) NOT NULL,
    tanggal_masuk DATE NOT NULL
);
DESC mahasiswa;

CREATE TABLE matakuliah(
	id_matakuliah INT NOT NULL PRIMARY KEY,
    nama_matakuliah VARCHAR(100),
    sks INT NOT NULL,
    semester VARCHAR(20)
);
DESC matakuliah;

CREATE TABLE nilai(
	id_nilai INT NOT NULL PRIMARY KEY,
    id_mahasiswa INT NOT NULL,
    id_matakuliah INT NOT NULl,
    nilai VARCHAR(2),
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
    FOREIGN KEY (id_matakuliah) REFERENCES matakuliah(id_matakuliah)
);
DESC nilai;

INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
	(1, 'Ahmad', 'Teknik Informatika', '2022-01-10'),
	(2, 'Budi', 'Manajemen', '2021-09-15'),
	(3, 'Citra', 'Psikologi', '2023-03-20'),
	(4, 'Dewi', 'Ilmu Komunikasi', '2022-07-05'),
	(5, 'Eka', 'Hukum', '2021-11-30'),
	(6, 'Fajar', 'Teknik Elektro', '2023-02-12'),
	(7, 'Gita', 'Ekonomi', '2022-05-18'),
	(8, 'Hadi', 'Farmasi', '2021-08-25'),
	(9, 'Indra', 'Kedokteran', '2023-01-03'),
	(10, 'Joko', 'Akuntansi', '2022-09-08');
SELECT * FROM mahasiswa;

INSERT INTO matakuliah (id_matakuliah, nama_matakuliah, sks, semester) VALUES
	(11, 'Matematika Dasar', 3, 'Gasal'),
	(12, 'Fisika Dasar', 4, 'Gasal'),
	(13, 'Kimia Dasar', 4, 'Gasal'),
	(14, 'Pengantar Ilmu Komputer', 3, 'Gasal'),
	(15, 'Pengantar Ekonomi', 3, 'Gasal'),
	(16, 'Statistika', 3, 'Genap'),
	(17, 'Kalkulus', 4, 'Genap'),
	(18, 'Basis Data', 3, 'Genap'),
	(19, 'Pemrograman', 4, 'Genap'),
	(20, 'Manajemen Bisnis', 3, 'Genap');
SELECT * FROM matakuliah;

INSERT INTO nilai (id_nilai, id_mahasiswa, id_matakuliah, nilai) VALUES
	(21, 1, 11, '80'),
	(22, 2, 12, '95'),
	(23, 3, 13, '85'),
	(24, 3, 14, '70'),
	(25, 4, 15, '75'),
	(26, 4, 16, '90'),
	(27, 5, 17, '85'),
	(28, 5, 18, '90'),
	(29, 6, 19, '75'),
	(30, 6, 20, '70');
SELECT * FROM nilai;
DROP TABLE nilai;


DELIMITER //
CREATE PROCEDURE HitungRataRataNilai(
    IN nama_mahasiswa VARCHAR(100)
)
BEGIN
    SELECT m.nama AS 'Nama Mahasiswa', mk.semester, AVG(CAST(n.nilai AS DECIMAL(4, 2))) AS 'Rata-rata Nilai'
    FROM mahasiswa m
    CROSS JOIN matakuliah mk
    LEFT JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa AND mk.id_matakuliah = n.id_matakuliah
    WHERE m.nama = nama_mahasiswa OR nama_mahasiswa IS NULL
    GROUP BY m.nama, mk.semester;
END //
DELIMITER ;
CALL HitungRataRataNilai(NULL);



DELIMITER //
CREATE PROCEDURE rata_rata()
BEGIN
    SELECT m.nama AS Nama_Mahasiswa, mk.semester AS Semester, ROUND(AVG(CAST(n.nilai AS DECIMAL))) AS Rata_Rata_Nilai
    FROM mahasiswa m
    INNER JOIN  nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN matakuliah mk ON n.id_matakuliah = mk.id_matakuliah
    GROUP BY m.nama, mk.semester
    ORDER BY m.nama, mk.semester;
END //
DELIMITER ;
DROP PROCEDURE rata_rata;
CALL rata_rata();