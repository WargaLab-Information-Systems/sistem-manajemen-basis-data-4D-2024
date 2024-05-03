CREATE DATABASE db_kampus;
USE db_kampus;

DROP TABLE tb_mahasiswa;
CREATE TABLE tb_mahasiswa(
	nim INT(20) NOT NULL PRIMARY KEY,
    nama_mhs VARCHAR(50) NOT NULL,
    fakultas VARCHAR(50) NOT NULL,
    prodi VARCHAR(50) NOT NULL,
    status ENUM('aktif', 'berhenti', 'lulus') NOT NULL
);
DESC tb_mahasiswa;

DROP TABLE tb_dosen;
CREATE TABLE tb_dosen(
	nip INT(20) NOT NULL PRIMARY KEY,
    nama_dosen VARCHAR(50) NOT NULL,
    fakultas VARCHAR(30) NOT NULL,  
    prodi VARCHAR(30) NOT NULL
);
DESC tb_dosen;

CREATE TABLE tb_matkul(
	kode_matkul CHAR(20) NOT NULL PRIMARY KEY,
    nama_matkul VARCHAR(30),
    sks INT(10)
);
DESC tb_matkul;

CREATE TABLE tb_krs (
    id_krs INT PRIMARY KEY,
    nim INT(12) NOT NULL,
    kode_matkul CHAR(20) NOT NULL,
    semester INT NOT NULL,
    FOREIGN KEY (nim) REFERENCES tb_mahasiswa(nim),
    FOREIGN KEY (kode_matkul) REFERENCES tb_matkul(kode_matkul)
);
DESC tb_krs;

CREATE TABLE tb_Pembayaran_UKT(
	id_pembayaran_ukt INT PRIMARY KEY,
	nim INT(12) NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_bayar INT(30) NOT NULL,
    FOREIGN KEY (nim) REFERENCES tb_mahasiswa(nim)
);
DESC tb_Pembayaran_UKT;

CREATE TABLE tb_pembayaran_GajiDosen(
	id_pembayaran_GajiDosen INT PRIMARY KEY,
	nip INT(12) NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran  INT (30) NOT NULL,
    FOREIGN KEY(nip) REFERENCES tb_dosen (nip)
);
DESC tb_pembayaran_GajiDosen;

CREATE TABLE tb_Pembelian_Barang(
	id_Pembelian INT AUTO_INCREMENT PRIMARY KEY,
    tanggal_pembelian DATE NOT NULL,
    nama_barang VARCHAR(30) NOT NULL,
    jumlah INT(10) NOT NULL,
    Harga INT(30) NOT NULL
);
DESC tb_Pembelian_Barang;

CREATE TABLE tb_Pembayaran_Tagihan(
	id_pembayaran INT AUTO_INCREMENT PRIMARY KEY ,
    tanggal_pembayaran DATE NOT NULL,
    jenis_Tagihan VARCHAR(50) NOT NULL,
    jumlah_pembayaran INT(30) NOT NULL
);
DESC tb_Pembayaran_Tagihan;

CREATE TABLE tb_laporan_keuangan(
	id_laporan INT PRIMARY KEY AUTO_INCREMENT,
    pembayaran_ukt_id INT,
    gaji_dosen_id INT,
    peralatan_id INT,
    tagihan_id INT,
    FOREIGN KEY (pembayaran_ukt_id) REFERENCES tb_pembayaran_ukt (id_pembayaran_ukt),
    FOREIGN KEY (gaji_dosen_id) REFERENCES tb_pembayaran_GajiDosen (id_pembayaran_GajiDosen),
    FOREIGN KEY (peralatan_id) REFERENCES tb_Pembelian_Barang (id_Pembelian),
    FOREIGN KEY (tagihan_id) REFERENCES tb_Pembayaran_Tagihan (id_pembayaran)
);
DESC tb_laporan_keuangan;

INSERT INTO tb_mahasiswa (nim, nama_mhs, fakultas, prodi, status) VALUES
	(100137, 'Rismayanti Dwi Indarti', 'Fakultas Teknik', 'Teknik Informatika', 'aktif'),
	(100142, 'Nur Aini', 'Fakultas Ekonomi', 'Manajemen', 'lulus'),
	(100060, 'Farra Atikasari', 'Fakultas Ilmu Sosial dan Politik', 'Ilmu Komunikasi', 'lulus'),
	(100010, 'Natasya Ayu Nur Aini', 'Fakultas Ilmu Pendidikan', 'PGSD', 'aktif'),
	(100123, 'Queensha Arabella', 'Fakultas Kedokteran', 'Kedokteran Umum', 'aktif'),
	(100156, 'Achmad Daniel Virgi', 'Fakultas Keislaman', 'Hukum Bisnis Syariah', 'lulus'),
	(100176, 'Nabila Putri', 'Fakultas Sastra', 'Sastra Inggris', 'berhenti'),
	(100011, 'Sukma Ayuningtyas', 'Fakultas Teknik', 'Teknik Industri', 'aktif'),
	(100001, 'Oktaviya Nuri Amelia', 'Fakultas Ekonomi', 'Akuntansi', 'berhenti'),
	(100020, 'Emilda Echa Olivia', 'Fakultas Pertanian', 'Agribisnis', 'aktif');
SELECT * FROM tb_mahasiswa;

