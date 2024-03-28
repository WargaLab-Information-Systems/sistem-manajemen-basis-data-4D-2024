CREATE DATABASE db_universitas;

USE db_universitas;

CREATE TABLE mhs (
  nim INT PRIMARY KEY,
  nama VARCHAR(100),
  prodi VARCHAR(50),
  semester INT,
  status ENUM('Nonaktif', 'Aktif')
);

CREATE TABLE dosen (
  nid INT PRIMARY KEY,
  nama VARCHAR(100),
  prodi VARCHAR(50),
  gaji INT
);

CREATE TABLE matakuliah (
  id INT PRIMARY KEY,
  nim INT,
  kode_mk VARCHAR(20),
  semester INT,
  FOREIGN KEY (nim) REFERENCES mhs(nim)
);



CREATE TABLE ukt (
  golongan_ukt INT,
  id INT PRIMARY KEY,
  nim INT,
  tanggal DATE,
  jumlah INT,
  FOREIGN KEY (nim) REFERENCES mhs(nim)
);
CREATE TABLE gaji_dosen (
  id INT PRIMARY KEY,
  nid INT,
  tanggal DATE,
  jumlah INT,
  FOREIGN KEY (nid) REFERENCES dosen(nid)
);


CREATE TABLE peralatan (
  id INT PRIMARY KEY,
  deskripsi VARCHAR(100),
  tanggal DATE,
  jumlah INT
);

ALTER TABLE tagihan ADD golongan_UKT VARCHAR(25);

CREATE TABLE tagihan (

  id INT PRIMARY KEY,
  deskripsi VARCHAR(100),
  tanggal DATE,
  jumlah INT
);

ALTER TABLE tagihan ADD jenis_tagihan VARCHAR(25);

-- SELECT * FROM tagihan;
CREATE TABLE laporan_keuangan (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pembayaran_ukt_id INT,
  gaji_dosen_id INT,
  peralatan_id INT,
  tagihan_id INT,
  FOREIGN KEY (pembayaran_ukt_id) REFERENCES ukt(id),
  FOREIGN KEY (gaji_dosen_id) REFERENCES gaji_dosen(id),
  FOREIGN KEY (peralatan_id) REFERENCES peralatan(id),
  FOREIGN KEY (tagihan_id) REFERENCES tagihan(id)
);

ALTER TABLE laporan_keuangan ADD data_laporan VARCHAR(25);

INSERT INTO mhs (nim, nama, prodi, semester, status)
VALUES
  (101, 'erick', 'Teknik Informatika', 5, 'Aktif'),
  (102, 'nadif', 'Sistem Informasi', 4, 'Aktif'),
  (103, 'pak asep', 'Sistem Informasi', 6, 'Aktif'),
  (104, 'akmal', 'Ilmu Komunikasi', 7, 'Aktif'),
  (105, 'dani', 'Hukum', 5, 'Nonaktif'),
  (106, 'birrur', 'Teknik Mesin', 8, 'Aktif'),
  (107, 'rafly', 'Kelautan', 3, 'Aktif'),
  (108, 'juan', 'Manajemen', 6, 'Nonaktif'),
  (109, 'sigma', 'Teknik Industri', 5, 'Aktif'),
  (110, 'well', 'Kelautan', 7, 'Aktif');

INSERT INTO dosen (nid, nama, prodi, gaji)
VALUES
  (211, 'Jokowi', 'Teknik Informatika', 15000000),
  (212, 'Asep', 'Sistem Informasi', 12000000),
  (213, 'Ucup', 'Sistem Informasi', 13000000),
  (214, 'Prof', 'Ilmu Komunikasi', 14000000),
  (215, 'Praboro', 'Hukum', 11000000),
  (216, 'Ckep', 'Teknik Mesin', 16000000),
  (217, 'Well', 'Kelautan', 12500000),
  (218, 'Prof. Soekar', 'Manajemen', 17000000),
  (219, 'Dr. Udien ', 'Kelautan', 13500000),
  (220, 'Dr. Habibi', 'Teknik Industri', 18000000);




  
  INSERT INTO matakuliah (id, nim, kode_mk, semester)
