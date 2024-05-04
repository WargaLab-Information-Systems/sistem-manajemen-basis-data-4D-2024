create database db_utm;
use db_utm;
CREATE TABLE tb_mahasiswa (
    nim INT(20) PRIMARY KEY,
    nama VARCHAR(40),
    thn_masuk INT(10),
    status enum('aktif', 'tidak aktif')
);

CREATE TABLE tb_dosen(
    nip INT PRIMARY KEY,
    nama_dosen VARCHAR(40),
    tgl_masuk_kerja DATE);

CREATE TABLE matkul (
    ID_matakul INT PRIMARY KEY,
    Nama_matkul VARCHAR(30),
    SKS INT);

CREATE TABLE ambilmatkul (
    ID_Pengambilan INT PRIMARY KEY,
    nim INT,
    ID_matakul INT,
    Semester VARCHAR(20),
    Tahun_Ajaran VARCHAR(10),
    FOREIGN KEY (nim) REFERENCES tb_mahasiswa(nim),
    FOREIGN KEY (ID_matakul) REFERENCES matkul(ID_matakul)
);

CREATE TABLE TransaksiUKT (
    ID_Transaksi INT PRIMARY KEY,
    nim INT,
    Tanggal_Pembayaran DATE,
    Jumlah_Pembayaran DECIMAL(10, 2),
    FOREIGN KEY (nim) REFERENCES tb_mahasiswa(nim)
);

CREATE TABLE BayarGaji (
    ID_Pembayaran INT PRIMARY KEY,
    nip INT,
    Tanggal_Pembayaran DATE,
    Jumlah_Pembayaran DECIMAL(10, 2),
    FOREIGN KEY (nip) REFERENCES tb_dosen(nip)
);

CREATE TABLE BeliAlat (
    ID_Pembelian INT PRIMARY KEY,
    Barang_Peralatan VARCHAR(255),
    Jumlah INT,
    Tanggal_Pembelian DATE
);

CREATE TABLE BayarTagihan (
    ID_Pembayaran INT PRIMARY KEY,
    Jenis_Tagihan VARCHAR(30),
    Tanggal_Pembayaran DATE,
    Jumlah_Pembayaran DECIMAL(10, 2)
);

CREATE TABLE pengeluaran (
    ID INT PRIMARY KEY,
    Jenis VARCHAR(30),
    Jumlah INT,
    Tanggal DATE
);



INSERT INTO tb_mahasiswa (nim, nama, tahun_masuk, status, jurusan) VALUES
(1001, 'Sukma Ayu', 2022, 'aktif', 'Sistem Informasi'),
(1002, 'Nur Hidayah', 2022, 'tidak aktif', 'Teknik Mesin'),
(1003, 'Siti Nouha', 2023, 'aktif', 'Psikologi'),
(1004, 'Nur Hidayah', 2022, 'tidak aktif', 'Manajemen'),
(1005, 'Septya', 2022, 'aktif', 'Psikologi'),
(1006, 'Nur Hidayah', 2022, 'tidak aktif', 'Manajemen'),
(1007, 'Siti Nouha', 2023, 'aktif', 'Teknik Elektro'),
(1008, 'Nur Hidayah', 2022, 'tidak aktif', 'Teknik Informatika'),
(1009, 'Hevi', 2022, 'tidak aktif', 'Agroteknologi'),
(1010, 'Melati', 2023, 'aktif', 'Agribisnis');

INSERT INTO tb_dosen (nip, nama_dosen, tgl_masuk_kerja) VALUES
(10001, 'Ahmad Budi', '2020-01-15'),
(10002, 'Budi Santoso', '2019-08-23'),
(10003, 'Syarief', '2021-03-10'),
(10004, 'Herawati', '2018-11-05'),
(10005, 'Yudha', '2020-06-17'),
(10006, 'Fajar Setiawan', '2017-09-28'),
(10007, 'Wahyudi', '2019-12-11'),
(10008, 'Novi', '2020-04-02'),
(10009, 'Fitri Damayanti', '2018-10-19'),
(10010, 'Joko Santoso', '2021-01-08');

