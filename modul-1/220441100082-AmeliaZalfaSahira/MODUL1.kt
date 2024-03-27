CREATE DATABASE utm;

USE utm;

CREATE TABLE mahasiswa (
    ID_mhs INT PRIMARY KEY,
    NIM INT,
    Nama VARCHAR(100),
    NPM VARCHAR (20),
    Prodi VARCHAR(50),
    Semester INT,
    TanggalMulai VARCHAR(20)NOT NULL,
    STATUS ENUM('Aktif', 'Nonaktif', 'Lulus','Cuti')
);

CREATE TABLE dosen (
    ID_dosen INT PRIMARY KEY,
    NID VARCHAR(20),
    Nama VARCHAR(100),
    Prodi VARCHAR(50),
    Gaji INT
);



CREATE TABLE pendaftaranmatkul (
    ID INT PRIMARY KEY,
    NIM INT,
    Kode_MK VARCHAR(20),
    Semester INT,
    FOREIGN KEY (NIM) REFERENCES mahasiswa(ID_mhs)
);


CREATE TABLE pembayaranUKT (
    ID INT PRIMARY KEY,
    NIM INT,
    Tanggal DATE,
    Jumlah INT,
    FOREIGN KEY (NIM) REFERENCES mahasiswa(ID_mhs)
);


CREATE TABLE pembayarangajidosen (
    ID INT PRIMARY KEY,
    NID INT,
    Tanggal DATE,
    Jumlah INT,
    FOREIGN KEY (NID) REFERENCES dosen(ID_dosen)
);

CREATE TABLE pembelianperalatan (
    ID INT PRIMARY KEY,
    Deskripsi VARCHAR(100),
    Tanggal DATE,
    Jumlah INT
);

CREATE TABLE pembayarantagihanrutin (
    ID INT PRIMARY KEY,
    Deskripsi VARCHAR(100),
    Tanggal DATE,
    Jumlah INT
);

INSERT INTO mahasiswa (ID_mhs, NIM, Nama, NPM, Prodi, Semester, TanggalMulai, stat) 
VALUES 
    (101, 22441102, 'Amelia Zalfa Sahira', '22441100082', "SI", 4, '2022-08-22', 'aktif'),
    (102, 20441173, 'Nadia Aprilia Puspitasari', '20441100073', "SI", 5, '2020-08-17', 'aktif'),
    (103, 194411154, 'Dwi Nurjannah', '19441100154', 6, "SI", '2019-09-05', 'aktif'),
    (104, 204411114, 'Irfan faruq', '20441100114', 7, "SI", '2020-05-04', 'aktif'),
    (105, 224411085, 'Khoirotun Nisak', '22441100085', 5, "SI", '2022-08-16', 'nonaktif'),
    (106, 214411119, 'Romauli', '21441100119', 6, "SI",'2021-04-11', 'aktif'),
    (107, 234411020, 'Tesa Hutagaol', '23441100020', 3, "SI", '2023-06-05', 'lulus'),
    (108, 214411017, 'Naela Nahdia', '21441100017', 6, "SI",'2021-07-17', 'nonaktif'),
    (109, 204411101, 'Bintang Wahyu', '20441100101', 7, "SI", '2020-03-15', 'lulus'),
    (110, 204411110, 'Imam Arishandi', '20441100110', 7, "SI", '2020-04-09', 'aktif');


INSERT INTO dosen (ID_dosen, NID, Nama, Prodi, Gaji) VALUES 
    (211, 111, 'WAHYUDI SETIAWAN, S.Kom., M.Kom.', 'Teknik Informatika', 26000000),
    (212, 112, 'Dr. Yeni', 'Sistem Informasi', 21000000),
    (213, 113, 'Dr. Syarif', 'Sistem Informasi', 25000000),
    (214, 114, 'FIRLI IRHAMNI, ST., M.Kom.', 'Sitem Informasi', 10000000),
    (215, 115, 'BAIN KHUSNUL KHOTIMAH, ST., M.Kom', 'Hukum', 19000000),
    (216, 116, 'Prof. Aselole', 'Teknik Mesin', 14000000),
    (217, 117, 'MEIDYA KOESHARDIANTO, S.Si., MT.', 'Agribisnis', 16500000),
    (218, 118, 'MUHAMMAD ALI SYAKUR, S.Si., M.T', 'Manajemen', 17600000),
    (219, 119, 'PRILLY LATUCONSINA, S.H','Akuntansi', 12700000),
    (220, 120, 'Achmad Zain Nur, S.Kom.,M.T', 'Teknik Industri', 18900000);



INSERT INTO pendaftaranmatkul (ID, NIM, Kode_MK, Semester) VALUES 
    (1, 101, 'SPK', 203),
    (2, 102, 'PEMBER', 201),
    (3, 103, 'PBO', 206),
    (4, 104, 'DM', 207),
    (5, 105, 'LO', 202),
    (6, 106, 'BING', 205),
    (7, 107, 'BIN', 204),
    (8, 108, 'KI', 200),
    (9, 109, 'PBW', 208),
    (10, 110, 'PAI', 203);


