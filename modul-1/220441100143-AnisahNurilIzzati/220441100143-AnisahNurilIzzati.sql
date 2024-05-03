CREATE DATABASE db_utm;
SHOW DATABASES;
USE db_utm;

CREATE TABLE mahasiswa (
    NIM CHAR(12) NOT NULL PRIMARY KEY,  
    nama_mhs VARCHAR(100) NOT NULL, 
    angkatan YEAR NOT NULL, 
    program_studi VARCHAR(50) NOT NULL, 
    status_mhs VARCHAR(20) NOT NULL
);

CREATE TABLE dosen (
    NIP CHAR(12) NOT NULL PRIMARY KEY, 
    nama_dosen VARCHAR(100) NOT NULL, 
    program_studi VARCHAR(60) NOT NULL,
    jabatan VARCHAR(50) NOT NULL,
    bidang_keahlian VARCHAR(50) NOT NULL,
    status_dosen VARCHAR(50) NOT NULL
);
                    
CREATE TABLE matakuliah (
	id_matakuliah INT AUTO_INCREMENT PRIMARY KEY,
	matakuliah VARCHAR (30) NOT NULL,
    sks INT (11) NOT NULL,
    semester INT NOT NULL,
    prodi VARCHAR (20) NOT NULL
);
                        
CREATE TABLE krs (
    id_krs INT AUTO_INCREMENT PRIMARY KEY,
    id_matakuliah INT NOT NULL,
    NIM CHAR(12) NOT NULL,
    semester INT NOT NULL,
    tahun_ajar VARCHAR (50) NOT NULL,
    FOREIGN KEY (NIM) REFERENCES mahasiswa(NIM),
    FOREIGN KEY (id_matakuliah) REFERENCES matakuliah(id_matakuliah)
);

CREATE TABLE pembayaran_UKT (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    NIM CHAR(12) NOT NULL,
    semester INT NOT NULL,
    tahun_ajar VARCHAR (50) NOT NULL,
    tanggal_bayar DATE NOT NULL,
    jumlah_bayar INT NOT NULL,
    FOREIGN KEY (NIM) REFERENCES mahasiswa(NIM)
);

CREATE TABLE gaji_dosen (
    id_gaji INT AUTO_INCREMENT PRIMARY KEY,
    NIP CHAR(12) NOT NULL,
    tanggal_bayar DATE NOT NULL,
    total_gaji INT NOT NULL,
    FOREIGN KEY (NIP) REFERENCES dosen(NIP)
);
                            
CREATE TABLE pembelian_peralatan (
    id_pembelian INT AUTO_INCREMENT PRIMARY KEY,
    tanggal_beli DATE NOT NULL,
    nama_barang VARCHAR(100) NOT NULL,
    jumlah_beli INT NOT NULL,
    total_harga INT NOT NULL
);
                        
CREATE TABLE pembayaran_tagihan (
    id_tagihan INT AUTO_INCREMENT PRIMARY KEY,
    jenis_tagihan VARCHAR(100) NOT NULL,
    total_tagihan INT NOT NULL,
    tanggal_bayar DATE NOT NULL
);

CREATE TABLE laporan_mahasiswa (
	id_laporanMhs INT AUTO_INCREMENT PRIMARY KEY,
    NIM CHAR(12) NOT NULL,
    FOREIGN KEY (NIM) REFERENCES mahasiswa(NIM)
);

CREATE TABLE laporan_dosen (
	id_laporanDosen INT AUTO_INCREMENT PRIMARY KEY,
    NIP CHAR(12) NOT NULL,
    FOREIGN KEY (NIP) REFERENCES dosen(NIP)
);

CREATE TABLE laporan_keuangan (
	id_laporanKeuangan INT AUTO_INCREMENT PRIMARY KEY,
    id_pembayaran INT NOT NULL,
    id_gaji INT NOT NULL,
    id_pembelian INT NOT NULL,
    id_tagihan INT NOT NULL,
    FOREIGN KEY (id_pembayaran) REFERENCES pembayaran_UKT(id_pembayaran),
    FOREIGN KEY (id_gaji) REFERENCES gaji_dosen(id_gaji),
    FOREIGN KEY (id_pembelian) REFERENCES pembelian_peralatan(id_pembelian),
    FOREIGN KEY (id_tagihan) REFERENCES pembayaran_tagihan(id_tagihan)
);
                        
