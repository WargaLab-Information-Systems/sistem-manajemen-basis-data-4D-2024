CREATE DATABASE db_trunojoyo;
USE  db_trunojoyo;
-- Tabel Mahasiswa
CREATE TABLE Mahasiswa (
    ID_Mahasiswa INT PRIMARY KEY ,
    Nama_Mahasiswa VARCHAR(100) NOT NULL,
    NIM VARCHAR(20)NOT NULL,
    Tanggal_Mulai_Studi DATE NOT NULL,
    Tanggal_Lulus DATE NOT NULL,
    STATUS VARCHAR(10) NOT NULL
    
);

-- Tabel Dosen
CREATE TABLE Dosen (
    ID_Dosen INT PRIMARY KEY,
    Nama_Dosen VARCHAR(100)NOT NULL,
    Nomor_Induk_Dosen VARCHAR(20)NOT NULL,
    Bidang_Keahlian VARCHAR(100)NOT NULL
);

-- Tabel Mata Kuliah
CREATE TABLE Mata_Kuliah (
    ID_Mata_Kuliah INT PRIMARY KEY,
    Nama_Mata_Kuliah VARCHAR(100) NOT NULL,
    SKS INT NOT NULL
);

-- Tabel Pengambilan Mata Kuliah
CREATE TABLE Pengambilan_Mata_Kuliah (
    ID_Pengambilan INT PRIMARY KEY,
    ID_Mahasiswa INT NOT NULL,
    ID_Mata_Kuliah INT NOT NULL,
    Semester VARCHAR(10) NOT NULL,
    Tahun_Ajaran INT NOT NULL,
    FOREIGN KEY (ID_Mahasiswa) REFERENCES Mahasiswa(ID_Mahasiswa),
    FOREIGN KEY (ID_Mata_Kuliah) REFERENCES Mata_Kuliah(ID_Mata_Kuliah)
);

-- Tabel Pembayaran UKT
CREATE TABLE Pembayaran_UKT (
    ID_Pembayaran INT PRIMARY KEY ,
    ID_Mahasiswa INT NOT NULL,
    Tanggal_Pembayaran DATE NOT NULL,
    Jumlah_Pembayaran DECIMAL(10, 2)NOT NULL,
    FOREIGN KEY (ID_Mahasiswa) REFERENCES Mahasiswa(ID_Mahasiswa)
);

-- Tabel Pembayaran Gaji Dosen
CREATE TABLE Pembayaran_Gaji_Dosen (
    ID_Pembayaran INT PRIMARY KEY,
    ID_Dosen INT NOT NULL,
    Tanggal_Pembayaran DATE NOT NULL,
    Jumlah_Pembayaran DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Dosen) REFERENCES Dosen(ID_Dosen)
);

-- Tabel Pembelian Peralatan
CREATE TABLE Pembelian_Peralatan (
    ID_Pembelian INT PRIMARY KEY,
    Deskripsi VARCHAR(200)NOT NULL,
    Tanggal_Pembelian DATE NOT NULL,
    Jumlah_Pembelian DECIMAL(10, 2)NOT NULL
);

-- Tabel Pembayaran Tagihan
CREATE TABLE Pembayaran_Tagihan (
    ID_Pembayaran INT PRIMARY KEY,
    Deskripsi VARCHAR(200)NOT NULL,
    Tanggal_Pembayaran DATE NOT NULL,
    Jumlah_Pembayaran DECIMAL(10, 2)NOT NULL
);

-- Tabel Kas
CREATE TABLE Kas (
    ID_Kas INT PRIMARY KEY AUTO_INCREMENT,
    Tanggal DATE NOT NULL,
    Keterangan VARCHAR(200),
    Jenis ENUM('Pemasukan', 'Pengeluaran') NOT NULL,
    Jumlah DECIMAL(10, 2) NOT NULL
);
-- lihat tabel
SHOW TABLES 

