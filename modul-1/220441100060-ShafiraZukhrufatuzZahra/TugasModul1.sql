CREATE DATABASE db_modul1;
USE db_modul1;

CREATE TABLE tb_mahasiswa(
	nim INT(20) NOT NULL PRIMARY KEY,
    nama_mhs VARCHAR(50) NOT NULL,
    prodi VARCHAR(50) NOT NULL,
    fakultas VARCHAR(50) NOT NULL,
    status ENUM('aktif', 'berhenti', 'lulus') NOT NULL
);
DESC tb_mahasiswa;
INSERT INTO tb_mahasiswa (nim, nama_mhs, prodi, fakultas, status) VALUES
	(1904401, 'Dia', 'Teknik', 'Teknik Informatika', 'lulus'),
	(2204460, 'Shafira', 'Teknik', 'Sistem Informasi', 'aktif'),
	(2204435, 'Farra', 'Teknik', 'Sistem Informasi', 'aktif'),
	(2204402, 'Andini', 'Pendidikan', 'PGSD', 'aktif'),
	(2204406, 'Alifia', 'Fisib', 'Ilmu Komunikasi', 'aktif'),
	(1904459, 'Fiana', 'Pendidikan', 'PGPAUD', 'lulus'),
	(2304455, 'Nabila', 'Fisib', 'Ilmu Komunikasi', 'berhenti'),
	(2204445, 'Ketut', 'Teknik', 'Teknik Industri', 'aktif'),
	(2304430, 'Husnul', 'Pertanian', 'Agroteknologi', 'berhenti'),
	(2204411, 'Reggina', 'Pertanian', 'Agribisnis', 'aktif');
SELECT * FROM tb_mahasiswa;

CREATE TABLE tb_dosen(
	nip INT(20) NOT NULL PRIMARY KEY,
    nama_dosen VARCHAR(50) NOT NULL,
    jurusan VARCHAR(30) NOT NULL,  
    prodi VARCHAR(30) NOT NULL,
    jabatan VARCHAR(30) NOT NULL 
);
DESC tb_dosen;
INSERT INTO tb_dosen (nip, nama_dosen, jurusan, prodi, jabatan) VALUES
	(197890, 'Jauhari', 'Teknik', 'Teknik Informatika', 'Lektor'),
	(198901, 'Bain', 'Teknik', 'Sistem Informasi', 'Lektor Kepala'),
	(199012, 'Aeri', 'Pertanian', 'Agribisnis', 'Asisten Ahli'),
	(190123, 'Ersa', 'Pendidikan', 'PGSD', 'Lektor'),
	(191234, 'Trisita', 'Pendidikan', 'PGPAUD', 'Lektor Kepala'),
	(192345, 'Sarkawi', 'Teknik', 'Teknik Industri', 'Asisten Ahli'),
	(193456, 'David', 'Teknik', 'Teknik Elektro', 'Lektor'),
	(194567, 'Wahyudi', 'Pertanian', 'Agroteknologi', 'Lektor Kepala'),
	(195678, 'Novi Prastiti', 'Teknik', 'Teknik Mesin', 'Asisten Ahli'),
	(197809, 'Rosdia', 'Teknik', 'Teknik Mekatronika', 'Lektor');
SELECT * FROM tb_dosen;

CREATE TABLE tb_matkul(
	kode_matkul CHAR(20) NOT NULL PRIMARY KEY,
    nama_matkul VARCHAR(30),
    sks INT(10)
);
DESC tb_matkul;
INSERT INTO tb_matkul (kode_matkul, nama_matkul, sks) VALUES
	('SI001', 'ALPRO', 4),
	('SI002', 'ADSI', 3),
	('K003', 'KI', 2),
	('K004', 'RO', 2),
	('TIF005', 'PEMBER', 4),
	('TIF006', 'PEMVIS', 4),
	('TIF007', 'PTIK', 3),
	('K008', 'DMJ', 3),
	('K009', 'APB', 3),
	('SI010', 'MPIT', 3);
SELECT * FROM tb_matkul;

CREATE TABLE tb_krs (
    id_krs INT PRIMARY KEY,
    nim INT(12) NOT NULL,
    kode_matkul CHAR(20) NOT NULL,
    semester INT NOT NULL,
    FOREIGN KEY (nim) REFERENCES tb_mahasiswa(nim),
    FOREIGN KEY (kode_matkul) REFERENCES tb_matkul(kode_matkul)
);
DESC tb_krs;
INSERT INTO tb_krs (id_krs, nim, kode_matkul, semester) VALUES
    (1, 1904401, 'SI001', 1),
    (2, 2204460, 'SI002', 1),
    (3, 2204435, 'K003', 1),
    (4, 2204402, 'K004', 1),
    (5, 2204406, 'TIF005', 3),
    (6, 1904459, 'TIF006', 3),
    (7, 2304455, 'TIF007', 3),
    (8, 2204445, 'K008', 4),
    (9, 2304430, 'K009', 4),
    (10, 2204411, 'SI010', 4);
SELECT * FROM tb_krs;