INSERT INTO mahasiswa (NIM, nama_mhs, program_studi, angkatan, status_mhs) VALUES 
('220441100143', 'Anisah Nuril Izzati', 'Sistem Informasi', 2022, 'Aktif'),					
('220441100144', 'Hasnah Insita Sahla', 'Sistem Informasi', 2022, 'Aktif'),
('220441100105', 'Anisyafaah', 'Sistem Informasi', '2022', 'Aktif'),
('220441100106', 'Adhelia Kusumawati', 'Sistem Informasi', 2022, 'Aktif'),
('220441100073', 'Nadia Aprilia Puspita Sari', 'Sistem Informasi', 2022, 'Aktif'),
('220441100083', 'Herdiyanti Fifin Purwaningrum', 'Teknik Informatika', 2022, 'Aktif'),
('220441100133', 'Firdausi Putri Cahyani', 'Teknik Informatika', 2022, 'Berhenti Kuliah'),
('230441100118', 'Rosalia Dewi Larasati', 'Teknik Mesin', 2023, 'Berhenti Kuliah'),
('230441100132', 'Tri Ayu Ningtyas', 'Teknik Mesin', 2023, 'Berhenti Kuliah'),
('230441100140', 'Nur Alipia', 'Teknik Industri', 2023, 'Berhenti Kuliah');


INSERT INTO dosen (NIP, nama_dosen, program_studi, jabatan, bidang_keahlian, status_dosen) VALUES 
('19001', 'Sigit Susanto Putro, S.Kom., M.Kom', 'S1 Teknik Informatika', 'Lektor', 'Sistem Pakar', 'Aktif'),					
('19002', 'Abdullah Basuki Rahmat, S.Si, M.T', 'S1 Teknik Informatika', 'Asisten Ahli', 'Kecerdasan Buatan', 'Aktif'),
('19003', 'Achmad Jauhari, S.T., M.Kom', 'S1 Teknik Informatika', 'Lektor', 'Optimasi', 'Aktif'),
('19004', 'Aeri Rachmad, S.T., M.T.', 'S1 Teknik Informatika', 'Lektor Kepala', 'Komputasi', 'Aktif'),
('19005', 'Bain Khusnul Khotimah, S.T., M.Kom.', 'S1 Teknik Informatika', 'Lektor', 'Data Mining', 'Aktif'),
('19006', 'Firli Irhamni, ST., M.Kom.', 'S1 Sistem Informasi', 'Lektor', 'Rekayasa Perangkat Lunak', 'Aktif'),
('19007', 'Wahyudi Agustiono, S.Kom., M.Sc.,Ph.D', 'S1 Sistem Informasi', 'Lektor Kepala', 'Sistem Informasi', 'Aktif'),
('19008', 'Fitri Damayanti, S.Kom, M.Kom', 'S1 Sistem Informasi', 'Lektor Kepala', 'Komputasi Cerdas', 'Aktif'),
('19009', 'Sri Herawati, S.Kom, M.Kom', 'S1 Sistem Informasi', 'Lektor', 'Business Intelligent', 'Aktif'),
('19010', 'Achmad Yasid, S.Kom., M.Kom.', 'S1 Sistem INFORMATIKA', 'Lektor', 'Sistem Informasi', 'Aktif');


INSERT INTO matakuliah (matakuliah, sks, semester, prodi) VALUES
('Analisa Proses Bisnis', 3, 2, 'Sistem Informasi'),
('Pemrograman Berbasis Web', 4, 2, 'Teknik Informatika'),
('Sistem Pendukung Keputusan', 3, 2, 'Sistem Informasi'),
('Pemrograman Bergerak', 3, 2, 'Sistem Informasi'),
('Sistem Manajemen Basis Data', 3, 2, 'Teknik Informatika'),
('Kewarganegaraan', 3, 2, 'Hukum'),
('Ekonomi', 3, 2, 'Manajemen'),
('Metodologi Penelitian', 3, 2, 'Sistem Informasi'),
('Pemrograman Basis Objek', 3, 2, 'Sistem Informasi'),
('Data Mining', 3, 2, 'Sistem Informasi');


