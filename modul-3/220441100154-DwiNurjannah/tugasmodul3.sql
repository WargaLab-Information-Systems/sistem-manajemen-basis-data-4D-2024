CREATE DATABASE db_perpus;
-- drop database db_perpus;
USE db_perpus;

CREATE TABLE anggota (
    id_anggota VARCHAR(10) PRIMARY KEY,
    nama_anggota VARCHAR(20),
    angkt_anggota VARCHAR(6),
    tempat_lahir_anggota VARCHAR(20),
    tanggal_lahir_anggota DATE,
    no_telp INT(12),
    jenis_kelamin VARCHAR(15),
    status_pinjam VARCHAR(15)
);

CREATE TABLE buku (
    kode_buku VARCHAR(10) PRIMARY KEY,
    judul_buku VARCHAR(25),
    pengarang_buku VARCHAR(30),
    penerbit_buku VARCHAR(30),
    tahun_buku VARCHAR(10),
    jumlah_buku VARCHAR(5),
    status_buku VARCHAR(10),
    klasifikasi_buku VARCHAR(20)
);

CREATE TABLE petugas (
    id_petugas VARCHAR(10) PRIMARY KEY,
    username VARCHAR(15),
    sandi VARCHAR(15),
    nama VARCHAR(25)
);

CREATE TABLE peminjaman (
    kode_peminjaman VARCHAR(10) PRIMARY KEY,
    id_anggota VARCHAR(10),
    id_petugas VARCHAR(10),
    tanggal_pinjam DATE,
    tanggal_kembali DATE,
    kode_buku VARCHAR(10),
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
    FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

CREATE TABLE pengembalian (
    kode_kembali VARCHAR(10) PRIMARY KEY,
    id_anggota VARCHAR(10),
    kode_buku VARCHAR(10),
    id_petugas VARCHAR(10),
    tgl_pinjam DATE,
    tgl_kembali DATE,
    denda VARCHAR(5),
    FOREIGN KEY (id_anggota) REFERENCES anggota(id_anggota),
    FOREIGN KEY (kode_buku) REFERENCES buku(kode_buku),
    FOREIGN KEY (id_petugas) REFERENCES petugas(id_petugas)
);

INSERT INTO petugas (id_petugas, username, sandi, nama) 
VALUES 
('1', 'Ninis', '789', 'Khoirotun Nisak'),
('2', 'Tesa', '891', 'Tesa Putri Hutagaol'),
('3', 'Roma', '912', 'Romauli Napitupulu'),
('4', 'Viko', '101', 'Viko Alfian P'),
('5', 'Izud', '102', 'M. Izuddin Arafat'),
('6', 'Sifa', '103', 'Sifa Saputra'),
('7', 'Oxa', '104', 'Oxa Indi Vixzio'),
('8', 'Imam', '123', 'Imam Arishandi Irfanto'),
('9', 'Dwi', '234', 'Dwi Nurjannah'),
('10', 'Amel', '345', 'Amelia Zalfa Sahira'),
('11', 'Bintang', '456', 'Bintang Wahyu Ariyono'),
('12', 'Angga', '567', 'Angga Jalasena Saputra'),
('13', 'Irfan', '678', 'M Irfan Faruq Zain');

INSERT INTO buku (kode_buku, judul_buku, pengarang_buku, penerbit_buku, tahun_buku, jumlah_buku, status_buku, klasifikasi_buku) 
VALUES 
('111', 'Bumi Manusia', 'imam', 'angga', '2019', '20', 'Ada', 'Fiksi'),
('222', 'Pejuang Sejati', 'angga', 'imam', '2017', '17', 'Habis', 'Cinta'),
('333', 'The Raid', 'dwi', 'amel', '2020', '27', 'Ada', 'Action'),
('444', 'Malinkundang', 'amel', 'dwi', '2021', '30', 'Habis', 'Sejarah'),
('555', 'Cinta Sejata', 'ninis', 'irfan', '2018', '25', 'Habis', 'Cinta'),
('666', 'Lain Waktu Kembali', 'irfan', 'ninis', '2023', '18', 'Ada', 'Fiksi'),
('777', 'Harga Diri Sejati', 'tesa', 'roma', '2024', '15', 'Ada', 'Sejarah'),
('888', 'Hari Terkutuk', 'roma', 'tesa', '2010', '9', 'Habis', 'Fiksi'),
('999', 'Menari Di Hari Ini', 'fiko', 'izud', '2015', '19', 'Habis', 'Santai'),
('989', 'Biarkan Saja Dia Mati', 'izud', 'fiko', '2017', '23', 'Ada', 'Fiksi'),
('889', 'Nenek Tercinta', 'naela', 'oxa', '2019', '28', 'Habis', 'Sejarah'),
('787', 'Gila Dengan Cintanya', 'oxa', 'naela', '2020', '30', 'Ada', 'Cinta'),
('676', 'Hirarki manusia yang lemah', 'sifa', 'sulthon', '2024', '15', 'Ada', 'Sejarah');

INSERT INTO anggota (id_anggota, nama_anggota, angkt_anggota, tempat_lahir_anggota, tanggal_lahir_anggota, no_telp, jenis_kelamin, status_pinjam) 
VALUES 
('1', 'Bintang', '22', 'Sidoarjo', '2003-06-28', '0882170882', 'Laki-laki', 'Belum'),
('2', 'Angga', '22', 'Bangkalan', '2004-07-02', '0882170882', 'Laki-laki', 'Belum'),
('3', 'Imam', '22', 'Bangkalan', '2003-09-29', '0882170882', 'Laki-Laki', 'Sudah'),
('4', 'Sulthon', '22', 'Sampang', '2004-11-11', '0882170882', 'Laki-Laki', 'Sudah'),
('5', 'Sipak', '22', 'Bojonegoro', '2003-01-24', '0882170882', 'Laki-Laki', 'Belum'),
('6', 'Roma', '22', 'Medan', '2003-02-14', '0882170882', 'Perempuan', 'Sudah'),
('7', 'Tesa', '22', 'Medan', '2003-03-20', '0882170882', 'Perempuan', 'Belum'),
('8', 'Dwi', '22', 'Lumajang', '2004-03-20', '0882170882', 'Perempuan', 'Belum'),
('9', 'Dela', '22', 'Sidoarjo', '2003-07-30', '0882170882', 'Perempuan', 'Sudah'),
('10', 'Ninis', '22', 'Sampang', '2004-05-27', '0882170882', 'Perempuan', 'Sudah'),
('11', 'Oxa', '22', 'Sidoarjo', '2004-01-07', '088217088262', 'Laki-Laki', 'Belum'),
('12', 'Naela', '22', 'Sidoarjo', '2003-06-29', '088217088262', 'Perempuan', 'Belum'),
('13', 'Amel', '22', 'Sampang', '2004-07-19', '088217088262', 'Perempuan', 'Sudah');  

SELECT * FROM anggota;

INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) 
VALUES 
('1','1','13','2024-04-12','2024-05-22','111'),
('2','2','12','2024-04-11','2024-05-21','222'),
('3','3','11','2024-04-13','2024-05-23','333'),
('4','4','10','2024-04-14','2024-05-24','444'),
('5','5','9','2024-04-15','2024-05-25','555'),
('6','6','8','2024-04-16','2024-05-26','666'),
('7','7','7','2024-04-17','2024-05-27','777'),
('8','8','6','2024-04-18','2024-05-28','888'),
('9','9','5','2024-04-19','2024-05-29','999'),
('10','10','4','2024-04-20','2024-05-30','989'),
('11','11','3','2024-04-21','2024-05-31','889'),
('12','12','2','2024-04-22','2024-06-01','787');