-- isikan data dummy satu persatu tabel
-- Tabel Mahasiswa
INSERT INTO Mahasiswa (ID_Mahasiswa, Nama_Mahasiswa, NIM, Tanggal_Mulai_Studi, Tanggal_Lulus, STATUS) 
VALUES 
(1, 'Alfian Khoirul', '22002', '2020-09-01', NULL, 'Aktif'),
(2, 'Rizky Dwi', '22001', '2021-02-15', NULL, 'Aktif'),
(3, 'Ade Verdaus', '22003', '2019-08-20', '2023-06-30', 'Lulus'),
(4, 'Martin Hara', '22033', '2020-09-01', NULL, 'Aktif'),
(5, 'Sabililah Rizky', '22044', '2021-02-15', NULL, 'Aktif'),
(6, 'Agung Sasmita', '22012', '2019-08-20', '2022-12-31', 'Berhenti'),
(7, 'Imam Mahdi', '22011', '2020-09-01', NULL, 'Aktif'),
(8, 'Megawati Larasati', '22032', '2021-02-15', NULL, 'Aktif'),
(9, 'Dona Rahma', '22009', '2019-08-20', '2024-06-30', 'Lulus'),
(10, 'Salwa Nur Azizah', '22071', '2020-09-01', NULL, 'Aktif');

-- Tabel Dosen
INSERT INTO Dosen (ID_Dosen, Nama_Dosen, Nomor_Induk_Dosen, Bidang_Keahlian)
VALUES 
(1, 'Prof. Budi Satoto', 'DSN123456', 'Ilmu Komputer'),
(2, 'Dr. Aeri Rachmat', 'DSN654321', 'Ilmu Komputer'),
(3, 'Dr. Yeni Kustyningsih', 'DSN234567', 'Ilmu Komputer'),
(4, 'Prof. Safii', 'DSN543210', 'Ilmu Komputer'),
(5, 'Dr. Edi Cahyadi', 'DSN345678', 'Ilmu Komputer'),
(6, 'Prof. Achmad Zain', 'DSN876543', 'ILmu Komputer'),
(7, 'Dr. Budi Susilo', 'DSN456789', 'Ilmu Komputer'),
(8, 'Prof. Novi Prastiti', 'DSN987654', 'Ilmu Komputer'),
(9, 'Dr. Ali Syakur', 'DSN567890', 'Ilmu Komputer'),
(10, 'Prof. Doni Abdul', 'DSN098765', 'Ilmu Komputer');

-- Tabel Mata Kuliah
INSERT INTO Mata_Kuliah (ID_Mata_Kuliah, Nama_Mata_Kuliah, SKS)
VALUES 
(1, 'Algorittma Pemrograman', 4),
(2, 'Desain Manajemen Jaringan', 3),
(3, 'Pemrograman Web', 4),
(4, 'Pemrograman Destkop', 3),
(5, 'Pemrograman Bergerak', 3),
(6, 'Sistem Manajemen Basis Data', 3),
(7, 'Keamanan Informasi', 2),
(8, 'Riset Operasi', 3),
(9, 'Metodologi Penelitian', 3),
(10, 'Sosio Teknologi Informasi', 3);

-- Tabel Pengambilan Mata Kuliah
INSERT INTO Pengambilan_Mata_Kuliah (ID_Pengambilan, ID_Mahasiswa, ID_Mata_Kuliah, Semester, Tahun_Ajaran)
VALUES 
(1, 1, 1, 'Ganjil', 2020),
(2, 1, 2, 'Ganjil', 2020),
(3, 1, 3, 'Genap', 2020),
(4, 2, 2, 'Ganjil', 2021),
(5, 2, 4, 'Genap', 2021),
(6, 3, 5, 'Ganjil', 2019),
(7, 3, 6, 'Genap', 2019),
(8, 4, 1, 'Ganjil', 2020),
(9, 4, 3, 'Genap', 2020),
(10, 5, 4, 'Ganjil', 2021);

