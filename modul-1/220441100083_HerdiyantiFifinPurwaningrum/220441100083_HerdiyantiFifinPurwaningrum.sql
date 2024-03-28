CREATE DATABASE db_univTrunojoyo;
USE db_univTrunojoyo;

CREATE TABLE mahasiswa (
NIM CHAR (12) NOT NULL PRIMARY KEY ,  
Nama_Mahasiswa VARCHAR (100) NOT NULL, 
Angkatan YEAR NOT NULL, 
Program_Studi VARCHAR (50) NOT NULL, 
Status_Mahasiswa VARCHAR (20) NOT NULL
);
DESC mahasiswa;

CREATE TABLE dosen (
NIP CHAR (12) NOT NULL PRIMARY KEY, 
Nama_Dosen VARCHAR (100) NOT NULL, 
Program_Studi VARCHAR (20) NOT NULL, 
Status_Dosen VARCHAR (20) NOT NULL 
);
DESC dosen;

CREATE TABLE mata_kuliah ( 
Kode_mk VARCHAR (10) NOT NULL PRIMARY KEY,
Nama_mk VARCHAR (50) NOT NULL,
SKS INT NOT NULL,
Semester INT NOT NULL,
Program_Studi VARCHAR (20) NOT NULL,
NIP CHAR (12) NOT NULL, 
FOREIGN KEY (NIP) REFERENCES Dosen (NIP)
);
DESC mata_kuliah;

CREATE TABLE krs (
NIM CHAR (12) NOT NULL,
Kode_mk VARCHAR (10) NOT NULL,
Semester INT NOT NULL,
Tahun_Ajar YEAR NOT NULL,
FOREIGN KEY (NIM) REFERENCES mahasiswa(NIM),
FOREIGN KEY (Kode_mk) REFERENCES mata_kuliah(Kode_mk)
);

CREATE TABLE ukt (
id_ukt INT NOT NULL PRIMARY KEY,
NIM CHAR (12) NOT NULL, 
Semester INT NOT NULL,
Tahun_Ajar YEAR NOT NULL,
Tanggal_Bayar DATE NOT NULL,
Jumlah_Bayar INT NOT NULL,
FOREIGN KEY (NIM) REFERENCES mahasiswa(NIM)
);
DESC ukt;

CREATE TABLE gaji_dosen (
id_Gaji INT NOT NULL PRIMARY KEY,
NIP CHAR (12) NOT NULL,
Tanggal_Gaji DATE NOT NULL,
Gaji_Pokok INT NOT NULL,
Tunjangan INT NOT NULL , 
Total_Gaji INT NOT NULL,
FOREIGN KEY (NIP) REFERENCES dosen(NIP)
);

ALTER TABLE gaji_dosen
ALTER COLUMN Gaji_Pokok SET DEFAULT 5000000;
ALTER TABLE gaji_dosen
ALTER COLUMN Tunjangan SET DEFAULT 2000000;
ALTER TABLE gaji_dosen
ALTER COLUMN Total_Gaji SET DEFAULT 3000000;
ALTER TABLE gaji_dosen
ALTER COLUMN Tanggal_Gaji SET DEFAULT "01-01-01"; 
ALTER TABLE gaji_dosen
ALTER COLUMN NIP SET DEFAULT 123;
ALTER TABLE gaji_dosen
ALTER COLUMN id_Gaji SET DEFAULT 111;

ALTER TABLE gaji_dosen change column Tunjangan Tambahan INT(11);
DESC gaji_dosen;

CREATE TABLE pembelian (
id_pembelian VARCHAR (6) NOT NULL PRIMARY KEY,
Tanggal_Beli DATE NOT NULL,
Nama_Barang VARCHAR (50) NOT NULL,
Jumlah_Beli INT NOT NULL,
Total_Harga INT NOT NULL
);
DESC pembelian;

CREATE TABLE tagihan (
id_tagihan VARCHAR (6) NOT NULL PRIMARY KEY,
Jenis_Tagihan VARCHAR (50) NOT NULL,
Jumlah_Tagihan INT NOT NULL,
Tanggal_Bayar DATE NOT NULL);
DESC tagihan;