INSERT INTO peminjaman (kode_peminjaman, id_anggota, id_petugas, tanggal_pinjam, tanggal_kembali, kode_buku) 
VALUES 
('13','1','13','2024-04-12','2024-05-22','111'),
('14','1','13','2024-04-05','2024-05-22','111');



INSERT INTO pengembalian (kode_kembali, id_anggota, kode_buku, id_petugas, tgl_pinjam, tgl_kembali, denda) 
VALUES 
('1','1','111','13','2024-04-12','2024-05-23','10000'),
('2','2','222','12','2024-04-11','2024-05-21','0'),
('3','3','333','11','2024-04-13','2024-05-25','20000'),
('4','4','444','10','2024-04-14','2024-05-25','10000'),
('5','5','555','9','2024-04-15','2024-05-25','0'),
('6','6','666','8','2024-04-16','2024-05-26','0'),
('7','7','777','7','2024-04-17','2024-06-01','50000'),
('8','8','888','6','2024-04-18','2024-05-28','0'),
('9','9','999','5','2024-04-19','2024-05-30','10000'),
('10','10','989','4','2024-04-20','2024-05-30','0'),
('11','11','889','3','2024-04-21','2024-05-31','0'),
('12','12','787','2','2024-04-22','2024-06-02','10000');

DELIMITER //

