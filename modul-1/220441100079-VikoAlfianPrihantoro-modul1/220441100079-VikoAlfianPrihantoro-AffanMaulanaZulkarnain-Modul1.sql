CREATE DATABASE universitas;

USE universitas;

DROP TABLE IF EXISTS `dosen`;

CREATE TABLE `dosen` (
  `nip` INT(11) NOT NULL,
  `nama` VARCHAR(200) DEFAULT NULL,
  `jurusan` VARCHAR(50) DEFAULT NULL,
  `jenis_kelamin` VARCHAR(20) DEFAULT NULL,
  `status_dosen` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`nip`)
);

INSERT  INTO `dosen`(`nip`,`nama`,`jurusan`,`jenis_kelamin`,`status_dosen`) VALUES 
(0,'Yanto Wibowo','Ekonomi','Laki-laki','Aktif'),
(1,'Budi Santoso','Teknik Informatika','Laki-laki','Aktif'),
(2,'Dewi Rahayu','Manajemen Bisnis','Perempuan','Aktif'),
(3,'Siti Hadijah','Akuntansi','Perempuan','Non-aktif'),
(4,'Ahmad Prasetyo','Ilmu Komputer','Laki-laki','Aktif'),
(5,'Fitri Handayani','Kedokteran','Perempuan','Aktif'),
(6,'Yuni Wulandari','Teknik Elektro','Perempuan','Non-aktif'),
(7,'Fajar Setiawan','Sastra Inggris','Laki-laki','Aktif'),
(8,'Rina Susanti','Arsitektur','Perempuan','Aktif'),
(9,'Indra Gunawan','Teknik Kimia','Laki-laki','Non-aktif');

DROP TABLE IF EXISTS `gaji_dosen`;

CREATE TABLE `gaji_dosen` (
  `nip` INT(11) NOT NULL,
  `tanggal` DATE DEFAULT NULL,
  `jumlah` INT(11) DEFAULT NULL,
  `via_pembayaran` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`nip`)
);

INSERT  INTO `gaji_dosen`(`nip`,`tanggal`,`jumlah`,`via_pembayaran`) VALUES 
(0,'2024-03-16',9800000,'Tunai'),
(1,'2024-03-25',10000000,'Transfer Bank'),
(2,'2024-03-24',9500000,'Transfer Bank'),
(3,'2024-03-23',9800000,'Tunai'),
(4,'2024-03-22',10500000,'Transfer Bank'),
(5,'2024-03-17',10300000,'Transfer Bank'),
(6,'2024-03-21',9700000,'Tunai'),
(7,'2024-03-20',9900000,'Transfer Bank'),
(8,'2024-03-19',10100000,'Transfer Bank'),
(9,'2024-03-18',9600000,'Tunai');

DROP TABLE IF EXISTS `laporan_dosen`;

CREATE TABLE `laporan_dosen` (
  `semester` VARCHAR(5) DEFAULT NULL,
  `tahun_ajaran` INT(11) DEFAULT NULL,
  `jumlah_dosen` INT(11) DEFAULT NULL
);

INSERT INTO laporan_dosen (semester, tahun_ajaran, jumlah_dosen)
SELECT 'satu', 2024, COUNT(*) AS jumlah_dosen
FROM dosen
WHERE Status_dosen = 'Aktif';

DROP TABLE IF EXISTS `laporan_keuangan`;

CREATE TABLE `laporan_keuangan` (
  `bulan` VARCHAR(5) DEFAULT NULL,
  `tahun` INT(11) DEFAULT NULL,
  `total_pengeluaran` INT(11) DEFAULT NULL,
  `total_pemasukan` INT(11) DEFAULT NULL
);

DROP TABLE IF EXISTS `laporan_mahasiswa`;

CREATE TABLE `laporan_mahasiswa` (
  `semester` VARCHAR(5) DEFAULT NULL,
  `tahun_ajaran` INT(11) DEFAULT NULL,
  `jumlah_mahasiswa` INT(11) DEFAULT NULL
);


INSERT INTO laporan_mahasiswa (semester, tahun_ajaran, jumlah_mahasiswa)
SELECT 'satu hingga delapan', 2024, COUNT(*) AS jumlah_mahasiswa
FROM mahasiswa
WHERE Status_mahasiswa = 'Aktif';


DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `nim` INT(11) NOT NULL,
  `nama` VARCHAR(200) DEFAULT NULL,
  `jurusan` VARCHAR(50) DEFAULT NULL,
  `jenis_kelamin` VARCHAR(20) DEFAULT NULL,
  `status_mahasiswa` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`nim`)
);


INSERT  INTO `mahasiswa`(`nim`,`nama`,`jurusan`,`jenis_kelamin`,`status_mahasiswa`) VALUES 
(123456789,'John Doe','Teknik Informatika','Laki-laki','Aktif'),
(234567891,'Emily Davis','Teknik Elektro','Perempuan','Non-aktif'),
(345678912,'Sophia Taylor','Arsitektur','Perempuan','Aktif'),
(432198765,'James Rodriguez','Ekonomi','Laki-laki','Aktif'),
(456789123,'Alice Johnson','Akuntansi','Perempuan','Non-aktif'),
(567891234,'Olivia Anderson','Kedokteran','Perempuan','Aktif'),
(654321987,'William Martinez','Teknik Kimia','Laki-laki','Non-aktif'),
(789123456,'Bob Brown','Ilmu Komputer','Laki-laki','Aktif'),
(876543219,'Michael Wilson','Sastra Inggris','Laki-laki','Aktif'),
(987654321,'Jane Smith','Manajemen Bisnis','Perempuan','Aktif');


