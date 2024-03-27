SHOW DATABASES;
CREATE DATABASE modul1;
USE modul1;

CREATE TABLE Mahasiswa (
    NIM VARCHAR(20) PRIMARY KEY, 
    Nama VARCHAR(100),  
    tanggal_lahir DATE,
    jenis_kelamin VARCHAR(20),
    alamat VARCHAR(255));
	
CREATE TABLE Dosen (
    NIP VARCHAR(50) PRIMARY KEY, 
    Nama VARCHAR(100),  
    tanggal_lahir DATE,
    jenis_kelamin VARCHAR(20),
    alamat VARCHAR(255));

CREATE TABLE mahasiswa_keluar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nama VARCHAR(100),
    tanggal_keluar DATE,
    jenis_keluar VARCHAR(20));

CREATE TABLE Pengambilan_Mata_Kuliah (ID INT AUTO_INCREMENT PRIMARY KEY,
    NIM VARCHAR (20),
    Kode_Mata_Kuliah VARCHAR(20),
    Nama_Mata_Kuliah VARCHAR(100),
    SKS INT, Semester INT);
    
CREATE TABLE Pembayaran_UKT (
    id_ukt INT PRIMARY KEY AUTO_INCREMENT,
    nim VARCHAR (20),
    jumlah_pembayaran DECIMAL(10, 2),
    tanggal_pembayaran DATE);

CREATE TABLE Pembayaran_Gaji_Dosen (
    id_gaji INT PRIMARY KEY AUTO_INCREMENT,
    nip VARCHAR (50),
    jumlah_pembayaran DECIMAL(10, 2),
    tanggal_pembayaran DATE);

CREATE TABLE pembelian_tagihan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    keterangan VARCHAR(255),
    jumlah DECIMAL(10, 2),
    tanggal DATE);

CREATE TABLE laporan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    jenis_laporan VARCHAR (100),
    deskripsi TEXT,
    tanggal DATE);
    
INSERT INTO Mahasiswa (NIM, Nama, tanggal_lahir, jenis_kelamin, alamat) VALUES
('220441100009', 'Naelah Yasmin Kusuma','2003-11-25', 'Perempuan', 'Jl. Kartini No. 15'),
('220441100075', 'Alvita Aqila Habsah','2003-12-25', 'Perempuan', 'Jl. Panglima Sudirman No. 5'),
('220441100088', 'Rian Jaya Dewa','2004-07-20', 'Laki-laki', 'Jl. Veteran No. 25'),
('220441100095', 'Nur Ichsan','2003-09-10', 'Laki-laki', 'Jl. Diponegoro No. 10'),
('220441100108', 'Nining Anggriani', '2004-06-12', 'Perempuan', 'Jl. A. Yani No. 8'),
('220441100112', 'Mahardika Kurniawan', '2004-3-30', 'Laki-laki', 'Jl. Merdeka No. 3'),
('220441100116', 'Maharani Ava Ningrum', '2003-08-15', 'Perempuan', 'Jl. Gajah Mada No. 12'),
('220441100117', 'Nadia Widi Fabila ','2004-03-18', 'Perempuan', 'Jl. Sudirman No. 30'),
('220441100122', 'Luluk Farida', '2003-04-05', 'Perempuan', 'Jl. HR. Rasuna Said No. 7'),
('220441100125', 'Farhan Sadewo', '2004-01-08', 'Laki-laki', 'Jl. Gatot Subroto No. 17');

