CREATE DATABASE db_UTM;
USE db_UTM;

CREATE TABLE tbl_mhs (
    NIM CHAR(12) NOT NULL PRIMARY KEY, 
    Nama CHAR(50), 
    Prodi CHAR(20), 
    Alamat CHAR(20),
    id_status INT,
    FOREIGN KEY (id_status) REFERENCES sts_mhs(id_status));
    
CREATE TABLE tbl_dosen (
	NIP CHAR (12) NOT NULL PRIMARY KEY, 
	NamaLengkap CHAR (50), 
	Prodi CHAR (20), 
	Jabatan CHAR (20));

CREATE TABLE sts_mhs (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    Status_mhs CHAR(20), 
    Alasan CHAR(50) DEFAULT '---');
    
CREATE TABLE tbl_mk (
	Kode_mk CHAR (10) PRIMARY KEY, 
	Nama_mk CHAR (20),
	SKS INT (4));

CREATE TABLE daftar_mk (
	Kode_mk CHAR (10),
	NIM CHAR (12),
	FOREIGN KEY (NIM) REFERENCES tbl_mhs(NIM), 
	FOREIGN KEY (Kode_mk) REFERENCES tbl_mk(Kode_mk));

CREATE TABLE ukt ( 
	id_ukt INT AUTO_INCREMENT PRIMARY KEY,
	besar_ukt INT (8));

CREATE TABLE bayar_ukt ( 
	id_bayarukt INT AUTO_INCREMENT PRIMARY KEY,
	id_ukt INT, 
	NIM CHAR (12),
	Tgl_bayar DATE,
	FOREIGN KEY (NIM) REFERENCES tbl_mhs(NIM), 
	FOREIGN KEY (id_ukt) REFERENCES ukt(id_ukt));

CREATE TABLE gaji_dosen (
	id_gajidosen INT AUTO_INCREMENT PRIMARY KEY,
	id_gaji INT,
	NIP CHAR (12),
	tgl_gaji DATE,
	FOREIGN KEY (id_gaji) REFERENCES gaji(id_gaji),
	FOREIGN KEY (NIP) REFERENCES tbl_dosen(NIP));

CREATE TABLE gaji (
	id_gaji INT AUTO_INCREMENT PRIMARY KEY, 
	besar_gaji INT (8));

CREATE TABLE beli_alat (
	id_beli INT AUTO_INCREMENT PRIMARY KEY,
	Nama_barang CHAR (20), 
	Jml_barang INT (4), 
	Harga INT (8), 
	Tot_harga INT (10), 
	Tgl_beli DATE, 
	Supplier CHAR (25));

CREATE TABLE bayar_tagihan (
	id_tagihan INT AUTO_INCREMENT PRIMARY KEY,
	Jenis_tagihan CHAR (20), 
	Periode CHAR (20), 
	Jml_tagihan INT (10), 
	Tgl_bayar DATE);

CREATE TABLE Laporan_mhs (
	id_laporanmhs INT AUTO_INCREMENT PRIMARY KEY,
	NIM CHAR (12), 
	FOREIGN KEY (NIM) REFERENCES tbl_mhs(NIM));

CREATE TABLE Laporan_dosen (
	id_laporandosen INT AUTO_INCREMENT PRIMARY KEY,
	NIP CHAR (12), 
	id_gajidosen INT,
	FOREIGN KEY (NIP) REFERENCES tbl_dosen(NIP),
	FOREIGN KEY (id_gajidosen) REFERENCES gaji_dosen(id_gajidosen));

CREATE TABLE Laporan_keuangan (
	id_laporankeuangan INT AUTO_INCREMENT PRIMARY KEY,
	id_bayarukt INT, 
	id_gajidosen INT,
	id_beli INT,
	id_tagihan INT,
	FOREIGN KEY (id_bayarukt) REFERENCES bayar_ukt(id_bayarukt),
	FOREIGN KEY (id_gajidosen) REFERENCES gaji_dosen(id_gajidosen),
	FOREIGN KEY (id_beli) REFERENCES beli_alat(id_beli),
	FOREIGN KEY (id_tagihan) REFERENCES bayar_tagihan(id_tagihan));