DROP TABLE IF EXISTS `matakuliah`;

CREATE TABLE `matakuliah` (
  `id_matakuliah` INT(11) NOT NULL,
  `nama_matakuliah` VARCHAR(50) DEFAULT NULL,
  `nama_dosen` VARCHAR(50) DEFAULT NULL,
  `semester` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id_matakuliah`)
);


INSERT  INTO `matakuliah`(`id_matakuliah`,`nama_matakuliah`,`nama_dosen`,`semester`) VALUES 
(198,'Teknik Informatika','Budi Santoso',3),
(200,'Manajemen Bisnis','Dewi Rahayu',4),
(263,'Kedokteran','Fitri Handayani',4),
(298,'Ekonomi','Yanto Wibowo',8),
(308,'Akuntansi','Siti Hadijah',2),
(487,'Ilmu Komputer','Ahmad Prasetyo',1),
(656,'Teknik Elektro','Yuni Wulandari',5),
(717,'Sastra Inggris','Fajar Setiawan',5),
(809,'Arsitektur','Rina Susanti',2),
(900,'Teknik Kimia','Indra Gunawan',4);

DROP TABLE IF EXISTS `pembayaran_ukt`;

CREATE TABLE `pembayaran_ukt` (
  `nim` INT(11) NOT NULL,
  `tanggal` DATE DEFAULT NULL,
  `jumlah` INT(11) DEFAULT NULL,
  `via_pembayaran` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`nim`)
);

INSERT  INTO `pembayaran_ukt`(`nim`,`tanggal`,`jumlah`,`via_pembayaran`) VALUES 
(123456789,'2024-03-25',5000000,'Transfer Bank'),
(234567891,'2024-03-21',4700000,'Tunai'),
(345678912,'2024-03-19',5100000,'Kartu Debit'),
(432198765,'2024-03-16',4800000,'Tunai'),
(456789123,'2024-03-23',4800000,'Kartu Kredit'),
(567891234,'2024-03-17',5300000,'Transfer Bank'),
(654321987,'2024-03-18',4600000,'Tunai'),
(789123456,'2024-03-22',5200000,'Transfer Bank'),
(876543219,'2024-03-20',4900000,'Transfer Bank'),
(987654321,'2024-03-24',4500000,'Tunai');

DROP TABLE IF EXISTS `pembelian`;

CREATE TABLE `pembelian` (
  `id_transaksi` INT(11) NOT NULL,
  `nama_barang` VARCHAR(20) DEFAULT NULL,
  `tanggal_transaksi` DATE DEFAULT NULL,
  `jumlah` INT(11) DEFAULT NULL,
  `total` VARCHAR(20) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`)
);

INSERT  INTO `pembelian`(`id_transaksi`, `nama_barang`,`tanggal_transaksi`,`jumlah`,`total`) VALUES 
(123,'komputer','2024-03-25',5,'250000'),
(124,'kabel','2024-03-24',3,'180000'),
(125,'meja','2024-03-23',2,'120000'),
(126,'kursi','2024-03-22',4,'240000'),
(127,'mouse','2024-03-21',6,'300000'),
(128,'laptop','2024-03-20',7,'350000'),
(129,'papan tulis','2024-03-19',1,'600000'),
(130,'kapur','2024-03-18',8,'400000'),
(131,'pena','2024-03-17',3,'180000'),
(132,'bulpoin','2024-03-16',5,'250000');

DROP TABLE IF EXISTS `tagihan`;

CREATE TABLE `tagihan` (
  `nomor_tagihan` INT(11) DEFAULT NULL,
  `nama_tagihan` VARCHAR(200) DEFAULT NULL,
  `jumlah` INT(11) DEFAULT NULL,
  `via_pembayaran` VARCHAR(200) DEFAULT NULL
);

INSERT  INTO `tagihan`(`nomor_tagihan`,`nama_tagihan`,`jumlah`,`via_pembayaran`) VALUES 
(12,'Tagihan Listrik',500000,'Transfer Bank'),
(13,'Tagihan Air',450000,'Tunai'),
(14,'Tagihan Internet',480000,'Kartu Kredit'),
(15,'Tagihan Telepon',520000,'Transfer Bank'),
(21,'Tagihan TV Kabel',470000,'Tunai'),
(22,'Tagihan Asuransi',490000,'Transfer Bank'),
(23,'Tagihan Pajak',510000,'Kartu Debit'),
(24,'Tagihan Pemeliharaan',460000,'Tunai'),
(25,'Tagihan Parkir',530000,'Transfer Bank'),
(26,'Tagihan Keanggotaan',480000,'Tunai');

DROP TABLE laporan_keuangan;

CREATE VIEW Laporan_Keuangan AS
SELECT 'pembayaran_ukt' AS Deskripsi, SUM(jumlah) AS Total
FROM pembayaran_ukt
UNION ALL
SELECT 'gaji_dosen' AS Deskripsi, SUM(jumlah) AS Total
FROM gaji_dosen
UNION ALL
SELECT 'pembelian' AS Deskripsi, SUM(total) AS Total
FROM pembelian
UNION ALL
SELECT 'tagihan' AS Deskripsi, SUM(jumlah) AS Total
FROM tagihan;

SELECT COUNT(*) AS jumlah_mahasiswa
FROM mahasiswa;

SELECT COUNT(*) AS jumlah_dosen
FROM dosen;

SELECT Deskripsi, Total
FROM Laporan_Keuangan;

SHOW TABLES;