create database db_praktikum;
use db_praktikum;
CREATE TABLE mhs_dosen (
    ID_mhsdosen INT PRIMARY KEY,
    nama VARCHAR(25),
    thn_masuk date,
    status varchar(25),
    jurusan varchar(25)
); 

ALTER TABLE mhs_dosen
ALTER COLUMN nama SET DEFAULT 0;
ALTER TABLE mhs_dosen
ALTER COLUMN thn_masuk SET DEFAULT "2021-01-01"; 
ALTER TABLE mhs_dosen
ALTER COLUMN status SET DEFAULT 0;
ALTER TABLE mhs_dosen
ALTER COLUMN jurusan SET DEFAULT 0;
desc mhs_dosen;

CREATE TABLE Matakuliah (
    ID_matakuliah INT PRIMARY KEY,
    nama_matakuliah VARCHAR(30),
    SKS INT
);

CREATE TABLE PengambilanMatakuliah (
    ID_pengambilan INT PRIMARY KEY,
    ID_mhsdosen INT,
    ID_matakuliah INT,
    semester VARCHAR(20),
    tahun_ajaran VARCHAR(10),
    FOREIGN KEY (ID_mhsdosen) REFERENCES mhs_dosen(ID_mhsdosen),
    FOREIGN KEY (ID_matakuliah) REFERENCES mhs_dosen(ID_matakuliah)
    
);
ALTER TABLE PengambilanMatakuliah  CHANGE COLUMN ID_nama ID_mhsdosen int;
CREATE TABLE TransaksiUKT (
    ID_transaksi INT PRIMARY KEY,
    ID_mhsdosen INT,
    Tgl_pembayaran DATE,
    Jml_pembayaran DECIMAL(10, 2),
    FOREIGN KEY (ID_mhsdosen) REFERENCES mhs_dosen(ID_mhsdosen)
);
ALTER TABLE mhs_dosen CHANGE COLUMN ID_nama ID_mhsdosen int;

CREATE TABLE pembayaran_gaji (
	id_Gaji INT PRIMARY KEY,
	no_induk CHAR (12),
	tgl_gaji DATE ,
	gaji_Pokok INT,
	tunjangan INT, 
	total_Gaji INT 
);

CREATE TABLE PembelianPeralatan (
    ID_pembelian INT PRIMARY KEY,
    barang_peralatan VARCHAR(255),
    jumlah INT,
    tgl_pembelian DATE
);
CREATE TABLE PembayaranTagihan (
    ID_pembayaran INT PRIMARY KEY,
    jenis_tagihan VARCHAR(255),
    tgl_pembayaran DATE,
    jml_pembayaran DECIMAL(10, 2)
);


INSERT INTO Mahasiswa (ID_nama, nama, thn_masuk, status, jurusan, no_induk)
VALUES
(2201, 'Nouha', '2022-01-15', 'dosen', 'Sistem Informasi', '111'),
(2202, 'Sukma', '2022-01-20', 'mahasiswa', 'Sistem Informasi','222'),
(2203, 'Tya', '2022-01-25', 'dosen', 'Sistem Informasi', '333'),
(2204, 'Vivin', '2021-09-10', 'mahasiswa', 'Sistem Informasi', '444'),
(2205, 'Ismi', '2021-09-15', 'dosen', 'Sistem Informasi', '555'),
(2206, 'Silvi', '2021-09-20', 'dosen', 'Sistem Informasi', '666'),
(2207, 'Septi', '2021-06-30', 'dosen', 'Hukum', '777'),
(2208, 'Caca', '2023-02-05', 'dosen', 'Manajemen', '888'),
(2209, 'Yulia', '2021-06-15', 'mahasiswa', 'Ekonomi Syariah', '999'),
(2210, 'Rani', '2023-01-20', 'mahasiswa', 'Pendidikan', '100');


INSERT INTO Matakuliah (ID_matakuliah, nama_matakuliah, SKS)
VALUES
(3001, 'statistika', 3),
(3002, 'pember', 4),
(3003, 'data mining', 4),
(3004, 'Bahasa Inggris', 2),
(3005, 'Pemrograman Dasar', 3),
(3006, 'Basis Data', 3),
(3007, 'Struktur Data', 3),
(3008, 'Algoritma dan Pemrograman', 4),
(3009, 'Kalkulus', 4),
(3010, 'Sistem Operasi', 3);

