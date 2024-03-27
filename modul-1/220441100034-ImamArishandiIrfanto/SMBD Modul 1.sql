CREATE DATABASE db_university;
DROP DATABASE db_university;
use db_university;

CREATE TABLE tb_mahasiswa (
	nim INT NOT NULL PRIMARY KEY,
    nama_mahasiswa VARCHAR (50) NOT NULL,
    prodi VARCHAR (20) NOT NULL,
    tanggal_masuk DATE NOT NULL
    );

INSERT INTO tb_mahasiswa (nim, nama_mahasiswa, prodi, tanggal_masuk)
VALUES 
(220410001, 'Angga Jalasena Saputra', 'Sistem Informasi', '2024-03-10'),
(220410108, 'Della Ayu Vernandah', 'Sistem Informasi', '2024-03-25'),
(220410082, 'Amelia Zalfa Sahira', 'Sistem Informasi', '2024-03-17'),
(220410034, 'Imam Arishandi Irfanto', 'Sistem Informasi', '2024-03-09'),
(220410154, 'Dwi Nurjannah', 'Sistem Informasi', '2024-03-02'),
(220410079, 'Viko Alfian P', 'Sistem Informasi', '2024-03-14'),
(220410022, 'Tesa Putri Hutagaol', 'Sistem Informasi', '2024-03-29'),
(220410014, 'Bintang Wahyu Ariyono', 'Sistem Informasi', '2024-03-22'),
(220410085, 'Khoirotun Nisak', 'Sistem Informasi', '2024-03-15'),
(220410119, 'Romauli Napitupulu', 'Sistem Informasi', '2024-03-24'),
(220410159, 'M. Irfan Faruq Zain', 'Sistem Informasi', '2024-03-27'),
(220410009, 'Naela Nahdiah', 'Sistem Informasi', '2024-03-16'),
(220410107, 'Oxa Indi Vixzio', 'Sistem Informasi', '2024-03-19');
    
CREATE TABLE tb_dosen (
	nip INT NOT NULL PRIMARY KEY,
    nama_dosen VARCHAR (50) NOT NULL,
	bidang_keahlian VARCHAR (20) NOT NULL,
    kode_matakuliah VARCHAR (10) NOT NULL,
    FOREIGN KEY (kode_matakuliah) REFERENCES tb_matakuliah(kode_mata_kuliah)
    );
    
ALTER TABLE tb_dosen ADD COLUMN kode_mata_kuliah VARCHAR (10);
ALTER TABLE tb_dosen
ADD CONSTRAINT kode_mata_kuliah FOREIGN KEY (kode_mata_kuliah) REFERENCES tb_matakuliah(kode_mata_kuliah); 

INSERT INTO tb_dosen (nip, nama_dosen, bidang_keahlian, kode_matakuliah)
VALUES 
(101, 'Budi Satoto', 'Sistem Informasi','SPK'),
(102, 'Yeni', 'Sistem Informasi', 'DM'),
(103, 'Fitri', 'Sistem Informasi', 'PEMBER'),
(104, 'Zain', 'Sistem Informasi', 'SMBD'),
(105, 'Hera', 'Sistem Informasi', 'PSDP'),
(106, 'Novi', 'Sistem Informasi', 'MPIT'),
(107, 'Budi Susilo', 'Sistem Informasi', 'IPPL'),
(108, 'Rika', 'Sistem Informasi', 'SPK'),
(109, 'Doni', 'Sistem Informasi', 'PEMBER'),
(110, 'Syarif', 'Sistem Informasi', 'MPIT');


CREATE TABLE tb_status_mahasiswa (
	id INT NOT NULL Primary Key,
	nim INT NOT NULL,
	status_mahasiswa ENUM('Aktif', 'Berhenti', 'Lulus') NOT NULL,
	tanggal DATE NOT NULL,
    FOREIGN KEY (nim) REFERENCES tb_mahasiswa(nim)
    );
    
INSERT INTO tb_status_mahasiswa (id,nim,status_mahasiswa,tanggal)
VALUES
(1,220410001,'Aktif','2024-03-27'),
(2,220410108,'Aktif','2024-03-27'),
(3,220410082,'Aktif','2024-03-27'),
(4,220410034,'Lulus','2024-03-27'),
(5,220410154,'Aktif','2024-03-27'),
(6,220410079,'Berhenti','2024-03-27'),
(7,220410022,'Aktif','2024-03-27'),
(8,220410014,'Aktif','2024-03-27'),
(9,220410085,'Aktif','2024-03-27'),
(10,220410119,'Aktif','2024-03-27'),
(11,220410159,'Aktif','2024-03-27'),
(12,220410009,'Aktif','2024-03-27'),
(13,220410107,'Aktif','2024-03-27');
    