-- Tabel Pembayaran UKT
INSERT INTO Pembayaran_UKT (ID_Pembayaran, ID_Mahasiswa, Tanggal_Pembayaran, Jumlah_Pembayaran)
VALUES 
(1, 1, '2020-09-10', 5000000),
(2, 2, '2021-02-20', 4500000),
(3, 3, '2019-09-05', 5500000),
(4, 4, '2020-09-15', 4800000),
(5, 5, '2021-02-25', 4600000),
(6, 6, '2019-09-10', 5000000),
(7, 7, '2020-09-10', 4900000),
(8, 8, '2021-02-20', 4700000),
(9, 9, '2019-09-05', 5600000),
(10, 10, '2020-09-15', 4900000);

-- Tabel Pembayaran Gaji Dosen
INSERT INTO Pembayaran_Gaji_Dosen (ID_Pembayaran, ID_Dosen, Tanggal_Pembayaran, Jumlah_Pembayaran)
VALUES 
(1, 1, '2022-01-05', 10000000),
(2, 2, '2022-01-05', 9000000),
(3, 3, '2022-01-05', 9500000),
(4, 4, '2022-01-05', 11000000),
(5, 5, '2022-01-05', 10500000),
(6, 6, '2022-01-05', 10000000),
(7, 7, '2022-01-05', 9800000),
(8, 8, '2022-01-05', 9700000),
(9, 9, '2022-01-05', 11500000),
(10, 10, '2022-01-05', 9800000);

-- Tabel Pembelian Peralatan
INSERT INTO Pembelian_Peralatan (ID_Pembelian, Deskripsi, Tanggal_Pembelian, Jumlah_Pembelian)
VALUES 
(1, 'Komputer Laboratorium', '2021-05-10', 20000000),
(2, 'Proyektor', '2021-05-15', 5000000),
(3, 'Meja dan Kursi', '2021-05-20', 8000000),
(4, 'Whiteboard', '2021-06-01', 3000000),
(5, 'Laptop Dosen', '2021-06-10', 15000000),
(6, 'Buku Ajar', '2021-06-15', 10000000),
(7, 'Laboratorium Kimia', '2021-07-01', 25000000),
(8, 'Laboratorium Biologi', '2021-07-05', 30000000),
(9, 'Kaca Mata Laboratorium', '2021-07-10', 5000000),
(10, 'Printer', '2021-08-01', 7000000);

-- Tabel Pembayaran Tagihan
INSERT INTO Pembayaran_Tagihan (ID_Pembayaran, Deskripsi, Tanggal_Pembayaran, Jumlah_Pembayaran)
VALUES 
(1, 'Tagihan Listrik', '2021-05-05', 15000000),
(2, 'Tagihan Air', '2021-05-10', 8000000),
(3, 'Tagihan Internet', '2021-05-15', 5000000),
(4, 'Pemeliharaan Gedung', '2021-06-05', 20000000),
(5, 'Kebersihan', '2021-06-10', 10000000),
(6, 'Keamanan', '2021-07-05', 15000000),
(7, 'Perawatan Taman', '2021-07-10', 5000000),
(8, 'Pemeliharaan Laboratorium', '2021-08-05', 30000000),
(9, 'Asuransi', '2021-08-10', 10000000),
(10, 'Pajak', '2021-09-05', 20000000);


-- Lihat Isi Semua Tabel 
SHOW TABLES;
SELECT * FROM dosen;
SELECT * FROM mahasiswa;
SELECT * FROM mata_kuliah;
SELECT * FROM pembayaran_gaji_dosen;
SELECT * FROM pembayaran_tagihan;
SELECT * FROM pembelian_peralatan;
SELECT * FROM kas;

-- query laporan 
-- LAPORAN DATA MAHASISWA
	SELECT *
	FROM Mahasiswa;
-- LAPORAN DAFTAR DOSEN
	SELECT *
	FROM Dosen;

