create database db_praktikum1;
use db_praktikum1;

CREATE TABLE Mahasiswa (
    nama VARCHAR(100) NOT NULL,
    nim CHAR(20) NOT NULL primary key,
    jurusan VARCHAR(50) NOT NULL,
    tahun_masuk INT NOT NULL,
    status_mahasiswa enum('aktif','cuti','lulus','berhenti')
);

CREATE TABLE Mahasiswa_Dosen (
    id CHAR(20) NOT NULL PRIMARY KEY ,
    nama VARCHAR(100) NOT NULL ,
    jurusan VARCHAR(50) NOT NULL ,
    tahun_masuk INT NOT NULL ,
    statu ENUM('dosen','mahasiswa'),
    nomor_induk char(20) not null 
);

ALTER TABLE mahasiswa_dosen CHANGE COLUMN jurusan prodi CHAR(25);

ALTER TABLE mahasiswa_dosen
ALTER COLUMN id SET DEFAULT 5000000;
ALTER TABLE mahasiswa_dosen
ALTER COLUMN nama SET DEFAULT 5000000;
ALTER TABLE mahasiswa_dosen
ALTER COLUMN jurusan SET DEFAULT 5000000;
ALTER TABLE mahasiswa_dosen
ALTER COLUMN tahun_masuk SET DEFAULT 5000000;
ALTER TABLE mahasiswa_dosen
ALTER COLUMN statu SET DEFAULT 5000000;
ALTER TABLE mahasiswa_dosen
ALTER COLUMN nomor_induk SET DEFAULT 5000000;
drop table mahasiswa_dosen;
INSERT INTO Mahasiswa_Dosen (id, nama, prodi, tahun_masuk, statu, nomor_induk)
VALUES ('M1', 'Budi', 'Teknik Informatika', 2018, 'mahasiswa', 'M1234567890'),
       ('M2', 'Ani', 'Ilmu Komputer', 2019, 'mahasiswa', 'M0987654321'),
       ('M3', 'Dodi', 'Teknik Mesin', 2020, 'mahasiswa', 'M1122334455'),
       ('D1', 'Prof. Dr. A', 'Teknik Informatika', 1990, 'dosen',  'D001'),
       ('D2', 'Prof. Dr. B', 'Ilmu Komputer', 1995, 'dosen',  'D002'),
       ('D3', 'Prof. Dr. C', 'Teknik Mesin', 2000, 'dosen', 'D003');

desc mahasiswa_dosen;
select * from mahasiswa_dosen;

-- Memasukkan data dosen ke dalam tabel Mahasiswa_Dosen

drop table mahasiswa_dosen;
-- Memasukkan data ke dalam tabel Mahasiswa_Dosen
INSERT INTO Mahasiswa_Dosen (nama, nim, jurusan_mahasiswa, tahun_masuk, status_mahasiswa, nama_dosen, nip_dosen, jurusan_dosen)
VALUES ('Budi', '1234567890', 'Teknik Informatika', 2018, 'aktif', 'Prof. Dr. A', 'D001', 'Teknik Informatika'),
       ('Ani', '0987654321', 'Ilmu Komputer', 2019, 'aktif', 'Prof. Dr. B', 'D002', 'Ilmu Komputer'),
       ('Dodi', '1122334455', 'Teknik Mesin', 2020, 'cuti', 'Prof. Dr. C', 'D003', 'Teknik Mesin');
-- Melihat isi dari tabel Mahasiswa_Dosen
SELECT * FROM Mahasiswa_Dosen;

CREATE TABLE Kursus (
    kode_kursus CHAR(10) NOT NULL PRIMARY KEY,
    nama_kursus VARCHAR(100) NOT NULL,
    nim CHAR(20) NOT NULL,
    nip VARCHAR(20) NOT NULL,
    FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
    FOREIGN KEY (nip) REFERENCES Dosen(nip)
);
drop table kursus;
-- SELECT Mahasiswa.nama AS nama_mahasiswa, Dosen.nama AS nama_dosen, Kursus.nama_kursus
-- FROM Mahasiswa
-- JOIN Kursus ON Mahasiswa.nim = Kursus.nim
-- JOIN Dosen ON Kursus.nip = Dosen.nip;




CREATE TABLE Dosen (
    nama VARCHAR(100) NOT NULL,
    nip VARCHAR(20) NOT NULL primary key,
    jurusan VARCHAR(50) NOT NULL
);


