CREATE DATABASE modul1;
use  modul1;
show databases;
show tables;
desc krs;
CREATE TABLE Mahasiswa (
  NIM VARCHAR(10) PRIMARY KEY,
  Nama VARCHAR(255) NOT NULL,
  Alamat VARCHAR(255) NOT NULL,
  Angkatan INT NOT NULL,
  Jurusan VARCHAR(255) NOT NULL,
  Status VARCHAR(10) NOT NULL -- Aktif/Berhenti/Lulus
  );

CREATE TABLE Dosen (
  NIDN VARCHAR(10) PRIMARY KEY,
  Nama VARCHAR(255) NOT NULL,
  Alamat VARCHAR(255) NOT NULL,
  Jabatan VARCHAR(255) NOT NULL,
  Jurusan VARCHAR(255) NOT NULL
);


CREATE TABLE MataKuliah (
  KodeMK VARCHAR(10) PRIMARY KEY,
  NamaMK VARCHAR(255) NOT NULL,
  SKS INT NOT NULL,
  Jurusan VARCHAR(255) NOT NULL
);

CREATE TABLE KRS (
  idkrs int PRIMARY KEY,
  NIM VARCHAR(10) NOT NULL,
  KodeMK VARCHAR(10) NOT NULL,
  Semester INT NOT NULL,
  Nilai INT,
  FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);



CREATE TABLE PembayaranUKT (
  idpembayaranukt int primary key,
  NIM VARCHAR(10) NOT NULL,
  Tanggal DATE NOT NULL,
  Jumlah INT NOT NULL,
  Semester INT NOT NULL,
  FOREIGN KEY (NIM) REFERENCES Mahasiswa(NIM)
);

CREATE TABLE PembayaranGajiDosen (
idpembayarangajidosen int primary key,
  NIDN VARCHAR(10) NOT NULL,
  Tanggal DATE NOT NULL,
  Jumlah INT NOT NULL,
  FOREIGN KEY (NIDN) REFERENCES Dosen(NIDN)
);

CREATE TABLE PembelianPeralatan (
  idpembelianperalatan int primary key,
  Tanggal DATE NOT NULL,
  NamaBarang VARCHAR(255) NOT NULL,
  Jumlah INT NOT NULL,
  Harga INT NOT NULL
);

CREATE TABLE PembayaranTagihan (
  idpembayarantagihan int primary key,
  Tanggal DATE NOT NULL,
  JenisTagihan VARCHAR(255) NOT NULL,
  Jumlah INT NOT NULL
);

create table laporankeuangan (
   idlaporan int primary key,
   idpembayaranukt int,
   idpembayarangajidosen int,
   idpembelianperalatan int,
	idpembayarantagihan int
);

ALTER TABLE laporankeuangan ADD foreign key (idpembayaranukt) references PembayaranUKT (idpembayaranukt) ;
ALTER TABLE laporankeuangan ADD foreign key (idpembayarangajidosen) references PembayaranGajiDosen (idpembayarangajidosen) ;
ALTER TABLE laporankeuangan ADD foreign key (idpembelianperalatan) references PembelianPeralatan (idpembelianperalatan) ;
ALTER TABLE laporankeuangan ADD foreign key (idpembayarantagihan) references PembayaranTagihan (idpembayarantagihan) ;

alter table matakuliah add idkrs int;
ALTER TABLE MataKuliah ADD foreign key (idkrs) references KRS (idkrs) ;

alter table matakuliah add NIDN varchar (10);
ALTER TABLE matakuliah ADD foreign key (NIDN) references dosen (NIDN) ;
-- laporan

SELECT Nama, NIM, Jurusan 
FROM Mahasiswa
WHERE Status = 'Aktif'
ORDER BY Jurusan;

SELECT Semester, SUM(Jumlah) AS TotalBayar
FROM PembayaranUKT
GROUP BY Semester
ORDER BY Semester;

SELECT Nama, NIDN, Jabatan
FROM Dosen
ORDER BY Nama;

