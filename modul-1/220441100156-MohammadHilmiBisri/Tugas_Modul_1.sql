-- Membuat Database
CREATE DATABASE IF NOT EXISTS universitas_trunojoyo;

-- Menggunakan Database
USE universitas_trunojoyo;

-- Tabel Mahasiswa
CREATE TABLE IF NOT EXISTS Mahasiswa (
    NIM INT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat VARCHAR(255),
    Tanggal_Lahir DATE,
    Program_Studi VARCHAR(100),
    Tanggal_Mulai_Kuliah DATE
);

-- Tabel Dosen
CREATE TABLE IF NOT EXISTS Dosen (
    NIDN INT PRIMARY KEY,
    Nama VARCHAR(100),
    Alamat VARCHAR(255),
    Tanggal_Lahir DATE,
    Program_Studi VARCHAR(100)
);

-- Tabel Status_Mahasiswa
CREATE TABLE IF NOT EXISTS Status_Mahasiswa (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NIM_Mahasiswa INT,
    Status ENUM('Berhenti Kuliah', 'Lulus'),
    Tanggal DATE,
    FOREIGN KEY (NIM_Mahasiswa) REFERENCES Mahasiswa(NIM)
);

-- Tabel Mata_Kuliah
CREATE TABLE IF NOT EXISTS Mata_Kuliah (
    Kode_Mata_Kuliah VARCHAR(20) PRIMARY KEY,
    Nama_Mata_Kuliah VARCHAR(100),
    SKS INT,
    Program_Studi VARCHAR(100),
    NIDN_Dosen INT,
    FOREIGN KEY (NIDN_Dosen) REFERENCES Dosen(NIDN)
);

-- Tabel Pendaftaran_Mata_Kuliah
CREATE TABLE IF NOT EXISTS Pendaftaran_Mata_Kuliah (
    ID_Pendaftaran INT AUTO_INCREMENT PRIMARY KEY,
    NIM_Mahasiswa INT,
    Kode_Mata_Kuliah VARCHAR(20),
    Semester VARCHAR(20),
    FOREIGN KEY (NIM_Mahasiswa) REFERENCES Mahasiswa(NIM),
    FOREIGN KEY (Kode_Mata_Kuliah) REFERENCES Mata_Kuliah(Kode_Mata_Kuliah)
);

-- Tabel Pembayaran_UKT
CREATE TABLE IF NOT EXISTS Pembayaran_UKT (
    ID_Pembayaran_UKT INT AUTO_INCREMENT PRIMARY KEY,
    NIM_Mahasiswa INT,
    Tanggal DATE,
    Jumlah DECIMAL(10, 2),
    FOREIGN KEY (NIM_Mahasiswa) REFERENCES Mahasiswa(NIM)
);

-- Tabel Pembayaran_Gaji_Dosen
CREATE TABLE IF NOT EXISTS Pembayaran_Gaji_Dosen (
    ID_Pembayaran_Gaji INT AUTO_INCREMENT PRIMARY KEY,
    NIDN_Dosen INT,
    Tanggal DATE,
    Jumlah DECIMAL(10, 2),
    FOREIGN KEY (NIDN_Dosen) REFERENCES Dosen(NIDN)
);

-- Tabel Pembelian_Peralatan
CREATE TABLE IF NOT EXISTS Pembelian_Peralatan (
    ID_Pembelian_Peralatan INT AUTO_INCREMENT PRIMARY KEY,
    Deskripsi VARCHAR(255),
    Tanggal DATE,
    Jumlah DECIMAL(10, 2)
);

-- Tabel Pembayaran_Tagihan
CREATE TABLE IF NOT EXISTS Pembayaran_Tagihan (
    ID_Pembayaran_Tagihan INT AUTO_INCREMENT PRIMARY KEY,
    Deskripsi VARCHAR(255),
    Tanggal DATE,
    Jumlah DECIMAL(10, 2)
);

-- Tabel Laporan_Daftar_Mahasiswa
CREATE TABLE IF NOT EXISTS Laporan_Daftar_Mahasiswa (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Laporan DATE,
    Jumlah_Mahasiswa INT
);

-- Tabel Laporan_Daftar_Dosen
CREATE TABLE IF NOT EXISTS Laporan_Daftar_Dosen (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Laporan DATE,
    Jumlah_Dosen INT
);

-- Tabel Laporan_Keuangan
CREATE TABLE IF NOT EXISTS Laporan_Keuangan (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Tanggal_Laporan DATE,
    Kategori VARCHAR(100),
    Total_Pengeluaran DECIMAL(10, 2)
);