INSERT INTO tbl_mhs (NIM, Nama, Prodi, Alamat, id_status) VALUES 
('220441100001', 'John Doe', 'Teknik Informatika', 'Jl. Mangga 10', 1),
('220441100002', 'Jane Smith', 'Sistem Informasi', 'Jl. Melati 20', 1),
('220441100003', 'Bob Brown', 'Teknik Mesin', 'Jl. Anggrek 30', 2),
('220441100004', 'Alice Johnson', 'Teknik Elektro', 'Jl. Kenanga 40', 1),
('220441100005', 'Charlie Wilson', 'Teknik Sipil', 'Jl. Mawar 50', 2),
('220441100006', 'David Lee', 'Teknik Komputer', 'Jl. Teratai 60', 1),
('220441100007', 'Eva Martinez', 'Teknik Lingkungan', 'Jl. Dahlia 70', 2),
('220441100008', 'Fiona Taylor', 'Teknik Kimia', 'Jl. Sakura 80', 1),
('220441100009', 'George Brown', 'Teknik Perkapalan', 'Jl. Flamboyan 90', 2),
('220441100010', 'Hannah Garcia', 'Teknik Industri', 'Jl. Puspa 100', 1);

INSERT INTO tbl_dosen (NIP, NamaLengkap, Prodi, Jabatan) VALUES 
('123456789012', 'Dr. John Doe', 'Teknik Informatika', 'Dosen'),
('234567890123', 'Prof. Jane Smith', 'Sistem Informasi', 'Dosen'),
('345678901234', 'Dr. Bob Brown', 'Teknik Mesin', 'Dosen'),
('456789012345', 'Prof. Alice Johnson', 'Teknik Elektro', 'Dosen'),
('567890123456', 'Dr. Charlie Wilson', 'Teknik Sipil', 'Dosen'),
('678901234567', 'Prof. David Lee', 'Teknik Komputer', 'Dosen'),
('789012345678', 'Dr. Eva Martinez', 'Teknik Lingkungan', 'Dosen'),
('890123456789', 'Prof. Fiona Taylor', 'Teknik Kimia', 'Dosen'),
('901234567890', 'Dr. George Brown', 'Teknik Perkapalan', 'Dosen'),
('012345678901', 'Prof. Hannah Garcia', 'Teknik Industri', 'Dosen');

INSERT INTO sts_mhs (Status_mhs) VALUES 
('Aktif'),
('Tidak Aktif');

INSERT INTO tbl_mk (Kode_mk, Nama_mk, SKS) VALUES 
('MK001', 'Matematika Dasar', 3),
('MK002', 'Fisika Dasar', 3),
('MK003', 'Kimia Dasar', 3),
('MK004', 'Pemrograman Dasar', 4),
('MK005', 'Basis Data', 3),
('MK006', 'Algoritma dan Struktur Data', 4),
('MK007', 'Bahasa Inggris', 2),
('MK008', 'Pendidikan Agama', 2),
('MK009', 'Kewarganegaraan', 2),
('MK010', 'Pemrograman Web', 4);

INSERT INTO daftar_mk (Kode_mk, NIM) VALUES
('MK001', '220441100001'),
('MK002', '220441100002'),
('MK003', '220441100003'),
('MK004', '220441100004'),
('MK005', '220441100005'),
('MK006', '220441100006'),
('MK007', '220441100007'),
('MK008', '220441100008'),
('MK009', '220441100009'),
('MK010', '220441100010');

INSERT INTO ukt (besar_ukt) VALUES 
(1000000),
(2000000),
(3000000), 
(4000000);

INSERT INTO bayar_ukt (id_ukt, NIM, Tgl_bayar) VALUES 
(1, '220441100001', '2023-01-15'),
(2, '220441100002', '2023-01-16'),
(3, '220441100003', '2023-01-17'),
(4, '220441100004', '2023-01-18'),
(1, '220441100005', '2023-01-19'),
(2, '220441100006', '2023-01-20'),
(3, '220441100007', '2023-01-21'),
(4, '220441100008', '2023-01-22'),
(1, '220441100009', '2023-01-23'),
(2, '220441100010', '2023-01-24');