CREATE PROCEDURE tampil(IN anggota INT)
BEGIN
    SELECT * FROM anggota WHERE id_anggota = anggota;
END //

DELIMITER ;

CALL tampil(2);

DELIMITER //

CREATE PROCEDURE getAnggotaByNama(IN nama VARCHAR(20))
BEGIN
    SELECT * FROM anggota WHERE nama_anggota = nama;
END //

DELIMITER ;

CALL getAnggotaByNama('Dwi');

DELIMITER //

CREATE PROCEDURE getBukuByStatusAndKlasifikasi(IN STATUS VARCHAR(10), IN klasifikasi VARCHAR(20))
BEGIN
    SELECT * FROM buku WHERE status_buku = STATUS AND klasifikasi_buku = klasifikasi;
END //

DELIMITER ;

CALL getBukuByStatusAndKlasifikasi('Ada', 'sejarah');

DELIMITER //

CREATE PROCEDURE getPeminjamanByAnggotaAndTanggalPinjamAndKodeBuku(
    IN anggota_id VARCHAR(10),
    IN tanggal_pinjam DATE,
    IN kode_buku VARCHAR(10))
BEGIN
    SELECT * FROM peminjaman WHERE id_anggota = anggota_id AND tanggal_pinjam = tanggal_pinjam AND kode_buku = kode_buku;
END //

DELIMITER ;

CALL getPeminjamanByAnggotaAndTanggalPinjamAndKodeBuku('1', '2024-04-11', '111');

DELIMITER //

CREATE PROCEDURE insertPetugas(IN idPetugas VARCHAR(10), IN username VARCHAR(15), IN PASSWORD VARCHAR(15), IN nama VARCHAR(25))
BEGIN
    INSERT INTO petugas (id_petugas, username, sandi, nama) VALUES (idPetugas, username, PASSWORD, nama);
END //

DELIMITER ;

CALL insertPetugas('20', 'Bintang', '456', 'Bintang Wahyu Ariyono');

SELECT * FROM petugas;

DELETE FROM petugas WHERE id_petugas = '19';

DELIMITER //

CREATE PROCEDURE getCountPeminjam(OUT COUNT INT)
BEGIN
    SELECT COUNT(*) INTO COUNT FROM peminjaman;
END //

DELIMITER ;

CALL getCountPeminjam(@count);
SELECT @count;

drop procedure hitung_jumlah_peminjam_berdasarkan_tanggal_dan_buku;



DELIMITER //

CREATE PROCEDURE hitung_jumlah_peminjam_berdasarkan_tanggal_dan_buku(
    IN tanggal_pinjam_param DATE,
    IN kode_buku_param VARCHAR(10),
    OUT jumlah_peminjam INT
)
BEGIN
    SELECT COUNT(*) INTO jumlah_peminjam 
    FROM peminjaman 
    WHERE tanggal_pinjam >= tanggal_pinjam_param AND tanggal_pinjam <= DATE_ADD(tanggal_pinjam_param, INTERVAL 1 MONTH) AND kode_buku = kode_buku_param;
    
    IF jumlah_peminjam IS NULL THEN
        SET jumlah_peminjam = 1;
    END IF;
END //

DELIMITER ;
select *from peminjaman;
SET @tanggal_pinjam = '2024-04-12'; 
SET @kode_buku = '111';
CALL hitung_jumlah_peminjam_berdasarkan_tanggal_dan_buku(@tanggal_pinjam, @kode_buku, @jumlah);
SELECT @tanggal_pinjam AS tanggal_pinjam, @jumlah AS jumlah_peminjam;