VALUES
  (1, 101, 'TI101', 5),
  (2, 102, 'SI301', 4),
  (3, 103, 'SI202', 6),
  (4, 104, 'IK341', 7),
  (5, 105, 'H171', 5),
  (6, 106, 'TM241', 8),
  (7, 107, 'KEL101', 3),
  (8, 108, 'MA111', 6),
  (9, 109, 'TIND321', 5),
  (10, 110, 'KEL112', 7);

INSERT INTO ukt (id, nim, tanggal, jumlah)
VALUES
  (301, 101, '2024-03-25', 5000000),
  (302, 102, '2024-03-26', 5500000),
  (303, 103, '2024-03-27', 4800000),
  (304, 104, '2024-03-28', 6000000),
  (305, 105, '2024-03-29', 5200000),
  (306, 106, '2024-03-30', 5800000),
  (307, 107, '2024-03-31', 5300000),
  (308, 108, '2024-04-01', 4900000),
  (309, 109, '2024-04-02', 5100000),
  (311, 110, '2024-04-03', 5400000);

INSERT INTO gaji_dosen (id, nid, tanggal, jumlah)
VALUES
  (401, 211, '2024-03-25', 15000000),
  (402, 212, '2024-03-26', 12000000),
  (403, 213, '2024-03-27', 13000000),
  (404, 214, '2024-03-28', 14000000),
  (405, 215, '2024-03-29', 11000000),
  (406, 216, '2024-03-30', 16000000),
  (407, 217, '2024-03-31', 12500000),
  (408, 218, '2024-04-01', 17000000),
  (409, 219, '2024-04-02', 13500000),
  (411, 220, '2024-04-03', 18000000);
  
  
  INSERT INTO peralatan (id, deskripsi, tanggal, jumlah)
VALUES
  (501, 'Proyektor', '2024-03-25', 5000000),
  (502, 'Laptop', '2024-03-26', 8000000),
  (503, 'Papan Tulis', '2024-03-27', 3000000),
  (504, 'Printer', '2024-03-28', 4000000),
  (505, 'Kursi', '2024-03-29', 2000000),
  (506, 'Meja', '2024-03-30', 2500000),
  (507, 'Speaker', '2024-03-31', 3500000),
  (508, 'Kamera', '2024-04-01', 7000000),
  (509, 'Mikrofon', '2024-04-02', 4500000),
  (511, 'Papan Proyeksi', '2024-04-03', 6000000);

INSERT INTO tagihan (id, deskripsi, tanggal, jumlah)
VALUES
  (601, 'Listrik', '2024-03-26', 150000),
  (602, 'Air', '2024-03-26', 100000),
  (603, 'Telepon Rumah', '2024-03-26', 50000),
  (604, 'Internet', '2024-03-26', 200000),
  (605, 'TV Kabel', '2024-03-26', 150000),
  (606, 'Kartu Kredit', '2024-03-26', 300000),
  (607, 'Asuransi Kendaraan', '2024-03-26', 250000),
  (608, 'Pemeliharaan Rumah', '2024-03-26', 500000),
  (609, 'Biaya Pendidikan', '2024-03-26', 1000000),
  (611, 'Pengeluaran Bulanan', '2024-03-26', 750000);

INSERT INTO laporan_keuangan (pembayaran_ukt_id, gaji_dosen_id, peralatan_id, tagihan_id)
VALUES
  (301, 401, 501, 601),
  (302, 402, 502, 602),
  (303, 403, 503, 603),
  (304, 404, 504, 604),
  (305, 405, 505, 605),
  (306, 406, 506, 606),
  (307, 407, 507, 607),
  (308, 408, 508, 608),
  (309, 409, 509, 609),
  (311, 411, 511, 611);
  
  
-- DROP DATABASE db_universitas;



