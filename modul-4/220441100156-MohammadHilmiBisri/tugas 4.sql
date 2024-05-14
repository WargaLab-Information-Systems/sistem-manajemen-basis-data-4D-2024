    CREATE DATABASE IF NOT EXISTS db_karyawan;

    USE db_karyawan;

    CREATE TABLE IF NOT EXISTS karyawan (
        id_karyawan INT(11) PRIMARY KEY AUTO_INCREMENT,
        nama VARCHAR(100),
        posisi VARCHAR(50),
        id_atasan INT(11)
    );
    INSERT INTO karyawan (nama, posisi, id_atasan) VALUES ('Karyawan 1', 'Posisi 1', 1), ('Karyawan 2', 'Posisi 2', 1), ('Karyawan 3', 'Posisi 3', 1), ('Karyawan 4', 'Posisi 4', 1), ('Karyawan 5', 'Posisi 5', 1), ('Karyawan 6', 'Posisi 6', 1), ('Karyawan 7', 'Posisi 7', 1), ('Karyawan 8', 'Posisi 8', 1), ('Karyawan 9', 'Posisi 9', 1), ('Karyawan 10', 'Posisi 10', 1);

    INSERT INTO karyawan (nama, posisi) VALUES ('Karyawan 11', 'Posisi 11'), ('Karyawan 12', 'Posisi 12'), ('Karyawan 13', 'Posisi 13'), ('Karyawan 14', 'Posisi 14'), ('Karyawan 15', 'Posisi 15'), ('Karyawan 16', 'Posisi 16'), ('Karyawan 17', 'Posisi 17'), ('Karyawan 18', 'Posisi 18'), ('Karyawan 19', 'Posisi 19'), ('Karyawan 20', 'Posisi 20');


    SELECT
        k.nama AS karyawan,
        a.id_atasan AS atasan
    FROM
        karyawan k, karyawan a
    WHERE
        k.id_atasan = a.id_karyawan OR
        (k.id_atasan IS NULL AND a.id_karyawan IS NULL);

    SELECT
        k.nama AS karyawan,
        a.id_atasan AS atasan
    FROM
        karyawan k
    RIGHT JOIN
        karyawan a ON k.id_atasan = a.id_karyawan;



    CREATE DATABASE IF NOT EXISTS mahastudent;

    USE mahastudent;

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
    (1, 'Matakuliah 1', 3, 'Semester 1'),
    (2, 'Matakuliah 2', 4, 'Semester 2'),
    (3, 'Matakuliah 3', 3, 'Semester 1'),
    (4, 'Matakuliah 4', 2, 'Semester 3'),
    (5, 'Matakuliah 5', 3, 'Semester 2'),
    (6, 'Matakuliah 6', 4, 'Semester 4'),
    (7, 'Matakuliah 7', 3, 'Semester 1'),
    (8, 'Matakuliah 8', 2, 'Semester 3'),
    (9, 'Matakuliah 9', 3, 'Semester 2'),
    (10, 'Matakuliah 10', 4, 'Semester 4');

    INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES (1, 'Mahasiswa 1', 'Jurusan 1', '2022-01-01'), (2, 'Mahasiswa 2', 'Jurusan 2', '2022-01-01'), (3, 'Mahasiswa 3', 'Jurusan 3', '2022-01-01'), (4, 'Mahasiswa 4', 'Jurusan 4', '2022-01-01'), (5, 'Mahasiswa 5', 'Jurusan 5', '2022-01-01'), (6, 'Mahasiswa 6', 'Jurusan 6', '2022-01-01'), (7, 'Mahasiswa 7', 'Jurusan 7', '2022-01-01'), (8, 'Mahasiswa 8', 'Jurusan 8', '2022-01-01'), (9, 'Mahasiswa 9', 'Jurusan 9', '2022-01-01'), (10, 'Mahasiswa 10', 'Jurusan 10', '2022-01-01');

    INSERT INTO nilai (id_nilai, id_mahasiswa, id_matakuliah, nilai) VALUES
    (1, 1, 1, 'A'),
    (2, 1, 2, 'B'),
    (3, 2, 1, 'C'),
    (4, 2, 2, 'A'),
    (5, 3, 1, 'B'),
    (6, 3, 2, 'C'),
    (7, 4, 1, 'A'),
    (8, 4, 2, 'B'),
    (9, 5, 1, 'C'),
    (10, 5, 2, 'A');
        INSERT INTO nilai (id_nilai, id_mahasiswa, id_matakuliah, nilai) VALUES
    (11, 1, 1, '90'),
    (12, 1, 2, '80'),
    (13, 2, 1, '80'),
    (14, 2, 2, '90'),
    (15, 3, 1, '80'),
    (16, 3, 2, '75'),
    (17, 4, 1, '90'),
    (18, 4, 2, '85'),
    (19, 5, 1, '99'),
    (20, 5, 2, '89');

    DELIMITER $$
    CREATE PROCEDURE RATANILAI()
    BEGIN
        SELECT
            m.nama AS nama_mahasiswa,
            mk.semester,
            AVG(n.nilai) AS rata_rata_nilai
        FROM
            mahasiswa m
        INNER JOIN
            nilai n ON m.id_mahasiswa = n.id_mahasiswa
        LEFT JOIN
            mata_kuliah mk ON n.id_matakuliah = mk.id_matakuliah
        GROUP BY
            m.nama, mk.semester;
    END$$
    DELIMITER ;