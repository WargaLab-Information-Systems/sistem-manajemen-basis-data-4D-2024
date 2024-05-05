CREATE DATABASE db_universitas;

USE db_universitas;

CREATE TABLE data_manusia(
	id INT PRIMARY KEY,
	nama VARCHAR (50),
	keterangan VARCHAR(100),
	prodi VARCHAR (20),
	ket_status VARCHAR (20),
	NI INT
);

DROP TABLE data_manusia;

INSERT INTO data_manusia (id, Nama, keterangan,Prodi, ket_status, NI) 
VALUES 
    (1, 'della ayu', 'mahasiswa','administrasi negara','Aktif', 101),
    (2, 'Prof. Mahfud MD', 'dosen','Sistem Informasi', 'Aktif', 311),
    (3, 'naela nahdia', 'mahasiswa','Sistem Informasi', 'Aktif', 103),
    (4, 'Dr. Yeni', 'dosen','Ilmu Komunikasi', 'Aktif', 312),
    (5, 'tesa putri', 'mahasiswa','Hukum', 'Nonaktif', 105),
    (6, 'Dr. kurniawan hidayat', 'dosen','Teknik Mesin', 'Aktif', 305),
    (7, 'Izuddin arrafat', 'ma`data_manusia``data_manusia`hasiswa','Kelautan', 'Aktif', 107),
    (8, 'Prof. Zain', 'dosen','Manajemen', 'Nonaktif', 314),
    (9, 'Bintang purnomo', 'mahasiswa','Teknik Industri', 'Aktif', 109),
    (10, 'Dr. jaelani abidin', 'dosen','Keislaman', 'Aktif', 315);


CREATE TABLE dosen(
	id_dosen INT PRIMARY KEY,
	nama VARCHAR (50),
	prodi VARCHAR (20),
	jenis_kelamin VARCHAR(20),
	gaji INT	
);



INSERT INTO dosen (id_dosen, nama, prodi, jenis_kelamin, gaji) VALUES 
    (311, 'Prof. Mahfud MD', 'Teknik Informatika', 'laki-laki', 15000000),
    (312, 'Dr. Yeni', 'Sistem Informasi', 'perempuan', 12000000),
    (313, 'Dr. Syarif', 'Sistem Informasi', 'laki-laki', 13000000),
    (314, 'Prof. Zain', 'Ilmu Komunikasi', 'laki-laki', 14000000),
    (315, 'Dr. jaelani abidin', 'Hukum', 'laki-laki', 11000000),
    (316, 'Prof. shoppe nurul', 'keislaman', 'perempuan', 16000000),
    (317, 'Dr. kurniawan hidayat', 'Kelautan', 'laki-laki', 12500000),
    (318, 'Prof. robbi satria', 'Manajemen', 'laki-laki', 17000000),
    (319, 'Dr. supriadi ahmad ','Kelautan', 'laki-laki', 13500000),
    (320, 'Dr. hadi samsul', 'Teknik Industri',  'laki-laki',18000000);



CREATE TABLE mata_kuliah(
	id INT PRIMARY KEY,
	nim INT,
	kode_matkul VARCHAR (10),
	semester INT,
	FOREIGN KEY (nim) REFERENCES mahasiswa (nim)	
);


INSERT INTO mata_kuliah (Id, nim, kode_matkul, semester) VALUES 
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


CREATE TABLE pembayaran_UKT(
	id INT PRIMARY KEY,
	nim INT,
	tanggal DATE,
	via_pembayaran VARCHAR (20),
	jumlah_pembayaran INT
);
 

INSERT INTO pembayaran_UKT (id, nim, tanggal, via_pembayaran, jumlah_pembayaran) 
VALUES 
    (1, 101, '2024-03-25', 'BRI', 5000000),
    (2, 102, '2024-03-26', 'BCA', 5500000),
    (3, 103, '2024-03-27', 'BCA', 4800000),
    (4, 104, '2024-03-28', 'BANK MEGA', 6000000),
    (5, 105, '2024-03-29', 'BRI', 5200000),
    (6, 106, '2024-03-30', 'BRI', 5800000),
    (7, 107, '2024-03-31', 'BRI', 5300000),
    (8, 108, '2024-04-01', 'BANK MEGA', 4900000),
    (9, 109, '2024-04-02', 'BANK JATIM', 5100000),
    (10, 110, '2024-04-03', 'BANK JATIM', 5400000);


