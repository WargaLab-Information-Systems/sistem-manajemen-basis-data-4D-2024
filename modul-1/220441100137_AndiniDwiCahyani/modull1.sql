CREATE DATABASE db_kampus;


USE db_kampus;

CREATE TABLE tb_mahasiswa(
	nim INT(12) NOT NULL PRIMARY KEY,
    nama_mhs VARCHAR(50) NOT NULL,
    pengambilan_matkul VARCHAR(50) NOT NULL,
     status ENUM('aktif', 'berhenti', 'lulus') NOT NULL
);
DESC tb_mahasiswa;

CREATE TABLE tb_dosen(
	nip INT(12) NOT NULL PRIMARY KEY,
    nama_dosen VARCHAR(50) NOT NULL,
    jenis_kelamin ENUM('laki - laki', 'perempuan'),
    fakultas VARCHAR(50) NOT NULL
);
DESC tb_dosen;

CREATE TABLE tb_TransaksiKeuangan (
    id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    tanggal_transaksi DATE NOT NULL,
    jenis_transaksi ENUM('Pembayaran_UKT', 'Pembayaran_Gaji_Dosen', 'Pembelian_Peralatan_Bahan_Ajar', 'Pembayaran_Tagihan') NOT NULL,
    keterangan VARCHAR(50) NOT NULL,
    jumlah INT  NOT NULL
);
DESC tb_TransaksiKeuangan;

CREATE TABLE tb_laporan(
	id_laporan INT PRIMARY KEY AUTO_INCREMENT,
    tanggal_laporan DATE NOT NULL,
    jumlah_mhs INT NOT NULL,
    jumlah_dosen INT NOT NULL
);
DESC tb_laporan;


CREATE TABLE tb_laporanKeuangan(
	id_laporanKeuangan INT PRIMARY KEY AUTO_INCREMENT,
    tanggal_laporan DATE NOT NULL,
    jenis_transaksi ENUM('Pembayaran_UKT', 'Pembayaran_Gaji_Dosen', 'Pembelian_Peralatan_Bahan_Ajar', 'Pembayaran_Tagihan') NOT NULL,
    pemasukan INT NOT NULL,
    pengeluaran INT NOT NULL
);
DESC tb_laporanKeuangan;

INSERT INTO tb_mahasiswa (nim, nama_mhs, pengambilan_matkul, status) VALUES
	(100137, 'Andini Dwi Cahyani', 'Pemrograman Dasar', 'aktif'),
	(100142, 'Nur Alifia Faryanti', 'Basis Data', 'aktif'),
	(100321, 'Shafira Zujhrufatus Zahra', 'Pemrograman Lanjut', 'berhenti'),
	(100456, 'Farra Athikasari', 'Algoritma dan Struktur Data', 'aktif'),
	(100789, 'Vivin Fiana', 'Sistem Operasi', 'aktif'),
	(100890, 'Nabila Putri Alaika', 'Jaringan Komputer', 'lulus'),
	(109012, 'Husnul Khotimah', 'Kecerdasan Buatan', 'aktif'),
	(100123, 'Hofifah', 'Manajemen Proyek', 'berhenti'),
	(100234, 'Noer Padhilah', 'Analisis Data', 'aktif'),
	(100345, 'Putri Syafina', 'Pengembangan Web', 'aktif');
SELECT * FROM tb_mahasiswa;