CREATE TABLE tb_Pembayaran_UKT(
	id_pembayaran_ukt INT PRIMARY KEY,
	nim INT(12) NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_bayar INT(30) NOT NULL,
    FOREIGN KEY (nim) REFERENCES tb_mahasiswa(nim)
);
DESC tb_Pembayaran_UKT;
INSERT INTO tb_Pembayaran_UKT (id_pembayaran_UKT, nim, tanggal_pembayaran, jumlah_bayar) VALUES
    (1, 1904401, '2024-03-15', 2000000),
    (2, 2204460, '2024-03-16', 2000000),
    (3, 2204435, '2024-03-17', 3000000),
    (4, 2204402, '2024-03-18', 3000000),
    (5, 2204406, '2024-03-19', 3000000),
    (6, 1904459, '2024-03-20', 3500000),
    (7, 2304455, '2024-03-15', 3500000),
    (8, 2204445, '2024-03-16', 4000000),
    (9, 2304430, '2024-03-17', 4000000),
    (10, 2204411, '2024-03-18', 4000000);
SELECT * FROM tb_Pembayaran_UKT;

CREATE TABLE tb_pembayaran_GajiDosen(
	id_pembayaran_GajiDosen INT PRIMARY KEY,
	nip INT(12) NOT NULL,
    tanggal_pembayaran DATE NOT NULL,
    jumlah_pembayaran  INT (30) NOT NULL,
    FOREIGN KEY(nip) REFERENCES tb_dosen (nip)
);
DESC tb_pembayaran_GajiDosen;
INSERT INTO tb_pembayaran_GajiDosen (id_pembayaran_GajiDosen, nip, tanggal_pembayaran, jumlah_pembayaran) VALUES
    (1, 197890, '2024-11-25', 7000000),
    (2, 198901, '2024-11-25', 7000000),
    (3, 199012, '2024-11-25', 7000000),
    (4, 190123, '2024-11-25', 8000000),
    (5, 191234, '2024-11-25', 8000000),
    (6, 192345, '2024-11-25', 8000000),
    (7, 193456, '2024-11-25', 9000000),
    (8, 194567, '2024-11-25', 9000000),
    (9, 195678, '2024-11-25', 9000000),
    (10, 197809,'2024-11-25', 9000000);
SELECT * FROM tb_pembayaran_GajiDosen;

CREATE TABLE tb_Pembelian_Barang(
	id_Pembelian INT AUTO_INCREMENT PRIMARY KEY,
    tanggal_pembelian DATE NOT NULL,
    nama_barang VARCHAR(30) NOT NULL,
    jumlah INT(10) NOT NULL,
    Harga INT(30) NOT NULL
);
DESC tb_Pembelian_Barang;
INSERT INTO tb_Pembelian_Barang (tanggal_pembelian, nama_barang, jumlah, Harga) VALUES
	('2024-03-01', 'komputer', 10, 8000000),
	('2024-04-02', 'cpu', 10, 5000000),
	('2024-05-03', 'AC', 6, 3000000),
	('2024-06-04', 'Printer', 2, 2000000),
	('2024-07-05', 'kursi', 10, 1500000),
	('2024-08-06', 'Keyboard', 10, 500000),
	('2024-09-07', 'Mouse', 10, 200000),
	('2024-10-08', 'meja', 5, 1000000),
	('2024-11-09', 'monitor', 6, 700000),
	('2024-12-10', 'Webcam', 6, 600000);
SELECT * FROM tb_Pembelian_Barang;

CREATE TABLE tb_Pembayaran_Tagihan(
	id_pembayaran INT AUTO_INCREMENT PRIMARY KEY ,
    tanggal_pembayaran DATE NOT NULL,
    jenis_Tagihan VARCHAR(50) NOT NULL,
    jumlah_pembayaran INT(30) NOT NULL
);
DESC tb_Pembayaran_Tagihan;
INSERT INTO tb_Pembayaran_Tagihan (tanggal_pembayaran, jenis_Tagihan, jumlah_pembayaran) VALUES
	('2024-03-11', 'Listrik', 600000),
	('2024-04-12', 'Air', 400000),
	('2024-05-13', 'Telepon', 100000),
	('2024-06-14', 'Internet', 200000),
	('2024-07-15', 'TV Kabel', 250000),
	('2024-08-16', 'Wifi', 800000),
	('2024-09-17', 'Asuransi Kesehatan', 200000),
	('2024-10-18', 'Kegiatan Unit Mahasiswa', 3000000),
	('2024-11-19', 'Pendaftaran Seminar', 50000),
	('2024-12-20', 'Laboratorium', 150000);
SELECT * FROM tb_Pembayaran_Tagihan;

CREATE TABLE laporan_keuangan(
	id_laporan INT PRIMARY KEY AUTO_INCREMENT,
    pembayaran_ukt_id INT,
    gaji_dosen_id INT,
    pembelian_id INT,
    pembayaran_id INT,
    FOREIGN KEY (pembayaran_ukt_id) REFERENCES tb_Pembayaran_UKT(id_pembayaran_ukt),
    FOREIGN KEY (gaji_dosen_id) REFERENCES tb_pembayaran_GajiDosen(id_pembayaran_GajiDosen),
    FOREIGN KEY (pembelian_id) REFERENCES tb_Pembelian_Barang(id_Pembelian),
    FOREIGN KEY (pembayaran_id) REFERENCES tb_Pembayaran_Tagihan(id_pembayaran)
);
DESC laporan_keuangan;

ALTER TABLE tb_Pembelian_Barang ADD COLUMN id_pembayaran INT;
ALTER TABLE tb_Pembelian_Barang ADD constraint fk_pengembalian foreign key (id_pembayaran) references tb_Pembayaran_Tagihan(id_pembayaran);

INSERT INTO laporan_keuangan(pembayaran_ukt_id, gaji_dosen_id) VALUES
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
SELECT * FROM laporan_keuangan;