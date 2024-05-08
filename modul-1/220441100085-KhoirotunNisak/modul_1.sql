CREATE DATABASE univ;

USE univ

CREATE TABLE Mhs (
    NIM INT PRIMARY KEY,
    Nama VARCHAR(100),
    Prodi VARCHAR(50),
    Semester INT,
    STATUS ENUM('Aktif', 'Nonaktif', 'Lulus')
);

CREATE TABLE Dosen (
    NIP INT PRIMARY KEY,
    Nama VARCHAR(100),
    Prodi VARCHAR(50),
    Gaji INT
);


CREATE TABLE Pendaftaran_Matkul (
    ID INT PRIMARY KEY,
    NIM INT,
    Kode_MK VARCHAR(20),
    Semester INT,
    FOREIGN KEY (NIM) REFERENCES Mhs(NIM)
);



CREATE TABLE Pembayaran_UKT (
    ID INT PRIMARY KEY,
    NIM INT,
    Tanggal DATE,
    Jumlah INT,
    FOREIGN KEY (NIM) REFERENCES Mhs(NIM)
);

CREATE TABLE Pembayaran_GjDosen (
    ID INT PRIMARY KEY,
    NIP INT,
    Tanggal DATE,
    Jumlah INT,
    FOREIGN KEY (NIP) REFERENCES Dosen(NIP)
);


CREATE TABLE Pembelian_Peralatan (
    ID INT PRIMARY KEY,
    Deskripsi VARCHAR(100),
    Tanggal DATE,
    Jumlah INT,
    Jenis VARCHAR(25)
);
DESC Pembelian_Peralatan;


SHOW TABLES;

INSERT INTO Mhs (NIM, Nama, Prodi, Semester, STATUS) 
VALUES 
    (085, 'Ninis', 'Kedokteran', 5, 'Aktif'),
    (086, 'Nanda', 'Hukum', 4, 'Aktif'),
    (087, 'Galuh', 'Sistem Informasi', 6, 'Aktif'),
    (088, 'Prabowo', 'Ilmu Komunikasi', 7, 'Aktif'),
    (089, 'Anies baswedan', 'Sistem Informasi', 5, 'Nonaktif'),
    (090, 'Ganjar', 'Teknik Mesin', 8, 'Aktif'),
    (100, 'Erik', 'Kelautan', 3, 'Aktif'),
    (101, 'Tohir', 'Manajemen', 6, 'Nonaktif'),
    (102, 'Gibran', 'Teknik Industri', 5, 'Aktif'),
    (103, 'Imin', 'Kelautan', 7, 'Aktif');

INSERT INTO Dosen (NIP, Nama, Prodi, Gaji) 
VALUES 
    (980, 'Prof. jibril', 'Teknik Mesin', 12500000),
    (981, 'Dr. Rana', 'Teknik Informatika', 12500000),
    (982, 'Dr. Yeni', 'Sistem Informasi', 12000000),
    (983, 'Prof. Wahyu', 'Teknik Informatika', 12500000),
    (984, 'Dr. Prabowo Subianto', 'Hukum', 12500000),
    (985, 'Prof. Siti', 'Teknik Mesin', 12500000),
    (986, 'Dr. Hazi', 'Kelautan', 12500000),
    (987, 'Prof. Soekarno', 'Manajemen', 12500000),
    (988, 'Dr. Imin ','Kelautan', 12500000),
    (989, 'Dr. Habibi', 'Kedokteran', 12500000);

INSERT INTO Pendaftaran_Matkul (ID, NIM, Kode_MK, Semester) VALUES 
    (1, 085, 'SI990', 4),
    (2, 086, 'KI125', 3),
    (3, 087, 'PB567', 2),
    (4, 088, 'KL333', 4),
    (5, 089, 'PAI43', 5),
    (6, 090, 'GY768', 6),
    (7, 100, 'AI90', 7),
    (8, 101, 'MK099', 8),
    (9, 102, 'IN22', 3),
    (10, 103, 'IK988', 2);

