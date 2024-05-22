CREATE DATABASE db_utm;

USE db_utm;

CREATE TABLE mahasiswa (
    id_mahasiswa INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    nim INT(11) UNIQUE,
    fakultas VARCHAR(50),
    prodi VARCHAR(50),
status_mhs VARCHAR(50),
tanggal date
);

INSERT INTO mahasiswa VALUES (1,'Rayhanza Nadhif', 220441100,'teknik', 'Informatika','aktif','-');
INSERT INTO mahasiswa VALUES (2,'Alfiandi', 220441213,'teknik', 'Informatika','aktif','-');
INSERT INTO mahasiswa VALUES (3,'Rifqi Khairan', 220441122,'teknik', 'Mesin','aktif','-');
INSERT INTO mahasiswa VALUES (4,'Akmal Nabil', 220441133,'FEB', 'manajemen','aktif','-');
INSERT INTO mahasiswa VALUES (5,'Anisyafaah', 220441144,'teknik', 'Elektro','aktif','-');
INSERT INTO mahasiswa VALUES (6,'Makin Amin', 220441155,'teknik', 'Industri','aktif','-');
INSERT INTO mahasiswa VALUES (7,'Nadhif AThala', 2204310,'teknik', 'Informatika','lulus','2024-03-02');
INSERT INTO mahasiswa VALUES (8,'Syahrul Ramadhani', 220441166,'teknik', 'Industri','lulus','2024-03-02');
INSERT INTO mahasiswa VALUES (9,'Birrur Rijaal', 220441192,'teknik', 'Informatika','berhenti','2023-03-02');
INSERT INTO mahasiswa VALUES (10,'Rehan Ramadhan', 220441128,'teknik', 'Industri','berhenti','2023-03-02');



DELETE FROM mahasiswa WHERE id=7;

CREATE TABLE Dosen (
    ID_Dosen INT AUTO_INCREMENT PRIMARY KEY,
    Nama VARCHAR(255),
    NIP int (15) UNIQUE,
    Program_Studi VARCHAR(100),
    Jabatan VARCHAR(100)
);

INSERT INTO Dosen VALUES (1,'Abdullah S.Kom., M.Kom', 11223311441,'Sistem Informasi', 'Dekan');
INSERT INTO Dosen VALUES (2,'Sri S.Kom., M.Kom', 2132383113,'teknik', 'Informatika');
INSERT INTO Dosen VALUES (3,'Ahmad Bazuki S.Kom., M.Kom', 2132383112,'teknik', 'Mesin');
INSERT INTO Dosen VALUES (4,'Muhammad Arsi S.Kom., M.Kom', 220441133,'Sistem Informasi', 'KoorProdi');
INSERT INTO Dosen VALUES (5,'Abdullah Ahmad S.T., M.T', 220441134,'Teknik Mesin', 'KoorProdi');
INSERT INTO Dosen VALUES (6,'Abdullah S.T., M.T', 220441130,'Teknik Elektro', 'KoorProdi');
INSERT INTO Dosen VALUES (7,'Ahmad Yudha S.T., M.T', 220441135,'Teknik Elektro', 'Dosen');
INSERT INTO Dosen VALUES (8,'Muhammad Doni S.T., M.T', 220441136,'Teknik Industri', 'KoorProdi');
INSERT INTO Dosen VALUES (9,'Dwi Rinjani S.T., M.T', 220441137,'Teknik Industri', 'Wakil Dekan');
INSERT INTO Dosen VALUES (10,'Ahamd Rizal S.T., M.T', 220441138,'Teknik Informatika', 'Wakil Dekan 2');

SELECT * from Dosen;

CREATE TABLE KRS (id_krs INT AUTO_INCREMENT PRIMARY KEY,
    NAMA VARCHAR (100),
    NIM VARCHAR (20),
    Kode_Mata_Kuliah VARCHAR(20),
    Nama_Mata_Kuliah VARCHAR(100),
    SKS INT, Semester INT);
    
INSERT INTO krs (NAMA, NIM, Kode_Mata_Kuliah, Nama_Mata_Kuliah, SKS, Semester) VALUES
('RAYHANZA NADHIF','220441100045', 'PB1', 'Pemrograman Bergerak', 4, 4),
('ANISYAFAAH','220441100047', 'SMBD2', 'Sistem Manajemen Basis Data', 4, 4),
 ('RIFQI KHAIRAN','220441100075', 'AP2', 'Algoritma Pemrograman', 4, 4),
 ('SYAHRUL RAMADHANI','210441100007', 'AP4', 'Algoritma Pemrograman', 4, 6),
 ('AKMAL NABIL','210441100110', 'E2', 'E-Ecom', 3, 6),
 ('BIRRUR RIJAAL','230441100010', 'PBO6', 'Pemrograman Berbasis Objek', 4, 2),
('JUANZHA','230441100065', 'PBO', 'Pemrograman Berbasis Objek', 4, 2),
 ('RAYHAN R','230441100100', 'E2', 'E- Bussiness dan E-Commerce', 3, 2),
 ('ERICK FIR','220441100103', 'DM2', 'Data Mining', 3, 4),
 ('RAFLY M','210441100115', 'SC2', 'Smart City', 4, 6);

CREATE TABLE Pembayaran_UKT (
    ID_Pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    NIM INT(11),
    Semester INT,
    Tahun_Ajaran VARCHAR(20),
    Jumlah_UKT INT(11),
    Tanggal_Pembayaran DATE
);

INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (1, 'Rayhanza Nadhif', 22044111, 4, '2024/2025', 3000000, '2024-01-04');
INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (2, 'Rifqi Khairan', 220441122, 4, '2024/2025', 3000000, '2024-01-11');
INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (3, 'Akmal Nabil', 2204433, 4, '2024/2025', 3000000, '2024-01-14');
INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (4, 'Anisyafaah', 2104444, 6, '2024/2025', 3000000, '2024-01-14');
INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (5, 'Makin Amin', 21044155, 6, '2024/2025', 3000000, '2024-01-12');
INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (6, 'Nadhif Athala', 22044166, 4, '2024/2025', 3000000, '2024-01-11');
INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (7, 'Syahrul Ramadhani', 20044177, 8, '2024/2025', 3000000, '2024-01-10');
INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (8, 'Birrur Rijaal', 22044188, 4, '2024/2025', 3000000, '2024-01-09');
INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (9, 'Rayhan Ramadhan', 20044199, 8, '2024/2025', 3000000, '2024-01-09');
INSERT INTO Pembayaran_UKT (ID_Pembayaran, nama, NIM, Semester, Tahun_Ajaran, Jumlah_UKT, Tanggal_Pembayaran )  VALUES (10, 'Juanzha', 22044110, 4, '2024/2025', 3000000, '2024-01-09');

ALTER TABLE Pembayaran_UKT MODIFY Semester INT(3);

CREATE TABLE gaji_dosen (
    id_gaji INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    NIP INT(11),
    gaji INT(11),
    tgl_dibayar DATE
);

INSERT INTO gaji_dosen VALUES (1,'Abdullah S.Kom., M.Kom', 1122331144,4000000, '2024-01-04');
INSERT INTO gaji_dosen VALUES (2,'Sri S.Kom., M.Kom', 213238311,5000000, '2024-01-04');
INSERT INTO gaji_dosen VALUES (3,'Ahmad Bazuki S.Kom., M.Kom', 2132383112,'5000000', '2024-01-04');
INSERT INTO gaji_dosen VALUES (4,'Muhammad Arsi S.Kom., M.Kom', 220441144,7000000, '2024-01-04');
INSERT INTO gaji_dosen VALUES (5,'Abdullah Ahmad S.T., M.T', 220441155, 800000, '2024-01-04');
INSERT INTO gaji_dosen VALUES (6,'Ahmad Yudha S.T., M.T', 220441100,1000000, '2024-01-04');
INSERT INTO gaji_dosen VALUES (7,'Muhammad Doni S.T., M.T', 220441166,20000000, '2024-02-04');
INSERT INTO gaji_dosen VALUES (8,'Dwi Rinjani S.T., M.T', 220441192,30000000, '2024-02-04');
INSERT INTO gaji_dosen VALUES (9,'Ahamd Rizal S.T., M.T', 220441128,2500000, '2024-02-04');
INSERT INTO gaji_dosen VALUES (10,'Abdullah S.T., M.T', 220441128,300000, '2024-02-04');

SELECT * FROM PengeluaranUTM;

CREATE TABLE PengeluaranUTM (
    ID_Pembayaran INT PRIMARY KEY,
    Jenis_Pengeluaran VARCHAR(60),
    total_harga int(11),
    Tanggal_Pembayaran DATE
);

INSERT INTO PengeluaranUTM (ID_Pembayaran, Jenis_Pengeluaran,total_harga, Tanggal_Pembayaran) VALUES
(1, 'Tagihan Air',500000, '2024-03-01'),
(2, 'Pembelian Proyektor',100000, '2024-03-05'),
(3, 'Pengadaan Buku',300000, '2024-03-10'),
(4, 'Pembelian Komputer Lab',450000, '2024-03-15'),
(5, 'Biaya Listrik',600000, '2024-03-20'),
(6, 'Biaya Administrasi',870000, '2024-03-25'),
(7, 'Pembelian Aksesories Komputer',900000, '2024-03-28'),
(8, 'Pembelian Printer ',900000, '2024-03-30'),
(9, 'Biaya Akomodasi',200000, '2024-04-02'),
(10, 'Biaya Kegiatan Ekstrakurikuler',300000, '2024-04-05');

CREATE TABLE Laporan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Jenis VARCHAR (100),
    Deskripsi TEXT,
    tanggal DATE);
    
INSERT INTO laporan (jenis, deskripsi, tanggal)VALUES
('Jumlah Dosen', '920 dosen aktif di Universitas Trunojoyo.', '2024-03-23'),
('Jumlah Mahasiswa', 'terdapat 11002 mahasiswa di Universitas Trunojoyo.', '2024-03-23'),
('Laporan Pengeluaran Keuangan', 'Total pengeluaran keuangan Tahun in adalah Rp 120.000.000.', '2023-10-13'),
('Jumlah Mahasiswa', 'Saat ini terdapat 8002 mahasiswa aktif di Universitas Trunojoyo.', '2022-06-22'),
('Laporan Jumlah Dosen', 'Saat ini terdapat 1015 dosen di Universitas Trunojoyo.', '2022-06-22'),
('Laporan Pengeluaran Keuangan', 'Total pengeluaran keuangan bulan ini adalah Rp 9.500.000.', '2022-05-10'),
('Laporan Jumlah Mahasiswa', 'terdapat 20000 mahasiswa aktif di Universitas Trunojoyo.', '2025-09-08'),
('Laporan Jumlah Dosen', 'Saat ini terdapat 1058 dosen di Universitas Trunojoyo.', '2023-09-08'),
('Laporan Pengeluaran Keuangan', 'Total pengeluaran keuanglaporanan bulan ini adalah Rp 8.000.000.', '2023-12-12'),
 ('Laporan Pengeluaran Keuangan', 'Total pengeluaran keuangan bulan ini adalah Rp 6.900.000.', '2024-02-12');

select nama from mahasiswa;





    