INSERT INTO matkul (ID_matakul, Nama_matkul, SKS) VALUES
(1, 'Pemrograman Dasar', 3),
(2, 'Basis Data', 4),
(3, 'Algoritma dan Struktur Data', 4),
(4, 'Pemrograman Web', 3),
(5, 'Jaringan Komputer', 3),
(6, 'Sistem Operasi', 4),
(7, 'Kecerdasan Buatan', 4),
(8, 'Pengembangan Aplikasi Mobile', 3),
(9, 'Keamanan Komputer', 4),
(10, 'Rekayasa Perangkat Lunak', 4);

INSERT INTO ambilmatkul (ID_Pengambilan, nim, ID_matakul, Semester, Tahun_Ajaran) VALUES
(1, 1001, 1, 'Ganjil', '2022/2023'),
(2, 1002, 2, 'Ganjil', '2022/2023'),
(3, 1003, 3, 'Ganjil', '2022/2023'),
(4, 1004, 1, 'Ganjil', '2022/2023'),
(5, 1005, 2, 'Ganjil', '2022/2023'),
(6, 1006, 3, 'Ganjil', '2022/2023'),
(7, 1007, 1, 'Ganjil', '2022/2023'),
(8, 1008, 2, 'Ganjil', '2022/2023'),
(9, 1009, 3, 'Ganjil', '2022/2023'),
(10, 1010, 1, 'Ganjil', '2022/2023');

INSERT INTO TransaksiUKT (ID_Transaksi, nim, Tanggal_Pembayaran, Jumlah_Pembayaran) VALUES
(1, 1001, '2024-03-01', 1500.00),
(2, 1002, '2024-03-05', 1200.00),
(3, 1003, '2024-03-10', 1800.00),
(4, 1004, '2024-03-15', 1300.00),
(5, 1005, '2024-03-20', 1700.00),
(6, 1006, '2024-03-25', 1600.00),
(7, 1007, '2024-03-28', 1900.00),
(8, 1008, '2024-03-30', 1400.00),
(9, 1009, '2024-04-02', 2000.00),
(10, 1010, '2024-04-05', 2100.00);

INSERT INTO BayarGaji (ID_Pembayaran, nip, Tanggal_Pembayaran, Jumlah_Pembayaran) VALUES
(1, 10001, '2024-03-01', 5000.00),
(2, 10002, '2024-03-05', 6000.00),
(3, 10003, '2024-03-10', 5500.00),
(4, 10004, '2024-03-15', 5200.00),
(5, 10005, '2024-03-20', 4800.00),
(6, 10006, '2024-03-25', 5300.00),
(7, 10007, '2024-03-28', 5800.00),
(8, 10008, '2024-03-30', 5100.00),
(9, 10009, '2024-04-02', 5400.00),
(10, 10010, '2024-04-05', 5900.00);



INSERT INTO pengeluaran (ID, Jenis, Jumlah, Tanggal,status)
VALUES
    (1, 'Laptop', '5000000', '2024-03-01', 'Beli Alat'),
    (2, 'Printer', '4000000', '2024-03-05', 'Beli Alat '),
    (3, 'Proyektor', '5000000', '2024-03-10', 'Beli Alat' ),
    (4, 'Scanner', '5000000', '2022-03-15', 'Beli Alat'),
    (5, 'Monitor', '5000000', '2020-03-20', 'Beli Alat'),
    
    (11, 'Listrik', 1500000, '2024-03-01', 'Bayar Tagihan'),
    (12, 'air', 200000, '2024-03-05', 'Bayar Tagihan'),
    (13, 'kistrik', 120000, '2024-03-10', 'Bayar Tagihan'),
    (14, 'air', 180000, '2024-03-15', 'Bayar Tagihan'),
    (15, 'air', 250000, '2024-03-20', 'Bayar Tagihan');
    
    
    


select*from Pengeluaran;
show tables;
drop table bayartagihan;
desc pengeluaran;

ALTER TABLE pengeluaran MODIFY COLUMN ID INT DEFAULT 0;
ALTER TABLE pengeluaran MODIFY COLUMN jumlah INT default 0;
ALTER TABLE pengeluaran change column jumlah total int(30);