-- Menambahkan data ke tabel Mahasiswa
INSERT INTO Mahasiswa (NIM, Nama, Alamat, Tanggal_Lahir, Program_Studi, Tanggal_Mulai_Kuliah) 
VALUES 
(101, 'Wisnu Ary Swadaya', 'Jl. Contoh No. 1233', '1998-05-15', 'Teknik Informatika', '2020-09-01'),
(102, 'Fairuz Abdullah', 'Jl. Contoh No. 4566', '1999-08-20', 'Sistem Informasi', '2020-09-01'),
(103, 'Zidan Abshar', 'Jl. Contoh No. 7879', '1997-12-10', 'Teknik Elektro', '2020-09-01'),
(104, 'Tomi Sultoni', 'Jl. Contoh No. 7889', '2000-02-20', 'Teknik Informatika', '2021-09-01'),
(105, 'Neesa Ringga', 'Jl. Contoh No. 7899', '2001-04-12', 'Sistem Informasi', '2021-09-01'),
(106, 'Lukmanul Hakim', 'Jl. Contoh No. 7819', '1999-08-05', 'Teknik Elektro', '2021-09-01'),
(107, 'Fahri Ali Rahim Yapono', 'Jl. Contoh No. 7829', '2000-01-25', 'Teknik Informatika', '2022-09-01'),
(108, 'Baskara Putra', 'Jl. Contoh No. 7849', '2001-03-18', 'Sistem Informasi', '2022-09-01'),
(109, 'Gilang Surya Abdillah Ary', 'Jl. Contoh No. 7859', '1999-07-10', 'Teknik Elektro', '2022-09-01'),
(110, 'Baihaqi Al-Hakim', 'Jl. Contoh No. 7869', '2000-09-10', 'Teknik Informatika', '2023-09-01');

-- Menambahkan data ke tabel Dosen
INSERT INTO Dosen (NIDN, Nama, Alamat, Tanggal_Lahir, Program_Studi) 
VALUES 
(1001, 'Dr. Johnny Sins', 'Jl. Dosen No. 1', '1975-03-25', 'Teknik Informatika'),
(1002, 'Dr. Bisri', 'Jl. Dosen No. 2', '1980-06-12', 'Sistem Informasi'),
(1003, 'Prof. Bruce Lee', 'Jl. Dosen No. 3', '1970-11-08', 'Teknik Elektro'),
(1004, 'Dr. Jet Li', 'Jl. Dosen No. 4', '1978-04-15', 'Teknik Informatika'),
(1005, 'Dr. Bobon Santoso', 'Jl. Dosen No. 5', '1982-09-20', 'Sistem Informasi'),
(1006, 'Prof. Wilson Syhaputra', 'Jl. Dosen No. 6', '1973-12-10', 'Teknik Elektro'),
(1007, 'Dr. Kevin E', 'Jl. Dosen No. 7', '1976-08-05', 'Teknik Informatika'),
(1008, 'Dr. Maldini Haryadi', 'Jl. Dosen No. 8', '1981-01-25', 'Sistem Informasi'),
(1009, 'Prof. Zidny Wildan H', 'Jl. Dosen No. 9', '1972-03-18', 'Teknik Elektro'),
(1010, 'Dr. Jeanne Pendragon', 'Jl. Dosen No. 10', '1977-07-10', 'Teknik Informatika');


-- Menambahkan data ke tabel Status_Mahasiswa
INSERT INTO Status_Mahasiswa (NIM_Mahasiswa, Status, Tanggal) 
VALUES 
(101, 'Lulus', '2024-03-25'),
(102, 'Berhenti Kuliah', '2023-10-15'),
(103, 'Lulus', '2024-03-27'),
(104, 'Lulus', '2024-03-28'),
(105, 'Berhenti Kuliah', '2024-01-31'),
(106, 'Lulus', '2024-03-30'),
(107, 'Lulus', '2024-03-31'),
(108, 'Berhenti Kuliah', '2024-02-15'),
(109, 'Lulus', '2024-03-31'),
(110, 'Lulus', '2024-03-31');

-- Menambahkan data ke tabel Mata_Kuliah
INSERT INTO Mata_Kuliah (Kode_Mata_Kuliah, Nama_Mata_Kuliah, SKS, Program_Studi, NIDN_Dosen) 
VALUES 
('CS101', 'Pemrograman Dasar', 3, 'Teknik Informatika', 1001),
('CS102', 'Basis Data', 3, 'Sistem Informasi', 1002),
('EE101', 'Pengantar Teknik Elektro', 3, 'Teknik Elektro', 1003),
('CS201', 'Pemrograman Lanjut', 3, 'Teknik Informatika', 1004),
('CS202', 'Sistem Informasi', 3, 'Sistem Informasi', 1005),
('EE201', 'Elektronika Dasar', 3, 'Teknik Elektro', 1006),
('CS301', 'Pemrograman Web', 3, 'Teknik Informatika', 1007),
('CS302', 'Rekayasa Perangkat Lunak', 3, 'Sistem Informasi', 1008),
('EE301', 'Sistem Kontrol', 3, 'Teknik Elektro', 1009),
('CS401', 'Pemrograman Mobile', 3, 'Teknik Informatika', 1010);

-- Menambahkan data ke tabel Pendaftaran_Mata_Kuliah
INSERT INTO Pendaftaran_Mata_Kuliah (NIM_Mahasiswa, Kode_Mata_Kuliah, Semester) 
VALUES 
(101, 'CS101', 'Ganjil'),
(102, 'CS102', 'Ganjil'),
(103, 'EE101', 'Ganjil'),
(104, 'CS201', 'Ganjil'),
(105, 'CS202', 'Ganjil'),
(106, 'EE201', 'Ganjil'),
(107, 'CS301', 'Ganjil'),
(108, 'CS302', 'Ganjil'),
(109, 'EE301', 'Ganjil'),
(110, 'CS401', 'Ganjil');