SELECT m.Nama AS NamaMahasiswa, m.NIM, mk.NamaMK, k.Nilai
FROM Mahasiswa m
JOIN KRS k ON m.NIM = k.NIM
JOIN MataKuliah mk ON k.KodeMK = mk.KodeMK
WHERE mk.KodeMK = 'MK101'; -- Ganti 'IF101' dengan kode MK yang diinginkan

SELECT MONTH(Tanggal) AS Bulan, SUM(Jumlah * Harga) AS TotalPengeluaran
FROM PembelianPeralatan
GROUP BY YEAR(Tanggal), MONTH(Tanggal)
ORDER BY YEAR(Tanggal), MONTH(Tanggal);

-- isi data

INSERT INTO Mahasiswa (NIM, Nama, Alamat, Angkatan, Jurusan, Status) VALUES
('111111', 'John Doe', 'Jl. Merdeka No. 123', 2022, 'Teknik Informatika', 'Aktif'),
('222222', 'Jane Smith', 'Jl. Ganesha No. 45', 2023, 'Sistem Informasi', 'Aktif'),
('333333', 'Alice Johnson', 'Jl. Sudirman No. 78', 2021, 'Manajemen', 'Lulus'),
('444444', 'Bob Wilson', 'Jl. Diponegoro No. 56', 2022, 'Ekonomi', 'Berhenti'),
('555555', 'Sarah Brown', 'Jl. Thamrin No. 90', 2023, 'Teknik Elektro', 'Aktif'),
('666666', 'David Lee', 'Jl. Pahlawan No. 12', 2021, 'Hukum', 'Lulus'),
('777777', 'Emily Wang', 'Jl. Asia Afrika No. 34', 2022, 'Sastra Inggris', 'Aktif'),
('888888', 'Michael Chen', 'Jl. Hayam Wuruk No. 67', 2023, 'Teknik Kimia', 'Aktif'),
('999999', 'Jessica Liu', 'Jl. Cikini No. 89', 2021, 'Arsitektur', 'Berhenti'),
('101010', 'Ryan Tan', 'Jl. Kebon Sirih No. 10', 2023, 'Desain Komunikasi Visual', 'Aktif');

-- Tabel Dosen
INSERT INTO Dosen (NIDN, Nama, Alamat, Jabatan, Jurusan) VALUES
('1234567890', 'Prof. Ahmad', 'Jl. Veteran No. 1', 'Guru Besar', 'Teknik Informatika'),
('2345678901', 'Dr. Budi', 'Jl. Cendrawasih No. 2', 'Lektor Kepala', 'Sistem Informasi'),
('3456789012', 'Drs. Candra', 'Jl. Cempaka No. 3', 'Lektor', 'Manajemen'),
('4567890123', 'Ir. Dian', 'Jl. Dahlia No. 4', 'Asisten Ahli', 'Ekonomi'),
('2303930123', 'Ir. dono', 'Jl. Dahlia No. 2', 'Asisten Ahli', 'Teknik'),
('4524890123', 'Ir. Dana', 'Jl. Dahlia No. 1', 'Asisten Ahli', 'Pendidikan'),
('4209890123', 'Ir. Joni', 'Jl. Dahlia No. 5', 'Asisten Ahli', 'Ekonomi syahriah'),
('4567029123', 'Ir. Dini', 'Jl. Dahlia No. 7', 'Asisten Ahli', 'Ekonomi Bisnis'),
('1292890123', 'Ir. Soto', 'Jl. Dahlia No. 8', 'Asisten Ahli', 'Akuntasi'),
('9842890123', 'Ir. Broto', 'Jl. Dahlia No. 49', 'Asisten Ahli', 'Sistem Informasi');
-- Tabel Mata Kuliah
INSERT INTO MataKuliah (KodeMK, NamaMK, SKS, Jurusan) VALUES
('MK101', 'Pemrograman Dasar', 3, 'Teknik Informatika'),
('MK202', 'Basis Data', 3, 'Sistem Informasi'),
('MK303', 'Manajemen Keuangan', 3, 'Manajemen'),
('MK404', 'Ekonomi Mikro', 3, 'Ekonomi'),
('MK210', 'Pemrograman Web', 3, 'Sistem Informasi'),
('MK392', 'Manajemen syahriah', 3, 'Manajemen'),
('MK218', 'Bisnis digital', 3, 'Sistem Informasi'),
('MK311', 'Manajemen Bisnis', 3, 'Manajemen'),
('MK208', 'Enterprenuership', 3, 'Sistem Informasi'),
('MK340', 'Manajemen organisasi', 3, 'Manajemen');