-- LAPORAN KEUANGAN
	-- Total Pembayaran UKT per Bulan
		SELECT MONTH(Tanggal_Pembayaran) AS Bulan, SUM(Jumlah_Pembayaran) AS Total_Pembayaran_UKT
		FROM Pembayaran_UKT
		GROUP BY MONTH(Tanggal_Pembayaran);
	-- cek bulan
		SELECT MONTH(Tanggal_pembayaran)FROM Pembayaran_UKT
	-- belajar membatasi (diluar soal)
		SELECT YEAR(Tanggal_Pembayaran) AS Tahun, SUM(Jumlah_Pembayaran) AS Total_Pembayaran_UKT
		FROM Pembayaran_UKT
		WHERE YEAR(tanggal_pembayaran) <= 2020
		GROUP BY YEAR(Tanggal_Pembayaran) ;

	-- belajar membatasi dan menotal (diluar soal)
		SELECT SUM(Jumlah_Pembayaran) AS Total_Pengeluaran
		FROM Pembayaran_UKT
		WHERE YEAR(Tanggal_Pembayaran) <= 2020;

	-- Total Pembayaran Gaji Dosen per Bulan
		SELECT MONTH(Tanggal_Pembayaran) AS Bulan, SUM(Jumlah_Pembayaran) AS Total_Pembayaran_Gaji
		FROM Pembayaran_Gaji_Dosen
		GROUP BY MONTH(Tanggal_Pembayaran);

	-- Total Pembelian Peralatan per Bulan
		SELECT MONTH(Tanggal_Pembelian) AS Bulan, SUM(Jumlah_Pembelian) AS Total_Pembelian_Peralatan
		FROM Pembelian_Peralatan
		GROUP BY MONTH(Tanggal_Pembelian);

	-- Total Pembayaran Tagihan per Bulan
		SELECT MONTH(Tanggal_Pembayaran) AS Bulan, SUM(Jumlah_Pembayaran) AS Total_Pembayaran_Tagihan
		FROM Pembayaran_Tagihan
		GROUP BY MONTH(Tanggal_Pembayaran);

	-- jumlah mahasiswa 
		SELECT COUNT(*) AS jumlah_mahasiswa FROM Mahasiswa;
	-- jumlah dosen
		SELECT COUNT(*) FROM Dosen;
	-- jumlah pengeluaran
		SELECT SUM(jumlah_pembayaran) AS total_pengeluaran_tagihan FROM pembayaran_tagihan;
		SELECT SUM(jumlah_pembelian) AS total_pengeluaran_peralatan FROM pembelian_peralatan;
		SELECT SUM(jumlah_pembayaran) AS total_pengeluaran_gajiDosen FROM pembayaran_gaji_dosen;
	-- menampilkan semua pengeluaran dalam satu eksekusi
		SELECT 
		    (SELECT SUM(jumlah_pembayaran) FROM pembayaran_tagihan) AS total_pengeluaran_tagihan,
		    (SELECT SUM(jumlah_pembelian) FROM pembelian_peralatan) AS total_pengeluaran_peralatan,
		    (SELECT SUM(jumlah_pembayaran) FROM pembayaran_gaji_dosen) AS total_pengeluaran_gajiDosen;
	  
	-- total seluruh pengeluaran yang tercatat di database 
		SELECT 
		    (SELECT SUM(jumlah_pembayaran) FROM pembayaran_tagihan) +
		    (SELECT SUM(jumlah_pembelian) FROM pembelian_peralatan) +
		    (SELECT SUM(jumlah_pembayaran) FROM pembayaran_gaji_dosen) AS total_pengeluaran;
-- query revisi dimulai dari sini 

-- Hubungin tabel Pemasukan sama tabel Kas
	ALTER TABLE Pembayaran_UKT
	ADD COLUMN ID_Kas INT,
	ADD CONSTRAINT fk_pembayaran_ukt_kas FOREIGN KEY (ID_Kas) REFERENCES Kas(ID_Kas);