INSERT INTO Dosen (NIP, Nama, tanggal_lahir, jenis_kelamin, alamat) VALUES
('197705292003121002', 'Firman Kurniawansyah, ST, M.EngSc. Ph.D', '1970-05-12', 'Laki-laki', 'Jl. Raya Barat No. 50'),
('198103032006041002', 'Donny Satria Bhuan,S.Kom', '1985-07-15', 'Laki-laki', 'Jl. Diponegoro No. 25'),
('198103032006041003', 'Ainy Mabruhatin, ST.M.Eng', '1978-09-20', 'Perempuan', 'Jl. Pemuda No. 7'),
('196406081991021003', 'Dr. Ir. Sumarno, M.Eng', '1965-08-03', 'Laki-laki', 'Jl. Merdeka Timur No. 2'),
('197705292003121004', 'Dr. Fadlilatul Taufany, ST, Ph.D',  '1973-04-28', 'Perempuan', 'Jl. Jendral Sudirman No. 18'),
('198110102009122004', 'Hikmatun Ni’mah, ST, M.Sc,',  '1980-12-10', 'Perempuan', 'Jl. Raden Saleh No. 33'),
('198311142015042007', 'Prida Novarita T, ST., MT','1976-11-25', 'Perempuan', 'Jl. Pangeran Antasari No. 11'),
('198405082009122004', 'Dr. Siti Nurkamidah, ST, MS, Ph.D','1982-03-05', 'Perempuan', 'Jl. Raya Selatan No. 20'),
('195303062005012002', 'Hj. Dwi Remawati, S.Kom, M.Kom', '1968-06-18', 'Perempuan', 'Jl. Raya Timur No. 8'),
('195004281979031002', 'Prof. Dr. Ir. Achmad Roesyadi, M.Sc','1960-10-08', 'Laki-laki', 'Jl. Jendral Gatot Subroto No. 5');

INSERT INTO mahasiswa_keluar (Nama, tanggal_keluar, jenis_keluar)VALUES
('Budi Santoso', '2023-12-31', 'Berhenti Kuliah'),
('Ani Wijayanti', '2023-11-15', 'Lulus'),
('Rudi Hidayat', '2024-01-20', 'Berhenti Kuliah'),
('Siti Rahayu', '2023-10-05', 'Lulus'),
('Eko Susanto', '2024-02-28', 'Lulus'),
('Rina Anggraeni', '2023-09-10', 'Berhenti Kuliah'),
('Agus Setiawan', '2024-03-15', 'Lulus'),
('Dewi Cahyani', '2023-08-20', 'Berhenti Kuliah'),
('Ferry Prasetyo', '2024-04-01', 'Berhenti Kuliah'),
('Siska Damayanti', '2023-07-25', 'Lulus');

INSERT INTO Pengambilan_Mata_Kuliah (NIM, Kode_Mata_Kuliah, Nama_Mata_Kuliah, SKS, Semester) VALUES
('220441100045', 'MK001', 'Pemrograman Bergerak', 4, 4),
('220441100047', 'MK002', 'Sistem Manajemen Basis Data', 4, 4),
('220441100075', 'MK003', 'Sistem Manajemen Basis Data', 4, 4),
('210441100007', 'MK004', 'Sistem Manajemen Basis Data', 4, 6),
('210441100110', 'MK005', 'E-Goverment', 3, 6),
('230441100010', 'MK006', 'Pemrograman Berbasis Objek', 4, 2),
('230441100065', 'MK007', 'Pemrograman Berbasis Objek', 4, 2),
('230441100100', 'MK008', 'E- Bussiness dan E-Commerce', 3, 2),
('220441100103', 'MK009', 'Data Mining', 3, 4),
('210441100115', 'MK010', 'Smart City', 4, 6);

INSERT INTO Pembayaran_UKT (nim, jumlah_pembayaran, tanggal_pembayaran) VALUES
('220441100009', 5000000.00, '2024-03-25'),
('220441100075', 4500000.00, '2024-03-25'),
('220441100088', 4800000.00, '2024-03-25'),
('220441100095', 5100000.00, '2024-03-25'),
('220441100108', 4700000.00, '2024-03-25'),
('220441100112', 4900000.00, '2024-03-25'),
('220441100116', 4600000.00, '2024-03-25'),
('220441100117', 4700000.00, '2024-03-25'),
('220441100122', 5200000.00, '2024-03-25'),
('220441100125', 5300000.00, '2024-03-25');

