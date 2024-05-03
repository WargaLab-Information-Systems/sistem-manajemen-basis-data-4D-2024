CREATE DATABASE db_campus;
USE db_campus;

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
DESC tb_mahasiswa;

CREATE TABLE tb_dosen(
	nip INT(20) NOT NULL PRIMARY KEY,
    nama_dosen VARCHAR(50) NOT NULL,
    fakultas VARCHAR(30) NOT NULL,  
    prodi VARCHAR(30) NOT NULL
);
DESC tb_dosen;

CREATE TABLE tb_keuangan (
    id_transaksi INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tanggal DATE NOT NULL,
    jenis_transaksi VARCHAR(50) NOT NULL,
    nama VARCHAR(50) NOT NULL,
    id_entitas VARCHAR(20) NOT NULL,
    deskripsi VARCHAR(100),
    jumlah DECIMAL(10,2) NOT NULL,
    metode_pembayaran VARCHAR(50) NOT NULL
);
DESC tb_keuangan;

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
(1010101, 'Budi Santoso', 'Teknik Informatika', 'Sistem Informasi', 'SI101', 'Pemrograman Dasar', 4, 1, 'aktif'),
(1010102, 'Anita Wijaya', 'Teknik Elektro', 'Elektronika', 'EL101', 'Dasar-dasar Elektronika', 3, 1, 'aktif'),
(1010103, 'Citra Sari', 'Ekonomi', 'Manajemen', 'MN101', 'Manajemen Keuangan', 3, 2, 'aktif'),
(1010104, 'Dewi Cahyani', 'Ilmu Komunikasi', 'Jurnalistik', 'JR101', 'Teori Jurnalistik', 3, 2, 'aktif'),
(1010105, 'Eko Prasetyo', 'Kedokteran', 'Kedokteran Umum', 'KD101', 'Anatomi dan Fisiologi', 5, 3, 'aktif'),
(1010106, 'Fajar Setiawan', 'Teknik Kimia', 'Teknik Lingkungan', 'TL101', 'Pengolahan Limbah Industri', 4, 4, 'aktif'),
(1010107, 'Gita Putri', 'Sastra Inggris', 'Sastra Inggris', 'SI102', 'Fonologi Bahasa Inggris', 3, 5, 'aktif'),
(1010108, 'Hendra Gunawan', 'Teknik Sipil', 'Teknik Sipil', 'TS101', 'Struktur Baja', 4, 6, 'aktif'),
(1010109, 'Ika Fitriani', 'Ilmu Hukum', 'Hukum Pidana', 'HP101', 'Prosedur Pemeriksaan Hukum', 3, 7, 'aktif'),
(1010110, 'Joko Susilo', 'Agribisnis', 'Agroteknologi', 'AG101', 'Pemuliaan Tanaman', 3, 8, 'aktif');
SELECT * FROM mahasiswa;


INSERT INTO tb_dosen (nip, nama_dosen, fakultas, prodi)
VALUES
(2000101, 'Dr. Iwan Setiawan', 'Teknik Informatika', 'Sistem Informasi'),
(2000102, 'Prof. Ani Cahaya', 'Teknik Elektro', 'Elektronika'),
(2000103, 'Dr. Bambang Susanto', 'Ekonomi', 'Manajemen'),
(2000104, 'Drs. Candra Wijaya', 'Ilmu Komunikasi', 'Jurnalistik'),
(2000105, 'Dr. Dewi Lestari', 'Kedokteran', 'Kedokteran Umum'),
(2000106, 'Dr. Eko Prabowo', 'Teknik Kimia', 'Teknik Lingkungan'),
(2000107, 'Dra. Gita Permata', 'Sastra Inggris', 'Sastra Inggris'),
(2000108, 'Prof. Hendra Wijaya', 'Teknik Sipil', 'Teknik Sipil'),
(2000109, 'Dr. Ika Dewi', 'Ilmu Hukum', 'Hukum Pidana'),
(2000110, 'Prof. Joko Santoso', 'Agribisnis', 'Agroteknologi');
SELECT * FROM tb_dosen;

INSERT INTO tb_keuangan (id_transaksi, tanggal, jenis_transaksi, nama, id_entitas, deskripsi, jumlah, metode_pembayaran)
VALUES
(1, '2024-03-01', 'Pembayaran UKT', 'Universitas ABC', '101', 'Pembayaran Uang Kuliah Tunggal', 5000000.00, 'Transfer Bank'),
(2, '2024-03-02', 'Pembayaran Gaji Dosen', 'Dr. Ani Cahaya', '201', 'Pembayaran gaji dosen bulan Maret', 10000000.00, 'Transfer Bank'),
(3, '2024-03-05', 'Pembelian', 'Toko Alat Laboratorium', '102', 'Pembelian peralatan laboratorium', 750000.00, 'Tunai'),
(4, '2024-03-08', 'Pembelian', 'Toko Buku ABC', '103', 'Pembelian buku ajar', 1200000.00, 'Transfer Bank'),
(5, '2024-03-10', 'Pembayaran Tagihan', 'PLN', '104', 'Pembayaran tagihan listrik bulan Maret', 500000.00, 'Transfer Bank'),
(6, '2024-03-15', 'Pembayaran Tagihan', 'PDAM', '105', 'Pembayaran tagihan air bulan Maret', 700000.00, 'Tunai'),
(7, '2024-03-20', 'Pembayaran UKT', 'Universitas ABC', '101', 'Pembayaran Uang Kuliah Tunggal', 5000000.00, 'Transfer Bank'),
(8, '2024-03-25', 'Pembayaran Gaji Dosen', 'Prof. Budi Santoso', '202', 'Pembayaran gaji dosen bulan Maret', 10000000.00, 'Transfer Bank'),
(9, '2024-03-28', 'Pembelian', 'Toko Alat Laboratorium', '102', 'Pembelian peralatan laboratorium', 800000.00, 'Tunai'),
(10, '2024-03-31', 'Pembelian', 'Toko Buku ABC', '103', 'Pembelian buku ajar', 1500000.00, 'Transfer Bank');
SELECT * FROM tb_keuangan;

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


 