INSERT INTO pembayaranUKT (ID, NIM, Tanggal, Jumlah) VALUES 
    (1, 101, '2024-04-01', 3000000),
    (2, 102, '2024-01-19', 500000),
    (3, 103, '2024-05-20', 1500000),
    (4, 104, '2024-03-07', 200000),
    (5, 105, '2024-01-05', 2200000),
    (6, 106, '2024-02-30', 400000),
    (7, 107, '2024-03-29', 300000),
    (8, 108, '2024-05-10', 2500000),
    (9, 109, '2024-04-17', 1000000),
    (10, 110, '2024-05-11', 700000);


INSERT INTO pembayarangajidosen (ID, NID, Tanggal, Jumlah) 
VALUES 
    (1, 211, '2024-05-10', 24000000),
    (2, 212, '2024-04-01', 17000000),
    (3, 213, '2024-07-15', 33000000),
    (4, 214, '2024-01-29', 10000000),
    (5, 215, '2024-03-22', 11000000),
    (6, 216, '2024-09-01', 10000000),
    (7, 217, '2024-03-09', 19500000),
    (8, 218, '2024-04-11', 21000000),
    (9, 219, '2024-01-26', 13500000),
    (10, 220, '2024-02-23', 18000000);


INSERT INTO pembelianperalatan (ID, Deskripsi, Tanggal, Jumlah) 
VALUES 
    (1, 'Monitor', '2024-05-15', 6000000),
    (2, 'Mouse', '2024-05-16', 2000000),
    (3, 'Keyboard', '2024-05-17', 2500000),
    (4, 'Scanner', '2024-05-18', 4000000),
    (5, 'Speaker Bluetooth', '2024-05-19', 3000000),
    (6, 'Headset', '2024-05-20', 1800000),
    (7, 'External Hard Drive', '2024-05-21', 3500000),
    (8, 'Webcam', '2024-05-22', 2800000),
    (9, 'Projector Screen', '2024-05-23', 4500000),
    (10, 'Graphics Tablet', '2024-05-24', 7000000);

 
INSERT INTO pembayarantagihanrutin (ID, Deskripsi, Tanggal, Jumlah) 
VALUES 
    (1, 'Tagihan Kebersihan', '2024-04-05', 1800000),
    (2, 'Tagihan Air Bersih', '2024-04-06', 2200000),
    (3, 'Tagihan Listrik', '2024-04-07', 2500000),
    (4, 'Tagihan Parkir', '2024-04-08', 800000),
    (5, 'Tagihan Kebersihan', '2024-04-10', 2000000), 
    (6, 'Tagihan Kebersihan', '2024-04-10', 2000000),
    (7, 'Tagihan Parkir', '2024-04-11', 750000),
    (8, 'Tagihan Listrik', '2024-04-12', 2800000),
    (9, 'Tagihan Internet', '2024-04-13', 3200000),
    (10, 'Tagihan Air Bersih', '2024-04-14', 2300000);

    
CREATE VIEW laporankeuangan AS
SELECT 'Pembayaran UKT' AS Deskripsi, SUM(Jumlah) AS Total
FROM pembayaranUKT
UNION ALL
SELECT 'Pembayaran Gaji Dosen' AS Deskripsi, SUM(Jumlah) AS Total
FROM pembayarangajidosen
UNION ALL
SELECT 'Pembelian Peralatan' AS Deskripsi, SUM(Jumlah) AS Total
FROM pembelianperalatan
UNION ALL
SELECT 'Pembayaran Tagihan Rutin' AS Deskripsi, SUM(Jumlah) AS Total
FROM pembayarantagihanrutin;

SELECT COUNT(*) AS Jumlah_mahasiswa
FROM mahasiswa;

SELECT COUNT(*) AS Jumlah_dosen
FROM dosen;

SELECT Deskripsi, Total
FROM laporankeuangan;


SELECT NPM AS NMR_IDK, Nama, 'Mahasiswa' AS STATUS
FROM mahasiswa
UNION
SELECT NID AS NMR_IDK, Nama, 'Dosen' AS STATUS
FROM dosen;

SELECT ID_mhs AS ID, NPM AS NMR_IDK, Nama, 'Mahasiswa' AS STATUS
FROM mahasiswa
UNION ALL
SELECT ID_dosen AS ID, NID AS NMR_IDK, Nama, 'Dosen' AS STATUS
FROM dosen;


SHOW DATABASES;
DESC mahasiswa;
SELECT ID_dosen,NID Nama,Prodi, Gaji FROM dosen;
SELECT*FROM dosen;
ALTER TABLE mahasiswa CHANGE COLUMN STATUS stat ENUM('aktif', 'nonaktif', 'lulus');

DROP DATABASE utm;

