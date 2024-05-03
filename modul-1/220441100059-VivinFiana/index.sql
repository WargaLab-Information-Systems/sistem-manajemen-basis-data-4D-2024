CREATE DATABASE db_praktikum1;
USE db_praktikum1;

CREATE TABLE tb_mahasiswa(
	nim INT(20) NOT NULL PRIMARY KEY,
    nama_mhs VARCHAR(50) NOT NULL,
    prodi VARCHAR(50) NOT NULL,
    fakultas VARCHAR(50) NOT NULL,
    status ENUM('aktif', 'berhenti', 'lulus') NOT NULL
);
DESC tb_mahasiswa;

CREATE TABLE tb_dosen(
	nip INT(20) NOT NULL PRIMARY KEY,
    nama_dosen VARCHAR(50) NOT NULL,
    jurusan VARCHAR(30) NOT NULL,  
    prodi VARCHAR(30) NOT NULL,
    jabatan VARCHAR(30) NOT NULL 
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

SHOW TABLES;
INSERT INTO tb_mahasiswa VALUES(22001101, 'Jaka', 'Teknik', 'Teknik Elektro', 'aktif');
INSERT INTO tb_mahasiswa VALUES(22001102, 'Tika', 'Keislaman', 'Ekonomi Syariah', 'aktif');
INSERT INTO tb_mahasiswa VALUES(22001103, 'Caca', 'Teknik', 'Teknik Industri', 'lulus');
INSERT INTO tb_mahasiswa VALUES(22001104, 'Jono', 'Pertanian', 'Agribisni', 'aktif');
INSERT INTO tb_mahasiswa VALUES(22001105, 'Jihan', 'Pertanian', 'Agribisnis', 'aktif');
INSERT INTO tb_mahasiswa VALUES(22001106, 'Cakra', 'Pendidikan', 'Pendidikan Sekolah Dasar', 'lulus');
INSERT INTO tb_mahasiswa VALUES(22001107, 'Tara', 'Teknik', 'Teknik Elektro', 'aktif');
INSERT INTO tb_mahasiswa VALUES(22001108, 'Imam', 'Teknik', 'Teknik Industri', 'aktif');
INSERT INTO tb_mahasiswa VALUES(22001109, 'Nana', 'Teknik', 'Sistem Informasi', 'lulus');
INSERT INTO tb_mahasiswa VALUES(22001110, 'Saiful', 'Teknik', 'Teknik Industri', 'aktif');
SELECT * FROM tb_mahasiswa;

INSERT INTO tb_dosen VALUES(11033011, 'Maman Sudrajat', 'Teknik', 'Teknik Elektro', 'dosen');
INSERT INTO tb_dosen VALUES(11033012, 'Pujiati', 'Keislaman', 'TEkonomi Syariah', 'dosen');
INSERT INTO tb_dosen VALUES(11033013, 'Budiono', 'Teknik', 'Teknik Industri', 'dosen');
INSERT INTO tb_dosen VALUES(11033014, 'Bambang Sucipto', 'Teknik', 'Teknik Industri', 'dosen');
INSERT INTO tb_dosen VALUES(11033015, 'Puji Astuti', 'Pertanian', 'Agribisnis', 'dosen');
INSERT INTO tb_dosen VALUES(11033016, 'Kumala Sari', 'Teknik', 'Teknik Elektro', 'dosen');
INSERT INTO tb_dosen VALUES(11033017, 'Titi Putriani', 'Teknik', 'Teknik Elektro', 'dosen');
INSERT INTO tb_dosen VALUES(11033018, 'Ahmad Rifki', 'Teknik', 'Sistem Informasi', 'dosen');
INSERT INTO tb_dosen VALUES(11033019, 'Ahmad Rozikin', 'Teknik', 'Teknik Industri', 'dosen');
INSERT INTO tb_dosen VALUES(110330110, 'Acha Salsabila', 'Pendidikan', 'Pendidikan Sekolah Dasar', 'dosen');
SELECT * FROM tb_dosen;

INSERT INTO tb_matkul VALUES('001', 'MPIT', 3);
INSERT INTO tb_matkul VALUES('002', 'Fisika Dasar', 3);
INSERT INTO tb_matkul VALUES('003', 'Mekanika Teknik', 2);
INSERT INTO tb_matkul VALUES('004', 'Kalkulus', 3);
INSERT INTO tb_matkul VALUES('005', 'Matematika SD', 3);
INSERT INTO tb_matkul VALUES('006', 'Bahasa Inggris', 2);
INSERT INTO tb_matkul VALUES('007', 'Rangkaian Listrik', 3);
INSERT INTO tb_matkul VALUES('008', 'Matematika', 3);
INSERT INTO tb_matkul VALUES('009', 'Bisnis Internasional', 2);
INSERT INTO tb_matkul VALUES('010', 'Ekonomi Moneter', 2);
SELECT * FROM tb_matkul;

INSERT INTO tb_krs VALUES(111, 22001101, '006', '2');
INSERT INTO tb_krs VALUES(112, 22001102, '010', '4');
INSERT INTO tb_krs VALUES(113, 22001103, '002', '2');
INSERT INTO tb_krs VALUES(114, 22001104, '009', '4');
INSERT INTO tb_krs VALUES(115, 22001105, '008', '3');
INSERT INTO tb_krs VALUES(116, 22001106, '005', '2');
INSERT INTO tb_krs VALUES(117, 22001107, '007', '3');
INSERT INTO tb_krs VALUES(118, 22001108, '003', '4');
INSERT INTO tb_krs VALUES(119, 22001109, '001', '4');
INSERT INTO tb_krs VALUES(110, 22001110, '004', '3');
SELECT * FROM tb_krs;

INSERT INTO tb_pembayaran_UKT VALUES(101, 22001101, '2024-01-01', 3000000);
INSERT INTO tb_pembayaran_UKT VALUES(102, 22001102, '2024-01-02', 2500000);
INSERT INTO tb_pembayaran_UKT VALUES(103, 22001103, '2024-01-03', 3000000);
INSERT INTO tb_pembayaran_UKT VALUES(104, 22001104, '2024-01-04', 500000);
INSERT INTO tb_pembayaran_UKT VALUES(105, 22001105, '2024-01-05', 1000000);
INSERT INTO tb_pembayaran_UKT VALUES(106, 22001106, '2024-01-06', 2500000);
INSERT INTO tb_pembayaran_UKT VALUES(107, 22001107, '2024-01-07', 2000000);
INSERT INTO tb_pembayaran_UKT VALUES(108, 2200118, '2024-01-08', 3000000);
INSERT INTO tb_pembayaran_UKT VALUES(109, 22001109, '2024-01-09', 2500000);
INSERT INTO tb_pembayaran_UKT VALUES(1010, 22001110, '2024-01-10', 500000);
SELECT * FROM tb_pembayaran_UKT;

INSERT INTO tb_pembayaran_GajiDosen VALUES(401, 11033011, '2024-02-10', 10000000);
INSERT INTO tb_pembayaran_GajiDosen VALUES(402, 11033012, '2024-02-10', 7000000);
INSERT INTO tb_pembayaran_GajiDosen VALUES(403, 11033013, '2024-02-10', 7000000);
INSERT INTO tb_pembayaran_GajiDosen VALUES(404, 11033014, '2024-02-10', 9000000);
INSERT INTO tb_pembayaran_GajiDosen VALUES(405, 11033015, '2024-02-10', 9000000);
INSERT INTO tb_pembayaran_GajiDosen VALUES(406, 11033016, '2024-02-10', 8000000);
INSERT INTO tb_pembayaran_GajiDosen VALUES(407, 11033017, '2024-02-10', 7000000);
INSERT INTO tb_pembayaran_GajiDosen VALUES(408, 11033018, '2024-02-10', 8000000);
INSERT INTO tb_pembayaran_GajiDosen VALUES(409, 11033019, '2024-02-10', 8000000);
INSERT INTO tb_pembayaran_GajiDosen VALUES(410, 110330110, '2024-02-10', 9000000);
SELECT * FROM tb_pembayaran_GajiDosen;

INSERT INTO tb_Pembelian_Barang VALUES(01, '2024-03-01', 'meja', 5, 1000000);
INSERT INTO tb_Pembelian_Barang VALUES(02, '2024-03-01', 'kursi', 5, 1000000);
INSERT INTO tb_Pembelian_Barang VALUES(03, '2024-03-01', 'komputer', 1, 7000000);
INSERT INTO tb_Pembelian_Barang VALUES(04, '2024-03-01', 'AC', 2, 5000000);
INSERT INTO tb_Pembelian_Barang VALUES(05, '2024-03-01', 'lampu', 10, 500000);
INSERT INTO tb_Pembelian_Barang VALUES(06, '2024-03-01', 'kipas angin', 3, 900000);
INSERT INTO tb_Pembelian_Barang VALUES(07, '2024-03-01', 'proyektor', 2, 9000000);
INSERT INTO tb_Pembelian_Barang VALUES(08, '2024-03-01', 'spidol', 5, 100000);
INSERT INTO tb_Pembelian_Barang VALUES(09, '2024-03-01', 'penghapus', 5, 100000);
INSERT INTO tb_Pembelian_Barang VALUES(011, '2024-03-01', 'sapu', 10, 100000);
SELECT * FROM tb_Pembelian_Barang;

INSERT INTO tb_Pembayaran_Tagihan VALUES(201, '2023-01-01', 'tagihan listrik', 500000);
INSERT INTO tb_Pembayaran_Tagihan VALUES(202, '2023-02-01', 'tagihan air', 500000);
INSERT INTO tb_Pembayaran_Tagihan VALUES(203, '2023-03-01', 'biaya keamanan', 5000000);
INSERT INTO tb_Pembayaran_Tagihan VALUES(204, '2023-04-01', 'biaya perawatan', 3000000);
INSERT INTO tb_Pembayaran_Tagihan VALUES(205, '2023-05-01', 'biaya kebersihan', 1000000);
INSERT INTO tb_Pembayaran_Tagihan VALUES(206, '2023-06-01', 'biaya pengawasan', 1000000);
INSERT INTO tb_Pembayaran_Tagihan VALUES(207, '2023-07-01', 'biaya fasilitas', 4000000);
INSERT INTO tb_Pembayaran_Tagihan VALUES(208, '2023-08-01', 'biaya administrasi', 1000000);
INSERT INTO tb_Pembayaran_Tagihan VALUES(209, '2023-09-01', 'biaya pengelolaan limbah', 500000);
INSERT INTO tb_Pembayaran_Tagihan VALUES(210, '2023-10-01', 'tagihan asuransi', 2000000);
SELECT * FROM tb_Pembayaran_Tagihan;

INSERT INTO laporan_keuangan VALUES(1, 101, 401, 01, 201);
INSERT INTO laporan_keuangan VALUES(2, 102, 02, 402, 202);
INSERT INTO laporan_keuangan (pembayaran_ukt_id,gaji_dosen_id,pembelian_id,pembayaran_id) VALUES(101, 401, 01, 201);
SELECT*FROM laporan_keuangan;

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