CREATE TABLE tb_matakuliah (
	kode_mata_kuliah VARCHAR (10) NOT NULL PRIMARY KEY,
	nama_matakuliah VARCHAR (50) NOT NULL,
	sks_matakuliah INT NOT NULL
    );


INSERT INTO tb_matakuliah (kode_mata_kuliah, nama_matakuliah, sks_matakuliah) VALUES
('SPK','Sistem Pendukung Keputusan',3),
('DM','Data Mining',3),
('PEMBER','Pemrograman Bergerak',4),
('SMBD','Sistem Manajemen Basis Data',4),
('PSDP','Perencanaan Sumber Daya Perusahaan',2),
('MPIT','Manajemen Proyek IT',3),
('IPPL','Implementasi Dan Pengujuan Perangkat Lunak',3);

    
CREATE TABLE tb_pengambilan_matakuliah (
	id INT NOT NULL PRIMARY KEY,
	nim INT NOT NULL,
	kode_mata_kuliah VARCHAR (10) NOT NULL,
	tahun_ajaran VARCHAR (10) NOT NULL,
	semester INT (5) NOT NULL,
    FOREIGN KEY (nim) REFERENCES tb_mahasiswa(nim),
    FOREIGN KEY (kode_mata_kuliah) REFERENCES tb_matakuliah(kode_mata_kuliah)
    );
    
INSERT INTO tb_pengambilan_matakuliah (id,nim,kode_mata_kuliah,tahun_ajaran,semester)
VALUE
(1,220410001,'SPK','2024/2025',4),
(2,220410001,'MPIT','2024/2025',4),
(3,220410001,'IPPL','2024/2025',4),
(4,220410034,'PSDP','2024/2025',4),
(5,220410034,'SMBD','2024/2025',4),
(6,220410034,'PEMBER','2024/2025',4),
(7,220410034,'SPK','2024/2025',4),
(8,220410022,'SPK','2024/2025',4),
(9,220410022,'PEMBER','2024/2025',4),
(10,220410022,'MPIT','2024/2025',4),
(11,220410159,'SMBD','2024/2025',4),
(12,220410159,'SPK','2024/2025',4),
(13,220410159,'IPPL','2024/2025',4),
(14,220410014,'SMBD','2024/2025',4),
(15,220410014,'PEMBER','2024/2025',4),
(16,220410014,'IPPL','2024/2025',4),
(17,220410014,'SPK','2024/2025',4);
    
CREATE TABLE tb_Pembayaran_ukt (
	id int NOT NULL PRIMARY KEY,
	nim INT NOT NULL,
	jumlah_pembayaran INT NOT NULL,
	tanggal_pembayaran DATE NOT NULL,
    FOREIGN KEY (nim) REFERENCES tb_mahasiswa(nim)
    );
    
INSERT INTO tb_pembayaran_ukt (id,nim,tanggal_pembayaran, jumlah_pembayaran)
VALUES 
(1,'220410001', '2024-03-25', 5000000),
(2,'220410108', '2024-03-24', 4500000),
(3,'220410082', '2024-03-23', 4800000),
(4,'220410034', '2024-03-22', 5200000),
(5,'220410154', '2024-03-21', 4700000),
(6,'220410079', '2024-03-20', 4900000),
(7,'220410022', '2024-03-19', 5100000),
(8,'220410014', '2024-03-18', 4600000),
(9,'220410085', '2024-03-17', 5300000),
(10,'220410119', '2024-03-16', 4800000),
(11,'220410159', '2024-03-16', 3500000),
(12,'220410009', '2024-03-16', 5000000),
(13,'220410107', '2024-03-16', 4500000);
    
CREATE TABLE tb_pembayaran_gaji_dosen (
	id int NOT NULL PRIMARY KEY,
	nip INT NOT NULL,
	jumlah_pembayaran INT NOT NULL,
	tanggal_pembayaran DATE NOT NULL,
    FOREIGN KEY (nip) REFERENCES tb_dosen(nip)
    );

