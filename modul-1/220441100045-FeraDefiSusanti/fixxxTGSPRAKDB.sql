CREATE DATABASE db_tgsprakdb1;
-- Tabel Administrasi
CREATE TABLE administrasi_mahasiswa (
    NPM INT PRIMARY KEY, nama_mahasiswa VARCHAR(100) NOT NULL,
    alamat_mahasiswa VARCHAR(255)NOT NULL, jenis_kelamin VARCHAR(20)NOT NULL,
	fakultas VARCHAR(255)NOT NULL, prodi VARCHAR(255)NOT NULL,
	status_kuliah ENUM('Berhenti', 'Lulus') NOT NULL);
DESC administrasi_mahasiswa;

CREATE TABLE administrasi_dosen (
    NIP INT PRIMARY KEY, nama_dosen VARCHAR(100)NOT NULL,
    alamat_dosen VARCHAR(255)NOT NULL,
	bidang_keahlian VARCHAR(100)NOT NULL, tahun_masuk YEAR NOT NULL,
    status_dosen ENUM('Aktif', 'Non Aktif') NOT NULL);
DESC administrasi_dosen;

CREATE TABLE administrasi_mata_kuliah (
    id_matkul INT PRIMARY KEY, 
    NPM INT NOT NULL, NIP INT NOT NULL, 
    nama_matkul VARCHAR(255) NOT NULL,
    jumlah_sks INT NOT NULL,
    semester VARCHAR(20) NOT NULL, 
    tahun_ajaran VARCHAR(20) NOT NULL, 
    FOREIGN KEY (NPM) REFERENCES administrasi_mahasiswa(NPM),
    FOREIGN KEY (NIP) REFERENCES administrasi_dosen(NIP)
);
DESC administrasi_mata_kuliah;
-- Tabel Keuangan
CREATE TABLE keuangan (
    id_transaksi INT PRIMARY KEY, 
    NPM INT,
    jenis_transaksi VARCHAR(100) NOT NULL, 
    tanggal_transaksi DATE NOT NULL, 
    jumlah_transaksi INT NOT NULL, 
    id_laporan INT, 
    FOREIGN KEY (id_laporan) REFERENCES laporan(id_laporan),
	FOREIGN KEY (NPM) REFERENCES administrasi_mahasiswa(NPM)
);
DESC keuangan;

DROP TABLE keuangan;
-- Tabel Laporan
CREATE TABLE laporan (
    id_laporan INT PRIMARY KEY, 
    jenis_laporan ENUM('Laporan Daftar Mahasiswa', 'Laporan Daftar Dosen','Laporan Keuangan') NOT NULL,
	NPM INT NOT NULL, NIP INT NOT NULL, 
    tanggal_laporan DATE NOT NULL, detail_laporan TEXT NOT NULL
);
DESC laporan;
SHOW TABLES;

INSERT INTO administrasi_mahasiswa (NPM, nama_mahasiswa, alamat_mahasiswa, jenis_kelamin, fakultas, prodi, status_kuliah)
VALUES
(1734567, 'Siti Nurhaliza', 'Jakarta', 'Perempuan', 'Fakultas Ilmu Sosial dan Ilmu Politik', 'Ilmu Komunikasi', 'lulus'),
(2345678, 'Ahmad Malik', 'Bandung', 'Laki-laki', 'Fakultas Teknik', 'Teknik Informatika', 'berhenti'),
(1956789, 'Dewi Lestari', 'Surabaya', 'Perempuan', 'Fakultas Kesehatan', 'Psikologi', 'lulus'),
(1567890, 'Rizki Maulana', 'Semarang', 'Laki-laki', 'Fakultas Ekonomi dan Bisnis', 'Manajemen', 'lulus'),
(2278901, 'Putri Anggraini', 'Yogyakarta', 'Perempuan', 'Fakultas Hukum', 'Ilmu Hukum', 'berhenti'),
(1889012, 'Agus Santoso', 'Medan', 'Laki-laki', 'Fakultas Teknik', 'Teknik Industri', 'lulus'),
(2090123, 'Dian Septiani', 'Denpasar', 'Perempuan', 'Fakultas Pertanian', 'Agribisnis', 'lulus'),
(2101234, 'Budi Prasetyo', 'Palembang', 'Laki-laki', 'Fakultas Keislaman', 'Hukum Ekonomi Syariah ', 'lulus'),
(1812345, 'Anisa Fitriani', 'Makassar', 'Perempuan', 'Fakultas Pendidikan', 'Biologi', 'berhenti'),
(1634568, 'Ahmad Taufik', 'Surakarta', 'Laki-laki', 'Fakultas Ekonomi dan Bisnis', 'Akutansi', 'berhenti');
SELECT * FROM administrasi_mahasiswa ; 

