CREATE DATABASE universitas;

USE universitas;

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
    ID_Pendaftaran_Mata_Kuliah INT PRIMARY KEY,
    NIM INT,
    Kode_MK VARCHAR(20),
    Semester INT,
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);

CREATE TABLE Pembayaran_UKT (
    ID_Pembayaran_UKT INT PRIMARY KEY,
    NIM INT,
    Tanggal DATE,
    Jumlah INT,
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);

CREATE TABLE Pembayaran_Gaji_Dosen (
    ID_Pembayaran_Gaji_Dosen INT PRIMARY KEY,
    NID INT,
    Tanggal DATE,
    Jumlah INT,
    FOREIGN KEY (NID) REFERENCES Dosen(NID)
);

CREATE TABLE Pembelian_Peralatan (
    ID_Pembelian_Peralatan INT PRIMARY KEY,
    Deskripsi VARCHAR(100),
    Tanggal DATE,
    Jumlah INT
);

CREATE TABLE Pembayaran_Tagihan_Rutin (
    ID_tagihan INT PRIMARY KEY,
    Deskripsi VARCHAR(100),
    Tanggal DATE,
    Jumlah INT
);

    CREATE TABLE Laporan_Keuangan (
    ID_Laporan_Keuangan INT AUTO_INCREMENT PRIMARY KEY,
    Deskripsi VARCHAR(100),
    Total INT
);

CREATE TABLE MataKuliah (
    Kode_MK VARCHAR(20) PRIMARY KEY,
    Nama_MK VARCHAR(100),
    NID INT
);


INSERT INTO Mahasiswa (NIM, Nama, Prodi, Semester, STATUS) 
VALUES 
    (009, 'Naela', 'Teknik Informatika', 5, 'Aktif'),
    (008, 'Amel', 'Sistem Informasi', 4, 'Aktif'),
    (007, 'Roma', 'Sistem Informasi', 6, 'Aktif'),
    (006, 'Tesa', 'Ilmu Komunikasi', 7, 'Aktif'),
    (005, 'Ninis', 'Hukum', 5, 'Nonaktif'),
    (004, 'Dwi', 'Teknik Mesin', 8, 'Aktif'),
    (003, 'Dela', 'Kelautan', 3, 'Aktif'),
    (002, 'Imam', 'Manajemen', 6, 'Nonaktif'),
    (001, 'Irpan', 'Teknik Industri', 5, 'Aktif'),
    (010, 'Bintang', 'Kelautan', 7, 'Aktif');

INSERT INTO Dosen (NID, Nama, Prodi, Gaji) VALUES 
    (211, 'Dinda', 'Teknik Informatika', 15000000),
    (212, 'Laila', 'Sistem Informasi', 12000000),
    (213, 'Wahyudi', 'Sistem Informasi', 13000000),
    (214, 'Yudha', 'Ilmu Komunikasi', 14000000),
    (215, 'Mamad', 'Hukum', 11000000),
    (216, 'Ahmad', 'Teknik Mesin', 16000000),
    (217, 'Jokowi', 'Kelautan', 12500000),
    (218, 'Anis', 'Manajemen', 17000000),
    (219, 'Ganjar','Kelautan', 13500000),
    (220, 'Risma', 'Teknik Industri', 18000000);

INSERT INTO Pendaftaran_Mata_Kuliah (ID_Pendaftaran_Mata_Kuliah, NIM, Kode_MK, Semester) VALUES 
    (1, 009, 'TI101', 5),
    (2, 008, 'SI301', 4),
    (3, 007, 'SI202', 6),
    (4, 006, 'IK341', 7),
    (5, 005, 'H171', 5),
    (6, 004, 'TM241', 8),
    (7, 003, 'KEL101', 3),
    (8, 002, 'MA111', 6),
    (9, 001, 'TIND321', 5),
    (10, 010, 'KEL112', 7);

INSERT INTO Pembayaran_UKT (id_Pembayaran_UKT, NIM, Tanggal, Jumlah) 
VALUES 
    (1, 009, '2024-03-25', 5000000),
    (2, 008, '2024-03-26', 5500000),
    (3, 007, '2024-03-27', 4800000),
    (4, 006, '2024-03-28', 6000000),
    (5, 005, '2024-03-29', 5200000),
    (6, 004, '2024-03-30', 5800000),
    (7, 003, '2024-03-31', 5300000),
    (8, 002, '2024-04-01', 4900000),
    (9, 001, '2024-04-02', 5100000),
    (10, 010, '2024-04-03', 5400000);

INSERT INTO Pembayaran_Gaji_Dosen (ID_Pembayaran_Gaji_Dosen, NID, Tanggal, Jumlah) 
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
    (10, 220, '2024-04-03', 18000000);

INSERT INTO Pembelian_Peralatan (ID_Pembelian_Peralatan, Deskripsi, Tanggal, Jumlah) 
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
 
INSERT INTO Pembayaran_Tagihan_Rutin (ID_tagihan, Deskripsi, Tanggal, Jumlah) 
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
       
    

SELECT * FROM Laporan_keuangan;
                                        
SELECT COUNT(*) AS Jumlah_Dosen
FROM Dosen;

SELECT COUNT(*) AS Jumlah_Mahasiswa
FROM mahasiswa;

SELECT Deskripsi, Total
FROM Laporan_Keuangan;

DROP VIEW Laporan_Keuangan;

SHOW TABLES;

DROP DATABASE universitas;


ALTER TABLE matakuliah ADD COLUMN NID INT
ALTER TABLE laporan_keuangan ADD COLUMN id_ INT

ALTER TABLE matakuliah
ADD CONSTRAINT fk_hubungananatardosen
FOREIGN KEY (NID) REFERENCES dosen(NID)

ALTER TABLE Laporan_Keuangan ADD COLUMN ID_Pembayaran_Gaji_Dosen INT

ALTER TABLE Laporan_Keuangan
ADD CONSTRAINT fk_pembayaran_gaji_dosen
FOREIGN KEY (ID_Pembayaran_Gaji_Dosen) REFERENCES Pembayaran_Gaji_Dosen(ID_Pembayaran_Gaji_Dosen);

ALTER TABLE Laporan_Keuangan ADD COLUMN ID_Pembelian_Peralatan INT

ALTER TABLE Laporan_Keuangan
ADD CONSTRAINT fk_pembelian_peralatan
FOREIGN KEY (ID_Pembelian_Peralatan) REFERENCES Pembelian_Peralatan (ID_Pembelian_Peralatan);

ALTER TABLE Laporan_Keuangan ADD COLUMN ID_Tagihan INT

ALTER TABLE Laporan_Keuangan
ADD CONSTRAINT fk_pembayaran_tagihan
FOREIGN KEY (ID_Tagihan) REFERENCES pembayaran_tagihan_Rutin(ID_Tagihan);


ALTER TABLE Laporan_Keuangan
DROP COLUMN ID_Pembayaran_Tagihan_Rutin;