INSERT INTO Pembayaran_Gaji_Dosen (nip, jumlah_pembayaran, tanggal_pembayaran) VALUES
('197705292003121002', 10000000.00, '2024-03-25'),
('198103032006041002', 9500000.00, '2024-03-25'),
('198103032006041003', 9800000.00, '2024-03-25'),
('196406081991021003', 10500000.00, '2024-03-25'),
('197705292003121004', 11000000.00, '2024-03-25'),
('198110102009122004', 10200000.00, '2024-03-25'),
('198311142015042007', 9700000.00, '2024-03-25'),
('198405082009122004', 9900000.00, '2024-03-25'),
('195303062005012002', 11500000.00, '2024-03-25'),
('195004281979031002', 12000000.00, '2024-03-25');

INSERT INTO pembelian_tagihan (keterangan, jumlah, tanggal)VALUES
('Listrik', 1500000.00, '2024-03-25'),
('Air', 500000.00, '2024-03-25'),
('Internet', 1000000.00, '2024-03-25'),
('Sewa Gedung', 2000000.00, '2024-03-25'),
('Keamanan', 300000.00, '2024-03-25'),
('Proyektor', 3000000.00, '2024-03-25'),
('Meja dan Kursi', 2500000.00, '2024-03-25'),
('Papan Tulis', 1500000.00, '2024-03-25'),
('Komputer', 10000000.00, '2024-03-25'),
('Printer', 5000000.00, '2024-03-25'),
('Meja Lab', 3000000.00, '2024-03-25');

INSERT INTO laporan (jenis_laporan, deskripsi, tanggal)VALUES
('Laporan Jumlah Mahasiswa', 'Saat ini terdapat 6800 mahasiswa aktif di Universitas Trunojoyo.', '2021-03-23'),
('Laporan Jumlah Dosen', 'Saat ini terdapat 1002 dosen di Universitas Trunojoyo.', '2021-03-23'),
('Laporan Pengeluaran Keuangan', 'Total pengeluaran keuangan bulan ini adalah Rp 10.000.000.', '2021-10-13'),
('Laporan Jumlah Mahasiswa', 'Saat ini terdapat 8002 mahasiswa aktif di Universitas Trunojoyo.', '2022-06-22'),
('Laporan Jumlah Dosen', 'Saat ini terdapat 1015 dosen di Universitas Trunojoyo.', '2022-06-22'),
('Laporan Pengeluaran Keuangan', 'Total pengeluaran keuangan bulan ini adalah Rp 9.500.000.', '2022-05-10'),
('Laporan Jumlah Mahasiswa', 'Saat ini terdapat 9800 mahasiswa aktif di Universitas Trunojoyo.', '2023-09-08'),
('Laporan Jumlah Dosen', 'Saat ini terdapat 1058 dosen di Universitas Trunojoyo.', '2023-09-08'),
('Laporan Pengeluaran Keuangan', 'Total pengeluaran keuangan bulan ini adalah Rp 78.000.000.', '2023-11-12'),
('Laporan Pengeluaran Keuangan', 'Total pengeluaran keuangan bulan ini adalah Rp 6.900.000.', '2024-02-12');

SELECT * FROM Mahasiswa;
SELECT * FROM Dosen;
SELECT * FROM mahasiswa_keluar;
SELECT * FROM Pengambilan_Mata_Kuliah;
SELECT * FROM Pembayaran_UKT;
SELECT * FROM Pembayaran_Gaji_Dosen;
SELECT * FROM pembelian_tagihan;
SELECT * FROM laporan;
SHOW TABLES ;

DESC laporan;
DESC pembelian_tagihan;
ALTER TABLE Pengambilan_Mata_Kuliah DROP COLUMN Semester;
DROP TABLE Pengambilan_Mata_Kuliah;
ALTER TABLE pembelian_tagihan CHANGE COLUMN jumlah total INT (100);
ALTER TABLE pembelian_tagihan MODIFY COLUMN total INT DEFAULT 10000;

INSERT INTO pembelian_tagihan (keterangan, tanggal) VALUES ( 'air', '23-03-24');