drop table dosen;
CREATE TABLE Matakuliah (
    id_matakuliah char(20) NOT NULL primary key,
    matakuliah VARCHAR(50) NOT NULL,
    sks INT NOT NULL
);


CREATE TABLE Kuliah (
    kuliah_id INT PRIMARY KEY,
    nim char(20) NOT NULL,
    kode_matakuliah char(20) NOT NULL,
    nilai DECIMAL(5,2),
    semester int(2),
    FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
    FOREIGN KEY (kode_matakuliah) REFERENCES Matakuliah(id_matakuliah)
    );



CREATE TABLE Tagihan (
    id INT PRIMARY KEY,
    jenis VARCHAR(50) NOT NULL,
    jumlah DECIMAL(10,2) NOT NULL,
    tanggal_pembayaran DATE NOT NULL
);

    
create table gajidosen (
id_gaji int primary key,
nip varchar (20) not null,
  tanggal_gaji date not null,
  gaji INT not null,
  foreign key(nip) references Dosen(nip));
drop table gajidosen;


CREATE TABLE Pembelian (
    id INT PRIMARY KEY,
    jenis VARCHAR(50) NOT NULL,
    jumlah DECIMAL(10,2) NOT NULL,
    tanggal_pembelian DATE NOT NULL
);

CREATE TABLE BayarUkt (
    id_ukt INT PRIMARY KEY,
    nim CHAR(20) NOT NULL,
    tahun_ajaran VARCHAR(10) NOT NULL,
    jumlah DECIMAL(10,2) NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    FOREIGN KEY (nim) REFERENCES Mahasiswa(nim)
);

INSERT INTO Mahasiswa (nama, nim, jurusan, tahun_masuk, status_mahasiswa) VALUES
('Aliando', '1834567890', 'Teknik Informatika', 2018, 'aktif'),
('Siti Maryam', '1987654321', 'Ilmu Komputer', 2019, 'aktif'),
('Dodik', '2022334455', 'Sistem Informasi', 2020, 'cuti'),
('Tino', '1766778899', 'Teknik Elektro', 2017, 'lulus'),
('Faza', '1698776655', 'Teknik Mesin', 2016, 'berhenti'),
('Sindy', '1855667788', 'Akuntansi', 2018, 'aktif'),
('Hanifa', '1933445566', 'Manajemen', 2019, 'aktif'),
('Desi', '2077889900', 'Desain Produk', 2020, 'cuti'),
('Rania', '1722334455', 'Teknik Sipil', 2017, 'lulus'),
('Tyas', '1688776655', 'Teknik Kimia', 2016, 'berhenti');

INSERT INTO Dosen (nama, nip, jurusan) VALUES
('Prof. Dr. Ahmad', '1234567890', 'Teknik Informatika'),
('Prof. Dr. Budi', '0987654321', 'Sistem Informasi'),
('Prof. Dr. Tiyan', '1122334455', 'Teknik Informatika'),
('Prof. Dr. Leli', '5544332211', 'Sistem Informasi'),
('Prof. Dr. Maya', '9988776655', 'Teknik Informatika'),
('Prof. Dr. Hasan', '4433221199', 'Sistem Informasi'),
('Prof. Dr. Akbar', '8877665544', 'Teknik Informatika'),
('Prof. Dr. Fitra', '2211998877', 'Sistem Informasi'),
('Prof. Dr. Rini', '6655443322', 'Teknik Informatika'),
('Prof. Dr. Yoni', '0099887766', 'Sistem Informasi');

INSERT INTO Matakuliah (id_matakuliah, matakuliah, sks) VALUES
('MK001', 'Pemrograman Dasar', 2),
('MK002', 'Struktur Data', 3),
('MK003', 'Algoritma dan Pemrograman', 3),
('MK004', 'Basis Data', 2),
('MK005', 'Sistem Operasi', 3),
('MK006', 'Jaringan Komputer', 2),
('MK007', 'Pemrograman Web', 3),
('MK008', 'Pengembangan Perangkat Lunak', 3),
('MK009', 'Keamanan Informasi', 2),
('MK010', 'Sistem Informasi Manajemen', 3);


