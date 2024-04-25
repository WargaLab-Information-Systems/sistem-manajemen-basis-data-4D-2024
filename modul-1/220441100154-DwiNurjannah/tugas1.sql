CREATE DATABASE universitas;

USE universitas;

CREATE TABLE Mahasiswa (
    NIM INT PRIMARY KEY,
    Nama VARCHAR(100),
    Prodi VARCHAR(50),
    Semester INT,
    Mata_kuliah VARCHAR(20),
    STATUS ENUM('Aktif', 'Nonaktif', 'Lulus')
);




INSERT INTO Mahasiswa (NIM, Nama, Prodi, Semester,Mata_kuliah, STATUS) 
VALUES 
    (111, 'Dika', 'Teknik Informatika', 5,'ALPRO', 'Aktif'),
    (112, 'Rani', 'Sistem Informasi', 4,'PBO', 'Aktif'),
    (113, 'Nanda', 'Sistem Informasi', 6,'IMK', 'Aktif'),
    (114, 'Ivan', 'Ilmu Komunikasi', 7,'Desain Visual', 'Aktif'),
    (115, 'Andi', 'Hukum', 5, 'HAM','Nonaktif'),
    (116, 'Fikri', 'Teknik Mesin', 8,'Mesin Fluida', 'Aktif'),
    (117, 'Indra', 'Kelautan', 3, 'Dinamika Arus','Aktif'),
    (118, 'Siti', 'Manajemen', 6,'Akuntansi', 'Nonaktif'),
    (119, 'Rizky', 'Teknik Industri','Data Mining','MA112', 'Aktif'),
    (120, 'Toni', 'Kelautan', 7,'Dinamika ', 'Aktif');

SELECT*FROM Mahasiswa;
CREATE TABLE Dosen (
    NID INT PRIMARY KEY,
    Nama VARCHAR(100),
    Prodi VARCHAR(50),
    Gaji INT
);
INSERT INTO Dosen (NID, Nama, Prodi, Gaji) VALUES 
	(221, 'Prof. Agus', 'Teknik Informatika', 15000000),
    (222, 'Dr. Nina', 'Sistem Informasi', 12000000),
    (223, 'Dr. Arief', 'Sistem Informasi', 13000000),
    (224, 'Prof. Budi', 'Ilmu Komunikasi', 14000000),
    (225, 'Dr. Susi', 'Hukum', 11000000),
    (226, 'Prof. Rudi', 'Teknik Mesin', 16000000),
    (227, 'Dr. Fajar', 'Kelautan', 12500000),
    (228, 'Prof. Joko', 'Manajemen', 17000000),
    (229, 'Dr. Dedi', 'Kelautan', 13500000),
    (230, 'Dr. Adi', 'Teknik Industri', 18000000);

CREATE TABLE Transaksi(
	ID INT PRIMARY KEY,
    Tanggal DATE,
    Pembayaran ENUM('UKT','Gaji Dosen','Pembelian Alat','Tagihan'),
    Detail VARCHAR (150),
    Total double
    );
   
INSERT INTO Transaksi
value 
	(1,'2024-03-01','UKT','Dwi bayar UKT',3000000),
    (2,'2024-03-02','Gaji Dosen','Gaji Pak Syarif',4000000),
	(3,'2024-03-03','Pembelian Alat','Beli AC',3000000),
    (4,'2024-03-04','UKT','Della bayar UKT',3000000),
    (5,'2024-03-05','Tagihan','Tagihan Listrik',100000),
    (6,'2024-03-06','UKT','Dwi bayar UKT',3000000),
    (7,'2024-03-07','Gaji Dosen','Gaji Pak Tawii',3000000),
    (8,'2024-03-08','Pembelian Alat','Beli Papan Tulis',150000),
    (9,'2024-03-09','Tagihan','Tagihan Internet',3000000),
    (10,'2024-03-10','UKT','Reno bayar UKT',2000000);

   

CREATE TABLE Laporan (
 ID INT Primary Key,
 Jenis Enum('Laporan Dosen','Laporan Mahsiswa'),
 Deskripsi varchar(200),
 Jumlah INT);
    
	insert into Laporan(ID,Jenis,Deskripsi,Jumlah) value (1,'Laporan Mahsiswa','Jumlah mahasiswa dari utm adalah sebanyak',(Select count(Nama) From Mahasiswa));
    insert into Laporan(ID,Jenis,Deskripsi,Jumlah) value (2,'Laporan Dosen','Jumlah dosen dari utm adalah sebanyak',(Select count(Nama) From Dosen));
    
    select * from Laporan;
    
CREATE TABLE Laporan_Keuangan (
 ID INT Primary Key,
 Jenis Enum('Laporan Gaji Dosen','Laporan Pembayaran UKT','Laporan Tagihan','Laporan Pembelian'),
 Deskripsi varchar(200),
 Jumlah double
    );
	
    insert into Laporan_Keuangan value (2,'Laporan Gaji Dosen','Jumlah Total Pengeluaran Untuk Gaji Dosen Adalah',(Select sum(total) from transaksi where pembayaran='Gaji Dosen'));

