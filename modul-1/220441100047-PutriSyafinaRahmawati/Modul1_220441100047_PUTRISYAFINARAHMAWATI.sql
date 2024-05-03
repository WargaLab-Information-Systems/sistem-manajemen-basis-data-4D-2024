-- ADMINISTRASI;
-- Tabel Mahasiswa
CREATE TABLE Mahasiswa (
    NIM INT PRIMARY KEY,
    Nama VARCHAR(100),
    JenisKelamin VARCHAR(10),
    Jurusan VARCHAR(50),
    TanggalMasuk DATE,
    Status VARCHAR(20),
    JumlahMahasiswa INT
);
-- DATA TABEL MAHASISWA;
INSERT INTO Mahasiswa (NIM, Nama, JenisKelamin, Jurusan, TanggalMasuk, Status, JumlahMahasiswa) 
VALUES 
(101, 'Ahmad', 'Laki-laki', 'Teknik Informatika', '2022-09-01', 'Aktif', '10'),
(102, 'Budi', 'Laki-laki', 'Teknik Elektro', '2022-09-01', 'Aktif', '20'),
(103, 'Citra', 'Perempuan', 'Teknik Mesin', '2022-09-01', 'Aktif', '30'),
(104, 'Dewi', 'Perempuan', 'Teknik Sipil', '2022-09-01', 'Aktif', '40f'),
(105, 'Eka', 'Laki-laki', 'Teknik Industri', '2022-09-01', 'Aktif', '50'),
(106, 'Fani', 'Perempuan', 'Teknik Kimia', '2022-09-01', 'Aktif', '60'),
(107, 'Gita', 'Perempuan', 'Teknik Lingkungan', '2022-09-01', 'Aktif', '70'),
(108, 'Hadi', 'Laki-laki', 'Teknik Perkapalan', '2022-09-01', 'Aktif', '80'),
(109, 'Indra', 'Laki-laki', 'Teknik Geodesi', '2022-09-01', 'Aktif', '90'),
(110, 'Joko', 'Laki-laki', 'Teknik Geomatika', '2022-09-01', 'Aktif', '100');
SELECT * FROM MAHASISWA;
 

-- TABEL UKT MAHASISWA;
CREATE TABLE Pembayaran_UKT_Mahasiswa (
    ID_Pembayaran_UKT INT PRIMARY KEY AUTO_INCREMENT,
    NIM_Mahasiswa INT,
    Jumlah_Pembayaran DECIMAL(10, 2),
    Tanggal_Pembayaran DATE,
    FOREIGN KEY (NIM_Mahasiswa) REFERENCES Mahasiswa(NIM)
);
-- DATA TABEL PEMBAYARAN UKT MAHASISWA;
INSERT INTO Pembayaran_UKT_Mahasiswa (NIM_Mahasiswa, Jumlah_Pembayaran, Tanggal_Pembayaran) 
VALUES 
(101, 5000000, '2024-03-01'),
(102, 5500000, '2024-03-02'),
(103, 5600000, '2024-03-03'),
(104, 5700000, '2024-03-04'),
(105, 5800000, '2024-03-05'),
(106, 5900000, '2024-03-06'),
(107, 6000000, '2024-03-07'),
(108, 6100000, '2024-03-08'),
(109, 6200000, '2024-03-09'),
(110, 6300000, '2024-03-10');
select * from Pembayaran_UKT_Mahasiswa;

-- Tabel Dosen
CREATE TABLE Dosen (
    NIDN INT PRIMARY KEY,
    Nama VARCHAR(100),
    MataKuliah VARCHAR(100),
    JumlahDosen INT
);

-- DATA TABEL DOSEN;
INSERT INTO Dosen (NIDN, Nama, MataKuliah, JumlahDosen) 
VALUES 
(201, 'Fahmi', 'Pemrograman Lanjut','10' ),
(202, 'Gita', 'Sistem Operasi', '20'),
(203, 'Hendra', 'Basis Data', '30'),
(204, 'Indra', 'Jaringan Komputer', '40'),
(205, 'Joko', 'Desain Web', '50'),
(206, 'Karti', 'Kecerdasan Buatan', '60'),
(207, 'Lina', 'Sistem Cerdas', '70'),
(208, 'Mira', 'Grafika Komputer', '80'),
(209, 'Nadia', 'Pengolahan Citra', '90'),
(210, 'Oscar', 'Rekayasa Perangkat Lunak', '100');
SELECT * FROM Dosen;
DROP TABLE Dosen;