INSERT INTO Kuliah (kuliah_id, nim, kode_matakuliah, nilai, semester) VALUES
(1, '1834567890', 'MK001', 85.50, 8),
(2, '1987654321', 'MK002', 90.00, 6),
(3, '2022334455', 'MK003', 88.00, 2),
(4, '1766778899', 'MK004', 92.50, 2),
(5, '1698776655', 'MK005', 87.00, 3),
(6, '1855667788', 'MK006', 91.00, 3),
(7, '1933445566', 'MK007', 86.50, 4),
(8, '2077889900', 'MK008', 90.50, 4),
(9, '1722334455', 'MK009', 89.00, 5),
(10, '1688776655', 'MK010', 92.00, 5);

INSERT INTO Tagihan (id, jenis, jumlah, tanggal_pembayaran) VALUES
(1, 'Listrik', 100000.00, '2023-04-01'),
(2, 'Internet', 5000000.00, '2023-04-01'),
(3, 'Air Bersih', 200000.00, '2023-04-01'),
(4, 'Kebersihan', 1500000.00, '2023-04-01'),
(5, 'Kantin', 300000.00, '2023-04-01'),
(6, 'Perpustakaan', 1000000.00, '2023-04-01'),
(7, 'Laboratorium', 500000.00, '2023-04-01'),
(8, 'Listrik', 200000.00, '2023-04-01'),
(9, 'Kegiatan Kampus', 10000.00, '2024-04-01'),
(10, 'Air Bersih', 500000.00, '2024-04-01');

INSERT INTO gajidosen (id_gaji, nip, tanggal_gaji, gaji) VALUES
(1, '1234567890', '2023-04-01', 5000000),
(2, '0987654321', '2023-04-01', 4500000),
(3, '1122334455', '2023-04-01', 5200000),
(4, '5544332211', '2023-04-01', 4800000),
(5, '9988776655', '2023-04-01', 5500000),
(6, '4433221199', '2023-04-01', 4700000),
(7, '8877665544', '2023-04-01', 5300000),
(8, '2211998877', '2023-04-01', 4900000),
(9, '6655443322', '2023-04-01', 5100000),
(10, '0099887766', '2023-04-01', 4600000);

INSERT INTO Pembelian (id, jenis, jumlah, tanggal_pembelian) VALUES
(1, 'Alat Laboratorium', 100, '2023-04-01'),
(2, 'Bahan Kimia', 50, '2023-04-02'),
(3, 'Peralatan Mikroskop', 20, '2023-04-03'),
(4, 'Alat Pengukur', 30, '2023-04-04'),
(5, 'Bahan Biologi', 40, '2023-04-05'),
(6, 'Peralatan Laboratorium', 150, '2023-04-06'),
(7, 'Alat Pemotong', 10, '2023-04-07'),
(8, 'Bahan Keselamatan', 20, '2023-04-08'),
(9, 'Peralatan Pengolah', 50, '2023-04-09'),
(10, 'Alat Pemeliharaan', 10, '2023-04-10');


INSERT INTO BayarUkt (id_ukt, nim, tahun_ajaran, jumlah, tanggal_pembayaran) VALUES
(1, '1834567890', '2023/2024', 1000000.00, '2023-08-15'),
(2, '1987654321', '2023/2024', 1000000.00, '2023-08-16'),
(3, '2022334455', '2023/2024', 1000000.00, '2023-08-17'),
(4, '1766778899', '2023/2024', 1000000.00, '2023-08-18'),
(5, '1698776655', '2023/2024', 1000000.00, '2023-08-19'),
(6, '1855667788', '2023/2024', 1000000.00, '2023-08-20'),
(7, '1933445566', '2023/2024', 1000000.00, '2023-08-21'),
(8, '2077889900', '2023/2024', 1000000.00, '2023-08-22'),
(9, '1722334455', '2023/2024', 1000000.00, '2023-08-23'),
(10, '1688776655', '2023/2024', 1000000.00, '2023-08-24');

select * from Mahasiswa;
select * from Dosen;
select nama, status_mahasiswa from Mahasiswa;
select * from bayarukt;
CREATE VIEW laporan AS
SELECT 
    (SELECT SUM(jumlah) FROM tagihan) AS total_tagihan,
    (SELECT SUM(gaji) FROM gajidosen) AS total_gaji_dosen,
    (SELECT SUM(jumlah) FROM pembelian) AS total_pembelian,
    ((SELECT SUM(jumlah) FROM tagihan) + 
     (SELECT SUM(gaji) FROM gajidosen) + 
     (SELECT SUM(jumlah) FROM pembelian)) AS total_semua;
 select * from laporan ;
 drop view laporan;
select count(nama) from mahasiswa;
select count(nama) from dosen;

