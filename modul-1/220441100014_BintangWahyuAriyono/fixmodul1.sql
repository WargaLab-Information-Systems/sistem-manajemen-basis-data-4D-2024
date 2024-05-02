CREATE DATABASE univ;

USE univ;

CREATE TABLE Mahasiswa (
    NIM INT PRIMARY KEY not null,
    Nama VARCHAR(100) not null,
    Prodi VARCHAR(50) not null,
    Semester INT not null,
    Jenis_Kelamin VARCHAR (10)not null,
    Umur INT not null,
    Agama VARCHAR (10) not null,
    STATUS ENUM('Aktif', 'Nonaktif', 'Lulus') not null
);

CREATE TABLE Dosen (
    NIP INT PRIMARY KEY not null,
    Nama VARCHAR(100) not null,
    Prodi VARCHAR(50) not null, 
    Jenis_Kelamin VARCHAR (10) not null,
    Umur INT not null,
    Gaji INT not null
);

CREATE TABLE Pendaftaran_MatKul (
    ID INT PRIMARY KEY not null,
    NIM INT not null,
    Kode_Matkul VARCHAR(20) not null,
    Jumlah_SKS INT not null,
    Semester INT not null,
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);

CREATE TABLE Pembayaran_UKT (
    ID INT PRIMARY KEY not null,
    NIM INT not null,
    Tanggal DATE not null, 
    Jumlah_Tagihan INT not null,
    Via_Bank VARCHAR(10) not null,
    FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);

CREATE TABLE Pembayaran_Gaji_Dosen (
    ID INT PRIMARY KEY not null,
    NIP INT not null,
    Tanggal DATE not null,
    Jumlah_Gaji INT not null,
    FOREIGN KEY (NIP) REFERENCES Dosen(NIP)
);

CREATE TABLE Pembelian_Peralatan (
    ID INT PRIMARY KEY not null,
    Deskripsi_Peralatan VARCHAR(100)not null,
    Tanggal_Pembelian DATE not null,
    Jumlah_Peralatan INT not null
);

CREATE TABLE Pembayaran_Tagihan_Rutin (
    ID INT PRIMARY KEY not null,
    Deskripsi_Tagihan VARCHAR(100) not null,
    Tanggal DATE not null,
    Jumlah_Tagihan INT not null
);

CREATE TABLE Laporan_Keuangan (
    ID INT PRIMARY KEY AUTO_INCREMENT not null, 
    Pembayaran_UKT_ID INT not null,
    Pembayaran_Gaji_Dosen_ID INT not null,
    Pembelian_Peralatan_ID INT not null,
    Pembayaran_Tagihan_Rutin_ID INT not null,
    FOREIGN KEY (Pembayaran_UKT_ID) REFERENCES Pembayaran_UKT(ID) ,
    FOREIGN KEY (Pembayaran_Gaji_Dosen_ID) REFERENCES Pembayaran_Gaji_Dosen(ID),
    FOREIGN KEY (Pembelian_Peralatan_ID) REFERENCES Pembelian_Peralatan(ID),
    FOREIGN KEY (Pembayaran_Tagihan_Rutin_ID) REFERENCES Pembayaran_Tagihan_Rutin(ID)
);

drop table Laporan_Keuangan;

INSERT INTO Mahasiswa (NIM, Nama, Prodi, Semester, Jenis_Kelamin, Umur, Agama, STATUS) 
VALUES 
    (001, 'Wahyu', 'Teknik Mesin', 2, 'Cowo', 20, 'Islam', 'Aktif'),
    (002, 'Bintang', 'Teknik Mekatro', 4, 'Cowo', 21, 'Islam', 'Aktif'),
    (003, 'Purnomo', 'Sistem Informasi', 6, 'Cowo', 23, 'Islam', 'Aktif'),
    (004, 'Marsetyo', 'Ilmu Komunikasi', 8, 'Cowo', 24, 'Islam', 'Aktif'),
    (005, 'Anies bused', 'Hukum', 12, 'Cowo', 80, 'Islam', 'Nonaktif'),
    (006, 'Prabowo', 'Teknik Mesin', 12, 'Cowo', 81, 'Islam', 'Aktif'),
    (007, 'Gibran', 'Kelautan', 8, 'Cowo', 70, 'Islam', 'Aktif'),
    (008, 'Guanjar', 'Manajemen', 6, 'Cowo', 60, 'Islam', 'Nonaktif'),
    (009, 'Jokowi', 'Teknik Industri', 4, 'Cowo', 67, 'Islam', 'Aktif'),
    (010, 'Imam Mahdi', 'Kelautan', 2, 'Cowo', 20, 'Kristen', 'Aktif');

INSERT INTO Dosen (NIP, Nama, Prodi, Jenis_Kelamin, Umur, Gaji) VALUES 
    (201, 'Prof. Bintang', 'Teknik Mesin', 'Cowo', 21, 20000000),
    (202, 'Dr. Angga', 'Sistem Informasi', 'Cowo', 22,12000000),
    (203, 'Dr. Imam', 'Sistem Informasi', 'Cowo', 77, 13000000),
    (204, 'Prof. Zain', 'Ilmu Komunikasi', 'Cowo', 28, 14000000),
    (205, 'Dr. Prabowo Subianto', 'Hukum', 'Cowo', 80, 11000000),
    (206, 'Prof. Anis Bused', 'Sastra Mesin', 'Cowo', 101, 16000000),
    (207, 'Dr. Titiek', 'Kelautan', 'Cewe', 56, 12500000),
    (208, 'Prof. Soekarno', 'Manajemen', 'Cowo', 200, 17000000),
    (209, 'Dr. Safi ','Kelautan', 'Cowo', 45, 13500000),
    (210, 'Dr. Jokowi', 'Hukum', 'Cowo', 60, 18000000);

