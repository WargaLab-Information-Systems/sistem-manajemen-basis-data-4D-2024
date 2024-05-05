-- CREATE DATABASE db_utm;
-- USE db_utm;

-- -- Tabel Mahasiswa
-- CREATE TABLE mahasiswa (
--   nim INT (11) NOT NULL PRIMARY KEY,
--   nama VARCHAR(100) NOT NULL,
--   semester INT (2) NOT NULL,
--   jurusan VARCHAR (50) NOT NULL,
--   status ENUM('Nonaktif', 'Aktif')
-- );

-- INSERT INTO mahasiswa (nim, nama, semester, jurusan, status) VALUES
-- (220441100,'Makin Amin', 1, 'Informatika', 'Aktif'),
-- (220441122, 'Budi Haryanto', 1, 'Mesin', 'Aktif'),
-- (220441133, 'Akmal Nabil', 1, 'Manajemen', 'Aktif'),
-- (220441144, 'Rudi Setiawan', 1, 'Elektro', 'Aktif'),
-- (220441155, 'Ainul Yaqin', 1, 'Industri', 'Aktif'),
-- (220441166, 'Nadhif Athala', 1, 'Informatika', 'Aktif'),
-- (220441177, 'Samsul Hadi', 1, 'Industri', 'Aktif'),
-- (220441188, 'Erick Firmansyah', 1, 'Informatika', 'Aktif'),
-- (220441192, 'Juanzha', 1, 'Informatika', 'Aktif'),
-- (220441199, 'Bagus Hikmah',1, 'Industri', 'Aktif');

-- -- Tabel Dosen
-- CREATE TABLE dosen (
--    nid INT (11) NOT NULL PRIMARY KEY, 
--    nama VARCHAR(100),
--    program_studi VARCHAR(100),
--    jabatan VARCHAR(100)
-- );

-- INSERT INTO dosen (nid, nama, program_studi, jabatan) VALUES 
-- (220411, 'Abdullah S.Kom., M.Kom', 'Sistem Informasi', 'Dekan'),
-- (210134, 'Sri S.Kom., M.Kom', 'Teknik Informatika', 'Dosen'),
-- (210345, 'Ahmad Bazuki S.Kom., M.Kom', 'Teknik Mesin', 'Dosen'),
-- (220111, 'Muhammad Arsi S.Kom., M.Kom', 'Sistem Informasi', 'KoorProdi'),
-- (220222, 'Abdullah Ahmad S.T., M.T', 'Teknik Mesin', 'KoorProdi'),
-- (220333, 'Abdullah S.T., M.T', 'Teknik Elektro', 'KoorProdi'),
-- (220444, 'Ahmad Yudha S.T., M.T', 'Teknik Elektro', 'Dosen'),
-- (220555, 'Muhammad Doni S.T., M.T', 'Teknik Industri', 'KoorProdi'),
-- (220666, 'Dwi Rinjani S.T., M.T', 'Teknik Industri', 'Wakil Dekan'),
-- (220777, 'Ahamd Rizal S.T., M.T', 'Teknik Informatika', 'Wakil Dekan 2');

-- -- Tabel KRS
-- CREATE TABLE krs (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   nim INT (11) NOT NULL,
--   kode_mk VARCHAR(20),
--   semester INT(2),
--   FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
-- );

-- INSERT INTO krs (id, nim, kode_mk, semester) VALUES
-- (1, 220441100, 'PB1', 4),
-- (2, 220441122, 'SMBD2', 4),
-- (3, 220441133, 'AP2', 4),
-- (4, 220441144, 'AP4', 6),
-- (5, 220441155, 'E2', 6),
-- (6, 220441166, 'PBO6', 2),
-- (7, 220441177, 'PBO', 2),
-- (8, 220441188, 'E2', 2),
-- (9, 220441192, 'DM2', 4),
-- (10, 220441199, 'SC2', 6);

