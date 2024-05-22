
USE modul4;

CREATE DATABASE modul4;

CREATE TABLE mata_kuliah (
    id_matakuliah INT (11) AUTO_INCREMENT PRIMARY KEY,
    nama_mata_kuliah VARCHAR(20),
    sks INT(11),
    semester VARCHAR (20)
);

CREATE TABLE  mahasiswa (
    id_mahasiswa INT(11) AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR (100),
    jurusan VARCHAR (50),
    tanggal_masuk DATE
);

CREATE TABLE nilai (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    id_mahasiswa INT(11),
    id_matakuliah INT(11),
    nilai VARCHAR(3),
    FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa (id_mahasiswa),
    FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah (id_matakuliah)
);


-- Memasukkan data ke dalam tabel mata_kuliah
INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester)
VALUES
    (1, 'Matematika', 3, 'Ganjil'),
    (2, 'Fisika Dasar', 4, 'Ganjil'),
    (3, 'Bahasa Inggris', 2, 'Genap'),
    (4, 'Algoritma dan Pemrograman', 3, 'Genap'),
    (5, 'Kimia Dasar', 3, 'Ganjil');


-- Memasukkan data ke dalam tabel mahasiswa
INSERT INTO mahasiswa (nama, jurusan, tanggal_masuk)
VALUES
    ('Andi', 'Teknik Informatika', '2023-09-10'),
    ('Budi', 'Sistem Informasi', '2023-09-12'),
    ('Cindy', 'Teknik Elektro', '2023-09-15'),
    ('Dewi', 'Teknik Mesin', '2023-09-20'),
    ('Eka', 'Teknik Industri', '2023-09-25');

-- Memasukkan data ke dalam tabel nilai
INSERT INTO nilai (id_mahasiswa, id_matakuliah, nilai)
VALUES
    (1, 1, 85),
    (2, 1, 75),
    (3, 1, 85),
    (4, 1, 75),
    (5, 1, 85),
    (1, 2, 70),
    (2, 2, 80),
    (3, 2, 80),
    (4, 2, 90),
    (5, 2, 70),
    (1, 3, 75),
    (2, 3, 85),
    (3, 3, 75),
    (4, 3, 85),
    (5, 3, 75),
    (1, 4, 80),
    (2, 4, 90),
    (3, 4, 70),
    (4, 4, 80),
    (5, 4, 90),
    (1, 5, 85),
    (2, 5, 75),
    (3, 5, 85),
    (4, 5, 75),
    (5, 5, 85);


-- INNER JOIN
DELIMITER //

CREATE PROCEDURE GetMahasiswaNilai()
BEGIN
    SELECT m.nama AS nama_mahasiswa, n.nilai
    FROM mahasiswa m
    INNER JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa;
END//

DELIMITER ;

CALL GetMahasiswaNilai

-- LEFT JOIN

DELIMITER //

CREATE PROCEDURE GetMahasiswaNilaiMataKuliah()
BEGIN
    SELECT m.nama AS nama_mahasiswa, mk.nama_mata_kuliah, n.nilai
    FROM mahasiswa m
    INNER JOIN nilai n ON m.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah;
END//

DELIMITER ;

CALL GetMahasiswaNilaiMataKuliah


-- RATA RATA
DELIMITER //

CREATE PROCEDURE GetRataRataKeseluruhan()
BEGIN
    SELECT AVG(CAST(nilai AS DECIMAL(5,2))) AS rata_rata_keseluruhan
    FROM nilai;
END//

DELIMITER ;

CALL GetRataRataKeseluruhan


DELIMITER //

CREATE PROCEDURE soal2()
BEGIN
    SELECT
        m.nama AS nama_mahasiswa,
        m.id_mahasiswa,
        mk.semester,
        AVG(nilai.nilai) AS rata_rata_nilai
    FROM
        nilai
    INNER JOIN
        mahasiswa m ON nilai.id_mahasiswa = m.id_mahasiswa
    INNER JOIN
        mata_kuliah mk ON nilai.id_matakuliah = mk.id_matakuliah
    GROUP BY
        m.nama, mk.semester;
END //

DELIMITER ;
CALL soal2();