-- Update ID_Kas di tabel Pembayaran_UKT
	UPDATE Pembayaran_UKT
	SET ID_Kas = (SELECT ID_Kas FROM Kas WHERE Kas.Tanggal = Pembayaran_UKT.Tanggal_Pembayaran AND Kas.Jumlah = Pembayaran_UKT.Jumlah_Pembayaran);

-- Hubungin tabel Pembayaran_Gaji_Dosen sama tabel Kas
	ALTER TABLE Pembayaran_Gaji_Dosen
	ADD COLUMN ID_Kas INT,
	ADD CONSTRAINT fk_pembayaran_gaji_dosen_kas FOREIGN KEY (ID_Kas) REFERENCES Kas(ID_Kas);

-- Update ID_Kas di tabel Pembayaran_Gaji_Dosen
	UPDATE Pembayaran_Gaji_Dosen
	SET ID_Kas = (SELECT ID_Kas FROM Kas WHERE Kas.Tanggal = Pembayaran_Gaji_Dosen.Tanggal_Pembayaran AND Kas.Jumlah = Pembayaran_Gaji_Dosen.Jumlah_Pembayaran);

-- Hubungin tabel Pembelian_Peralatan sama tabel Kas
	ALTER TABLE Pembelian_Peralatan
	ADD COLUMN ID_Kas INT,
	ADD CONSTRAINT fk_pembelian_peralatan_kas FOREIGN KEY (ID_Kas) REFERENCES Kas(ID_Kas);

-- Update ID_Kas di tabel Pembelian_Peralatan
	UPDATE Pembelian_Peralatan
	SET ID_Kas = (SELECT ID_Kas FROM Kas WHERE Kas.Tanggal = Pembelian_Peralatan.Tanggal_Pembelian AND Kas.Jumlah = Pembelian_Peralatan.Jumlah_Pembelian);
-- Hubungkan tabel Pembayaran_Tagihan sama tabel Kas
	ALTER TABLE Pembayaran_Tagihan
	ADD COLUMN ID_Kas INT,
	ADD CONSTRAINT fk_pembayaran_tagihan_kas FOREIGN KEY (ID_Kas) REFERENCES Kas(ID_Kas);
-- Update ID_Kas di tabel Pembayaran_Tagihan
	UPDATE Pembayaran_Tagihan
	SET ID_Kas = (SELECT ID_Kas FROM Kas WHERE Kas.Tanggal = Pembayaran_Tagihan.Tanggal_Pembayaran AND Kas.Jumlah = Pembayaran_Tagihan.Jumlah_Pembayaran);



-- Tambahkan data dummy dari Pembayaran_UKT ke tabel Kas
INSERT INTO Kas (Tanggal, Keterangan, Jenis, Jumlah, ID_Kas)
SELECT Tanggal_Pembayaran, CONCAT('Pembayaran UKT oleh Mahasiswa ', M.Nama_Mahasiswa), 'Pemasukan', Jumlah_Pembayaran, ID_Pembayaran
FROM Pembayaran_UKT U
JOIN Mahasiswa M ON U.ID_Mahasiswa = M.ID_Mahasiswa;
SELECT * FROM kas

-- testing
	-- testing not null : 
	-- insert into mahasiswa values (11,null,null,null,null,"Aktif")
	-- select * from mahasiswa
	-- SELECT * FROM pengambilan_mata_kuliah
	-- SELECT * FROM dosen
	-- ALTER TABLE Pembayaran_UKT
	-- ADD COLUMN ID_Kas INT,
	-- ADD CONSTRAINT fk_pembayaran_ukt_kas FOREIGN KEY (ID_Kas) REFERENCES Kas(ID_Kas);
	-- SELECT MONTH(Tanggal) AS Bulan, 
	       -- SUM(CASE WHEN Jenis = 'Pemasukan' THEN Jumlah ELSE 0 END) AS Total_Pemasukan,
	       -- SUM(CASE WHEN Jenis = 'Pengeluaran' THEN Jumlah ELSE 0 END) AS Total_Pengeluaran
	-- FROM Kas
	-- GROUP BY MONTH(Tanggal);