-- -- Tabel Pembayaran UKT
-- CREATE TABLE bayar_ukt (
--    id_ukt INT AUTO_INCREMENT PRIMARY KEY,
--    nim INT(11) NOT NULL,
--    jumlah_ukt INT(11) NOT NULL,
--    tanggal DATE,
--    golongan VARCHAR(3) NOT NULL,
--    FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
-- );

-- INSERT INTO bayar_ukt (id_ukt, nim, jumlah_ukt, tanggal, golongan) VALUES 
-- (100, 220441100, 3000000, '2024-01-04', 'IV'),
-- (101, 220441122, 3000000, '2024-01-11', 'IV'),
-- (102, 220441133, 3000000, '2024-01-14', 'IV'),
-- (103, 220441144, 3000000, '2024-01-14', 'IV'),
-- (104, 220441155, 3000000, '2024-01-12', 'IV'),
-- (105, 220441166, 3000000, '2024-01-11', 'IV'),
-- (106, 220441177, 3000000, '2024-01-10', 'IV'),
-- (107, 220441188, 3000000, '2024-01-09', 'IV'),
-- (108, 220441192, 3000000, '2024-01-09', 'IV'),
-- (109, 220441199, 3000000, '2024-01-09', 'IV');

-- -- Tabel Pembayaran Gaji Dosen
-- CREATE TABLE gaji_dosen (
--   id_gaji INT(11) PRIMARY KEY,
--   nid INT(11),
--   jumlah_gaji INT(11),
--   tanggal DATE,
--   FOREIGN KEY (nid) REFERENCES dosen(nid)
-- );

-- INSERT INTO gaji_dosen (id_gaji, nid, jumlah_gaji, tanggal) VALUES 
-- (200, 220411, 4000000, '2024-01-04'),
-- (201, 210134, 5000000, '2024-01-04'),
-- (202, 210345, 5000000, '2024-01-04'),
-- (203, 220111, 7000000, '2024-01-04'),
-- (204, 220222, 800000, '2024-01-04'),
-- (205, 220333, 1000000, '2024-01-04'),
-- (206, 220444, 7000000, '2024-01-08'),
-- (207, 220555, 4000000, '2024-01-08'),
-- (208, 220666, 5000000, '2024-01-08'),
-- (209, 220777, 7000000, '2024-01-08');

-- -- Tabel Pembelian Peralatan dan Bahan Ajar
-- CREATE TABLE pembelian_alat (
--    id_alat INT AUTO_INCREMENT PRIMARY KEY,
--    barang VARCHAR(100),
--    jumlah INT(10),
--    total_harga INT(11),
--    tanggal_beli DATE
-- );

-- INSERT INTO pembelian_alat (id_alat, barang, jumlah, total_harga, tanggal_beli) VALUES
-- (300, 'Monitor', 5, 25000, '2024-03-01'),
-- (301, 'Webcam', 3, 500000, '2024-03-05'),
-- (302, 'Microphone', 4, 80000, '2024-03-10'),
-- (303, 'Scanner', 3, 950000, '2022-03-15'),
-- (304, 'Laptop', 10, 1000000, '2020-03-20'),
-- (305, 'Keyboard', 10, 400000, '2024-03-25'),
-- (306, 'Mouse', 12, 600000, '2024-02-28'),
-- (307, 'Speaker', 5, 700000, '2024-03-30'),
-- (308, 'Proyektor', 3, 500000, '2024-04-02'),
-- (309, 'Printer', 2, 800000, '2023-04-05');

-- -- Tabel Pembayaran Tagihan
-- CREATE TABLE tagihan (
--    id_tagihan INT PRIMARY KEY,
--    jenis_tagihan VARCHAR(50),
--    total_harga int(11),
--    tanggal_bayar DATE
-- );