INSERT INTO tb_dosen (nip, nama_dosen, jenis_kelamin, fakultas) VALUES
	(567890, 'Wahyudi Setiawan', 'laki - laki', 'Fakultas Teknik'),
	(678901, 'Ersa Alami', 'perempuan', 'Fakultas Ilmu Pendidikan'),
	(789012, 'Sarkawi', 'laki - laki', 'Fakultas Keislaman'),
	(890123, 'Eza Rachmanita', 'perempuan', 'Fakultas Ekonomi dan Bisnis'),
	(901234, 'Yudha Dwi Putra Negara', 'laki - laki', 'Fakultas Hukum'),
	(012345, 'Sri Herawati', 'perempuan', 'Fakultas Kedokteran'),
	(123456, 'Achmad Zain Nur', 'laki - laki', ' Fakultas Teknik'),
	(234567, 'Budi Dwi Satoto', 'laki - laki', 'Fakultas Ilmu Sosial dan Budaya'),
	(345678, 'Bain Khusnul', 'perempuan', 'Fakultas Keislaman'),
	(456789, 'Ali Syakur', 'laki - laki', 'Fakultas Ekonomi dan Bisnis');
SELECT * FROM tb_dosen;

INSERT INTO tb_TransaksiKeuangan (tanggal_transaksi, jenis_transaksi, keterangan, jumlah) VALUES
	('2020-08-01', 'Pembayaran_UKT', 'Pembayaran UKT oleh mahasiswa atas Nama Andini', 5000000),
	('2021-02-02', 'Pembayaran_Gaji_Dosen', 'Pembayaran gaji bulan Februari', 10000000),
	('2022-03-03', 'Pembelian_Peralatan_Bahan_Ajar', 'Pembelian buku teks', 2000000),
	('2022-03-04', 'Pembayaran_Tagihan', 'Pembayaran listrik bulan Maret', 7500000),
	('2023-03-15', 'Pembayaran_UKT', 'Pembayaran UKT oleh mahasiswa atas nama Cahyani', 4500000),
	('2023-03-20', 'Pembayaran_Gaji_Dosen', 'Pembayaran gaji bulan Maret', 12000000),
	('2024-01-07', 'Pembelian_Peralatan_Bahan_Ajar', 'Pembelian perangkat presentasi', 3000000),
	('2024-03-08', 'Pembayaran_Tagihan', 'Pembayaran air bulan Maret', 8000000),
	('2024-04-09', 'Pembayaran_UKT', 'Pembayaran UKT oleh mahasiswa atas nama Dwi', 4800000),
	('2024-04-10', 'Pembayaran_Gaji_Dosen', 'Pembayaran gaji bulan April', 11000000);
SELECT * FROM tb_TransaksiKeuangan;

INSERT INTO tb_laporan (tanggal_laporan, jumlah_mhs, jumlah_dosen) VALUES
	('2015-08-09', 1500, 100),
	('2016-03-02', 1550, 105),
	('2017-07-27', 1600, 110),
	('2018-05-20', 1650, 115),
	('2019-06-10', 1700, 120),
	('2020-04-06', 1750, 125),
	('2021-09-07', 1800, 130),
	('2022-02-22', 1850, 135),
	('2023-01-01', 1900, 140),
	('2024-07-10', 1950, 145);
SELECT * FROM tb_laporan;

INSERT INTO tb_laporanKeuangan (tanggal_laporan, jenis_transaksi, pemasukan, pengeluaran) VALUES
	('2015-09-09', 'Pembayaran_UKT', 15000000, 8000000),
	('2016-02-02', 'Pembelian_Peralatan_Bahan_Ajar', 16000000, 8500000),
	('2017-10-27', 'Pembayaran_Gaji_Dosen', 17000000, 9000000),
	('2018-06-20', 'Pembayaran_Tagihan', 18000000, 9250000),
	('2019-09-10', 'Pembelian_Peralatan_Bahan_Ajar', 19000000, 9500000),
	('2020-04-06', 'Pembayaran_UKT', 20000000, 1000000),
	('2021-10-07', 'Pembayaran_Gaji_Dosen', 21000000, 1050000),
	('2022-12-22', 'Pembayaran_Tagihan', 22000000, 1750000),
	('2023-11-23', 'Pembelian_Peralatan_Bahan_Ajar', 23000000, 1850000),
	('2024-12-31', 'Pembayaran_Gaji_Dosen', 24000000, 1250000);
SELECT * FROM tb_laporanKeuangan;