INSERT INTO krs (id_matakuliah, NIM, semester, tahun_ajar) VALUES
(1, '220441100143', 2, '2021/2022 Ganjil'),
(2, '220441100144', 2, '2021/2022 Ganjil'),
(3, '220441100105', 2, '2021/2022 Ganjil'),
(4, '220441100106', 4, '2021/2022 Genap'),
(5, '220441100073', 4, '2021/2022 Genap'),
(6, '220441100083', 4, '2022/2023 Ganjil'),
(7, '220441100133', 4, '2022/2023 Ganjil'),
(8, '230441100118', 6, '2022/2023 Genap'),
(9, '230441100132', 6, '2022/2023 Genap'),
(10, '230441100140', 6, '2022/2023 Genap');

INSERT INTO pembayaran_ukt(nim, semester, tahun_ajar, tanggal_bayar, jumlah_bayar) VALUES
('220441100143', 2, '2021/2022 Ganjil', '240413', 3000000),					
('220441100144', 2, '2021/2022 Ganjil', '240415', 3000000),
('220441100105', 2, '2021/2022 Genap', '240416', 3000000),
('220441100106', 4, '2021/2022 Genap', '240417', 2500000),
('220441100073', 4, '2021/2022 Genap', '240418', 2500000),
('220441100083', 4, '2022/2023 Ganjil', '240418', 2000000),
('220441100133', 4, '2022/2023 Ganjil', '240419', 2000000),
('230441100118', 6, '2022/2023 Genap', '240419', 3000000),
('230441100132', 6, '2022/2023 Genap', '240420', 3000000),
('230441100140', 6, '2022/2023 Genap', '240420', 3000000);

INSERT INTO pembelian_peralatan (tanggal_beli, nama_barang, jumlah_beli, total_harga) VALUES
('210113', 'komputer', 80, 50000000),
('210115', 'laptop', 80, 55000000),
('210215', 'proyektor', 10, 30000000),
('220216', 'meja', 60, 4000000),
('220416', 'kursi', 60, 3500000),
('230518', 'papan tulis', 10, 500000),
('230523', 'AC', 15, 45000000),
('230622', 'lampu', 50, 4000000),
('240225', 'buku materi', 70, 5000000),
('240225', 'lemari', 10, 10000000);

INSERT INTO gaji_dosen (nip, tanggal_bayar, total_gaji) VALUES
('19001', '230315', 3500000),
('19002', '230315', 3500000),
('19003', '230315', 3500000),
('19004', '230315', 3500000),
('19005', '230315', 3500000),
('19006', '240315', 4500000),
('19007', '240315', 4500000),
('19008', '240315', 4500000),
('19009', '240315', 4500000),
('19010', '240315', 4500000);

INSERT INTO pembayaran_tagihan (jenis_tagihan, total_tagihan, tanggal_bayar) VALUES
('Pembayaran Listrik', 10000000, '230922'),
('Pembayaran Air', 20000000, '230922'),
('Pembayaran Internet', 23000000, '231022'),
('Pembayaran Asuransi', 1000000, '231021'),
('Pembayaran Internet', 10000000, '231112'),
('Pembayaran Sewa Lahan', 2000000, '231113'),
('Kebersihan', 4000000, '231214'),
('Iuran', 1500000, '231224'),
('Telepon', 1000000, '240212'),
('Pembayaran Pemeliharaan', 10000000, '240215');


INSERT INTO laporan_mahasiswa (NIM) VALUES
('220441100143'),					
('220441100144'),
('220441100105'),
('220441100106'),
('220441100073'),
('220441100083'),
('220441100133'),
('230441100118'),
('230441100132'),
('230441100140');

INSERT INTO laporan_dosen (NIP) VALUES
('19001'),				
('19002'),
('19003'),
('19004'),
('19005'),
('19006'),
('19007'),
('19008'),
('19009'),
('19010');

INSERT INTO laporan_keuangan (id_pembayaran, id_gaji, id_pembelian, id_tagihan) VALUES 
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5),
(6, 6, 6, 6),
(7, 7, 7, 7),
(8, 8, 8, 8),
(9, 9, 9, 9),
(10, 10, 10, 10);
