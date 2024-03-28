CREATE DATABASE db_kuliah;
USE db_kuliah;

CREATE TABLE mahasiswa(
	nim INT(20) NOT NULL PRIMARY KEY,
    nama_mhs VARCHAR(50) NOT NULL,
    fakultas VARCHAR(50) NOT NULL,
    prodi VARCHAR(50) NOT NULL,
    kode_matkul CHAR(20) NOT NULL,
    nama_matkul VARCHAR(30) NOT NULL,
    sks INT(10) NOT NULL,
    semester INT(10) NOT NULL,
    status ENUM('aktif', 'berhenti', 'lulus') NOT NULL
);
DESC mahasiswa;

CREATE TABLE dosen(
	nip INT(20) NOT NULL PRIMARY KEY,
    nama_dosen VARCHAR(50) NOT NULL,
    fakultas VARCHAR(30) NOT NULL,  
    prodi VARCHAR(30) NOT NULL
);
DESC dosen;

CREATE TABLE keuangan (
    id_transaksi INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE NOT NULL,
    jenis_transaksi VARCHAR(50) NOT NULL,
    nama VARCHAR(50) NOT NULL,
    id_entitas VARCHAR(20) NOT NULL,
    deskripsi VARCHAR(100),
    jumlah DECIMAL(10,2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL
);
DESC keuangan;

CREATE TABLE tb_laporan_mahasiswa_dosen (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    prodi VARCHAR(50) NOT NULL,
    fakultas VARCHAR(50) NOT NULL,
    jumlah_dosen INT NOT NULL,
    jumlah_mahasiswa INT NOT NULL
);

DESC tb_laporan_mahasiswa_dosen;

CREATE TABLE tb_laporan_keuangan (
    id_transaksi INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE NOT NULL,
    jenis_transaksi VARCHAR(50) NOT NULL,
    deskripsi VARCHAR(100),
    jumlah DECIMAL(10,2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL
);
DESC tb_laporan_keuangan;

INSERT INTO mahasiswa (nim, nama_mhs, fakultas, prodi, kode_matkul, nama_matkul, sks, semester, status)
VALUES
(22109, 'Nuha', 'Teknik', 'Sistem Informasi', 'SI101', 'Pemrograman Dasar', 4, 1, 'berhenti'),
(22146, 'Sukma', 'Teknik ', 'Elektronika', 'EL101', 'Dasar-dasar Elektronika', 3, 1, 'berhenti'),
(22077, 'Yani', 'Ekonomi', 'Manajemen', 'MN101', 'Manajemen Keuangan', 3, 2, 'aktif'),
(22089, 'Dewi', 'Ilmu Komunikasi', 'Jurnalistik', 'JR101', 'Teori Jurnalistik', 3, 2, 'aktif'),
(22345, 'Andi', 'Kedokteran', 'Kedokteran Umum', 'KD101', 'Anatomi dan Fisiologi', 5, 3, 'aktif'),
(11099, 'Ahmad ', 'Teknik Kimia', 'Teknik Lingkungan', 'TL101', 'Pengolahan Limbah Industri', 4, 4, 'aktif'),
(20099, 'Raffi', 'Sastra Inggris', 'Sastra Inggris', 'SI102', 'Fonologi Bahasa Inggris', 3, 5, 'berhenti'),
(20911, 'Fera', 'Teknik Sipil', 'Teknik Sipil', 'TS101', 'Struktur Baja', 4, 6, 'aktif'),
(12345, 'Riris', 'Hukum', 'Hukum Pidana', 'HP101', 'Prosedur Pemeriksaan Hukum', 3, 7, 'berhenti'),
(23909, 'Joko ', 'Agribisnis', 'Agroteknologi', 'AG101', 'Pemuliaan Tanaman', 3, 8, 'aktif');
SELECT * FROM mahasiswa;


INSERT INTO dosen (nip, nama_dosen, fakultas, prodi)
VALUES
(19087, 'Bu Fitri', 'Teknik Informatika', 'Sistem Informasi'),
(18900, 'Pak Syarif', 'Teknik Elektro', 'Elektronika'),
(10988, 'Pak Budi', 'Ekonomi', 'Manajemen'),
(19011, 'Bu Novi', 'Ilmu Komunikasi', 'Jurnalistik'),
(18999, 'Pak Firli', 'Kedokteran', 'Kedokteran Umum'),
(19000, 'Pak Jokowi', 'Teknik Kimia', 'Teknik Lingkungan'),
(12909, 'Pak Husni', 'Sastra Inggris', 'Sastra Inggris'),
(19877, 'Bu Rosa', 'Teknik Sipil', 'Teknik Sipil'),
(19111, 'Bu Tika', 'Ilmu Hukum', 'Hukum Pidana'),
(12222, 'Pak Joko', 'Agribisnis', 'Agroteknologi');
SELECT * FROM dosen;

INSERT INTO keuangan (id_transaksi, tanggal, jenis_transaksi, nama, id_entitas, deskripsi, jumlah, metode_pembayaran)
VALUES
(1, '2024-03-01', 'Pembayaran UKT', 'Universitas Trunojoyo Madura', '101', 'Pembayaran Uang Kuliah Tunggal', 5000000.00, 'Transfer Bank'),
(2, '2024-03-02', 'Pembayaran Gaji Dosen', 'Pak Syarif', '18900', 'Pembayaran gaji dosen bulan Maret', 10000000.00, 'Transfer Bank'),
(3, '2024-03-03', 'Pembayaran UKT', 'Ahmad', '22098', 'Pembayaran uang kuliah tunggal', 3000000.00, 'Transfer Bank'),
(4, '2024-03-04', 'Pembayaran Gaji Dosen', 'Pak Budi', '10988', 'Pembayaran gaji dosen bulan Februari', 50000000.00, 'Transfer Bank'),
(5, '2024-03-05', 'Pembayaran Gaji Dosen', 'Bu Novi', '19011', 'Pembayaran gaji dosen bulan Maret', 60000000.00, 'Transfer Bank'),
(6, '2024-03-06', 'Pembayaran Gaji Dosen', 'Bu Fitri', '19811', 'Pembayaran gaji dosen bulan Maret', 80000000.00, 'Transfer Bank'),
(7, '2024-03-07', 'Pembayaran Gaji Dosen', 'Pak Jokowi', '19000', 'Pembayaran gaji dosen bulan Maret', 90000000.00, 'Transfer Bank'),
(8, '2024-03-08', 'Pembayaran Gaji Dosen', 'Sukma', '22297', 'Pembayaran uang kuliah tunggal', 20000000.00, 'Transfer Bank'),
(9, '2024-03-09', 'Pembayaran Gaji Dosen', 'Pak Husni', '12909', 'Pembayaran gaji dosen bulan Maret', 70000000.00, 'Transfer Bank'),
(10,'2024-03-10', 'Pembayaran Gaji Dosen', 'Bu Rosa', '19877', 'Pembayaran gaji dosen bulan Maret', 30000000.00, 'Transfer Bank');
select * from keuangan;

delete from keuangan where id_transaksi=10;

INSERT INTO tb_laporan_mahasiswa_dosen (id, prodi, fakultas, jumlah_dosen, jumlah_mahasiswa)
VALUES
(1, 'Teknik Informatika', 'Fisib', 15, 120),
(2, 'Ilmu Komputer', 'Fisib', 20, 150),
(3, 'Teknik Elektro', 'Fisib', 18, 130),
(4, 'Sistem Informasi', 'Fisib', 25, 180),
(5, 'Teknik Mesin', 'Fisib', 22, 160),
(6, 'Matematika', 'Sains', 10, 80),
(7, 'Fisika', 'Sains', 12, 100),
(8, 'Kimia', 'Sains', 15, 110),
(9, 'Biologi', 'Sains', 18, 130),
(10, 'Teknik Kimia', 'Sains', 20, 150);

SELECT * FROM tb_laporan_mahasiswa_dosen;

INSERT INTO tb_laporan_keuangan (id_transaksi, tanggal, jenis_transaksi, deskripsi, jumlah, metode_pembayaran)
VALUES
(1, '2024-03-01', 'Pengeluaran', 'Pembayaran SPP', 5000000.00, 'Transfer Bank'),
(2, '2024-03-05', 'Pengeluaran', 'Pembayaran Pajak Bangunan', 10000000.00, 'Tunai'),
(3, '2024-03-10', 'Pengeluaran', 'Perawatan dan pemeliharaan bangunan kampus', 750000.00, 'Transfer Bank'),
(4, '2024-03-15', 'Pengeluaran', 'Biaya Operasional Lab dan Riset', 1200000.00, 'Tunai'),
(5, '2024-03-20', 'Pengeluaran', 'Pembayaran SPP', 5000000.00, 'Transfer Bank'),
(6, '2024-03-25', 'Pengeluaran', 'Pembayaran Pajak Bangunan', 10000000.00, 'Transfer Bank'),
(7, '2024-03-28', 'Pengeluaran', 'Pembiayaan proyek riset dan pengembangan', 250000.00, 'Tunai'),
(8, '2024-03-30', 'Pengeluaran', 'Pembayaran Sewa Laboratorium', 800000.00, 'Transfer Bank'),
(9, '2024-03-31', 'Pengeluaran', 'Pembayaran SPP', 5000000.00, 'Tunai'),
(10, '2024-03-31', 'Pengeluaran', 'Pembayaran Pajak Bangunan', 10000000.00, 'Transfer Bank');

SELECT * FROM tb_laporan_keuangan;