INSERT INTO tb_dosen (nip, nama_dosen, fakultas, prodi) VALUES
	(567890, 'Fitri Damayanti', 'Fakultas Teknik', 'Teknik Informatika'),
	(678901, 'Bain Khusnul', 'Fakultas Ekonomi', 'Manajemen'),
	(789012, 'Eza Rachmanita', 'Fakultas Ilmu Sosial dan Politik', 'Ilmu Komunikasi'),
	(890123, 'Ersa Alami', 'Fakultas Ilmu Pendidikan', 'PGSD'),
	(901234, 'Sri Herawati', 'Fakultas Kedokteran', 'Kedokteran Umum'),
	(012345, 'Sarkawi', 'Fakultas Keislaman', 'Hukum Bisnis Syariah'),
	(123456, 'Achmad David', 'Fakultas Teknik', 'Teknik Industri'),
	(234567, 'Wahyudi', 'Fakultas Ekonomi', 'Akuntansi'),
	(345678, 'Novi Prastiti', 'Fakultas Pertanian', 'Agribisnis'),
	(567809, 'Rosdia', 'Fakultas Pertanian', 'Ilmu Kelautan');
SELECT * FROM tb_dosen;

INSERT INTO tb_matkul (kode_matkul, nama_matkul, sks) VALUES
	('MAT001', 'Matematika Dasar', 3),
	('FIS002', 'Fisika Dasar', 4),
	('KI003', 'Kimia Dasar', 3),
	('BI004', 'Bahasa Inggris', 2),
	('PM005', 'Pemrograman Dasar', 3),
	('AL006', 'Algoritma dan Struktur Data', 4),
	('BD007', 'Basis Data', 3),
	('SO008', 'Sistem Operasi', 3),
	('PW009', 'Pemrograman Web', 3),
	('MP010', 'Manajemen Proyek', 2);
SELECT * FROM tb_matkul;

INSERT INTO tb_krs (id_krs, nim, kode_matkul, semester) VALUES
    (1, 100137, 'MAT001', 1),
    (2, 100142, 'FIS002', 3),
    (3, 100060, 'KI003', 4),
    (4, 100010, 'BI004', 2),
    (5, 100123, 'PM005', 5),
    (6, 100156, 'AL006', 3),
    (7, 100176, 'BD007', 2),
    (8, 100011, 'SO008', 4),
    (9, 100001, 'PW009', 2),
    (10, 100020, 'MP010', 3);
SELECT * FROM tb_krs;

INSERT INTO tb_Pembayaran_UKT (id_pembayaran_UKT, nim, tanggal_pembayaran, jumlah_bayar) VALUES
	(1, 100137, '2024-01-01', 5000000),
	(2, 100142, '2024-01-02', 4500000),
	(3, 100060, '2024-01-03', 6000000),
	(4, 100010, '2024-01-04', 5500000),
	(5, 100123, '2024-01-05', 4800000),
	(6, 100156, '2024-01-06', 5200000),
	(7, 100176, '2024-01-07', 5800000),
	(8, 100011, '2024-01-08', 5100000),
	(9, 100001, '2024-01-09', 5300000),
	(10, 100020, '2024-01-10', 5700000);
SELECT * FROM tb_Pembayaran_UKT;

INSERT INTO tb_pembayaran_GajiDosen (id_pembayaran_GajiDosen, nip, tanggal_pembayaran, jumlah_pembayaran) VALUES
    (1, 567890, '2024-03-01', 5000000),
    (2, 678901, '2024-03-01', 7000000),
    (3, 789012, '2024-03-01', 6000000),
    (4, 890123, '2024-03-01', 5500000),
    (5, 901234, '2024-03-01', 7500000),
    (6, 012345, '2024-03-01', 6200000),
    (7, 123456, '2024-03-01', 5800000),
    (8, 234567, '2024-03-01', 8000000),
    (9, 345678, '2024-03-01', 6300000),
    (10, 567809,'2024-03-01', 5700000);
SELECT * FROM tb_pembayaran_GajiDosen;

INSERT INTO tb_Pembelian_Barang (tanggal_pembelian, nama_barang, jumlah, Harga) VALUES
	('2024-03-01', 'Laptop', 5, 8000000),
	('2024-03-02', 'Smartphone', 10, 5000000),
	('2024-03-03', 'Tablet', 3, 3000000),
	('2024-03-04', 'Printer', 2, 2000000),
	('2024-03-05', 'Monitor', 7, 1500000),
	('2024-03-06', 'Keyboard', 15, 500000),
	('2024-03-07', 'Mouse', 20, 200000),
	('2024-03-08', 'Speaker', 4, 1000000),
	('2024-03-09', 'Headset', 6, 700000),
	('2024-03-10', 'Webcam', 8, 600000);
SELECT * FROM tb_Pembelian_Barang;

INSERT INTO tb_Pembayaran_Tagihan (tanggal_pembayaran, jenis_Tagihan, jumlah_pembayaran) VALUES
	('2024-03-11', 'Listrik', 600000),
	('2024-03-12', 'Air', 400000),
	('2024-03-13', 'Telepon', 100000),
	('2024-03-14', 'Internet', 200000),
	('2024-03-15', 'TV Kabel', 250000),
	('2024-03-16', 'PBB', 800000),
	('2024-03-17', 'Asuransi Kesehatan', 200000),
	('2024-03-18', 'Kegiatan Unit Mahasiswa', 3000000),
	('2024-03-19', 'Pendaftaran Seminar', 50000),
	('2024-03-20', 'Laboratorium', 150000);
SELECT * FROM tb_Pembayaran_Tagihan;

INSERT INTO tb_laporan_keuangan (pembayaran_ukt_id, gaji_dosen_id) VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
SELECT * FROM tb_laporan_keuangan;