INSERT INTO gaji (besar_gaji) VALUES 
(5000000),  
(6000000),  
(7000000),  
(8000000);  

INSERT INTO gaji_dosen (id_gaji, NIP, tgl_gaji) VALUES
(1, '123456789012', '2024-01-01'),
(2, '234567890123', '2024-01-01'),
(3, '345678901234', '2024-01-01'),
(4, '456789012345', '2024-01-01'),
(1, '567890123456', '2024-01-01'),
(2, '678901234567', '2024-01-01'),
(3, '789012345678', '2024-01-01'),
(4, '890123456789', '2024-01-01'),
(1, '901234567890', '2024-01-01'),
(2, '012345678901', '2024-01-01');

INSERT INTO beli_alat (Nama_barang, Jml_barang, Harga, Tot_harga, Tgl_beli, Supplier) VALUES 
('Laptop', 5, 7000000, 35000000, '2023-01-15', 'PT. Tekno Maju'),
('Proyektor', 2, 5000000, 10000000, '2023-01-16', 'PT. Electronic Solution'),
('Kamera', 3, 8000000, 24000000, '2023-01-17', 'PT. Jaya Foto'),
('Meja', 10, 1000000, 10000000, '2023-01-18', 'PT. Furni'),
('Kursi', 15, 800000, 12000000, '2023-01-19', 'PT. Furni'),
('AC', 4, 6000000, 24000000, '2023-01-20', 'PT. Elektronik Lancar'),
('Printer', 3, 3000000, 9000000, '2023-01-21', 'PT. Print Solution'),
('Whiteboard', 2, 2000000, 4000000, '2023-01-22', 'PT. Furni'),
('Speaker', 5, 1500000, 7500000, '2023-01-23', 'PT. Audio Jaya'),
('Papan tulis', 3, 1000000, 3000000, '2023-01-24', 'PT. Furni');

INSERT INTO bayar_tagihan (Jenis_tagihan, Periode, Jml_tagihan, Tgl_bayar) VALUES 
('Biaya Registrasi', 'Januari 2023', 3000000, '2023-01-15'),
('Biaya Ujian Akhir', 'Februari 2023', 3000000, '2023-02-17'),
('Biaya Laboratorium', 'Januari 2023', 500000, '2023-01-20'),
('Biaya Praktikum', 'Februari 2023', 750000, '2023-02-18'),
('Biaya Perpustakaan', 'Maret 2023', 200000, '2023-03-20'),
('Asuransi Kesehatan', 'April 2023', 150000, '2023-04-22'),
('Biaya Akomodasi', 'Januari 2023', 1000000, '2023-01-25'),
('Biaya Kegiatan Mahasiswa', 'Februari 2023', 100000, '2023-02-26'),
('Biaya Wisuda', 'Mei 2023', 500000, '2023-05-27'),
('Biaya Sertifikasi', 'Juni 2023', 2000000, '2023-06-28');

INSERT INTO Laporan_mhs (NIM) VALUES
('220441100001'),
('220441100002'),
('220441100003'),
('220441100004'),
('220441100005'),
('220441100006'),
('220441100007'),
('220441100008'),
('220441100009'),
('220441100010');

INSERT INTO Laporan_dosen (NIP, id_gajidosen) VALUES
('123456789012', 11),
('234567890123', 12),
('345678901234', 13),
('456789012345', 14),
('567890123456', 15),
('678901234567', 16),
('789012345678', 17),
('890123456789', 18),
('901234567890', 19),
('012345678901', 20);

INSERT INTO Laporan_keuangan (id_bayarukt, id_gajidosen, id_beli, id_tagihan) VALUES
(1, 11, 1, 1),
(2, 12, 2, 2),
(3, 13, 3, 3),
(4, 14, 4, 4),
(5, 15, 5, 5),
(6, 16, 6, 6),
(7, 17, 7, 7),
(8, 18, 8, 8),
(9, 19, 9, 9),
(10, 20, 10, 10);
