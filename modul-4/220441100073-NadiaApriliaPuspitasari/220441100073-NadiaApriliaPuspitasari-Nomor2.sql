create database db_mhs;
use db_mhs;

create table mahasiswa(
id_mahasiswa int(11) primary key,
nama varchar(100),
jurusan varchar(100),
tanggal_masuk date);

create table mata_kuliah(
id_matakuliah int(11) primary key,
nama_matakuliah varchar(100),
sks int(11),
semester varchar(20));

create table nilai(
id int(11) primary key,
id_mahasiswa int(11),
id_matakuliah int(11),
nilai varchar(2),
FOREIGN KEY (id_mahasiswa) REFERENCES mahasiswa(id_mahasiswa),
FOREIGN KEY (id_matakuliah) REFERENCES mata_kuliah(id_matakuliah));

-- Memasukkan data ke tabel mahasiswa
INSERT INTO mahasiswa (id_mahasiswa, nama, jurusan, tanggal_masuk) VALUES
(1, 'Yusufa', 'Ilmu Komputer', '2022-08-15'),
(2, 'Fahmi', 'Teknik Mesin', '2022-09-20'),
(3, 'Refli', 'Teknik Elektro', '2022-07-10'),
(4, 'Aris', 'Biologi', '2022-08-01'),
(5, 'Sarah', 'Fisika', '2022-09-05'),
(6, 'Michael', 'Ekonomi', '2022-07-25'),
(7, 'Amel', 'Psikologi', '2022-08-30'),
(8, 'Berly', 'Kimia', '2022-09-10'),
(9, 'Lisa', 'Matematika', '2022-07-15'),
(10, 'Yoga', 'Sejarah', '2022-08-20');

-- Memasukkan data ke tabel mata_kuliah
INSERT INTO mata_kuliah (id_matakuliah, nama_matakuliah, sks, semester) VALUES
(1, 'Pengantar Pemrograman', 3, 'Ganjil'),
(2, 'Kalkulus I', 4, 'Genap'),
(3, 'Komposisi Bahasa Inggris', 3, 'Ganjil'),
(4, 'Fisika I', 4, 'Genap'),
(5, 'Kimia Umum', 4, 'Ganjil'),
(6, 'Sejarah Seni', 3, 'Genap'),
(7, 'Makroekonomi', 3, 'Ganjil'),
(8, 'Psikologi 101', 3, 'Genap'),
(9, 'Aljabar Linear', 4, 'Ganjil'),
(10, 'Kimia Organik', 4, 'Genap');

-- Memasukkan data ke tabel nilai
INSERT INTO nilai (id, id_mahasiswa, id_matakuliah, nilai) VALUES
(1, 1, 1, '90'),
(2, 2, 2, '85'),
(3, 3, 4, '87'),
(4, 4, 3, '93'),
(5, 5, 5, '82'),
(6, 6, 1, '91'),
(7, 7, 4, '85'),
(8, 8, 5, '84'),
(9, 9, 2, '79'),
(10, 10, 4, '87');
drop table nilai;
-- soal 2 
DELIMITER //
CREATE PROCEDURE nilai_rata_rata()
BEGIN
	SELECT mahasiswa.nama, mata_kuliah.semester, (AVG(CAST(nilai.nilai AS DECIMAL))) AS rata_rata_nilai
    FROM mahasiswa
    JOIN nilai ON mahasiswa.id_mahasiswa = nilai.id_mahasiswa
    LEFT JOIN mata_kuliah ON nilai.id_matakuliah = mata_kuliah.id_matakuliah
    GROUP BY mahasiswa.nama, mata_kuliah.semester;
END //
DELIMITER ;
drop procedure nilai_rata_rata;
CALL nilai_rata_rata;
drop table mata_kuliah;
select * from nilai;