INSERT INTO tb_pembayaran_gaji_dosen (id, nip, tanggal_pembayaran, jumlah_pembayaran)
VALUES 
(1, 101, '2024-03-25', 10000000),
(2, 102, '2024-03-24', 9500000),
(3, 103, '2024-03-23', 9800000),
(4, 104, '2024-03-22', 10500000),
(5, 105, '2024-03-17', 10300000),
(6, 106, '2024-03-21', 9700000),
(7, 107, '2024-03-20', 9900000),
(8, 108, '2024-03-19', 10100000),
(9, 109, '2024-03-18', 9600000),
(0, 110, '2024-03-16', 9800000);

CREATE TABLE tb_pembelian_peralatan (
	id INT NOT NULL PRIMARY KEY,
	deskripsi VARCHAR (20) NOT NULL,
	jumlah INT NOT NULL,
	tanggal_pembelian DATE NOT NULL,
    total INT NOT NULL
    );
    
INSERT INTO tb_pembelian_peralatan (id, deskripsi, tanggal_pembelian, jumlah, total)
VALUES 
('123', 'Proyektor' ,'2024-03-25', 5, 250000),
('124', 'Layar Proyektor' ,'2024-03-24', 3, 180000),
('125', 'Laptop','2024-03-23', 2, 120000),
('126', 'PC','2024-03-22', 4, 240000),
('127', 'Kipas Angin','2024-03-21', 6, 300000),
('128', 'AC','2024-03-20', 7, 350000),
('129', 'Karpet','2024-03-19', 1, 600000),
('130', 'Kursi' ,'2024-03-18', 8, 400000),
('131', 'ATK','2024-03-17', 3, 180000),
('132', 'Sapu','2024-03-16', 5, 250000);

CREATE TABLE tb_pembayaran_tagihan_rutin (
	id INT NOT NULL PRIMARY KEY,
	deskripsi_tagihan VARCHAR (50) NOT NULL,
	jumlah_pembayaran INT NOT NULL,
	tanggal_pembayaran DATE NOT NULL
    );
    
INSERT INTO tb_pembayaran_tagihan_rutin (id, deskripsi_tagihan, jumlah_pembayaran, tanggal_pembayaran)
VALUES 
(001, 'Tagihan Listrik', 500000, '2024-02-25'),
(002, 'Tagihan Air', 450000, '2024-02-25'),
(003, 'Tagihan Internet', 480000, '2024-02-25'),
(004, 'Tagihan Telepon', 520000, '2024-02-25'),
(005, 'Tagihan TV Kabel', 470000, '2024-02-25'),
(006, 'Tagihan Asuransi', 490000, '2024-02-25'),
(007, 'Tagihan Pajak', 510000, '2024-02-25'),
(008, 'Tagihan Pemeliharaan', 460000, '2024-02-25'),
(009, 'Tagihan Parkir', 530000, '2024-02-25'),
(010, 'Tagihan Keanggotaan', 480000, '2024-02-25');

CREATE TABLE tb_transaksi_keuangan (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    pembayaran_ukt_id INT,
    pembayaran_gaji_dosen_id INT,
    pembayaran_pembelian_id INT,
    pembayaran_tagihan_rutin_id INT,
    FOREIGN KEY (pembayaran_ukt_id) REFERENCES tb_pembayaran_ukt(id),
    FOREIGN KEY (pembayaran_gaji_dosen_id) REFERENCES tb_pembayaran_gaji_dosen(id),
    FOREIGN KEY (pembayaran_pembelian_id) REFERENCES tb_pembelian_peralatan(id),
    FOREIGN KEY (pembayaran_tagihan_rutin_id) REFERENCES tb_pembayaran_tagihan_rutin(id)
    );
    
INSERT INTO tb_transaksi_keuangan(pembayaran_ukt_id,pembayaran_gaji_dosen_id,pembayaran_pembelian_id,pembayaran_tagihan_rutin_id)
VALUES
(1,1,123,001),
(2,2,124,002),
(3,3,125,003),
(4,4,126,004),
(5,5,127,005),
(6,6,128,006),
(7,7,129,007),
(8,8,130,008),
(9,9,131,009),
(10,0,132,010);

select count(*) AS Jumlah_Mahasiswa
    from tb_mahasiswa;
select count(*) AS Jumlah_Dosen
    from tb_dosen;   
select * FROM tb_transaksi_keuangan;
select * from tb_mahasiswa;
select * from tb_dosen;
select * from tb_pengambilan_matakuliah;
select * from tb_Pembayaran_ukt;
select * from tb_pembayaran_gaji_dosen;
select * from tb_pembelian_peralatan;
select * from tb_pembayaran_tagihan_rutin;