INSERT INTO Pembayaran_UKT (ID, NIM, Tanggal, Jumlah) 
VALUES 
    (21, 085, '2024-03-25', 5000000),
    (22, 086, '2024-03-26', 5500000),
    (23, 087, '2024-03-27', 4800000),
    (24, 088, '2024-03-28', 6000000),
    (25, 089, '2024-03-29', 5200000),
    (26, 090, '2024-03-30', 5800000),
    (27, 100, '2024-03-31', 5300000),
    (28, 101, '2024-04-01', 4900000),
    (29, 102, '2024-04-02', 5100000),
    (30, 103, '2024-04-03', 5400000);

INSERT INTO Pembayaran_GjDosen (ID, NIP, Tanggal, Jumlah) 
VALUES 
    (11, 980, '2024-09-5', 15000000),
    (12, 981, '2024-09-2', 12000000),
    (13, 982, '2024-09-7', 13000000),
    (14, 983, '2024-09-8', 14000000),
    (15, 984, '2024-09-9', 11000000),
    (16, 985, '2024-09-3', 16000000),
    (17, 986, '2024-09-01', 12500000),
    (18, 987, '2024-09-01', 17000000),
    (19, 988, '2024-09-02', 13500000),
    (20, 989, '2024-09-03', 18000000);

INSERT INTO Pembelian_Peralatan (ID, Deskripsi, Tanggal, Jumlah, Jenis) 
VALUES 
    (31, 'Proyektor', '2024-03-25', 5000000, 'Pembelian'),
    (32, 'Laptop', '2024-03-26', 8000000, 'Pembelian'),
    (33, 'Papan Tulis', '2024-03-27', 3000000, 'Pembelian'),
    (34, 'Printer', '2024-03-28', 4000000,'Pembelian'),
    (35, 'Kursi', '2024-03-29', 2000000, 'Pembelian'),
    (56, 'Tagihan Parkir', '2024-03-30', 800000, 'Pembayaran'),
    (57, 'Tagihan Cleaning Service', '2024-03-31', 1200000, 'Pembayaran'),
    (58, 'Tagihan Maintenance Gedung', '2024-04-01', 2500000, 'Pembayaran'),
    (59, 'Tagihan Internet', '2024-04-02', 3000000, 'Pembayaran'),
    (60, 'Tagihan Listrik', '2024-04-03', 1800000, 'Pembayaran'); 
    
ALTER TABLE Pembelian_Peralatan
ALTER COLUMN ID SET DEFAULT 12;
ALTER TABLE Pembelian_Peralatan
ALTER COLUMN Deskripsi SET DEFAULT 'Pembayaran';
ALTER TABLE Pembelian_Peralatan
ALTER COLUMN Tanggal SET DEFAULT '30-03-09';
ALTER TABLE Pembelian_Peralatan
ALTER COLUMN Jumlah SET DEFAULT "1"; 
ALTER TABLE Pembelian_Peralatan
ALTER COLUMN Jenis SET DEFAULT 123;

 INSERT INTO Pembayaran_Tagihan_Rutin (ID, Deskripsi, Tanggal, Jumlah) 
 VALUES 
    
 
CREATE VIEW Laporan_Keuangan AS
SELECT 'Pembayaran UKT' AS Deskripsi, SUM(Jumlah) AS Total
FROM Pembayaran_UKT
UNION ALL
SELECT 'Pembayaran Gaji Dosen' AS Deskripsi, SUM(Jumlah) AS Total
FROM Pembayaran_GjDosen
UNION ALL
SELECT 'Pembelian Peralatan' AS Deskripsi, SUM(Jumlah) AS Total
FROM Pembelian_Peralatan
UNION ALL
SELECT 'Pembayaran Tagihan Rutin' AS Deskripsi, SUM(Jumlah) AS Total
FROM Pembayaran_Tagihan_Rutin;

SELECT Deskripsi, Total
FROM Laporan_Keuangan;

SELECT COUNT(*) AS Jumlah_Mahasiswa
FROM Mhs;

SELECT COUNT(*) AS Jumlah_Dosen
FROM Dosen;