-- Menambahkan data ke tabel Pembayaran_UKT
INSERT INTO Pembayaran_UKT (NIM_Mahasiswa, Tanggal, Jumlah) 
VALUES 
(101, '2024-01-15', 2500000),
(102, '2024-01-20', 3000000),
(103, '2024-02-10', 2800000),
(104, '2024-02-15', 2700000),
(105, '2024-03-01', 2600000),
(106, '2024-03-05', 2900000),
(107, '2024-03-10', 3100000),
(108, '2024-03-15', 3200000),
(109, '2024-03-20', 3300000),
(110, '2024-03-25', 3400000);

-- Menambahkan data ke tabel Pembayaran_Gaji_Dosen
INSERT INTO Pembayaran_Gaji_Dosen (NIDN_Dosen, Tanggal, Jumlah) 
VALUES 
(1001, '2024-01-31', 10000000),
(1002, '2024-01-31', 12000000),
(1003, '2024-01-31', 15000000),
(1004, '2024-02-28', 11000000),
(1005, '2024-02-28', 13000000),
(1006, '2024-02-28', 16000000),
(1007, '2024-03-31', 14000000),
(1008, '2024-03-31', 16000000),
(1009, '2024-03-31', 19000000),
(1010, '2024-03-31', 17000000);

-- Menambahkan data ke tabel Pembelian_Peralatan
INSERT INTO Pembelian_Peralatan (Deskripsi, Tanggal, Jumlah) 
VALUES 
('Pembelian Laptop', '2024-02-05', 15000000),
('Pembelian Proyektor', '2024-03-10', 20000000),
('Pembelian Meja dan Kursi', '2024-03-15', 10000000),
('Pembelian AC', '2024-03-20', 30000000),
('Pembelian Papan Tulis', '2024-03-25', 5000000),
('Pembelian Printer', '2024-03-30', 8000000),
('Pembelian Scanner', '2024-03-30', 7000000),
('Pembelian Kamera', '2024-03-30', 10000000),
('Pembelian Sound System', '2024-03-30', 15000000),
('Pembelian Mikrofon', '2024-03-30', 5000000);

-- Menambahkan data ke tabel Pembayaran_Tagihan
INSERT INTO Pembayaran_Tagihan (Deskripsi, Tanggal, Jumlah) 
VALUES 
('Pembayaran Listrik', '2024-01-10', 5000000),
('Pembayaran Air', '2024-01-15', 3000000),
('Pembayaran Internet', '2024-01-20', 2000000),
('Pembayaran Keamanan', '2024-01-25', 4000000),
('Pembayaran Kebersihan', '2024-02-01', 3000000),
('Pembayaran Parkir', '2024-02-05', 2000000),
('Pembayaran Telepon', '2024-02-10', 1000000),
('Pembayaran Asuransi', '2024-02-15', 5000000),
('Pembayaran Pajak', '2024-02-20', 4000000),
('Pembayaran Sewa Gedung', '2024-02-25', 10000000);

-- Menambahkan data ke tabel Laporan_Daftar_Mahasiswa
INSERT INTO Laporan_Daftar_Mahasiswa (Tanggal_Laporan, Jumlah_Mahasiswa) 
VALUES 
('2024-03-01', 300),
('2024-03-15', 320),
('2024-03-31', 340),
('2024-03-20', 340),
('2024-03-31', 360),
('2025-03-01', 350),
('2025-03-15', 370),
('2025-03-31', 390),
('2025-03-20', 390),
('2025-03-31', 410);

-- Menambahkan data ke tabel Laporan_Daftar_Dosen
INSERT INTO Laporan_Daftar_Dosen (Tanggal_Laporan, Jumlah_Dosen) 
VALUES 
('2024-03-01', 20),
('2024-03-15', 22),
('2024-03-31', 24),
('2024-03-20', 24),
('2024-03-31', 26),
('2025-03-01', 25),
('2025-03-15', 27),
('2025-03-31', 29),
('2025-03-20', 29),
('2025-03-31', 31);

-- Menambahkan data ke tabel Laporan_Keuangan
INSERT INTO Laporan_Keuangan (Tanggal_Laporan, Kategori, Total_Pengeluaran) 
VALUES 
('2024-03-31', 'Gaji Dosen', 37000000),
('2024-03-31', 'Pembelian Peralatan', 35000000),
('2024-03-31', 'Pembayaran Tagihan', 34000000),
('2024-03-31', 'Pembayaran UKT', 33000000),
('2024-03-31', 'Pembayaran Gaji Dosen', 32000000),
('2025-03-31', 'Gaji Dosen', 39000000),
('2025-03-31', 'Pembelian Peralatan', 37000000),
('2025-03-31', 'Pembayaran Tagihan', 36000000),
('2025-03-31', 'Pembayaran UKT', 35000000),
('2025-03-31', 'Pembayaran Gaji Dosen', 34000000);