CREATE TABLE gaji_dosen(
	id INT PRIMARY KEY,
	id_dosen INT,
	tanggal DATE,
	jumlah_gaji INT,
	FOREIGN KEY (id_dosen) REFERENCES dosen(id_dosen)
);



INSERT INTO gaji_dosen (id, id_dosen, tanggal, jumlah_gaji) 
VALUES 
    (1, 311, '2024-03-25', 15000000),
    (2, 312, '2024-03-26', 12000000),
    (3, 313, '2024-03-27', 13000000),
    (4, 314, '2024-03-28', 14000000),
    (5, 315, '2024-03-29', 11000000),
    (6, 316, '2024-03-30', 16000000),
    (7, 317, '2024-03-31', 12500000),
    (8, 318, '2024-04-01', 17000000),
    (9, 319, '2024-04-02', 13500000),
    (10, 320, '2024-04-03', 18000000);
    
 CREATE TABLE pengeluaran(
	id INT PRIMARY KEY,
	deskripsi VARCHAR(100),
	jenis VARCHAR(100),
	tanggal DATE,
	harga INT
 );
 
 

 
INSERT INTO pengeluaran (id, deskripsi, jenis,tanggal, harga) 
VALUES 
    (1, 'Proyektor', 'peralatan', '2024-03-25', 5000000),
    (2, 'Laptop', 'peralatan', '2024-03-26', 8000000),
    (3, 'Papan Tulis', 'peralatan', '2024-03-27', 3000000),
    (4, 'Printer', 'peralatan', '2024-03-28', 4000000),
    (5, 'Kursi', 'peralatan', '2024-03-29', 2000000),
    (6, 'Tagihan listrik', 'tagihan', '2024-03-30', 2500000),
    (7, 'Tagihan air', 'tagihan','2024-03-31', 3500000),
    (8, 'Tagihan internet', 'tagihan', '2024-04-01', 7000000),
    (9, 'Tagihan telepon', 'tagihan', '2024-04-02', 4500000),
    (10, 'Tagihan keamanan', 'tagihan', '2024-04-03', 6000000);
 
 
 CREATE TABLE pembayaran_tagihan (
    id INT PRIMARY KEY,
    deskripsi VARCHAR(100),
    tanggal DATE,
    jumlah_pembayaran_tagihan INT
);

DROP TABLE pembayaran_tagihan;

INSERT INTO pembayaran_tagihan (id, deskripsi, tanggal, jumlah_pembayaran_tagihan) 
VALUES 
	(1, 'Tagihan Listrik', '2024-03-25', 2500000),
	(2, 'Tagihan Air', '2024-03-26', 2000000),
	(3, 'Tagihan Internet', '2024-03-27', 3500000),
	(4, 'Tagihan Telepon', '2024-03-28', 1500000),
	(5, 'Tagihan Keamanan', '2024-03-29', 800000),
	(6, 'Tagihan Parkir', '2024-03-30', 1300000),
	(7, 'Tagihan Cleaning Service', '2024-03-31', 1700000),
	(8, 'Tagihan Maintenance Gedung', '2024-04-01', 3000000),
	(9, 'Tagihan Internet', '2024-04-02', 3500000),
	(10, 'Tagihan Pulsa', '2024-04-03', 2200000);
	
SELECT * FROM pengeluaran;
DESC pengeluaran;
ALTER TABLE pengeluaran MODIFY COLUMN harga INT (11) DEFAULT 30000;
INSERT INTO pengeluaran (id,deskripsi,jenis,tanggal) VALUES (11,'Proyektor', 'peralatan', '2024-03-25');

CREATE VIEW Laporan_Keuangan AS
SELECT 'pembayaran UKT' AS deskripsi, SUM(jumlah_pembayaran) AS total
FROM pembayaran_UKT
UNION ALL
SELECT 'gaji dosen' AS deskripsi, SUM(jumlah_gaji) AS total
FROM gaji_dosen
UNION ALL
SELECT 'pembelian peralatan' AS deskripsi, SUM(harga) AS total
FROM pembelian_peralatan
UNION ALL
SELECT 'pembayaran tagihan ' AS deskripsi, SUM(jumlah_pembayaran_tagihan) AS total
FROM pembayaran_tagihan;

SELECT COUNT(*) AS jumlah_mahasiswa
FROM mahasiswa;

SELECT COUNT(*) AS jumlah_dosen
FROM dosen;

SELECT deskripsi, Total
FROM Laporan_Keuangan;