-- Tabel Pengambilan_Matkul_Mahasiswa
CREATE TABLE Pengambilan_Matkul_Mahasiswa (
    ID_Pengambilan INT PRIMARY KEY AUTO_INCREMENT,
    NIM_Mahasiswa INT,
    Kode_Matkul VARCHAR(20),
    Tahun_Ajaran VARCHAR(20),
    Semester VARCHAR(10),
    NIDN_Dosen INT,
    FOREIGN KEY (NIM_Mahasiswa) REFERENCES Mahasiswa(NIM),
    FOREIGN KEY (NIDN_Dosen) REFERENCES Dosen(NIDN)
);
-- DATA TABEL PENGAMBILAN MATAKULIAH MAHASISWA;
INSERT INTO Pengambilan_Matkul_Mahasiswa (NIM_Mahasiswa, Kode_Matkul, Tahun_Ajaran, Semester, NIDN_Dosen) 
VALUES 
(101, 'PL', '2023/2024', 'Genap', '201'),
(102, 'SO', '2023/2024', 'Genap', '202'),
(103, 'BD', '2023/2024', 'Genap', '203'),
(104, 'JK', '2023/2024', 'Genap', '204'),
(105, 'DW', '2023/2024', 'Genap', '205'),
(106, 'KB', '2023/2024', 'Genap', '206'),
(107, 'SL', '2023/2024', 'Genap', '207'),
(108, 'PK', '2023/2024', 'Genap', '208'),
(109, 'GC', '2023/2024', 'Genap', '209'),
(110, 'RG', '2023/2024', 'Genap', '210');

select * from Pengambilan_Matkul_Mahasiswa;
drop table Pengambilan_Matkul_Mahasiswa;

-- Tabel Pembayaran_Gaji_Dosen
CREATE TABLE Pembayaran_Gaji_Dosen (
    ID_Pembayaran_Gaji INT PRIMARY KEY AUTO_INCREMENT,
    NIDN_Dosen INT,
    Jumlah_Pembayaran DECIMAL(10, 2),
    Tanggal_Pembayaran DATE,
    FOREIGN KEY (NIDN_Dosen) REFERENCES Dosen(NIDN)
);
-- DATA TABEL PEMBAYARAN GAJI DOSEN;
INSERT INTO Pembayaran_Gaji_Dosen (NIDN_Dosen, Jumlah_Pembayaran, Tanggal_Pembayaran) 
VALUES 
(201, 10000000, '2024-03-10'),
(202, 10500000, '2024-03-11'),
(203, 10200000, '2024-03-12'),
(204, 10300000, '2024-03-13'),
(205, 10300000, '2024-03-13'),
(206, 10300000, '2024-03-13'),
(207, 10300000, '2024-03-13'),
(208, 10300000, '2024-03-13'),
(209, 10300000, '2024-03-13'),
(210, 10300000, '2024-03-13');
select * from Pembayaran_Gaji_Dosen ;

-- Tabel Pengeluaran
CREATE TABLE Pengeluaran (
    ID_Pengeluaran INT PRIMARY KEY AUTO_INCREMENT,
    DeskripsiPembelian VARCHAR(255),
    JumlahPembelian DECIMAL(10, 2),
    TanggalPembelian DATE,
    JenisTagihan VARCHAR(20),
    JumlahPembayaran DECIMAL(10, 2),
    TanggalPembayaran DATE,
    LaporanJumlahPengeluaran DECIMAL(10, 2),
    TanggalLaporan DATE,
    ID_Pembayaran_Gaji INT ,
    FOREIGN KEY (ID_Pembayaran_Gaji) REFERENCES Pembayaran_Gaji_Dosen(ID_Pembayaran_Gaji)
);
INSERT INTO Pengeluaran (DeskripsiPembelian, JumlahPembelian, TanggalPembelian, JenisTagihan, JumlahPembayaran, TanggalPembayaran, LaporanJumlahPengeluaran, TanggalLaporan, ID_Pembayaran_Gaji )
VALUES 
('Buku Tulis', 50.00, '2024-03-25', 'Air', 50.00, '2024-03-25', 100.00, '2024-03-25', '1'),
('Spidol', 20.00, '2024-03-26', 'Listrik', 40.00, '2024-03-26', 60.00, '2024-03-26', '2'),
('', 0.00, '2024-03-27', 'Listrik', 100.00, '2024-03-27', 100.00, '2024-03-27', '3'),
('', 0.00, '2024-03-28', 'Air', 50.00, '2024-03-28', 50.00, '2024-03-28', '4'),
('Papan Tulis', 80.00, '2024-03-29', 'Listrik', 20.00, '2024-03-29', 100.00, '2024-03-29', '5'),
('Buku Ajar', 120.00, '2024-03-30', 'Air', 30.00, '2024-03-30', 150.00, '2024-03-30', '6'),
('', 0.00, '2024-03-31', 'Listrik', 120.00, '2024-03-31', 120.00, '2024-03-31', '7'),
('', 0.00, '2024-04-01', 'Air', 70.00, '2024-04-01', 70.00, '2024-04-01', '8'),
('Meja Guru', 150.00, '2024-04-02', 'Listrik', 50.00, '2024-04-02', 200.00, '2024-04-02', '9'),
('Kursi Siswa', 200.00, '2024-04-03', 'Air', 30.00, '2024-04-03', 230.00, '2024-04-03', '10');

select * from pengeluaran;
drop table pengeluaran;
show tables;