INSERT INTO PengambilanMatakuliah (ID_pengambilan, ID_nama, ID_matakuliah, semester, tahun_ajaran)
VALUES
(2001, 2201, 3001, 'Ganjil', '2022/2023'),
(2002, 2202, 3002, 'Ganjil', '2022/2023'),
(2003, 2203, 3003, 'Ganjil', '2022/2023'),
(2004, 2204, 3001, 'Ganjil', '2022/2023'),
(2005, 2205, 3004, 'Ganjil', '2022/2023'),
(2006, 2206, 3001, 'Ganjil', '2022/2023'),
(2007, 2207, 3005, 'Ganjil', '2022/2023'),
(2008, 2208, 3006, 'Ganjil', '2022/2023'),
(2009, 2209, 3007, 'Ganjil', '2022/2023'),
(2010, 2210, 3008, 'Ganjil', '2022/2023');

INSERT INTO TransaksiUKT (ID_transaksi, ID_nama, Tgl_pembayaran, Jml_pembayaran)
VALUES
(4001, 2201, '2023-01-10', 1500000.00),
(4002, 2202, '2023-01-12', 1500000.00),
(4003, 2203, '2023-01-15', 1500000.00),
(4004, 2204, '2023-01-20', 1500000.00),
(4005, 2205, '2023-01-22', 1500000.00),
(4006, 2206, '2023-01-25', 1500000.00),
(4007, 2207, '2023-01-28', 1500000.00),
(4008, 2208, '2023-01-30', 1500000.00),
(4009, 2209, '2023-02-01', 1500000.00),
(4010, 2210, '2023-02-05', 1500000.00);

INSERT INTO pembayaran_gaji (id_gaji,no_induk, tgl_gaji, gaji_pokok, tunjangan, total_Gaji)  
VALUES   
(1, '123456789012', '2024-02-25', 3000000, 1000000, 4000000), 
(2, '123456789013', '2024-02-25', 3500000, 1500000, 5000000), 
(3, '123456789014', '2024-02-25', 3000000, 1000000, 4000000), 
(4, '123456789015', '2024-02-25', 3500000, 1500000, 5000000), 
(5, '123456789016', '2024-02-25', 3500000, 1500000, 5000000), 
(6, '123456789017', '2024-02-25', 3500000, 1500000, 5000000), 
(7, '123456789018', '2024-02-25', 3000000, 1000000, 4000000), 
(8, '123456789019', '2024-02-25', 3000000, 1000000, 4000000), 
(9, '123456789020', '2024-02-25', 3000000, 1000000, 4000000), 
(10, '123456789021', '2024-02-25', 3500000, 1500000, 5000000);

INSERT INTO PembelianPeralatan (ID_pembelian, barang_peralatan, jumlah, tgl_pembelian)
VALUES
(6001, 'Laptop', 5, '2023-01-10'),
(6002, 'Proyektor', 3, '2023-01-15'),
(6003, 'Meja', 10, '2023-01-20'),
(6004, 'Kursi', 15, '2023-01-25'),
(6005, 'Whiteboard', 2, '2023-01-30'),
(6006, 'Printer', 4, '2023-02-05'),
(6007, 'Scanner', 2, '2023-02-10'),
(6008, 'Speaker', 6, '2023-02-15'),
(6009, 'Monitor', 8, '2023-02-20'),
(6010, 'Microphone', 3, '2023-02-25');

INSERT INTO PembayaranTagihan (ID_pembayaran, jenis_tagihan, tgl_pembayaran, jml_pembayaran)
VALUES
(7001, 'Listrik', '2023-01-05', 2000000.00),
(7002, 'Air', '2023-01-10', 1500000.00),
(7003, 'Internet', '2023-01-15', 1000000.00),
(7004, 'Sewa Gedung', '2023-01-20', 5000000.00),
(7005, 'Keamanan', '2023-01-25', 3000000.00),
(7006, 'Cleaning Service', '2023-01-30', 2000000.00),
(7007, 'Telepon', '2023-02-05', 1200000.00),
(7008, 'Parkir', '2023-02-10', 800000.00),
(7009, 'Pajak', '2023-02-15', 2500000.00),
(7010, 'Asuransi', '2023-02-20', 1800000.00);

select * from mhs_dosen;
select * from Matakuliah;
select * from PengambilanMatakuliah;
select * FROM TransaksiUKT ;

show tables;
desc mhs_dosen;
DELETE FROM Mahasiswa WHERE ID_nama = 220999;
DELETE FROM pembayaran_gaji WHERE ID_Gaji = 0;
drop table mahasiswa;
desc pengambilanmatakuliah;
ALTER TABLE mahasiswa RENAME TO mhs_dosen;
















