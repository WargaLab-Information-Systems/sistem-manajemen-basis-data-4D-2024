CREATE DATABASE universitas;

USE universitas

CREATE TABLE Mahasiswa (
    NIM INT PRIMARY KEY,
    Nama VARCHAR(100),
    Prodi VARCHAR(50),
    Semester INT,
    STATUS ENUM('Aktif', 'Nonaktif', 'Lulus')
);

CREATE TABLE Dosen (
    NID INT PRIMARY KEY,
    Nama VARCHAR(100),
    Prodi VARCHAR(50),
    Gaji INT
);

CREATE TABLE Pendaftaran_Mata_Kuliah (
    ID INT PRIMARY KEY,
    NIM INT,
    Kode_MK VARCHAR(20),
    Semester INT,
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);

CREATE TABLE Pembayaran_UKT (
    ID INT PRIMARY KEY,
    NIM INT,
    Tanggal DATE,
    Jumlah INT,
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);

CREATE TABLE Pembayaran_Gaji_Dosen (
    ID INT PRIMARY KEY,
    NID INT,
    Tanggal DATE,
    Jumlah INT,
    FOREIGN KEY (NID) REFERENCES Dosen(NID)
);

CREATE TABLE Pembelian_Peralatan (
    ID INT PRIMARY KEY,
    Deskripsi VARCHAR(100),
    Tanggal DATE,
    Jumlah INT
);

CREATE TABLE Pembayaran_Tagihan_Rutin (
    ID INT PRIMARY KEY,
    Deskripsi VARCHAR(100),
    Tanggal DATE,
    Jumlah INT
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

INSERT INTO Pembayaran_UKT (ID, NIM, Tanggal, Jumlah) 
VALUES 
    (1, 101, '2024-03-25', 5000000),
    (2, 102, '2024-03-26', 5500000),
    (3, 103, '2024-03-27', 4800000),
    (4, 104, '2024-03-28', 6000000),
    (5, 105, '2024-03-29', 5200000),
    (6, 106, '2024-03-30', 5800000),
    (7, 107, '2024-03-31', 5300000),
    (8, 108, '2024-04-01', 4900000),
    (9, 109, '2024-04-02', 5100000),
    (10, 110, '2024-04-03', 5400000);

INSERT INTO Pembayaran_Gaji_Dosen (ID, NID, Tanggal, Jumlah) 
VALUES 
    (1, 211, '2024-03-25', 15000000),
    (2, 212, '2024-03-26', 12000000),
    (3, 213, '2024-03-27', 13000000),
    (4, 214, '2024-03-28', 14000000),
    (5, 215, '2024-03-29', 11000000),
    (6, 216, '2024-03-30', 16000000),
    (7, 217, '2024-03-31', 12500000),
    (8, 218, '2024-04-01', 17000000),
    (9, 219, '2024-04-02', 13500000),
    (10, 210, '2024-04-03', 18000000);

INSERT INTO Pembelian_Peralatan (ID, Deskripsi, Tanggal, Jumlah) 
VALUES 
    (1, 'Proyektor', '2024-03-25', 5000000),
    (2, 'Laptop', '2024-03-26', 8000000),
    (3, 'Papan Tulis', '2024-03-27', 3000000),
    (4, 'Printer', '2024-03-28', 4000000),
    (5, 'Kursi', '2024-03-29', 2000000),
    (6, 'Meja', '2024-03-30', 2500000),
    (7, 'Speaker', '2024-03-31', 3500000),
    (8, 'Kamera', '2024-04-01', 7000000),
    (9, 'Mikrofon', '2024-04-02', 4500000),
    (10, 'Papan Proyeksi', '2024-04-03', 6000000);
    
INSERT INTO Pembayaran_Tagihan_Rutin (ID, Deskripsi, Tanggal, Jumlah) 
VALUES 
    (1, 'Tagihan Listrik', '2024-03-25', 2000000),
    (2, 'Tagihan Air', '2024-03-26', 1500000),
    (3, 'Tagihan Internet', '2024-03-27', 3000000),
    (4, 'Tagihan Telepon', '2024-03-28', 1000000),
    (5, 'Tagihan Keamanan', '2024-03-29', 500000),
    (6, 'Tagihan Parkir', '2024-03-30', 800000),
    (7, 'Tagihan Cleaning Service', '2024-03-31', 1200000),
    (8, 'Tagihan Maintenance Gedung', '2024-04-01', 2500000),
    (9, 'Tagihan Internet', '2024-04-02', 3000000),
    (10, 'Tagihan Listrik', '2024-04-03', 1800000);
 

CREATE VIEW Laporan_Keuangan AS
select * from pembayaran_gaji_dosen;
SELECT * FROM pembayaran_ukt;

SELECT COUNT(*) AS Jumlah_Mahasiswa
FROM Mahasiswa;

SELECT COUNT(*) AS Jumlah_Dosen
FROM Dosen;

SELECT Deskripsi, Total
FROM Laporan_Keuangan;

DROP TABLE pembayaran_gaji_dosen;

show table dosen;

ALTER TABLE Pendaftaran_Mata_Kuliah RENAME TO Mata_Kuliah;
ALTER TABLE Pembayaran_tagihan_rutin RENAME TO Tagihan_Rutin;