INSERT INTO Pendaftaran_MatKul (ID, NIM, Kode_Matkul, Jumlah_SKS, Semester) VALUES 
    (1, 001, 'TM101', 24, 2),
    (2, 002, 'TK301', 23, 4),
    (3, 003, 'SI202', 24, 6),
    (4, 004, 'IK341', 22, 8),
    (5, 005, 'H171', 20, 12),
    (6, 006, 'TM241', 24, 12),
    (7, 007, 'KEL101', 18, 8),
    (8, 008, 'MA111', 18, 6),
    (9, 009, 'TIND321', 24, 4),
    (10, 010, 'KEL112', 23, 2);

INSERT INTO Pembayaran_UKT (ID, NIM, Tanggal, Jumlah_Tagihan, Via_Bank) 
VALUES 
    (11, 001, '2024-04-25', 5000000, 'BCA'),
    (12, 002, '2024-04-26', 5500000, 'Mandiri'),
    (13, 003, '2024-04-27', 4800000, 'Bjatim'),
    (14, 004, '2024-04-28', 6000000, 'BRI'),
    (15, 005, '2024-05-29', 5200000, 'BCA'),
    (16, 006, '2024-05-30', 5800000, 'Bjatim'),
    (17, 007, '2024-05-31', 5300000, 'Bjatim'),
    (18, 008, '2024-05-01', 4900000, 'BRI'),
    (19, 009, '2024-05-02', 5100000, 'BRI'),
    (20, 010, '2024-06-03', 5400000, 'Mandiri');

INSERT INTO Pembayaran_Gaji_Dosen (ID, NIP, Tanggal, Jumlah_Gaji) 
VALUES 
    (41, 201, '2024-04-25', 15000000),
    (42, 202, '2024-04-26', 12000000),
    (43, 203, '2024-04-27', 13000000),
    (44, 204, '2024-04-28', 14000000),
    (45, 205, '2024-04-29', 11000000),
    (46, 206, '2024-04-30', 16000000),
    (47, 207, '2024-04-31', 12500000),
    (48, 208, '2024-04-01', 17000000),
    (49, 209, '2024-04-02', 13500000),
    (50, 210, '2024-04-03', 18000000);

INSERT INTO Pembelian_Peralatan (ID, Deskripsi_Peralatan, Tanggal_Pembelian, Jumlah_Peralatan) 
VALUES 
    (301, 'Kursi', '2024-03-25', 500),
    (302, 'Komputer', '2024-03-26', 800),
    (303, 'Spidol', '2024-03-27', 100),
    (304, 'Penghapus', '2024-03-28', 100),
    (305, 'Meja', '2024-03-29', 500),
    (306, 'Proyektor', '2024-03-30', 25),
    (307, 'Taplak', '2024-03-31', 35),
    (308, 'AC', '2024-04-01', 27),
    (309, 'Keyboard', '2024-04-02', 800),
    (310, 'Papan Proyektor', '2024-04-03', 25);
    
 INSERT INTO Pembayaran_Tagihan_Rutin (ID, Deskripsi_Tagihan, Tanggal, Jumlah_Tagihan) 
 VALUES 
    (21, 'Tagihan Listrik', '2024-03-25', 2000000),
    (22, 'Tagihan Air', '2024-03-26', 1500000),
    (23, 'Tagihan Internet', '2024-03-27', 3000000),
    (24, 'Tagihan Mesin Lab', '2024-03-28', 1000000),
    (25, 'Tagihan Keamanan', '2024-03-29', 500000),
    (26, 'Tagihan Parkir', '2024-03-30', 800000),
    (27, 'Tagihan Cleaning Service', '2024-03-31', 1200000),
    (28, 'Tagihan Maintenance Gedung', '2024-04-01', 2500000),
    (29, 'Tagihan Asrama', '2024-04-02', 3000000),
    (30, 'Tagihan Supir', '2024-04-03', 1800000);   
    
 INSERT INTO Laporan_Keuangan (Pembayaran_UKT_ID, Pembayaran_Gaji_Dosen_ID, Pembelian_Peralatan_ID, Pembayaran_Tagihan_Rutin_ID) 
 VALUES 
    (11, 41, 301, 21),
    (12, 42, 302, 22),
    (13, 43, 303, 23),
    (14, 44, 304, 24),
    (15, 45, 305, 25),
    (16, 46, 306, 26),
    (17, 47, 307, 27),
    (18, 48, 308, 28),
    (19, 49, 309, 29),
    (20, 50, 310, 30);   
    
    select count(*) AS Jumlah_Mahasiswa
    from Mahasiswa;
    
	select count(*) AS Jumlah_Dosen
    from Dosen;   
    
    select * FROM Laporan_Keuangan;
    DROP TABLE IF EXISTS Laporan_Keuangan;
    
    select * from Mahasiswa;
    select * from Dosen;
	select * from Pendaftaran_Matkul;
	select * from Pembayaran_UKT;
	select * from Pembayaran_Gaji_Dosen;
	select * from Pembelian_Peralatan;
	select * from Pembayaran_Tagihan_Rutin;
