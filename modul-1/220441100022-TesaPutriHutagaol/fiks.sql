CREATE DATABASE universitas_truno;

USE universitas_truno;

CREATE TABLE Mahasiswa (
    NIM INT PRIMARY KEY NOT NULL,
    Nama VARCHAR(100) NOT NULL,
    Prodi VARCHAR(50) NOT NULL,
    Semester INT NOT NULL,
    STATUS ENUM('Aktif', 'Nonaktif', 'Lulus') NOT NULL
);
INSERT INTO Mahasiswa (NIM, Nama, Prodi, Semester, STATUS) 
VALUES 
    (101, 'Oxa', 'Teknik Informatika', 5, 'Aktif'),
    (102, 'Naela', 'Sistem Informasi', 4, 'Aktif'),
    (103, 'Nahdiah', 'Sistem Informasi', 6, 'Aktif'),
    (104, 'Irfan faruq', 'Ilmu Komunikasi', 7, 'Aktif'),
    (105, 'Anies baswedan', 'Hukum', 5, 'Nonaktif'),
    (106, 'Viko', 'Teknik Mesin', 8, 'Aktif'),
    (107, 'Ijud', 'Kelautan', 3, 'Aktif'),
    (108, 'Sipak', 'Manajemen', 6, 'Nonaktif'),
    (109, 'Bintang', 'Teknik Industri', 5, 'Aktif'),
    (110, 'Imam', 'Kelautan', 7, 'Aktif');


CREATE TABLE Dosen (
    NID INT PRIMARY KEY NOT NULL,
    Nama VARCHAR(100) NOT NULL,
    Prodi VARCHAR(50) NOT NULL,
    Gaji INT NOT NULL
);
INSERT INTO Dosen (NID, Nama, Prodi, Gaji) VALUES 
    (211, 'Prof. Mahfud MD', 'Teknik Informatika', 15000000),
    (212, 'Dr. Yeni', 'Sistem Informasi', 12000000),
    (213, 'Dr. Syarif', 'Sistem Informasi', 13000000),
    (214, 'Prof. Zain', 'Ilmu Komunikasi', 14000000),
    (215, 'Dr. Prabowo Subianto', 'Hukum', 11000000),
    (216, 'Prof. Aselole', 'Teknik Mesin', 16000000),
    (217, 'Dr. Vixzio', 'Kelautan', 12500000),
    (218, 'Prof. Soekarno', 'Manajemen', 17000000),
    (219, 'Dr. Udien ','Kelautan', 13500000),
    (220, 'Dr. Habibi', 'Teknik Industri', 18000000);


CREATE TABLE Pendaftaran_Mata_Kuliah (
    ID INT PRIMARY KEY NOT NULL,
    NIM INT NOT NULL,
    Kode_MK VARCHAR(20) NOT NULL,
    Semester INT NOT NULL,
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM) 
);
INSERT INTO Pendaftaran_Mata_Kuliah (ID, NIM, Kode_MK, Semester) VALUES 
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

CREATE TABLE Pembayaran_UKT (
    ID INT PRIMARY KEY NOT NULL,
    NIM INT NOT NULL,
    Tanggal DATE NOT NULL,
    Jumlah INT NOT NULL,
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM) 
);

INSERT INTO Pembayaran_UKT (ID, NIM, Tanggal, Jumlah) 
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

CREATE TABLE Pembayaran_Gaji_Dosen (
    ID INT PRIMARY KEY NOT NULL,
    NID INT NOT NULL,
    Tanggal DATE NOT NULL,
    Jumlah INT NOT NULL,
    FOREIGN KEY (NID) REFERENCES Dosen(NID)
);

INSERT INTO Pembayaran_Gaji_Dosen (ID, NID, Tanggal, Jumlah) 
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

CREATE TABLE Pembelian_Peralatan (
    ID INT PRIMARY KEY NOT NULL,
    Deskripsi VARCHAR(100) NOT NULL,
    Tanggal DATE NOT NULL,
    Jumlah INT NOT NULL
);
INSERT INTO Pembelian_Peralatan (ID, Deskripsi, Tanggal, Jumlah) 
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

CREATE TABLE Pembayaran_Tagihan_Rutin (
    ID INT PRIMARY KEY NOT NULL,
    Deskripsi VARCHAR(100) NOT NULL,
    Tanggal DATE NOT NULL,
    Jumlah INT NOT NULL
);
INSERT INTO Pembayaran_Tagihan_Rutin (ID, Deskripsi, Tanggal, Jumlah) 
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

CREATE TABLE Laporan_Keuangan (
    ID INT PRIMARY KEY AUTO_INCREMENT , 
    Pembayaran_UKT_ID INT NOT NULL,
    Pembayaran_Gaji_Dosen_ID INT NOT NULL,
    Pembelian_Peralatan_ID INT NOT NULL,
    Pembayaran_Tagihan_Rutin_ID INT NOT NULL,
    FOREIGN KEY (Pembayaran_UKT_ID) REFERENCES Pembayaran_UKT(ID),
    FOREIGN KEY (Pembayaran_Gaji_Dosen_ID) REFERENCES Pembayaran_Gaji_Dosen(ID),
    FOREIGN KEY (Pembelian_Peralatan_ID) REFERENCES Pembelian_Peralatan(ID),
    FOREIGN KEY (Pembayaran_Tagihan_Rutin_ID) REFERENCES Pembayaran_Tagihan_Rutin(ID)
);
INSERT INTO Laporan_Keuangan (Pembayaran_UKT_ID, Pembayaran_Gaji_Dosen_ID, Pembelian_Peralatan_ID, Pembayaran_Tagihan_Rutin_ID) 
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



SELECT COUNT(*) AS Jumlah_Mahasiswa
FROM Mahasiswa;

SELECT COUNT(*) AS Jumlah_Dosen
FROM Dosen; 

SELECT Deskripsi, Total
FROM Laporan_Keuangan;

SELECT * FROM Mahasiswa WHERE STATUS = 'Nonaktif';

SELECT * FROM laporan_keuangan;
