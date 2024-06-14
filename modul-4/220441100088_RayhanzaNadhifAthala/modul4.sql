create database modul4;
use modul4;


CREATE TABLE karyawan (
  id_karyawan INT(11) PRIMARY KEY AUTO_INCREMENT,
  nama VARCHAR(100) NOT NULL,
  posisi VARCHAR(50) NOT NULL,
  id_atasan INT(11) DEFAULT NULL
);

INSERT INTO karyawan (nama, posisi, id_atasan) VALUES
('Budi', 'Manajer', NULL),
('Wijaya', 'Asisten Manajer', 1),
('Dewi ', 'Staf', 1),
('Putra ', 'Staf', 2),
('Sari ', 'Staf', 2),
('Indra ', 'Staf', 1),
('Lina ', 'Staf', 4),
('Adi ', 'Staf', 4),
('Rina', 'Staf', 2),
('Fauzi', 'Staf', 1);


CREATE TABLE mata_kuliah(
	id_matakuliah INT PRIMARY KEY NOT NULL,
	nama_mata_kuliah VARCHAR (100) NOT NULL,
	sks INT NOT NULL,
	semester VARCHAR (20)NOT NULL
);


select * from mahasiswa;
delete from mahasiswa where id_mahasiswa = 11;
delete from nilai where id =2;
select * from nilai;

CREATE TABLE mahasiswa (
	id_mahasiswa INT PRIMARY KEY NOT NULL,
	nama VARCHAR (100) NOT NULL,
	jurusan VARCHAR (50) NOT NULL,
	tanggal_masuk DATE NOT NULL
);


CREATE TABLE nilai(
	id INT PRIMARY KEY NOT NULL,
	id_mahasiswa INT NOT NULL,
	id_matakuliah INT NOT NULL,
	nilai VARCHAR (2),
	FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
	FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah)
);

INSERT INTO mata_kuliah (id_matakuliah, nama_mata_kuliah, sks, semester) VALUES
(1, 'Logika Informatika', 2, 'Ganjil'),
(2, 'Sistem Operasi', 4, 'Genap'),
(3, 'Pengantar Teknologi Informasi', 2, 'Ganjil'),
(4, 'Komunikasi Data dan Jaringan', 3, 'Genap'),
(5, 'Pemrograman Berorientasi Objek', 4, 'Ganjil'),
(6, 'Analisis Algoritma', 3, 'Genap'),
(7, 'Manajemen Proyek Perangkat Lunak', 3, 'Ganjil'),
(8, 'Etika Profesi', 2, 'Genap'),
(9, 'Pemrograman Mobile', 3, 'Ganjil'),
(10, 'Keamanan Informasi', 3, 'Genap');

insert into mahasiswa(nama, jurusan, tanggal_masuk)VALUES
('Nadhif',' Teknik Mesin','2022-07-03' ),
('Akmal',' Teknik Elektro','2022-06-18' ),
('Andi',' Teknik Mekatronika','2022-09-22' );
select * from nilai;

insert into mahasiswa(nama, jurusan, tanggal_masuk)VALUES
(1,9,3.5),
(1,1,4.5),
(1,3,2.5),
(2,3,2.5),
(2,7,3.5),
(2,1,3),
(3,1,2.5),
(3,9,2.5),
(3,3,3.5);


-- nomer1
SELECT karyawan2.Nama AS Nama_Karyawan, karyawan2.Posisi AS Posisi_Karyawan, karyawan1.Nama AS Nama_Atasan, karyawan1.Posisi AS Posisi_Atasan
FROM Karyawan karyawan1
RIGHT JOIN Karyawan karyawan2 ON karyawan1.id_Karyawan = karyawan2.id_atasan
ORDER BY karyawan2.id_Karyawan;

-- nomer2
DELIMITER //
CREATE PROCEDURE nomer2()
BEGIN
    SELECT mahasiswa.nama AS 'Nama Mahasiswa', mata_kuliah.semester AS 'Semester', 
        AVG(nilai) AS 'Rata-rata Nilai'
    FROM mahasiswa
    JOIN nilai n ON mahasiswa.id_mahasiswa = n.id_mahasiswa
    LEFT JOIN mata_kuliah ON n.id_matakuliah = mata_kuliah.id_matakuliah
    GROUP BY mahasiswa.nama, mata_kuliah.semester;
END //
DELIMITER 
call nomer2();
select * from nilai;