CREATE TABLE keuangan (
id_keuangan INT NOT NULL PRIMARY KEY,
uang_masuk INT NOT NULL,
uang_keluar INT NOT NULL,
tgl_transaksi DATE NOT NULL,
saldo INT NOT NULL
);

INSERT INTO mahasiswa VALUES
('220441100001','Nurul Anisa','2022','Sistem Informasi','Aktif'),
('220441100002','Rizki Ramadhan','2022','Sistem Informasi','Berhenti'),
('230441100003','Ardhito Pramono','2023', 'Sistem Informasi', 'Aktif'),
('220441100004','Irma Damayanti','2022','Sistem Informasi','Aktif'),
('200441100005','Pamungkas Saputra','2020','Sistem Informasi','Sudah Lulus'),
('200441300001','Syahrul Rauf','2020','Teknik Informatika','Sudah Lulus'),
('220441300002','Indy Ratna','2022','Teknik Informatika','Aktif'),
('220441300003','Ismail Anam','2022','Teknik Informatika','Aktif'),
('220441300004','Hendra Eka','2022','Teknik Informatika','Berhenti'),
('230441300005','Cantika Fitri','2023','Teknik Informatika','Aktif');

INSERT INTO dosen VALUES
('123456789012','Siti Cholifah S.Kom, M.Kom','Sistem Informasi','Dosen Tetap'),
('123456789013','Dr. Lailatul Qadariyah, ST, MT','Sistem Informasi','Dosen Tetap'),
('123456789014','Husnul Maad Junaidi, S.Kom, M.Kom','Teknik Informatika','Dosen Tetap'),
('123456789015','Dr. Budi Santoso,ST, M.T.','Teknik Informatika','Dosen Tetap'),
('123456789016','Ir. Ignatius Gunardi, MT','Teknik Informatika','Dosen Tetap'),
('123456789017','Dr. Ir. Sri Rachmania Juliastuti, M.Eng','Teknik Informatika','Dosen Tetap'),
('123456789018','Firman Kurniawansyah, ST, MT','Sistem Informasi','Dosen Tetap'),
('123456789019','Donny Satria Bhuan,S.Kom, M.Kom','Sistem Informasi','Dosen Tetap'),
('123456789020','Hikmatun Ni’mah, ST, M.Sc,','Sistem Informasi','Dosen Tetap'),
('123456789021','Dr. Fadlilatul Taufany, ST, Ph.D','Sistem Informasi','Dosen Tetap');

INSERT INTO mata_kuliah VALUES
('SI101','PTIK',3,2,'Sistem Informasi','123456789012'),
('SI102','Sistem Manajemen Basis Data',3,4,'Sistem Informasi','123456789019'),
('SI103','Pemrograman Berbasis Web',4,2,'Sistem Informasi','123456789013'),
('SI104','Pemrograman Bergerak',4,4,'Sistem Informasi','123456789018'),
('SI105','Analisa Proses Bisnis',3,2,'Sistem Informasi','123456789021'),
('TIF301','Keamanan Informasi',3,4,'Teknik Informatika','123456789015'),
('TIF302','Pemrograman Berbasis Objek',4,4,'Teknik Informatika','123456789014'),
('TIF303','Interaksi Manusia dan Komputer',3,4,'Teknik Informatika','123456789016'),
('TIF304','Algoritma Pemrograman',3,2,'Teknik Informatika','123456789020'),
('TIF305','Komputer Grafik',3,4,'Teknik Informatika','123456789017');

INSERT INTO krs VALUES 
('220441100001','SI102',4,'2024'),
('220441100002','SI104',4,'2024'),
('230441100003','SI101',2,'2024'),
('220441100004','SI104',4,'2024'),
('200441100005','SI102',4,'2022'),
('200441300001','TIF305',4,'2022'),
('220441300002','TIF303',4,'2024'),
('220441300003','TIF301',4,'2024'),
('220441300004','TIF302',4,'2024'),
('230441300005','TIF304',2,'2024');