-- INSERT INTO tagihan (id_tagihan, jenis_tagihan, total_harga, tanggal_bayar) VALUES
-- (400, 'Tagihan Air', 500000, '2024-03-01'),
-- (401, 'Sewa Gedung', 100000, '2024-03-05'),
-- (402, 'Pengadaan Buku', 300000, '2024-03-10'),
-- (403, 'Biaya Laboratorium', 450000, '2024-03-15'),
-- (404, 'Biaya Listrik', 600000, '2024-03-20'),
-- (405, 'Biaya Administrasi', 870000, '2024-03-25'),
-- (406, 'Sewa Alat proyektor', 900000, '2024-03-28'),
-- (407, 'Biaya Potong Rumput Fasilitas', 900000, '2024-03-30'),
-- (408, 'Biaya Akomodasi', 200000, '2024-04-02'),
-- (409, 'Biaya Kegiatan Ekstrakurikuler', 300000, '2024-04-05');

-- CREATE TABLE laporan (
--   id INT PRIMARY KEY AUTO_INCREMENT,
--   id_ukt INT(11),
--   id_gaji INT(11),
--   id_alat INT(11),
--   id_tagihan INT(11),
--   data_laporan VARCHAR (100),
--   FOREIGN KEY (id_ukt) REFERENCES bayar_ukt(id_ukt),
--   FOREIGN KEY (id_gaji) REFERENCES gaji_dosen(id_gaji),
--   FOREIGN KEY (id_alat) REFERENCES pembelian_alat(id_alat),
--   FOREIGN KEY (id_tagihan) REFERENCES tagihan(id_tagihan)
-- );

-- INSERT INTO laporan (id_ukt, id_gaji, id_alat, id_tagihan, data_laporan)
-- VALUES
--   (100, 200, 300, 400, 'Jumlah uang yang dikeluarkan pada pembayaran listrik sebesar 10 juta'),
--   (101, 201, 301, 401, 'Jumlah uang yang dikeluarkan pada pembayaran listrik sebesar 10 juta'),
--   (102, 202, 302, 402, 'Jumlah uang yang dikeluarkan pada pembayaran tagihan air sebesar 60 juta'),
--   (103, 203, 303, 403, 'Jumlah uang yang dikeluarkan pada pembelian laptop sebesar 320 juta'),
--   (104, 204, 304, 404, 'Jumlah uang yang dikeluarkan pada pembayaran gaji dosen sebesar 90 juta'),
--   (105, 205, 305, 405, 'Jumlah uang yang dikeluarkan pada pembelian microphone sebesar 40 juta'),
--   (106, 206, 306, 406, 'Jumlah uang yang dikeluarkan pada pembelian webcam sebesar 100 juta'),
--   (107, 207, 307, 407, 'Jumlah uang yang dikeluarkan pada pembelian scanner sebesar 60 juta'),
--   (108, 208, 308, 408, 'Jumlah uang yang dikeluarkan pada pembelian monitor sebesar 50 juta'),
--   (109, 209, 309, 409, 'Jumlah uang yang dikeluarkan pada pembelian proyektor sebesar 20 juta');


CREATE DATABASE db_olahraga;
USE db_olahraga;

CREATE TABLE tb_atlet (
  id_atlet INT PRIMARY KEY AUTO_INCREMENT,
  nama_atlet VARCHAR(50) default 'nama kosong',
  cabang_olahraga VARCHAR(50)) 
;

INSERT INTO tb_atlet (id_atlet, nama_atlet, cabang_olahraga) VALUES
(1, 'Budi', 'Futsal'),
(2, 'Agus', 'Voli');

CREATE TABLE tb_latihan (
  id_latihan INT PRIMARY KEY AUTO_INCREMENT,
  waktu_latihan DATE,
  lokasi_latihan VARCHAR(50) NOT NULL) 
;

INSERT INTO tb_latihan (id_latihan, waktu_latihan, lokasi_latihan) VALUES
(1, '2024-03-25', 'Lapangan Gili'),
(2, '2024-04-21', 'Gedung Cakra');

