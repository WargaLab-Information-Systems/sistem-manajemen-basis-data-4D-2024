	CREATE DATABASE db_smbdmodul1;

	USE db_smbdmodul1;

	CREATE TABLE mahasiswa (
	  nim INT PRIMARY KEY,
	  nama VARCHAR(50),
	  prodi VARCHAR(50),
	  semester INT,
	  status ENUM('Nonaktif', 'Aktif')
	);
    
    DESC mahasiswa;

	CREATE TABLE dosen (
	  nip INT PRIMARY KEY,
	  nama VARCHAR(100),
	  prodi VARCHAR(50),
	  gaji INT
	);

	CREATE TABLE matakuliah (
	  id INT PRIMARY KEY,
	  nim INT,
	  kode_mk VARCHAR(20),
	  semester INT,
	  FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
	);

	CREATE TABLE ukt (
	  id INT PRIMARY KEY,
	  nim INT,
	  tanggal DATE,
	  jumlah INT,
	  FOREIGN KEY (nim) REFERENCES mahasiswa(nim)
	);

	CREATE TABLE gaji_dosen (
	  id INT PRIMARY KEY,
	  nip INT,
	  tanggal DATE,
	  jumlah INT,
	  FOREIGN KEY (nip) REFERENCES dosen(nip)
	);


	CREATE TABLE peralatan (
	  id INT PRIMARY KEY,
	  deskripsi VARCHAR(100),
	  tanggal DATE,
	  jumlah INT
	);

	CREATE TABLE tagihan (
	  id INT PRIMARY KEY,
	  deskripsi VARCHAR(100),
	  tanggal DATE,
	  jumlah INT
	);

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

	INSERT INTO mahasiswa (nim, nama, prodi, semester, status)
	VALUES
	  (001, 'Kadita', 'Teknik Informatika', 5, 'Nonaktif'),
	  (002, 'Nolan', 'Sistem Informasi', 4, 'Aktif'),
	  (003, 'LuoYi', 'Sistem Informasi', 6, 'Nonaktif'),
	  (004, 'Arlot', 'Ilmu Komunikasi', 7, 'Aktif'),
	  (005, 'Thamuz', 'Hukum', 5, 'Nonaktif'),
	  (006, 'Angela', 'Teknik Mesin', 8, 'Aktif'),
	  (007, 'Melisa', 'Kelautan', 3, 'Aktif'),
	  (008, 'Brody', 'Manajemen', 6, 'Nonaktif'),
	  (009, 'Mathilda', 'Teknik Industri', 5, 'Aktif'),
	  (010, 'Minshitar', 'Kelautan', 7, 'Aktif');

	INSERT INTO dosen (nip, nama, prodi, gaji)
	VALUES
	  (1211, 'Prof. Mahfud MD', 'Teknik Informatika', 15000000),
	  (1212, 'Dr. Yeni', 'Sistem Informasi', 12000000),
	  (1213, 'Dr. Syarif', 'Sistem Informasi', 13000000),
	  (1214, 'Prof. Zain', 'Ilmu Komunikasi', 14000000),
	  (1215, 'Dr. Prabowo Subianto', 'Hukum', 11000000),
	  (1216, 'Prof. Aselole', 'Teknik Mesin', 16000000),
	  (1217, 'Dr. Vixzio', 'Kelautan', 12500000),
	  (1218, 'Prof. Soekarno', 'Manajemen', 17000000),
	  (1219, 'Dr. Udien ', 'Kelautan', 13500000),
	  (1220, 'Dr. Habibi', 'Teknik Industri', 18000000);

	  
	  INSERT INTO matakuliah (id, nim, kode_mk, semester)
	VALUES
	  (1, 001, 'TI101', 4),
	  (2, 002, 'SI301', 2),
	  (3, 003, 'SI202', 6),
	  (4, 004, 'IK341', 4),
	  (5, 005, 'H171', 4),
	  (6, 006, 'TM241', 2),
	  (7, 007, 'KEL101', 6),
	  (8, 008, 'MA111', 6),
	  (9, 009, 'TIND321', 2),
	  (10, 010, 'KEL112', 2);

	INSERT INTO ukt (id, nim, tanggal, jumlah)
	VALUES
	  (101, 001, '2024-03-25', 5040000),
	  (102, 002, '2024-03-26', 5500000),
	  (103, 003, '2024-03-27', 4880000),
	  (104, 004, '2024-03-28', 6600000),
	  (105, 005, '2024-03-29', 5200000),
	  (106, 006, '2024-03-30', 5890000),
	  (107, 007, '2024-03-31', 5390000),
	  (108, 008, '2024-04-01', 4910000),
	  (109, 009, '2024-04-02', 5110000),
	  (110, 010, '2024-04-03', 5410000);

	INSERT INTO gaji_dosen (id, nip, tanggal, jumlah)
	VALUES
	  (111, 1211, '2024-03-25', 15500000),
	  (112, 1212, '2024-03-26', 12400000),
	  (113, 1213, '2024-03-27', 13900000),
	  (114, 1214, '2024-03-28', 14900000),
	  (115, 1215, '2024-03-29', 11100000),
	  (116, 1216, '2024-03-30', 16300000),
	  (117, 1217, '2024-03-31', 15400000),
	  (118, 1218, '2024-04-01', 17600000),
	  (119, 1219, '2024-04-02', 12200000),
	  (120, 1220, '2024-04-03', 11200000);
	  
	  
	  INSERT INTO peralatan (id, deskripsi, tanggal, jumlah)
	VALUES
	  (501, 'Proyektor', '2024-03-25', 5000000),
	  (502, 'Laptop', '2024-03-26', 8000000),
	  (503, 'Papan Tulis', '2024-03-27', 3100000),
	  (504, 'Printer', '2024-03-28', 4400000),
	  (505, 'Kursi', '2024-03-29', 2200000),
	  (506, 'Meja', '2024-03-30', 2550000),
	  (507, 'Speaker', '2024-03-31', 3500000),
	  (508, 'Kamera', '2024-04-01', 7000000),
	  (509, 'Mikrofon', '2024-04-02', 4500000),
	  (511, 'Papan Proyeksi', '2024-04-03', 6000000);

	INSERT INTO tagihan (id, deskripsi, tanggal, jumlah)
	VALUES
	  (601, 'Listrik', '2024-03-26', 150000),
	  (602, 'Air', '2024-03-26', 100000),
	  (603, 'Telepon', '2024-03-26', 50000),
	  (604, 'Internet', '2024-03-26', 200000),
	  (605, 'TV Kabel', '2024-03-26', 150000),
	  (606, 'Kartu Kredit', '2024-03-26', 300000),
	  (607, 'Asuransi Kendaraan', '2024-03-26', 250000),
	  (608, 'Pemeliharaan', '2024-03-26', 500000),
	  (609, 'Biaya Pendidikan', '2024-03-26', 1000000),
	  (611, 'Pengeluaran Bulanan', '2024-03-26', 750000);

		INSERT INTO laporan_keuangan (pembayaran_ukt_id, gaji_dosen_id, peralatan_id, tagihan_id)
		VALUES
		  (101, 111, 501, 601),
		  (102, 112, 502, 602),
		  (103, 113, 503, 603),
		  (104, 114, 504, 604),
		  (105, 115, 505, 605),
		  (106, 116, 506, 606),
		  (107, 117, 507, 607),
		  (108, 118, 508, 608),
		  (109, 119, 509, 609),
		  (110, 120, 511, 611);
	  
SELECT * FROM mahasiswa;
SELECT * FROM dosen;
SELECT * FROM laporan_keuangan;
SHOW TABLES;
-- DROP DATABASE db_universitas;