INSERT INTO ukt VALUES
(1,'220441100001',4,'2024','2024-02-05',8000000),
(2,'220441100002',4,'2024','2024-02-05',10000000),
(3,'230441100003',2,'2024','2024-02-05',8000000),
(4,'220441100004',4,'2024','2024-02-05',7500000),
(5,'200441100005',7,'2023','2023-02-08',10000000),
(6,'200441300001',7,'2023','2023-02-08',10000000),
(7,'220441300002',4,'2024','2024-02-08',10000000),
(8,'220441300003',4,'2024','2024-02-09',8000000),
(9,'220441300004',4,'2024','2024-02-09',8000000),
(10,'230441300005',2,'2024','2024-02-09',7500000);

INSERT INTO gaji_dosen VALUES
(1,'123456789012','2024-02-25',3000000, 1000000, 4000000),
(2,'123456789013','2024-02-25',3500000, 1500000, 5000000),
(3,'123456789014','2024-02-25',3000000, 1000000, 4000000),
(4,'123456789015','2024-02-25',3500000, 1500000, 5000000),
(5,'123456789016','2024-02-25',3500000, 1500000, 5000000),
(6,'123456789017','2024-02-25',3500000, 1500000, 5000000),
(7,'123456789018','2024-02-25',3000000, 1000000, 4000000),
(8,'123456789019','2024-02-25',3000000, 1000000, 4000000),
(9,'123456789020','2024-02-25',3000000, 1000000, 4000000),
(10,'123456789021','2024-02-25',3500000, 1500000, 5000000);

INSERT INTO pembelian VALUES
('PP001','2024-02-15','Printer',2,2000000),
('PP002','2024-02-15','Komputer',1,6000000),
('PP003','2024-02-15','Proyektor',1,1000000),
('PP004','2024-02-18','Kamera',1,2000000),
('PP005','2024-02-18','Kursi Mahasiswa',10,5000000),
('PB001','2024-03-01','Papan Tulis',5,2000000),
('PB002','2024-03-01','Buku Ajar Teknik',3,500000),
('PB003','2024-03-18','Modul Praktikum Teknik',5,500000),
('PB004','2024-03-18','Mikroskop',2,1500000),
('PB005','2024-03-18','Alat Laboratorium',4,2000000);

INSERT INTO tagihan VALUES
('TGA01','Biaya Air',550000,'2024-02-15'),
('TGW01','Biaya Wifi',750000,'2024-02-15'),
('TGL01','Biaya Listrik',1000000,'2024-02-15'),
('TGP01','Biaya Pajak dan Regulasi',500000,'2024-02-25'),
('TGAD01','Biaya Administrasi',500000,'2024-02-25'),
('TGT01','Biaya Telephone',400000,'2024-02-28'),
('TGS02','Biaya Seminar dan Konferensi',350000,'2024-02-28'),
('TGL02','Biaya Listrik',1000000,'2024-03-15'),
('TGA02','Biaya Air',550000,'2024-03-15'),
('TGW02','Biaya Wifi',750000,'2024-03-15');

INSERT INTO keuangan VALUES
(001,33500000,0,'2024-02-05',33500000),
(002,30000000,0,'2024-02-08',65500000),
(003,23500000,0,'2024-02-09',89000000),
(004,0,11300000,'2024-02-15',77700000),
(005,0,7000000,'2024-02-18',70700000),
(006,0,33500000,'2024-02-25',37200000),
(007,0,750000,'2024-02-28',36450000),
(008,0,2500000,'2024-03-01',33950000),
(009,0,2300000,'2024-03-15',31650000),
(010,0,4000000,'2024-03-18',27650000);

SELECT*FROM mahasiswa;
SELECT*FROM dosen;
SELECT*FROM mata_kuliah;
SELECT*FROM krs;
SELECT*FROM ukt;
SELECT*FROM gaji_dosen;
SELECT*FROM pembelian;
SELECT*FROM tagihan;

SELECT COUNT(Nama_Mahasiswa) FROM mahasiswa;
SELECT COUNT(Nama_Dosen) FROM dosen;
SELECT*FROM keuangan;

-- SELECT SUM(Total_Harga) FROM pembelian;
SHOW TABLES;
DESC gaji_dosen;

SHOW TABLES;
-- DROP DATABASE db_univtrunojoyo;-- 
    