INSERT INTO administrasi_dosen (NIP, nama_dosen, alamat_dosen, bidang_keahlian, tahun_masuk, status_dosen)
VALUES
(1234567, 'Dewi Rahayu', 'Jakarta', 'Dasar-dasar Ilmu Komunikasi', 2010, 'Aktif'),
(2345678, 'Agus Setiawan', 'Bandung', 'Rekayasa Perangkat Lunak', 2005, 'Aktif'),
(3456789, 'Nina Wulandari', 'Surabaya', 'Psikologi Perkembangan', 2018, 'Aktif'),
(4567890, 'Budi Santoso', 'Semarang', 'Manajemen Sumber Daya Manusia', 2008, 'Non Aktif'),
(5678901, 'Rina Novitasari', 'Yogyakarta', 'Hukum Perdata', 2015, 'Non Aktif'),
(6789012, 'Ahmad Fauzi', 'Medan','Analisis Finansial', 2013, 'Aktif'),
(7890123, 'Siti Nurlaila', 'Denpasar','Pemasaran Hasil Pertanian', 2011, 'Aktif'),
(8901234, 'Dewi Susanti', 'Palembang','Perkembangan Hukum Ekonomi Syariah', 2012, 'Non Aktif'),
(9012345, 'Indra Wijaya', 'Makassar', 'Biologi Dasar', 2009, 'Non Aktif'),
(1234568, 'Rizki Permadi', 'Surakarta', 'Akutansi Sektor Publik', 2016, 'Aktif');
SELECT * FROM administrasi_dosen ; 

INSERT INTO administrasi_mata_kuliah (id_matkul, NPM, NIP, nama_matkul, jumlah_sks, semester, tahun_ajaran)
VALUES
(1, 1734567, 1234567, 'Dasar-dasar Ilmu Komunikasi', 3, 'Ganjil', '2022/2023'),
(2, 2345678, 2345678, 'Rekayasa Perangkat Lunak', 4, 'Genap', '2023/2024'),
(3, 1956789, 3456789, 'Psikologi Perkembangan', 3, 'Ganjil', '2022/2023'),
(4, 1567890, 4567890, 'Manajemen Sumber Daya Manusia', 3, 'Genap', '2023/2024'),
(5, 2278901, 5678901, 'Hukum Perdata', 3, 'Ganjil', '2023/2024'),
(6, 1889012, 6789012, 'Analisis Finansial', 4, 'Genap', '2023/2024'),
(7, 2090123, 7890123, 'Pemasaran Hasil Pertanian', 3, 'Ganjil', '2022/2023'),
(8, 2101234, 8901234, 'Perkembangan Hukum Ekonomi Syariah', 3, 'Genap', '2023/2024'),
(9, 1812345, 9012345, 'Biologi Dasar', 3, 'Ganjil', '2023/2024'),
(10, 1634568, 1234568, 'Akutansi Sektor Publik', 4, 'Genap', '2021/2022');
SELECT * FROM administrasi_mata_kuliah ; 

INSERT INTO keuangan (id_transaksi, jenis_transaksi, tanggal_transaksi, jumlah_transaksi) VALUES 
(1, 'Pembayaran UKT', '2024-03-20', 5000000),
(2, 'Pembayaran Gaji Dosen', '2024-03-25', 8000000),
(3, 'Pembelian Peralatan dan Bahan Ajar', '2024-03-22', 15000000),
(4, 'Pembayaran Listrik', '2024-03-24', 10000000),
(5, 'Pembelian Bahan Ajar', '2024-03-26', 2000000),
(6, 'Pembayaran Tagihan Air', '2024-03-28', 5000000),
(7, 'Pembayaran Sewa Gedung', '2024-03-30', 25000000),
(8, 'Pembelian Buku', '2024-04-02', 3000000),
(9, 'Pembayaran Tagihan Telepon', '2024-04-05', 7000000),
(10, 'Pembelian Perlengkapan Kantor', '2024-04-08', 4000000);
SELECT * FROM keuangan ; 

INSERT INTO laporan (id_laporan, jenis_laporan, tanggal_laporan, detail_laporan) VALUES 
(1, 'Laporan Daftar Mahasiswa', '2024-03-24', 'Total Mahasiswa Aktif: 5800, Total Mahasiswa Lulus: 5200'),
(2, 'Laporan Daftar Dosen', '2024-03-24', 'Total Dosen Aktif: 950'),
(3, 'Laporan Daftar Mahasiswa', '2024-03-25', 'Total Mahasiswa Aktif: 6800, Total Mahasiswa Lulus: 6210'),
(4, 'Laporan Daftar Dosen', '2024-03-25', 'Total Dosen Aktif: 800'),
(5, 'Laporan Keuangan', '2024-03-25', 'Total Pengeluaran: 450000000, Total Pemasukan: 700000000'),
(6, 'Laporan Daftar Mahasiswa', '2024-03-26', 'Total Mahasiswa Aktif: 8000, Total Mahasiswa Lulus: 7820'),
(7, 'Laporan Daftar Dosen', '2024-03-26', 'Total Dosen Aktif: 792'),
(8, 'Laporan Keuangan', '2024-03-26', 'Total Pengeluaran: 260000000, Total Pemasukan: 310000000'),
(9, 'Laporan Daftar Mahasiswa', '2024-03-27', 'Total Mahasiswa Aktif: 9385, Total Mahasiswa Lulus: 8525'),
(10, 'Laporan Daftar Dosen', '2024-03-27', 'Total Dosen Aktif: 953');
SELECT * FROM laporan ; 

-- rename colom
ALTER TABLE administrasi_dosen CHANGE COLUMN STATUS status_dosen  ENUM('Aktif', 'Non Aktif') NOT NULL;
-- update data
UPDATE administrasi_dosen SET nama_dosen='Rizki Permadi', bidang_keahlian='Akutansi Sektor Publik' WHERE NIP=1234568;
-- menghapus tabel 
DROP TABLE laporan;