-- Isikan data ke tabel KRS
INSERT INTO KRS (idkrs, NIM, KodeMK, Semester, Nilai) VALUES
(1, '111111', 'MK101', 1, 85),
(2, '222222', 'MK202', 1, 78),
(3, '333333', 'MK303', 2, 90),
(4, '444444', 'MK404', 2, 82),
(5, '555555', 'MK210', 1, 75),
(6, '666666', 'MK392', 1, 88),
(7, '777777', 'MK218', 2, 92),
(8, '888888', 'MK311', 2, 80),
(9, '999999', 'MK208', 1, 87),
(10, '101010', 'MK340', 1, 79);

-- Isikan data ke tabel PembayaranUKT
INSERT INTO PembayaranUKT (idpembayaranukt, NIM, Tanggal, Jumlah, Semester) VALUES
(1, '111111', '2024-01-15', 5000000, 1),
(2, '222222', '2024-02-20', 5500000, 2),
(3, '333333', '2024-01-25', 5000000, 1),
(4, '444444', '2024-02-22', 5500000, 2),
(5, '555555', '2024-01-18', 5000000, 1),
(6, '666666', '2024-02-27', 5500000, 2),
(7, '777777', '2024-01-30', 5000000, 1),
(8, '888888', '2024-02-29', 5500000, 2),
(9, '999999', '2024-01-12', 5000000, 1),
(10, '101010', '2024-02-10', 5500000, 2);

-- Isikan data ke tabel PembayaranGajiDosen
INSERT INTO PembayaranGajiDosen (idpembayarangajidosen, NIDN, Tanggal, Jumlah) VALUES
(1, '1234567890', '2024-01-31', 10000000),
(2, '2345678901', '2024-02-29', 11000000),
(3, '3456789012', '2024-01-30', 10000000),
(4, '4567890123', '2024-02-28', 11000000),
(5, '2303930123', '2024-01-31', 10000000),
(6, '4524890123', '2024-02-29', 11000000),
(7, '4209890123', '2024-01-31', 10000000),
(8, '4567029123', '2024-02-29', 11000000),
(9, '1292890123', '2024-01-31', 10000000),
(10, '9842890123', '2024-02-29', 11000000);

-- Isikan data ke tabel PembelianPeralatan
INSERT INTO PembelianPeralatan (idpembelianperalatan, Tanggal, NamaBarang, Jumlah, Harga) VALUES
(1, '2024-01-05', 'Laptop', 10, 10000000),
(2, '2024-02-10', 'Proyektor', 5, 5000000),
(3, '2024-01-15', 'Printer', 3, 3000000),
(4, '2024-02-20', 'Kamera', 2, 7000000),
(5, '2024-01-25', 'Scanner', 4, 4000000),
(6, '2024-02-28', 'Speaker', 6, 6000000),
(7, '2024-01-30', 'Monitor', 8, 8000000),
(8, '2024-02-29', 'Microphone', 7, 7000000),
(9, '2024-01-05', 'Router', 2, 2000000),
(10, '2024-02-10', 'Switch', 3, 3000000);

-- Isikan data ke tabel PembayaranTagihan
INSERT INTO PembayaranTagihan (idpembayarantagihan, Tanggal, JenisTagihan, Jumlah) VALUES
(1, '2024-01-15', 'Listrik', 1000000),
(2, '2024-02-20', 'Air', 1500000),
(3, '2024-01-25', 'Internet', 800000),
(4, '2024-02-22', 'Telepon', 700000),
(5, '2024-01-18', 'Listrik', 1100000),
(6, '2024-02-27', 'Air', 1600000),
(7, '2024-01-30', 'Internet', 850000),
(8, '2024-02-29', 'Telepon', 750000),
(9, '2024-01-12', 'Listrik', 1200000),
(10, '2024-02-10', 'Air', 1700000);
